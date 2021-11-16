import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:get/get.dart';
import 'package:fashow/Products.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';

class CapesW extends StatefulWidget {
  final  int selectedPage;

  const CapesW({Key key, this.selectedPage}) : super(key: key);
  @override
  _CapesWState createState() => _CapesWState();
}

class _CapesWState extends State<CapesW> {
  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
  }

  Single(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(AQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
           String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):

      priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats'),

    );
  }
  Double(){
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(BQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
           String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WDouble Breasted Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WDouble Breasted Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WDouble Breasted Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
           .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WDouble Breasted Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats'),

    );
  }
  Duffle(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(CQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats'),

    );
  }
  Padded(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(DQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WPadded Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WPadded Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WPadded Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
           .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WPadded Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats'),

    );
  }
  WCapes(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(EQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes'),

    );
  }
  WLeather(){
    return   PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(FQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats'),

    );
  }
  WWool(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(GQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WWool Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WWool Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WWool Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WWool Coats'),

    );
  }
  WCargo(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(HQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats'),

    );
  }
  WFaux(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(IQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
               .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats'),

    );
  }
  Parka(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(JQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WParka Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WParka Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WParka Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
           .where('Category',isEqualTo: 'WParka Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats'),

    );
  }
  Rain(){
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(KQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats'),

    );
  }
  Trench(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(LQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                    color: kText,
                  ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
         :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "low$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "high$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0D$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highD$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Trench Coats'),

    );
  }




  @override
  Widget build(BuildContext context) {

      SizeConfig().init(context);
    return  RotatedBox(
      quarterTurns: 1,
      child: Expanded(
        child: DefaultTabController(
            initialIndex:widget.selectedPage ?? 0,

            length:12,
            child: Scaffold(

              appBar:tabs? AppBar(
                toolbarHeight: SizeConfig.screenWidth * 0.3,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom:  PreferredSize(
                  preferredSize: Size.fromHeight(100.0),

                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 30,
                    child: TabBar(

                      isScrollable: true,

                      ///filled
                      labelStyle:TextStyle(fontFamily: "AlteroDCURegular",color: Colors.white ),
                      ///outline
                      unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU",color: Colors.white  ),
                      tabs:[
                        RotatedBox(quarterTurns:3,child: Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Single Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Double Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Duffle Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Padded coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Capes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Leather Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Wool Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Cargo & Military Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Faux  & Shearling Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Parka coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Rain Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Trench Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      ],
                    ),
                  ),
                ),
              ):null,

              body: Container(

                child: RotatedBox(
                  quarterTurns: 3,
                  child: TabBarView(
                      children:<Widget> [
                        Single(),
                        Double(),
                        Duffle(),
                        Padded(),
                         WCapes(),
                         WLeather(),

                        WWool(),
                        WCargo(),
                       WFaux(),
                        Parka(),
                        Rain(),
                        Trench(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}
