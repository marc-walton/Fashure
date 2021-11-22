import 'package:fashow/Resale/addressResale.dart';
import 'package:flutter/material.dart';

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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';


class UserCart extends StatefulWidget {

  final String currentUser;
  final String prodId;
  final String onwerId;
  UserCart({ this.currentUser,
    this.prodId,

    this.onwerId});

  @override
  _UserCartState createState() => _UserCartState( prodId: this.prodId,ownerId:this.onwerId);
}

class _UserCartState extends State<UserCart> {
  final _firestore = FirebaseFirestore.instance;
  String postOrientation = "grid";
  String shopOrientation = "grid";
  bool isFollowing = false;
  bool isLoading = false;
  String uid="";
  String prodId;
  String ownerId;
  Prod products;
List<bool> sold = <bool>[];
bool countryBool ;
  _UserCartState({
    this.prodId, this.products,this.ownerId,
  });

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(backgroundColor: kPrimaryColor,
          title: FittedBox(
            child: Text(   'Cart',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  color: Colors.white),),
          ),
          iconTheme: new IconThemeData(color: kIcon),
        ),

        body:Container(
          height :MediaQuery.of(context).size.height/2,
          child: StreamBuilder(
              stream: cartRef.doc(currentUser.id)
                  .collection('userCart')
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
                        return Expanded(
                          child: Container(
                            child:
                              Str(ownerId:ds['ownerId'],resaleId: ds['resaleId']),

                          ),
                        );
                      }
                  );
                }
              }
          ),
        ),


      );
  }
  Str({String ownerId,String resaleId}){
    return
      StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Resale')
              .doc(ownerId)
              .collection('userResale')
              .doc(resaleId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            } else {
              return new ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    sold.add(ds['sold']);
                    List images = ds['images'];
                    countryBool =    currentUser.country == ds['country']? true :false;
                    return Column(
                      children: [
                        new CartItem(
                          count: snapshot.data.docs.length,
                          shopmediaUrl: images.first,
                          productname: ds['title'],
                          eur: ds['eur'],
                          usd : ds['usd'],
                          inr: ds['inr'],
                          gbp: ds['gbp'],
                          photoUrl: ds['photoUrl'],
                          username: ds['username'],
                          prodId: ds['resaleId'],
                          ownerId: ds['ownerId'],
                          size: ds['size'],
                          sold:ds["sold"],
                        ),

                        Container(
                          child:
                          InkWell(
                            onTap: (){
                              if(sold.contains(true)){
                                Fluttertoast.showToast(
                                    msg: "Remove items that are sold" , timeInSecForIos: 4,gravity: ToastGravity.CENTER);
                              }
                              else{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddressResale(
                                      eur: ds['eur'],
                                      usd : ds['usd'],
                                      inr: ds['inr'],
                                      gbp: ds['gbp'],
                                      username: ds['username'],

                                      size: ds['size'],
                                      OwnerId: ds['ownerId'],
                                      resaleId:ds['resaleId'] ,
                                      profileimg: ds['photoUrl'],
                                      images:images.first,
                                      title:ds['title'],
                                      country:ds['country'],

                                      shipcost:currentUser.currency == 'INR' && currentUser.country == ds['country'] ?ds['shipcostinr']:
                                      currentUser.currency == 'EUR' && currentUser.country == ds['country'] ?ds['shipcosteur']:
                                      currentUser.currency == 'GBP' && currentUser.country == ds['country'] ?ds['shipcostgbp']:
                                      currentUser.currency == 'USD' && currentUser.country == ds['country'] ?ds['shipcostusd']:
                                      currentUser.currency == 'INR'  ?ds['shipcostinterninr']:
                                      currentUser.currency == 'EUR'  ?ds['shipcostinterneur']:
                                      currentUser.currency == 'GBP'  ?ds['shipcostinterngbp']:
                                      ds['shipcostinternusd'],
                                      // usd:Usd,
                                      // eur:Eur,
                                      // gbp:Gbp,
                                      // inr:Inr,
                                      // ship: ship,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: FittedBox(
                              fit:  BoxFit.fitHeight,
                              child: Container(
                                alignment:Alignment.center,

                                //icon: Icon(Icons.drag_handle),
                                child:Text("Check out",style:TextStyle(color: Colors.black)),

                              ),
                            ),
                          ),

                        ),
                      ],
                    );
                  }
              );
            }
          }
      );

  }
}
class CartItem extends StatelessWidget {
  final String username;
  final String prodId;
  final String ownerId;
  final String photoUrl;
  final String shopmediaUrl;
  final String productname;
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
  final String userId;
  final String size;
final String sold;
int count;
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
this.sold,

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
    var docReference = cartRef.doc(currentUser.id).collection("userCart").doc(prodId);
    docReference.delete();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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



        Divider(color: kGrey,),
      ],

    );


  }
}

