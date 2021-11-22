
import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:flutter/cupertino.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/product_custom.dart';

import 'package:fashow/upload_Ecommerce.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ResaleWishList extends StatefulWidget {

  final String currentUser;
  final String prodId;
  final String onwerId;
  ResaleWishList({ this.currentUser,
    this.prodId,

    this.onwerId});

  @override
  _ResaleWishListState createState() => _ResaleWishListState( prodId: this.prodId,ownerId:this.onwerId);
}

class _ResaleWishListState extends State<ResaleWishList> {
  final _firestore = FirebaseFirestore.instance;
  String postOrientation = "grid";
  String shopOrientation = "grid";
  bool isFollowing = false;
  bool isLoading = false;
  String uid="";
  String prodId;
  String ownerId;
  Prod products;

  _ResaleWishListState({
    this.prodId, this.products,this.ownerId,
  });

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(backgroundColor: kPrimaryColor,
          title: FittedBox(
            child: Text(   'Wishlist',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  color: Colors.white),),
          ),
          iconTheme: new IconThemeData(color: kIcon),
        ),

        body:Container(
          color: Cont,

          child: StreamBuilder(
              stream: favRef.doc(currentUser.id)
                  .collection('userWishlist')
                  .orderBy('timestamp', descending:true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                } else {
                  return new ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        return new CartItem(
                          count: snapshot.data.docs.length,
                          shopmediaUrl: ds['images'],
                          productname: ds['title'],
                          eur: ds['eur'],
                          usd : ds['usd'],
                          inr: ds['inr'],
                          gbp: ds['gbp'],
                          photoUrl: ds['photoUrl'],
                          username: ds['username'],
                          prodId: ds['prodId'],
                          userId: ds['userId'],
                          ownerId: ds['ownerId'],
                          size: ds['size'],
                        );
                      }
                  );
                }
              }
          ),
        ),


      );
  }
}
class CartItem extends StatelessWidget {
  final String username;
  final int count;
  final String prodId;
  final String ownerId;
  final String photoUrl;
  final String shopmediaUrl;
  final String productname;
  var eur;
  var usd;
  var inr;
  var cny;
  var gbp;
  final String userId;
  final String size;

  final String currentUserId = currentUser?.id;



  CartItem({
    this.count,
    this.ownerId,
    this.prodId,
    this.shopmediaUrl,
    this.username,
    this.photoUrl,
    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
    this.productname,
    this.userId,
    this.size,

  });

  showProduct(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          prodId: prodId,
          userId: ownerId,
        ),
      ),
    );
  }
//  addToCart() {
//    cartRef.doc(currentUser.id).collection("userCart").doc(prodId).set({
//      "username": username,
//       "prodId": prodId,
//      "timestamp": timestamp,
//      "avatarUrl": photoUrl,
////      "userId":userId,
//     "ownerId": ownerId,
//     "price":price,
//    "productname":productname,
//    "shopmediaUrl":shopmediaUrl
//    });
//  }
  deleteFav(){
    var docReference = favRef.doc(currentUser.id).collection("userWishlist").doc(prodId);
    docReference.delete();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(photoUrl),
                  backgroundColor: Colors.grey,
                ),
              ),
              title: GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child: Text(
                  username,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showProduct(context),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),child:CachedImage(shopmediaUrl,height: MediaQuery
                      .of(context)
                      .size
                      .height/3,width: MediaQuery
                      .of(context)
                      .size
                      .width,),),
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor:kText.withOpacity(0.5),
                      onPressed: deleteFav,
                      child: Icon(Icons.delete,color: Colors.red,),
                    ),
                  )
                ],),),

            Text(productname, style: TextStyle(
              color: kText,
            ),),
            SizedBox(height: 7.0,),

            Text("size:$size", style: TextStyle(
              color: kText,
            ),),


            SizedBox(height: 7.0,),

            currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
            currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
            currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
            Text(
                "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold)),



          ],

        ),
      ),
    );


  }
}