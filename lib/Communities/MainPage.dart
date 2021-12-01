import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/CollectionsUplaod.dart';
import 'package:fashow/Shipping/shipEngine/ship_engine.dart';
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
  TabController _tabController;
  List<Post> posts;
  List<String> foollowingList = [];

  List timelinePosts = [];

  @override
  void initState() {
    super.initState();
    getFfollowing();


    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  List <Post>Posts = [];


  ///1
  getTimeline() async {
    QuerySnapshot snapshot = await timelineRef
        .doc(currentUser.id)
        .collection('timelinePosts')
        .orderBy('timestamp', descending: true)
        .get();
    List<Post> posts =
    snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    setState(() {
      this.posts = posts;
    });
  }
  ///2
  buildTimeline() {
    if (posts == null) {
      return circularProgress();
    } else if (posts.isEmpty) {
      return buildUsersToFollow();
    } else {
      return ListView(children: posts);
    }
  }

  getFfollowing() async {
    QuerySnapshot snapshot = await followingRef
        .doc(currentUser.id)
        .collection('userFollowing')
        .get();
    setState(() {
      foollowingList = snapshot.docs.map((doc) => doc.id).toList();
    });
  }



  buildUsersToFollow() {
    return StreamBuilder(
      stream:
      usersRef.orderBy('timestamp', descending: true).limit(30).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<UserResult> userResults = [];
        snapshot.data.docs.forEach((doc) {
          Users user = Users.fromDocument(doc);
          final bool isAuthUser = currentUser.id == user.id;
          final bool isFollowingUser = foollowingList.contains(user.id);
          // remove auth user from recommended list
          if (isAuthUser) {
            return;
          } else if (isFollowingUser) {
            return;
          } else {
            UserResult userResult = UserResult(user);
            userResults.add(userResult);
          }
        });
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person_add,
                      color: kblue,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Users to Follow",
                      style: TextStyle(
                        color: kblue,
                        fontSize: 30.0,
                      ),
                    )
                  ],
                ),
              ),
              Column(children: userResults),
            ],
          ),
        );
      },
    );
  }


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
          height: 150,
          child: GridView.builder(

              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery
                      .of(context)
                      .orientation == Orientation.portrait) ? 3 : 3),
              itemCount: 1,
              itemBuilder: (context, index) {
                // DocumentSnapshot docSnapshot = snapshot.data.docs[index];
                // List image = snapshot.data.docs[index]["mediaUrl"];
                return

                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         PostScreen(
                              //           postId: docSnapshot["postId"],
                              //           userId: docSnapshot["ownerId"],
                              //         ),
                              //   ),
                              // );
                            },
                            child:
                                Stack(children:[
                                  CachedImage("https://firebasestorage.googleapis.com/v0/b/fashure-app.appspot.com/o/appstore.png?alt=media&token=43d3aa9d-bf8a-4272-b0c5-debb92b291b0"),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.bottomCenter, child:Text("title",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)))),
                                ])
                        ),
                      )
                  );
              }),
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
            Text("Explore",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35)),
          ],
        ),
        ListTile(leading:CachedImage("https://firebasestorage.googleapis.com/v0/b/fashure-app.appspot.com/o/appstore.png?alt=media&token=43d3aa9d-bf8a-4272-b0c5-debb92b291b0"),
    title:Text("title",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),subtitle:Text("description......",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)))
      ],
    ),);
  }
  Widget Buttons(){
    if(_tabController.index == 2){return
      FloatingActionButton(
        heroTag:'upload',
        backgroundColor: Colors.black38,
        onPressed: () async{
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>ShipEngine()));
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Upload(currentUser: currentUser)));
        },
        child: Icon(Icons.add_a_photo),
      );}
    else{return
      FloatingActionButton(
        heroTag:'upload',
        backgroundColor: Colors.black38,
        onPressed: () async{
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>ShipEngine()));
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Upload(currentUser: currentUser)));
        },
        child: Icon(Icons.add_a_photo),
      );}

  }
}
