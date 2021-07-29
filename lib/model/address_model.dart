import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
class Address{
  String name;
  String phone;
  String street1;
  String country;
 String type;


  String city;
  String state;
  String postal_code;
  String country_code;
   String phone_code;

  String company_name;


  Address({
    this.name,
    this.phone,
    this.street1,
    this.country,
 this.type,
 this.phone_code,

    this.city,
    this.state,
    this.postal_code,
    this.country_code,
    this.company_name,

  });
  factory Address.fromDocument(DocumentSnapshot doc){
    return Address(
        name: doc.data()['fullname'],
        phone :doc.data()['phone'],
      street1 :doc.data()['address'],
      type :doc.data()['type'],
      phone_code :doc.data()['phone_code'],
      city: doc.data()['city'],
      state :doc.data()['state'],
        postal_code :doc.data()['zip'],
        country_code:  doc.data()['countryISO'],
               company_name: doc.data()['company_name'],
        country: doc.data()['country'],

    );
  }
}