import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/CollectionsUplaod.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Shipping/shipEngine/ship_engine.dart';
import 'package:fashow/Timeline.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/upload_editorial.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/post.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/comments.dart';
import 'package:fashow/user.dart';
import 'package:fashow/Search.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fashow/Profile.dart';
import 'package:fashow/upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height:MediaQuery.of(context).size.height/25,
            child:            Row(
              children: [
                Text("My communities",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.search_sharp),),
                )
              ],
            ),

          ),
        ),
        Flexible(
          child:
        ListView(
          children: [
            Container(
            child:
                pagi(),
              ),

          ],
        )
          ,),
      ],
    );
  }
  pagi() {
    if (currentUser.communityId.length == 0) {
return  PaginateView(
  child: PaginateFirestore(
    isLive:true,
    itemBuilderType:
    PaginateBuilderType.listView, //Change types accordingly
    itemBuilder: (index, context, documentSnapshot) {
        return new Container(
        child:
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedImage(
                documentSnapshot.data()['communityImg'], width: MediaQuery
                  .of(context)
                  .size
                  .width / 3, height: 200,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(documentSnapshot.data()['title'], softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      documentSnapshot.data()['description'], softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
              ],
            ),
          ],
        ),
      );



    },


    query: FirebaseFirestore.instance.collection('Community')
        .orderBy('timestamp',descending: false),

  ),
);

    }
    else{
    for (var i = 0; i < currentUser.communityId.length; i++) {
      return
        FutureBuilder(
            future: FirebaseFirestore.instance.collection('Community')
                .doc(currentUser.communityId[i])
            // .where('ownerId' ,isEqualTo: '$ownerId')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Container(
                  child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedImage(
                          snapshot.data['communityImg'], width: MediaQuery
                            .of(context)
                            .size
                            .width / 3, height: 200,),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(snapshot.data['title'], softWrap: true,
                                overflow: TextOverflow.fade,
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ), Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                snapshot.data['description'], softWrap: true,
                                overflow: TextOverflow.fade,
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            });
    }
  }
  }
}
