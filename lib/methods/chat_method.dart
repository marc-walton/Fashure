import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/model/contact_model.dart';
import 'package:fashow/model/message_model.dart';
import 'package:fashow/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/user.dart';

class ChatMethods {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference _messageCollection =
  _firestore.collection(MESSAGES_COLLECTION);

  final CollectionReference _userCollection =
  _firestore.collection(USERS_COLLECTION);

  Future<void> addMessageToDb(
      Message message, UserModel sender, UserModel receiver) async {
    var map = message.toMap();

    await _messageCollection
        .doc(message.senderId)
        .collection(message.receiverId)
        .add(map);

    addToContacts(senderId: message.senderId, receiverId: message.receiverId);

    return await _messageCollection
        .doc(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }
  Future<void> unreadMessage(
      Message message, UserModel sender, UserModel receiver) async {
    var map = message.toMap();

    await _messageCollection
        .doc(message.senderId)
        .collection(message.receiverId)
        .add(map);

    addToContacts(senderId: message.senderId, receiverId: message.receiverId);

    return await _messageCollection
        .doc(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }
//
  DocumentReference getContactsDocument({String of, String forContact}) =>
      _userCollection
          .doc(of)
          .collection(CONTACTS_COLLECTION)
          .doc(forContact);

  addToContacts({String senderId, String receiverId}) async {
    Timestamp currentTime = Timestamp.now();

    await addToSenderContacts(senderId, receiverId, currentTime);
    await addToReceiverContacts(senderId, receiverId, currentTime);
  }

  Future<void> addToSenderContacts(
      String senderId,
      String receiverId,
      currentTime,
      ) async {
    DocumentSnapshot senderSnapshot =
    await getContactsDocument(of: senderId, forContact: receiverId).get();

    if (!senderSnapshot.exists) {
      //does not exists
      Contact receiverContact = Contact(
        uid: receiverId,
        addedOn: currentTime,
      );

      var receiverMap = receiverContact.toMap(receiverContact);

      await getContactsDocument(of: senderId, forContact: receiverId)
          .set(receiverMap);
    }
  }

  Future<void> addToReceiverContacts(
      String senderId,
      String receiverId,
      currentTime,
      ) async {
    DocumentSnapshot receiverSnapshot =
    await getContactsDocument(of: receiverId, forContact: senderId).get();

    if (!receiverSnapshot.exists) {
      //does not exists
      Contact senderContact = Contact(
        uid: senderId,
        addedOn: currentTime,
      );

      var senderMap = senderContact.toMap(senderContact);

      await getContactsDocument(of: receiverId, forContact: senderId)
          .set(senderMap);
    }
  }

  void setImageMsg(String url, String receiverId, String senderId) async {
    Message message;

    message = Message.imageMessage(
        message: "IMAGE",
        receiverId: receiverId,
        senderId: senderId,
        imgUrl: url,
        timestamp: Timestamp.now(),
        type: 'image');

    // create imagemap
    var map = message.toImageMap();

    // var map = Map<String, dynamic>();
    await _messageCollection
        .doc(message.senderId)
        .collection(message.receiverId)
        .add(map);

    _messageCollection
        .doc(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }

  Stream<QuerySnapshot> fetchContacts({String userId}) => _userCollection
      .doc(userId)
      .collection(CONTACTS_COLLECTION)
      .snapshots();

  Stream<QuerySnapshot> fetchLastMessageBetween({
    String senderId,
    String receiverId,
  }) =>
      _messageCollection
          .doc(senderId)
          .collection(receiverId)
          .orderBy("timestamp")
          .snapshots();
}