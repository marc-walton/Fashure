import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fashow/products.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Constants.dart';

Widget buildprod(BuildContext context, DocumentSnapshot document) {
  final prod = Prod.fromDocument(document);
  // final tripType = trip.types();

  return new Container(
    child: Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(child: Image.network(prod.shopmediaUrl),)),

            title: Text(
              prod.productname,
              style:
              TextStyle(color:kText, fontWeight: FontWeight.bold),
            ),

          ),
        ),


        onTap: () => showProd(context, prodId: prod.prodId,ownerId: prod.ownerId),
      ),
    ),
  );
}
showProd(BuildContext context, {String prodId,String ownerId,}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductScreen(
            userId: ownerId,
            prodId: prodId,
          )));
}