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
class KiddrGT extends StatefulWidget {
  final  int selectedPage;

  const KiddrGT({Key key, this.selectedPage}) : super(key: key);
  @override
  _KiddrGTState createState() => _KiddrGTState();
}

class _KiddrGTState extends State<KiddrGT> {
  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
  }



  TGGowns(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns'),

    );
  }
  TGParty(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGParty Dresses'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGParty Dresses')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGParty Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGParty Dresses'),

    );
  }
  TGOff(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGOff- Shoulder')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder'),

    );
  }
  TGOne(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGOne-Shoulder'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGOne-Shoulder')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGOne-Shoulder')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGOne-Shoulder'),

    );
  }
  TGShirt(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGShirt Dresses'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGShirt Dresses')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGShirt Dresses'),

    );
  }
  TGT(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)  :
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses'),

    );
  }
  TGShort(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGShort Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses'),

    );
  }
  TGKaftan(){
    return   PaginateFirestore(
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
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGKaftan Dresses'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGKaftan Dresses')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "low$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "high$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0D$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highD$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGKaftan Dresses'),

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

            length:8,
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
                      RotatedBox(quarterTurns:3,child: Text("Gowns",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Party Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Kaftan Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Off- Shoulder",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("One-Shoulder",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),

                      RotatedBox(quarterTurns:3,child: Text("Shirt Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("T-Shirt and Jersey Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Short Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
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
                        TGGowns(),
                        TGParty(),
                        TGKaftan(),
                        TGOff(),
                        TGOne(),
                        TGShirt(),
                        TGT(),
                        TGShort()

                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}
