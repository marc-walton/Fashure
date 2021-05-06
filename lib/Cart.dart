
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/model/address.dart';
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
class Cart extends StatefulWidget {

  final User currentUser;
  final String prodId;
  final String onwerId;
  Cart({ this.currentUser,
    this.prodId,

    this.onwerId});

  @override
  _CartState createState() => _CartState( prodId: this.prodId,ownerId:this.onwerId);
}

class _CartState extends State<Cart> {
  final _firestore = Firestore.instance;
  String postOrientation = "grid";
  String shopOrientation = "grid";
  bool isFollowing = false;
  bool isLoading = false;
  String uid="";
  String prodId;
  String ownerId;
  Prod products;
  var total = 0;
  List<String> followingList = [];
  _CartState({
    this.prodId, this.products,this.ownerId,
  });
  Subtotal()async{
    if(currentUser.country=='Europe') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += doc.data['eur'];
        });
      });
      return {total.toString(), CartItem(total: total.toString(),)};
    }
    else  if(currentUser.country=='India') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += doc.data['inr'];
        });
      });
      return {total.toString(), CartItem(total: total.toString(),)};
    }
    else  if(currentUser.country=='UK') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += doc.data['gbp'];
        });
      });
      return {total.toString(), CartItem(total: total.toString(),)};
    }
    else if(currentUser.country=='China') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += doc.data['cny'];
        });
      });
      return {total.toString(), CartItem(total: total.toString(),)};
    }
    else if(currentUser.country=='USA') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += doc.data['usd'];
        });
      });
      return {total.toString(), CartItem(total: total.toString(),)};
    }
     else{
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += doc.data['usd'];
        });
      });
      return {total.toString(), CartItem(total: total.toString(),)};
    }

  }
  getFollowing() async {
    QuerySnapshot snapshot = await followersRef
        .document(currentUser.id)
        .collection('userFollowers')
        .getDocuments();
    setState(() {
      followingList = snapshot.documents.map((doc) => doc.documentID).toList();
      print(followingList);
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(backgroundColor: kSecondaryColor,
          title: Text('Cart',
            style: TextStyle(
                fontFamily :"MajorMonoDisplay",
                fontSize:  35.0 ,
                color: Colors.white),),
          iconTheme: new IconThemeData(color: kIcon),
        ),
        backgroundColor: kPrimaryColor,

        body:
        StreamBuilder(
            stream: cartRef.document(currentUser.id)
                .collection('userCart')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return  Center(child: Text('text',style: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  35.0 ,
                    color: Colors.white),));
              } else  {
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
                        userSize: ds['userSize'],

                      );
                    }
                );
              // ignore: unnecessary_statements
              }
            }
        ),

      );
  }
}
class CartItem extends StatelessWidget {
  final int count;
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
  final String total;

  final int userSize;

  final String currentUserId = currentUser?.id;



  CartItem({
    this.count,
    this.ownerId,
    this.prodId,
    this.total,
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
    this.userSize
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
    var docReference = cartRef.document(currentUser.id).collection("userCart").document(prodId);
    docReference.delete();
  }
Checkout(){
    return
  Align(
    alignment: FractionalOffset.
    bottomCenter,
    child: RaisedButton(
     onPressed: ()=>Address(),
      color: kblue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
      ),
      child: Text('CHECK OUT ', style: TextStyle(color: kText),),
    ),
  );
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
              // Text('$count', style: TextStyle(fontSize: 20.0),),
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
              trailing:        Positioned(
                top: 10.0,
                right: 10.0,
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor:kText.withOpacity(0.5),
                  onPressed: deleteFav,
                  child: Icon(Icons.delete,color: Colors.red,),
                ),
              ),),
                        GestureDetector(
                  onTap: () => showProduct(context),
                  child: Column(
                    children: [
                      Container(
                        height:  MediaQuery.of(context).size.height * 0.20,
                        child: ListTile(
                           leading:ClipRRect(
                               borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                         
                          trailing: Column(
                            children: [
                              Text(productname, style: TextStyle(
                                  color: kText,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),),
                              Text('Size:$userSize', style: TextStyle(color: kText,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                              Text('₹$inr', style: TextStyle(color: kText,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),),
              

              Divider(color: kGrey,),
              ListTile(
                leading: Text('$count ITEMS', style: TextStyle(fontSize: 20.0),),
                trailing: Text('SUBTOTAL:₹$total '),
              ),
              Align(
                alignment: FractionalOffset.
                bottomCenter,
                child: RaisedButton(
                  onPressed: ()=>Address(),
                  color: kblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  child: Text('CHECK OUT ', style: TextStyle(color: kText),),
                ),
              ),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'China'){
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
              // Text('$count', style: TextStyle(fontSize: 20.0),),
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
                trailing:        Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor:kText.withOpacity(0.5),
                    onPressed: deleteFav,
                    child: Icon(Icons.delete,color: Colors.red,),
                  ),
                ),),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Column(
                  children: [
                    Container(
                      height:  MediaQuery.of(context).size.height * 0.20,
                      child: ListTile(
                        leading:ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),

                        trailing: Column(
                          children: [
                            Text(productname, style: TextStyle(
                                color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),),
                            Text('Size:$userSize', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                            Text('¥$cny', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),),


              Divider(color: kGrey,),
              ListTile(
                leading: Text('$count ITEMS', style: TextStyle(fontSize: 20.0),),
                trailing: Text('SUBTOTAL:₹$total '),
              ),
              Align(
                alignment: FractionalOffset.
                bottomCenter,
                child: RaisedButton(
                  onPressed: ()=>Address(),
                  color: kblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  child: Text('CHECK OUT ', style: TextStyle(color: kText),),
                ),
              ),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'Europe'){
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
              // Text('$count', style: TextStyle(fontSize: 20.0),),
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
                trailing:        Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor:kText.withOpacity(0.5),
                    onPressed: deleteFav,
                    child: Icon(Icons.delete,color: Colors.red,),
                  ),
                ),),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Column(
                  children: [
                    Container(
                      height:  MediaQuery.of(context).size.height * 0.20,
                      child: ListTile(
                        leading:ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),

                        trailing: Column(
                          children: [
                            Text(productname, style: TextStyle(
                                color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),),
                            Text('Size:$userSize', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                            Text('€$eur', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),),


              Divider(color: kGrey,),
              ListTile(
                leading: Text('$count ITEMS', style: TextStyle(fontSize: 20.0),),
                trailing: Text('SUBTOTAL:₹$total '),
              ),
              Align(
                alignment: FractionalOffset.
                bottomCenter,
                child: RaisedButton(
                  onPressed: ()=>Address(),
                  color: kblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  child: Text('CHECK OUT ', style: TextStyle(color: kText),),
                ),
              ),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'UK') {
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
              // Text('$count', style: TextStyle(fontSize: 20.0),),
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
                trailing:        Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor:kText.withOpacity(0.5),
                    onPressed: deleteFav,
                    child: Icon(Icons.delete,color: Colors.red,),
                  ),
                ),),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Column(
                  children: [
                    Container(
                      height:  MediaQuery.of(context).size.height * 0.20,
                      child: ListTile(
                        leading:ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),

                        trailing: Column(
                          children: [
                            Text(productname, style: TextStyle(
                                color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),),
                            Text('Size:$userSize', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                            Text('£$gbp', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),),


              Divider(color: kGrey,),
              ListTile(
                leading: Text('$count ITEMS', style: TextStyle(fontSize: 20.0),),
                trailing: Text('SUBTOTAL:₹$total '),
              ),
              Align(
                alignment: FractionalOffset.
                bottomCenter,
                child: RaisedButton(
                  onPressed: ()=>Address(),
                  color: kblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  child: Text('CHECK OUT ', style: TextStyle(color: kText),),
                ),
              ),
            ],

            );
          },
        );
    }
    else if (currentUser.country == 'USA')  {
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
              // Text('$count', style: TextStyle(fontSize: 20.0),),
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
                trailing:        Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor:kText.withOpacity(0.5),
                    onPressed: deleteFav,
                    child: Icon(Icons.delete,color: Colors.red,),
                  ),
                ),),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Column(
                  children: [
                    Container(
                      height:  MediaQuery.of(context).size.height * 0.20,
                      child: ListTile(
                        leading:ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),

                        trailing: Column(
                          children: [
                            Text(productname, style: TextStyle(
                                color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),),
                            Text('Size:$userSize', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                            Text('\u0024 $usd', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),),


              Divider(color: kGrey,),
              ListTile(
                leading: Text('$count ITEMS', style: TextStyle(fontSize: 20.0),),
                trailing: Text('SUBTOTAL:₹$total '),
              ),
              Align(
                alignment: FractionalOffset.
                bottomCenter,
                child: RaisedButton(
                  onPressed: ()=>Address(),
                  color: kblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  child: Text('CHECK OUT ', style: TextStyle(color: kText),),
                ),
              ),
            ],

            );
          },
        );
    }
 else {
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
              // Text('$count', style: TextStyle(fontSize: 20.0),),
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
                trailing:        Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor:kText.withOpacity(0.5),
                    onPressed: deleteFav,
                    child: Icon(Icons.delete,color: Colors.red,),
                  ),
                ),),
              GestureDetector(
                onTap: () => showProduct(context),
                child: Column(
                  children: [
                    Container(
                      height:  MediaQuery.of(context).size.height * 0.20,
                      child: ListTile(
                        leading:ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),

                        trailing: Column(
                          children: [
                            Text(productname, style: TextStyle(
                                color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),),
                            Text('Size:$userSize', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                            Text('\u0024 $usd', style: TextStyle(color: kText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),),


              Divider(color: kGrey,),
              ListTile(
                leading: Text('$count ITEMS', style: TextStyle(fontSize: 20.0),),
                trailing: Text('SUBTOTAL:₹$total '),
              ),
              Align(
                alignment: FractionalOffset.
                bottomCenter,
                child: RaisedButton(
                  onPressed: ()=>Address(),
                  color: kblue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  child: Text('CHECK OUT ', style: TextStyle(color: kText),),
                ),
              ),
            ],

            );
          },
        );
    }

  }
}