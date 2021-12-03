import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/CollectionsUplaod.dart';
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
    return SingleChildScrollView(child:
    Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),

            child: TextFormField(
              style:  TextStyle(color: Colors.black),
              // controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for a community...",
                hintStyle: TextStyle(color: Colors.grey),

                filled: true,

                suffixIcon: IconButton(
                  icon: Icon(Icons.clear,
                      color: Colors.black),
                  // onPressed: clearSearch,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Text("My communities",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35)),
          ],
        ),
        Container(
          height:300,
          child: SingleChildScrollView(child:
            pagi(),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              elevation : 0.1,

              primary:  Colors.white.withOpacity(0.1), // background
              onPrimary:  Colors.black, // for
            ), child: Text("See all",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),),
          ),
        ),
        Row(
          children: [
            Text("More Communities",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35)),
          ],
        ),
        ListTile(leading:CachedImage("https://firebasestorage.googleapis.com/v0/b/fashure-app.appspot.com/o/appstore.png?alt=media&token=43d3aa9d-bf8a-4272-b0c5-debb92b291b0"),
    title:Text("title",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),subtitle:Text("description......",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)))
      ],
    ),);
  }
  pagi(){
    for(var i=0;i < currentUser.communityId.length;i++) {
      FutureBuilder (
          future:    FirebaseFirestore.instance.collection('Community')
              .doc(currentUser.communityId[i])
          // .where('ownerId' ,isEqualTo: '$ownerId')
              .get(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new Container(
                  height: 150,
                  child:
                  ListTile(leading:
                  CachedImage(snapshot.data['communityImg']),
                      title:Text(snapshot.data['title'],
                          style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
                      subtitle:Text(snapshot.data['description'],style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)))

              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          });


    }
  }
}
