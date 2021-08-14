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
 var designerUsd;
 var illustratorUsd;
 var artisansUsd;
 var choreographerUsd;
 var hairUsd;
 var makeupUsd;
 var modelUsd;
 var photographerUsd;
 var bloggerUsd;
 var stylistUsd;
  bool designer;
 bool illustrator;
 bool artisans;
 bool choreographer;
 bool hair;
 bool makeup;
 bool model;
 bool photographer;
 bool blogger;
 bool stylist;

 String countryISO;



  String language;
  int client;
 int visits;
 int sales;
 int revenue;

  int state;
  bool seller;
bool ban;
bool Bidding;

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
this.stylistAvg,this.designerUsd,
this.illustratorUsd,
this.artisansUsd,
this.choreographerUsd,
this.hairUsd,
this.makeupUsd,
this.modelUsd,
this.photographerUsd,
this.bloggerUsd,
this.stylistUsd,
  this.designer,
this.illustrator,
this.artisans,
this.choreographer,
this.hair,
this.makeup,
this.model,
this.photographer,
this.blogger,
this.stylist,

this.countryISO,


    this.language,
    this.client,
    this.sales,
    this.visits,
    this.ban,
this.Bidding,

  });
  factory Users.fromDocument(DocumentSnapshot doc){
    return Users(
        id: doc.data()['id'],
      Bidding: doc.data()['Bidding'],
      countryISO: doc.data()['countryISO'],

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
      artisansAvg: doc.data()['artisanAvg'],
      choreographerAvg: doc.data()['choreographerAvg'],
      hairAvg: doc.data()['hairAvg'],
      makeupAvg: doc.data()['makeupAvg'],
      modelAvg: doc.data()['modelAvg'],
      photographerAvg: doc.data()['photographerAvg'],
      bloggerAvg: doc.data()['bloggerAvg'],
      stylistAvg: doc.data()['stylistAvg'],
      designerUsd: doc.data()['designerUsd'],
      illustratorUsd: doc.data()['illustratorUsd'],
      artisansUsd: doc.data()['artisanUsd'],
      choreographerUsd: doc.data()['choreographerUsd'],
      hairUsd: doc.data()['hairUsd'],
      makeupUsd: doc.data()['makeupUsd'],
      modelUsd: doc.data()['modelUsd'],
      photographerUsd: doc.data()['photographerUsd'],
      bloggerUsd: doc.data()['bloggerUsd'],
      stylistUsd: doc.data()['stylistUsd'],
    designer: doc.data()['designer'],
      illustrator: doc.data()['illustrator'],
      artisans: doc.data()['artisan'],
      choreographer: doc.data()['choreographer'],
      hair: doc.data()['hair'],
      makeup: doc.data()['makeup'],
      model: doc.data()['model'],
      photographer: doc.data()['photographer'],
      blogger: doc.data()['blogger'],
      stylist: doc.data()['stylist'],

        state: doc.data()['state'],
        client:doc.data()['client'],
        seller: doc.data()['seller'],
      sales: doc.data()['sales'],
      visits: doc.data()['visits'],
      ban: doc.data()['ban'],

    );
  }
}
