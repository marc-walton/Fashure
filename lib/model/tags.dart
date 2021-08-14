import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';


final DynamicLinkService _dynamicLinkService = DynamicLinkService();
class Tags{
  String name;
  String prodId;
  String ownerId;
  var usd;
  String image;

Tags({
  this.name,
 this.prodId,
 this.ownerId,
 this.usd,
 this.image,


});
factory Tags.fromDocument(DocumentSnapshot doc){
return Tags(
name: doc.data()['name'],
prodId: doc.data()['prodId'],
ownerId: doc.data()['ownerId'],
usd: doc.data()['usd'],
image: doc.data()['image'],


);
}
}