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
class JacketW extends StatefulWidget {
  final  int selectedPage;

  const JacketW({Key key, this.selectedPage}) : super(key: key);
  @override
  _JacketWState createState() => _JacketWState();
}

class _JacketWState extends State<JacketW> {
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
  SuitJ(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSuit Jackets'),


    );
  }
  WFitted(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFitted Jackets')
             );
  }
  Biker(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WBiker Jackets'),


    );
  }
  Bomber(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WBomber Jackets'),


    );
  }
  Blazers(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WBlazers'),


    );
  }
  WOver(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WOver-sized  Jackets')
        );
  }
  WTweed(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WTweed Jackets')
          .where('Category',isEqualTo: 'WCropped Jackets')
          .where('Category',isEqualTo: 'WHooded Jackets')
          .where('Category',isEqualTo: 'WLeather Jackets')
          .where('Category',isEqualTo: 'WPadded & Puffer Jackets')
          .where('Category',isEqualTo: 'WMilitary jackets')
          .where('Category',isEqualTo: 'WSport jackets')
          .where('Category',isEqualTo: 'WWaistcoats & Gillets'),


    );
  }
  WCropped(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WCropped Jackets')

     );
  }
  WHooded(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WHooded Jackets')


     );
  }
  WLeather(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Jackets')


     );
  }
  Hooded(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WHooded Jackets'),


    );
  }
  Leather(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLeather Jackets'),


    );
  }
  WPadded(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPadded & Puffer Jackets')
    );
  }

  Military(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WMilitary Jackets'),


    );
  }
  Sport(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSport Jackets'),


    );
  }
  Waistcoats(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
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
      query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WWaistcoats & Gillets'),


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

            length:14,
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

                    Text("Suit Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Fitted Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Biker Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Bomber Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Blazers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Over-sized  Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Tweed Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Cropped Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Padded & Puffer Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Hooded Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Leather Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Military jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Sport jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Waistcoats & Gilets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                  ],
                ),
              ),

              body: Container(
                decoration: BoxDecoration(
                    gradient: fabGradient
                ) ,
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                       SuitJ(),
                        WFitted(),
                        Biker(),
                       Bomber(),
                       Blazers(),
                        WOver(),
                       WTweed(),
                        WCropped(),
                        WPadded(),
                        WHooded(),
                        WLeather(),
                        Military(),
                       Sport(),
                        Waistcoats(),
                                           ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}
