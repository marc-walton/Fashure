import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/Categories/Men/hats.dart';
import 'package:fashow/Categories/Men/braces.dart';
import 'package:fashow/Categories/Men/ties.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';

class Accessories extends StatefulWidget {
  final  int selectedPage;

  const Accessories({Key key, this.selectedPage}) : super(key: key);

  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  df({String productname,String usd,String inr,String cny,String eur,String gbp,String prodId,String ownerId,}){
    if(currentUser.country=='India'){
      return

      ListTile(
        title:            Text(productname, style: TextStyle(
            color: kText,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),),
subtitle:            Text( "₹$inr",style: TextStyle(color: kText,
    fontSize: 20.0,
    fontWeight: FontWeight.bold)),

      );

  }
    else if(currentUser.country=='US'){
      return

      ListTile(
        title:                      Text(productname, style: TextStyle(
            color: kText,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),),

        subtitle:          Text( "\u0024 $usd",style: TextStyle(color: kText,
            fontSize: 20.0,
            fontWeight: FontWeight.bold)),

      );


    }
    else if (currentUser.country == 'Europe'){
      return

      ListTile(
        title:                      Text(productname, style: TextStyle(
            color: kText,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),),

        subtitle:           Text( "€ $eur",style: TextStyle(color: kText,
            fontSize: 20.0,
            fontWeight: FontWeight.bold)),

      );

  }
    else if (currentUser.country == 'UK'){
      return

      ListTile(
        title:                    Text(productname, style: TextStyle(
            color: kText,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),),

        subtitle:                     Text( "£  $gbp ",style: TextStyle(color: kText,
            fontSize: 20.0,
            fontWeight: FontWeight.bold)),


      );

  }
    else{
      return

        ListTile(
          title:                      Text(productname, style: TextStyle(
              color: kText,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),),

          subtitle:          Text( "\u0024 $usd",style: TextStyle(color: kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),

        );


    }
  }

  Scarves(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Scarves'),isLive:true,



    );
  }
  Belts(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Belts'),isLive:true,


    );
  }
  Glasses(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Glasses & Frames'),isLive:true,


    );
  }
  Sunglasses(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Sunglasses'),isLive:true,


    );
  }
  Gloves(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Gloves')
      ,isLive:true,

    );
  }
  Socks(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Socks'),isLive:true,


    );
  }
  PocketSquare(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'PocketSquare')
      ,isLive:true,

    );
  }
  Wallets(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Wallets')
    ,isLive:true,


    );
  }
  Umbrellas(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Umbrellas & Travel'),isLive:true,


    );
  }
  Phone(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
        String ownerId = documentSnapshot.data()['ownerId'];
        String prodId = documentSnapshot.data()['prodId'];
        String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
        String productname = documentSnapshot.data()['productname'];
        String inr = documentSnapshot.data()['inr'];
        String usd = documentSnapshot.data()['usd'];
        String eur = documentSnapshot.data()['eur'];
        String gbp = documentSnapshot.data()['gbp'];
        return
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  Divider(color: kGrey,),
                ],

              );

            },
          );
      },
      query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Phone')
      ,isLive:true,


    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            initialIndex:widget.selectedPage ?? 0,
            length:13,
            child: Scaffold(
              appBar:AppBar(
                toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,

                  tabs:[
                    Text("Hats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Scarves",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Belts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Braces & Suspenders",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Ties & Bow Ties",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Glasses & Frames",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Sunglasses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Gloves",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Socks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                     Text("Pocket Square & Handkerchiefs",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                     Text("Wallets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Umbrellas & Travel",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Phone cases",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                  ],
                ),
              ),

              body: Container(

              decoration: BoxDecoration(
    gradient: fabGradient
    ),
    alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        Hats(),
                        Scarves(),
                        Belts(),
                        Braces(),
                        Ties(),
                        Glasses(),
                        Sunglasses(),
                        Gloves(),
                        Socks(),
                        PocketSquare(),
                        Wallets(),
                        Umbrellas(),
                        Phone(),


                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }

}
