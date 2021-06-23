import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
class Address{
  String name;
  String phone;
  String address_line1;
   String address_line2;

  String city_locality;
  String state_province;
  String postal_code;
  String country_code;
  String address_residential_indicator;
  String company_name;


  Address({
    this.name,
    this.phone,
    this.address_line1,
    this.address_line2,

    this.city_locality,
    this.state_province,
    this.postal_code,
    this.country_code,
    this.address_residential_indicator,
    this.company_name,

  });
  factory Address.fromDocument(DocumentSnapshot doc){
    return Address(
        name: doc.data()['name'],
        phone :doc.data()['phone'],
        address_line1 :doc.data()['address_line1'],
        city_locality: doc.data()['city_locality'],
        state_province :doc.data()['state_province'],
        postal_code :doc.data()['postal_code'],
        country_code: doc.data()['country_code'],
        address_residential_indicator: doc.data()['address_residential_indicator'],
        company_name: doc.data()['company_name'],
        address_line2: doc.data()['address_line2'],

    );
  }
}