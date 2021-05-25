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