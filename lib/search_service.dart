import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/user.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fashow/enum/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
 class SearchMethod{
   final FirebaseAuth _auth = FirebaseAuth.instance;
//   GoogleSignIn _googleSignIn = GoogleSignIn();
   static final Firestore firestore = Firestore.instance;

   static final CollectionReference _userCollection =
   _firestore.collection(USERS_COLLECTION);
   String id;
   SharedPreferences myPrefs;



   readLocal() async {
     myPrefs = await SharedPreferences.getInstance();
     id = myPrefs.getString('id') ?? '';
   }


   Future<UserModel> getUserDetails() async {
//     FirebaseUser currentUser = await getCurrentUser();

     DocumentSnapshot snapshot =
     await _userCollection.document(currentUser.id).get();

     return UserModel.fromMap(snapshot.data);
   }

   Future<UserModel> getUserDetailsById(id) async {
     try {
       DocumentSnapshot documentSnapshot =
       await _userCollection.document(id).get();
       return UserModel.fromMap(documentSnapshot.data);
     } catch (e) {
       print(e);
       return null;
     }
   }

//    getCurrentUser() async {
//    User currentU;
//     currentU = currentUser;
//     return currentU;
//   }
   Future<FirebaseUser> getCurrentUser() async {
     FirebaseUser currentUs;
     currentUs = await _auth.currentUser();
     return currentUs;
   }
   static final Firestore _firestore = Firestore.instance;


   Future<List<UserModel>> fetchAllUsers() async {
     List<UserModel> userList = List<UserModel>();

     QuerySnapshot querySnapshot =
     await usersRef.getDocuments();
     for (var i = 0; i < querySnapshot.documents.length; i++) {
       if (querySnapshot.documents[i].documentID != currentUser.id) {
         userList.add(UserModel.fromMap(querySnapshot.documents[i].data));
       }
     }
     return userList;
   }
   void setUserState({@required String userId, @required UserState userState}) {
     int stateNum = Utils.stateToNum(userState);

     _userCollection.document(userId).updateData({
       "state": stateNum,
     });
   }

   Stream<DocumentSnapshot> getUserStream({@required String id}) =>
       _userCollection.document(id).snapshots();
 }

