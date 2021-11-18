import 'package:flutter/material.dart';
import 'package:fashow/Resale/resaleScreen.dart';
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
class TCB extends StatefulWidget {
  final  int selectedPage;

  const TCB({Key key, this.selectedPage}) : super(key: key);
  @override
  _TCBState createState() => _TCBState();
}

class _TCBState extends State<TCB> {
  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
  }


  TBBlazer(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBlazer'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBlazer')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBBlazer')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBlazer'),

    );
  }
  TBDuffle(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDuffle coats'),

    );
  }
  TBPadded(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBPadded coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBPadded coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBPadded coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBPadded coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBPadded coats'),

    );
  }
  TBBomber(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
              .where('Category',isEqualTo: 'TBBomber Jackets'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
              .where('Category',isEqualTo: 'TBBomber Jackets')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
              .where('Category',isEqualTo: 'TBBomber Jackets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBBomber Jackets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
              .where('Category',isEqualTo: 'TBBomber Jackets'),

    );
  }
  TBDenim(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBDenim Jackets'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBDenim Jackets')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDenim Jackets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDenim Jackets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBDenim Jackets'),

    );
  }
  TBSingle(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
                .where('Category',isEqualTo: 'TBSingle Breasted Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
                .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBSingle Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
                .where('Category',isEqualTo: 'TBSingle Breasted Coats'),

    );
  }
  TBDouble(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBDouble Breasted Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBDouble Breasted Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBDouble Breasted Coats'),

    );
  }
  TBWool(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBWool coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBWool coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWool coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWool coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBWool coats'),

    );
  }
  TBRain(){
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBRain Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBRain Coats')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBRain Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBRain Coats')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBRain Coats'),

    );
  }
  TBWaist(){
    return   PaginateFirestore(
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
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
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
                        builder: (context) => ResaleScreen(
                          postId: prodId,
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
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
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
                            var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
                            docReference.delete();
                            setState(() {
                              isLiked = false;
                              likes[currentUser.id] = false;
                            });
                          } else if (!_isLiked) {
                            FirebaseFirestore.instance.collection('Resale')
                                .doc(ownerId)
                                .collection('userResale')
                                .doc(prodId)
                                .update({'likes.${currentUser.id}': true});
                            bool isNotPostOwner = currentUser.id != ownerId;
                            if (isNotPostOwner) {
                              activityFeedRef
                                  .doc(ownerId)
                                  .collection("feedItems")
                                  .doc(prodId)
                                  .set({
                                "type": "resaleLike",
                                "username": currentUser.displayName,
                                "userId": currentUser.id,
                                "userProfileImg": currentUser.photoUrl,
                                "postId": prodId,
                                "mediaUrl": shopmediaUrl.first,
                                "timestamp": timestamp,
                                "read": 'false',
                              });
                            }
                            favRef.doc(currentUser.id).collection("userWishlist")
                                .doc(prodId)
                                .set({
                              "username": username,
                              "prodId": prodId,
                              "timestamp": timestamp,
                              "photoUrl": photoUrl,
                              "size":size,
                              "ownerId": ownerId,
                              "eur":eur,
                              "usd":usd,
                              "inr":inr,
                              "gbp":gbp,
                              "title": productname,
                              "images": shopmediaUrl.first,
                            });
                            setState(() {
                              isLiked = true;
                              likes[currentUser.id] = true;
//        showHeart = true;
                            });
                          }
                        },
                          icon:Icon(Icons.bookmark_add ),
                        color:  Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
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
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBWaist Coats & Gilets'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            :priceQuery == "0D"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "0S$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "highD"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        priceQuery == "highS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "0DS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "lowDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: false)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
            :priceQuery == "highDS$sizeFilter"?
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
             .where('Category',isEqualTo: 'TBWaist Coats & Gilets')

            .where('country',isEqualTo: '${currentUser.country}')
            .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
        FirebaseFirestore.instance.collectionGroup('userResale')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Boys')
               .where('Category',isEqualTo: 'TBWaist Coats & Gilets'),

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

             length:10,
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
                        RotatedBox(quarterTurns:3,child: Text("Blazer",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Duffle coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Padded coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Bomber Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Denim Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Wool coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Rain Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                        RotatedBox(quarterTurns:3,child: Text("Waist Coats & Gilets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
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
                         TBSingle(),
                         TBDouble(),
                         TBBlazer(),
                         TBDuffle(),
                         TBPadded(),
                         TBBomber(),
                         TBDenim(),
                         TBWool(),
                         TBRain(),
                         TBWaist(),

                       ]),
                 ),
               ),
             )
         ),
       ),
     );
  }
}
