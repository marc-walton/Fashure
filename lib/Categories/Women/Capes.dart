import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:image/image.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';
class CapesW extends StatefulWidget {
  @override
  _CapesWState createState() => _CapesWState();
}

class _CapesWState extends State<CapesW> {
  df({String productname,String usd,String inr,String cny,String eur,String gbp,String prodId,String ownerId,}){
    if(currentUser.country=='India'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "₹$inr",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if(currentUser.country=='US'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "\u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'China') {
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "¥ $cny",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'Europe'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "€ $eur",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'UK'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "£  $gbp ",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else{
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "\u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
  }
  Single(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSingle Breasted Coats'),


    );
  }
  Double(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDouble Breasted Coats'),


    );
  }
  Duffle(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WDuffle Coats'),


    );
  }
  Padded(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded Coats'),


    );
  }
  WCapes(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCapes')
       );
  }
  WLeather(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Coats')

       );
  }
  WWool(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WWool Coats')
       );
  }
  WCargo(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCargo & Military Coats')

       );
  }
  WFaux(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFaux  & Shearling Coats')

       );
  }

  Parka(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WParka Coats'),


    );
  }
  Rain(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WRain Coats'),


    );
  }
  Trench(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data['ownerId'];
        String prodId = documentSnapshot.data['prodId'];
        String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
        String productname = documentSnapshot.data['productname'];
        String inr = documentSnapshot.data['inr'];
        String cny = documentSnapshot.data['cny'];
        String usd = documentSnapshot.data['usd'];
        String eur = documentSnapshot.data['eur'];
        String gbp = documentSnapshot.data['gbp'];
        return
          FutureBuilder(
            future: usersRef.document(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(user.username,
                        style: TextStyle(color: kIcon),),),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Trench Coats'),


    );
  }
  Coats(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
          String ownerId = documentSnapshot.data['ownerId'];
          String prodId = documentSnapshot.data['prodId'];
          String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
          String productname = documentSnapshot.data['productname'];
          String inr = documentSnapshot.data['inr'];
          String cny = documentSnapshot.data['cny'];
          String usd = documentSnapshot.data['usd'];
          String eur = documentSnapshot.data['eur'];
          String gbp = documentSnapshot.data['gbp'];
          return
            FutureBuilder(
              future: usersRef.document(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(user.username,
                          style: TextStyle(color: kIcon),),),
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                        ],),),
                    df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WSingle Breasted Coats')
            .where('Category',isEqualTo: 'WDouble Breasted Coats')
            .where('Category',isEqualTo: 'WDuffle Coats')
            .where('Category',isEqualTo: 'WPadded Coats')
        .where('Category',isEqualTo: 'WCapes')
            .where('Category',isEqualTo: 'WLeather Coats')
         .where('Category',isEqualTo: 'WWool Coats')
         .where('Category',isEqualTo: 'WCargo & Military Coats')
        .where('Category',isEqualTo: 'WFaux  & Shearling Coats')

            .where('Category',isEqualTo: 'WParka Coats')
            .where('Category',isEqualTo: 'WRain Coats')
            .where('Category',isEqualTo: 'WTrench Coats')
    );
  }


  @override
  Widget build(BuildContext context) {

      SizeConfig().init(context);
    return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:13,
            child: Scaffold(
              backgroundColor: kPrimaryColor,

              appBar:AppBar(
                toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,
//                indicatorSize: TabBarIndicatorSize.label,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)
//                           ),
//                           color: Colors.white),

                  tabs:[
                    Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Single Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Double Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Duffle Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Padded coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Capes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Leather Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Wool Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Cargo & Military Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Faux  & Shearling Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Parka coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Rain Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Trench Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                  ],
                ),
              ),

              body: RotatedBox(
                quarterTurns: 1,
                child: TabBarView(
                    children:<Widget> [
                     Coats(),
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
            )
        ),
      ),
    );
  }
}