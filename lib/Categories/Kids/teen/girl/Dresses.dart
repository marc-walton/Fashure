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
class KiddrGT extends StatefulWidget {
  final  int selectedPage;

  const KiddrGT({Key key, this.selectedPage}) : super(key: key);
  @override
  _KiddrGTState createState() => _KiddrGTState();
}

class _KiddrGTState extends State<KiddrGT> {
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
  TGGowns(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGGowns')


    );
  }
  TGParty(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGParty Dresses')

    );
  }
  TGOff(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOff- Shoulder')

    );
  }
  TGOne(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGOne-Shoulder')

    );
  }
  TGShirt(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShirt Dresses')

    );
  }
  TGT(){
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
          String productname = documentSnapshot.data()['productname'];    String inr = documentSnapshot.data()['inr'];
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGT-Shirt and Jersey Dresses')

    );
  }
  TGShort(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGShort Dresses')

    );
  }
  TGKaftan(){
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
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('Category',isEqualTo: 'TGKaftan Dresses')
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

            length:8,
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

                    Text("Gowns",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Party Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Kaftan Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Off- Shoulder",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("One-Shoulder",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shirt Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("T-Shirt and Jersey Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Short Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),


                  ],
                ),
              ),

              body: Container(     decoration: BoxDecoration(
                  gradient: fabGradient
              ) ,
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        TGGowns(),
                        TGParty(),
                        TGKaftan(),
                        TGOff(),
                        TGOne(),
                        TGShirt(),
                        TGT(),
                        TGShort()

                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}
