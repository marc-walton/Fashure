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
class ShoesW extends StatefulWidget {
  @override
  _ShoesWState createState() => _ShoesWState();
}

class _ShoesWState extends State<ShoesW> {
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
  WBallerinas(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WBallerinas')


    );
  }
  WEspadrilles(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WEspadrilles')



    );
  }
  Brogues(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WBrogues'),


    );
  }
  Boots(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WBoots'),

    );
  }
  WMules(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WMules')


    );
  }
  WPumps(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WPumps')

    );
  }
  Loafers(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'Loafers'),


    );
  }
  Oxford(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WOxford Shoes'),
    );
  }
  Lace(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WLace-Up Shoes'),
    );
  }
  Sandals(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSandals'),

    );
  }
  Flip(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WFlip flops & Slides'),


    );
  }
  Slippers(){
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
      query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Women')
          .where('Category',isEqualTo: 'WSlippers'),


    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:12,
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
                    Text("Ballerinas",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Espadrilles",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Brogues",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Boots",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Mules",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Pumps",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Loafers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Oxford Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Lace-Up Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Sandals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Flip flops & Slides",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Slippers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),


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
                        WBallerinas(),
                        WEspadrilles(),
                        Brogues(),
                       Boots(),
                        WMules(),
                       WPumps(),
                        Loafers(),
                       Oxford(),
                       Lace(),
                       Sandals(),
                       Flip(),
                       Slippers(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}
