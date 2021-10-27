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
  String city;

   String currencyISO;
   String currency;
 String currencysym;
 var Earnings;
 var TotalEarnings;
 var designerInr;
 var illustratorInr;
 var artisansInr;
 var choreographerInr;
 var hairInr;
 var makeupInr;
 var modelInr;
 var photographerInr;
 var bloggerInr;
 var stylistInr;
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
  var designerEur;
 var illustratorEur;
 var artisansEur;
 var choreographerEur;
 var hairEur;
 var makeupEur;
 var modelEur;
 var photographerEur;
 var bloggerEur;
 var stylistEur;
   var designerGbp;
 var illustratorGbp;
 var artisansGbp;
 var choreographerGbp;
 var hairGbp;
 var makeupGbp;
 var modelGbp;
 var photographerGbp;
 var bloggerGbp;
 var stylistGbp;

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
    this.city,
    this.Earnings,
    this.TotalEarnings,
this.currencysym,
this.revenue,
this.designerInr,
this.illustratorInr,
this.artisansInr,
this.choreographerInr,
this.hairInr,
this.makeupInr,
this.modelInr,
this.photographerInr,
this.bloggerInr,
this.stylistInr,
    this.designerUsd,
this.illustratorUsd,
this.artisansUsd,
this.choreographerUsd,
this.hairUsd,
this.makeupUsd,
this.modelUsd,
this.photographerUsd,
this.bloggerUsd,
this.stylistUsd,
    this.designerEur,
this.illustratorEur,
this.artisansEur,
this.choreographerEur,
this.hairEur,
this.makeupEur,
this.modelEur,
this.photographerEur,
this.bloggerEur,
this.stylistEur,
     this.designerGbp,
this.illustratorGbp,
this.artisansGbp,
this.choreographerGbp,
this.hairGbp,
this.makeupGbp,
this.modelGbp,
this.photographerGbp,
this.bloggerGbp,
this.stylistGbp,

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
      city: doc.data()['city'],
        Earnings: doc.data()['Earnings'],
        TotalEarnings: doc.data()['TotalEarnings'],

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
      designerInr: doc.data()['designerInr'],
      illustratorInr: doc.data()['illustratorInr'],
      artisansInr: doc.data()['artisanInr'],
      choreographerInr: doc.data()['choreographerInr'],
      hairInr: doc.data()['hairInr'],
      makeupInr: doc.data()['makeupInr'],
      modelInr: doc.data()['modelInr'],
      photographerInr: doc.data()['photographerInr'],
      bloggerInr: doc.data()['bloggerInr'],
      stylistInr: doc.data()['stylistInr'],
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
      designerEur: doc.data()['designerEur'],
      illustratorEur: doc.data()['illustratorEur'],
      artisansEur: doc.data()['artisanEur'],
      choreographerEur: doc.data()['choreographerEur'],
      hairEur: doc.data()['hairEur'],
      makeupEur: doc.data()['makeupEur'],
      modelEur: doc.data()['modelEur'],
      photographerEur: doc.data()['photographerEur'],
      bloggerEur: doc.data()['bloggerEur'],
      stylistEur: doc.data()['stylistEur'],
         designerGbp: doc.data()['designerGbp'],
      illustratorGbp: doc.data()['illustratorGbp'],
      artisansGbp: doc.data()['artisanGbp'],
      choreographerGbp: doc.data()['choreographerGbp'],
      hairGbp: doc.data()['hairGbp'],
      makeupGbp: doc.data()['makeupGbp'],
      modelGbp: doc.data()['modelGbp'],
      photographerGbp: doc.data()['photographerGbp'],
      bloggerGbp: doc.data()['bloggerGbp'],
      stylistGbp: doc.data()['stylistGbp'],

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
