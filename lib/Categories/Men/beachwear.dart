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
class BeachwearM extends StatefulWidget {
  @override
  _BeachwearMState createState() => _BeachwearMState();
}

class _BeachwearMState extends State<BeachwearM> {
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
          ],
        );

    }
  }
  Tops(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'MBTops'),


    );
  }
  Shorts(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'MBShorts'),


    );
  }
  Trunks(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'MBTrunks'),


    );
  }
  Footwear(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'MBFootwear'),


    );
  }

  Accessories(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'MBAccessories'),


    );
  }

  @override

    Widget build(BuildContext context) {
      SizeConfig().init(context);
      return  RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length:5,
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
                      Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Trunks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Footwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),


                    ],
                  ),
                ),

                body: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        Tops(),
                        Trunks(),
                        Shorts(),
                        Footwear(),
                        Accessories(),

                      ]),
                ),
              )
          ),
        ),
      );
    }

}
