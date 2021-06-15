import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/Categories/Kids/teen/boy/Accessories.dart';
import 'package:fashow/Categories/Kids/teen/boy/Denim.dart';
import 'package:fashow/Categories/Kids/teen/boy/Coats and Jackets.dart';
import 'package:fashow/Categories/Kids/teen/boy/knitwear.dart';
import 'package:fashow/Categories/Kids/teen/boy/Shoes.dart';
import 'package:fashow/Categories/Kids/teen/boy/Shorts.dart';
import 'package:fashow/Categories/Kids/teen/boy/Swimwear.dart';
import 'package:fashow/Categories/Kids/teen/boy/Top.dart';
import 'package:fashow/Categories/Kids/teen/boy/Tracks.dart';
import 'package:fashow/Categories/Kids/teen/boy/Trousers.dart';
import 'package:fashow/Categories/Kids/teen/boy/ETHNICT.dart';

import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';
class TeenBoy extends StatefulWidget {
  @override
  _TeenBoyState createState() => _TeenBoyState();
}

class _TeenBoyState extends State<TeenBoy> {
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
  Allin(){
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
            .where('Gender',isEqualTo: 'Teen-Boys')

    );
  }All(){
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
            .where('Gender',isEqualTo: 'Teen-Boys')
            .where('indian', isEqualTo:false)

    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (currentUser.country == 'India'){
      return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:12,
            child: Scaffold(
              appBar:AppBar(
                toolbarHeight: SizeConfig.safeBlockHorizontal * 15,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,

                  tabs:[
                    Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Coast & Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Tracks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
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
                        Allin(),
                        TBEthnic(),
                        TopsGT(),
                        TCB(),
                        DenimBT(),
                        TrouserTM(),
                        KidTB(),
                        KidshBT(),
                        KidswBT(),
                        TrackBT(),
                        KidSBT(),
                        AccessBT(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }else{ return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:11,
            child: Scaffold(
              appBar:AppBar(
                toolbarHeight: SizeConfig.safeBlockHorizontal * 15,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,

                  tabs:[
                    Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Coast & Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Tracks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
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
                        All(),
                        TopsGT(),
                        TCB(),
                        DenimBT(),
                        TrouserTM(),
                        KidTB(),
                        KidshBT(),
                        KidswBT(),
                        TrackBT(),
                        KidSBT(),
                        AccessBT(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );}
  }
}
