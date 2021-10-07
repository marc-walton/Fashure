import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fashow/products.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Constants.dart';

import 'package:fashow/user.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class TagItem extends StatelessWidget {
  final String ownerId ;
  final String prodId ;

  final String Id ;
  final String image ;
  final String name;
  final usd ;
  final inr ;
  final gbp ;
  final eur ;

  var currencyFormatter =      currentUser.currency == "USD"? NumberFormat('#,##0.00', ):
  currentUser.currency == "INR"?NumberFormat.currency(locale:"HI"):
  currentUser.currency == "EUR"? NumberFormat.currency(locale:" ${currentUser.currencyISO}"):
  currentUser.currency == "GBP"?NumberFormat.currency(locale:" ${currentUser.currencyISO}"): NumberFormat('#,##0.00', );

  TagItem({this.ownerId,this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

  delete(){
    var  docReference =      collRef .doc(currentUser.id)
        .collection("userCollections")
        .doc(prodId)
        .collection('tags')
        .doc(Id);
    docReference.delete();

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedImage(image)),
              Row(
                children: [
                  Text(name,
                      style: TextStyle(color: kText,
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: [
                  currentUser.currency == "USD"?Text("\u0024 ${currencyFormatter.format(usd)}",):
                  currentUser.currency == "INR"?Text("₹ ${currencyFormatter.format(inr)}",):
                  currentUser.currency == "EUR"?Text("€ ${currencyFormatter.format(eur)}",):
                  currentUser.currency == "GBP"?Text("£ ${currencyFormatter.format(gbp)}",):Text("\u0024 ${currencyFormatter.format(usd)}",),


                ],
              ),

            ]),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              mini: true,
              backgroundColor:kText.withOpacity(0.5),
              onPressed: delete,
              child: Icon(Icons.delete,color: Colors.red,),
            ),
          ),
        ]
    );
  }
}
