import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/chat_screen.dart';
import 'package:fashow/methods/chat_method.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/search_service.dart';
import 'package:fashow/utils/last_message.dart';
import 'package:flutter/material.dart';
import 'package:fashow/model/contact_model.dart';
import 'package:fashow/page_view/online_dot_indicator.dart';
import 'package:fashow/chatcached_image.dart';

import 'package:fashow/page_view/custom_tile.dart';


class ContactView extends StatelessWidget {
  final Contact contact;

  final SearchMethod _authMethods = SearchMethod();
  ContactView(this.contact);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: _authMethods.getUserDetailsById(contact.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel user = snapshot.data;

          return ViewLayout(
            contact: user,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
//
class ViewLayout extends StatelessWidget {
//  UserModel user;
  final CollectionReference _messageCollection =
  FirebaseFirestore.instance.collection(MESSAGES_COLLECTION);

  final UserModel contact;
  final ChatMethods _chatMethods = ChatMethods();
String count;
  ViewLayout({
    @required this.contact,
    this.count,
  });


  @override
  Widget build(BuildContext context) {
//    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return CustomTile(
      mini: false,
      onTap: () {  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              receiver: contact,
            ),
          ));
    },
      title: Text(
        (contact != null ? contact.displayName : null) != null ? contact.displayName : "..",
        style:
        TextStyle(color:kText, fontFamily: "Arial", fontSize: 19),
      ),
      subtitle:LastMessageContainer(
        stream: _chatMethods.fetchLastMessageBetween(
          senderId: currentUser.id,
          receiverId: contact.id,

        ),),
      leading: Container(
        constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
        child: Stack(
          children: <Widget>[
            CachedImage(
              contact.photoUrl,
              radius: 80,
              isRound: true,
            ),

          ],
        ),
      ),
      trailing:
      badgescount()    );
  }
  badgescount()  {
    StreamBuilder(
      stream: _messageCollection
          .doc(currentUser.id)
          .collection(contact.id).where('read',isEqualTo: 'false').snapshots(),
      builder: (context,snapshot){
     int data =  snapshot.data.documents.length;
     return
            Badge(
         shape: BadgeShape.circle,
         padding: EdgeInsets.all(7),
         badgeContent: Text('$data',style: TextStyle(color: Colors.white),),
        );

      },
    );

  }
}

