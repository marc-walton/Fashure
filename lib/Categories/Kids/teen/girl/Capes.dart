import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';

import 'package:fashow/Product_screen.dart';

import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
class CapesGT extends StatefulWidget {
  final  int selectedPage;

  const CapesGT({Key key, this.selectedPage}) : super(key: key);
  @override
  _CapesGTState createState() => _CapesGTState();
}

class _CapesGTState extends State<CapesGT> {
  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
  }


  TGSingle(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
             .where('Category',isEqualTo: 'TGSingle Breasted Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGSingle Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGSingle Breasted Coats'),

    );
  }

  TGDouble(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
            .where('Category',isEqualTo: 'TGDouble Breasted Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDouble Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDouble Breasted Coats'),

    );
  }
  TGDuffle(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
            .where('Category',isEqualTo: 'TGDuffle Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGDuffle Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGDuffle Coats'),

    );
  }
  TGCapes(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
            .where('Category',isEqualTo: 'TGCapes'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGCapes')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCapes'),

    );
  }
  TGWool(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
           .where('Category',isEqualTo: 'TGWool Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGWool Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGWool Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGWool Coats'),

    );
  }
  TGCargo(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
           .where('Category',isEqualTo: 'TGCargo & Military Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGCargo & Military Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGCargo & Military Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGCargo & Military Coats'),

    );
  }
  TGFaux(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
           .where('Category',isEqualTo: 'TGFaux  & Shearling Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
             .where('Category',isEqualTo: 'TGFaux  & Shearling Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGFaux  & Shearling Coats'),

    );
  }
  TGRain(){
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
           .where('Category',isEqualTo: 'TGRain Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGRain Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGRain Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
           .where('Category',isEqualTo: 'TGRain Coats'),

    );
  }
  TGTrench(){
    return   PaginateFirestore(
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      IconButton(
                        onPressed: (){

                          if (_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': false});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .get()
                                  .then((doc) {
                                if (doc.exists) {
                                  doc.reference.delete();
                                }
                              });
                            }
                            var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            productsRef
                                .doc(ownerId)
                                .collection('userProducts')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "fav",
                                "username": currentUser.displayName,
                                "userId": ownerId,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userFav")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
//      "userId":userId,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "productname": productname,
                              "shopmediaUrl": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                        icon: Icon(
                          isLiked?   Icons.bookmark:Icons.bookmark_outline ,
                          color:  Colors.black,
                        ),
                        color:  Colors.black,
                      ),
                    ],
                  ),

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
            .where('Category',isEqualTo: 'TGTrench Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGTrench Coats'),

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

             length:9,
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
                       RotatedBox(quarterTurns:3,child: Text("Single Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                       RotatedBox(quarterTurns:3,child: Text("Double Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                       RotatedBox(quarterTurns:3,child: Text("Capes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                       RotatedBox(quarterTurns:3,child: Text("Duffle coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                       RotatedBox(quarterTurns:3,child: Text("Cargo & Military Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                       RotatedBox(quarterTurns:3,child: Text("Faux  & Shearling Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                       RotatedBox(quarterTurns:3,child: Text("Wool coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
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
                        TGSingle(),
                        TGDouble(),
                        TGCapes(),
                        TGDuffle(),
                         TGCargo(),
                         TGFaux(),
                        TGWool(),
                        TGRain(),
TGTrench(),
                       ]),
                 ),
               ),
             )
         ),
       ),
     );
  }
}
