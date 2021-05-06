
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:getflutter/getflutter.dart';
import 'package:fashow/upload_Ecommerce.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
class Fav extends StatefulWidget {

  final String currentUser;
  final String prodId;
  final String onwerId;
  Fav({ this.currentUser,
    this.prodId,

    this.onwerId});

  @override
  _FavState createState() => _FavState( prodId: this.prodId,ownerId:this.onwerId);
}

class _FavState extends State<Fav> {
  final _firestore = Firestore.instance;
  String postOrientation = "grid";
  String shopOrientation = "grid";
  bool isFollowing = false;
  bool isLoading = false;
  String uid="";
  String prodId;
  String ownerId;
  Prod products;
  _FavState({
    this.prodId, this.products,this.ownerId,
  });

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(backgroundColor: kSecondaryColor,
          title: FittedBox(
            child: Text(   'Favorites',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  color: Colors.white),),
          ),
          iconTheme: new IconThemeData(color: kIcon),
        ),
        backgroundColor: kPrimaryColor,

        body:StreamBuilder(
            stream: favRef.document(currentUser.id)
                .collection('userFav')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              } else {
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new CartItem(
                        count: snapshot.data.documents.length,
                        shopmediaUrl: ds['shopmediaUrl'],
                        productname: ds['productname'],
                        eur: ds['eur'],
                        usd : ds['usd'],
                        inr: ds['inr'],
                        cny: ds['cny'],
                        gbp: ds['gbp'],
                        photoUrl: ds['photoUrl'],
                        username: ds['username'],
                        prodId: ds['prodId'],
                        userId: ds['userId'],
                        ownerId: ds['ownerId'],
                        quantity: ds['quantity'],
                      );
                    }
                );
              }
            }
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
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
  final String userId;
  final int quantity;
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
    this.quantity
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
//    cartRef.document(currentUser.id).collection("userCart").document(prodId).setData({
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
    var docReference = favRef.document(currentUser.id).collection("userFav").document(prodId);
    docReference.delete();
  }
  @override
  Widget build(BuildContext context) {
//    configureshopmediaPreview(context);
    if(currentUser.country=='India') {
      return
        StreamBuilder(
          stream: usersRef.document(ownerId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
            bool isPostOwner = currentUserId == ownerId;

            return Column(children: <Widget>[
              Text('$count', style: TextStyle(fontSize: 20.0),),
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ), ),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
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



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(productname, style: TextStyle(
                      color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),),

                  Text('₹$inr', style: TextStyle(color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                  GFButton(
                    onPressed: () => showProduct(context),
                    text: "More",
                    icon: Icon(Icons.card_travel),
                    shape: GFButtonShape.pills,

                  ),
                ],
              ),

              Divider(color: kGrey,),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'China'){
      return
        FutureBuilder(
          future: usersRef.document(ownerId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
            bool isPostOwner = currentUserId == ownerId;

            return Column(children: <Widget>[
              Text('$count', style: TextStyle(fontSize: 20.0),),
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ), ),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(productname, style: TextStyle(
                      color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),),

                  Text('¥$cny', style: TextStyle(color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                  GFButton(
                    onPressed: () => showProduct(context),
                    text: "More",
                    icon: Icon(Icons.card_travel),
                    shape: GFButtonShape.pills,

                  ),
                ],
              ),

              Divider(color: kGrey,),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'Europe'){
      return
        FutureBuilder(
          future: usersRef.document(ownerId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
            bool isPostOwner = currentUserId == ownerId;

            return Column(children: <Widget>[
              Text('$count', style: TextStyle(fontSize: 20.0),),
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ), ),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(productname, style: TextStyle(
                      color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),),

                  Text('€$eur', style: TextStyle(color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                  GFButton(
                    onPressed: () => showProduct(context),
                    text: "More",
                    icon: Icon(Icons.card_travel),
                    shape: GFButtonShape.pills,

                  ),
                ],
              ),

              Divider(color: kGrey,),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'UK') {
      return
        FutureBuilder(
          future: usersRef.document(ownerId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
            bool isPostOwner = currentUserId == ownerId;

            return Column(children: <Widget>[
              Text('$count', style: TextStyle(fontSize: 20.0),),
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ), ),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(productname, style: TextStyle(
                      color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),),

                  Text('£$gbp', style: TextStyle(color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                  GFButton(
                    onPressed: () => showProduct(context),
                    text: "More",
                    icon: Icon(Icons.card_travel),
                    shape: GFButtonShape.pills,

                  ),
                ],
              ),

              Divider(color: kGrey,),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'USA')  {
      return
        FutureBuilder(
          future: usersRef.document(ownerId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
            bool isPostOwner = currentUserId == ownerId;

            return Column(children: <Widget>[
              Text('$count', style: TextStyle(fontSize: 20.0),),
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ), ),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(productname, style: TextStyle(
                      color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),),

                  Text('\u0024 $usd', style: TextStyle(color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                  GFButton(
                    onPressed: () => showProduct(context),
                    text: "More",
                    icon: Icon(Icons.card_travel),
                    shape: GFButtonShape.pills,

                  ),
                ],
              ),

              Divider(color: kGrey,),
            ],

            );
          },
        );
    }
    else {
      return
        FutureBuilder(
          future: usersRef.document(ownerId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
            bool isPostOwner = currentUserId == ownerId;

            return Column(children: <Widget>[
              Text('$count', style: TextStyle(fontSize: 20.0),),
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ),
                trailing: FloatingActionButton(
                  mini: true,
                  backgroundColor: kText.withOpacity(0.5),
                  onPressed: deleteFav,
                  child: Icon(Icons.delete),
                ),
              ),

              GestureDetector(
                onTap: () => showProduct(context),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: cachedNetworkImage(shopmediaUrl)),
//                  Positioned(
//                    top: 10.0,
//                    right: 10.0,
//                    child:
//                  )
                  ],),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(productname, style: TextStyle(
                      color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),),

                  Text('\u0024 $usd', style: TextStyle(color: kText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                  GFButton(
                    onPressed: () => showProduct(context),
                    text: "More",
                    icon: Icon(Icons.card_travel),
                    shape: GFButtonShape.pills,

                  ),
                ],
              ),

              Divider(color: kGrey,),
            ],

            );
          },
        );
    }

  }
}