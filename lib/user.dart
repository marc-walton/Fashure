import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
class User{
   String id;
   String username;
   String email;
  String photoUrl;
  String displayName;
   String bio;
   String coverPhoto;
   String country;
   String language;
   int client;

  int state;
//  String followers;
  User({
    this.id,
    this.username,
    this.email,
    this.photoUrl,
    this.displayName,
    this.bio,
    this.state,
    this.coverPhoto,
//    this.followers,
this.country,
    this.language,
    this.client
  });
//  Map toMap(User user) {
//    var data = Map<String, dynamic>();
//    data['id'] = user.id;
//    data['username'] = user.username;
//    data['email'] = user.email;
//    data['displayName'] = user.displayName;
//    data["bio"] = user.bio;
//    data["state"] = user.state;
//    data["photoUrl"] = user.photoUrl;
//    return data;
//  }
//
//  // Named constructor
//  User.fromMap(Map<String, dynamic> mapData) {
//    this.id = mapData['id'];
//    this.username = mapData['username'];
//    this.email = mapData['email'];
//    this.displayName = mapData['displayName'];
//    this.bio = mapData['bio'];
//    this.state = mapData['state'];
//    this.photoUrl = mapData['photoUrl'];
//  }
//}
  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      id: doc['id'],
      username :doc['username'],
      email :doc['email'],
      photoUrl: doc['photoUrl'],
      displayName :doc['displayName'],
      bio :doc['bio'],
      coverPhoto: doc['coverPhoto'],
      language: doc['language'],
      country: doc['country'],
      state: doc['state'],
client:doc['client'],
//      followers: doc['followers']
    );
  }
}