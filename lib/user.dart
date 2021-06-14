import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
class Users{
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
 int seller;
  Users({
    this.id,
    this.username,
    this.email,
    this.photoUrl,
    this.displayName,
    this.bio,
    this.state,
    this.coverPhoto,
   this.seller,
this.country,
    this.language,
    this.client
  });
  factory Users.fromDocument(DocumentSnapshot doc){
    return Users(
      id: doc.data()['id'],
      username :doc.data()['username'],
      email :doc.data()['email'],
      photoUrl: doc.data()['photoUrl'],
      displayName :doc.data()['displayName'],
      bio :doc.data()['bio'],
      coverPhoto: doc.data()['coverPhoto'],
      language: doc.data()['language'],
      country: doc.data()['country'],
      state: doc.data()['state'],
client:doc.data()['client'],
     seller: doc.data()['seller']
    );
  }
}