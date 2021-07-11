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
   String currencyISO;
   String currency;
 String currencysym;
 String designerAvg;
 String illustratorAvg;
 String artisansAvg;
 String choreographerAvg;
 String hairAvg;
 String makeupAvg;
 String modelAvg;
 String photographerAvg;
 String bloggerAvg;
 String stylistAvg;



  String language;
  int client;
 int visits;
 int sales;
 int revenue;

  int state;
  bool seller;
bool ban;

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
     this.currencyISO,
     this.currency,
this.currencysym,
this.revenue,
this.designerAvg,
this.illustratorAvg,
this.artisansAvg,
this.choreographerAvg,
this.hairAvg,
this.makeupAvg,
this.modelAvg,
this.photographerAvg,
this.bloggerAvg,
this.stylistAvg,


    this.language,
    this.client,
    this.sales,
    this.visits,
    this.ban,

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
      currencyISO: doc.data()['currencyISO'],
      currency: doc.data()['currency'],
 currencysym: doc.data()['currencysym'],
 revenue: doc.data()['revenue'],
      designerAvg: doc.data()['designerAvg'],
      illustratorAvg: doc.data()['illustratorAvg'],
      artisansAvg: doc.data()['artisansAvg'],
      choreographerAvg: doc.data()['choreographerAvg'],
      hairAvg: doc.data()['hairAvg'],
      makeupAvg: doc.data()['makeupAvg'],
      modelAvg: doc.data()['modelAvg'],
      photographerAvg: doc.data()['photographerAvg'],
      bloggerAvg: doc.data()['bloggerAvg'],
      stylistAvg: doc.data()['stylistAvg'],

        state: doc.data()['state'],
        client:doc.data()['client'],
        seller: doc.data()['seller'],
      sales: doc.data()['sales'],
      visits: doc.data()['visits'],
      ban: doc.data()['ban'],

    );
  }
}