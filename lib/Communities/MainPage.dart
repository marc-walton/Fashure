import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/CollectionsUplaod.dart';
import 'package:fashow/Communities/CommunityPage.dart';
import 'package:fashow/Communities/Community_model.dart';
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
        Container(
          height:MediaQuery.of(context).size.height/1.625,
color: Cont,
          child:
    pagi()

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
      print(documentSnapshot.data().length);
      return  PaginateView(
        child: PaginateFirestore(
          isLive:true,
          itemBuilderType:
          PaginateBuilderType.listView, //Change types accordingly
          itemBuilder: (index, context, documentSnapshot) {
            List members =   documentSnapshot.data()['members'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all (Radius.circular(20.0)),
                child: GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>CommunityMainPage(

                    CommunityId:documentSnapshot.data()['communityId'],
                    photoUrl:documentSnapshot.data()['communityImg'],
                    description :documentSnapshot.data()['description'],
                    title :documentSnapshot.data()['title'],
                    members:   members ,

                  ))),
                  child: Stack(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: CachedImage(
                          documentSnapshot.data()['communityImg'], width: MediaQuery
                            .of(context)
                            .size
                            .width ,height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,fit: BoxFit.cover,),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment:Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(documentSnapshot.data()['title'], softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Row(

                                  children: [
                                    Icon(Icons.group,color: Colors.white,),
                                    Text("${members.length} members", softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );



          },


          query: FirebaseFirestore.instance.collection('Community')
              .where("members",arrayContains: currentUser.id)
              .orderBy('timestamp',descending: false),

        ),
      );



    },


    query: FirebaseFirestore.instance.collection('Community')
        .orderBy('timestamp',descending: false),

  ),
);

    }
    else {
      return  PaginateView(
        child: PaginateFirestore(
          isLive:true,
          itemBuilderType:
          PaginateBuilderType.listView, //Change types accordingly
          itemBuilder: (index, context, documentSnapshot) {
          List members =   documentSnapshot.data()['members'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all (Radius.circular(20.0)),
                child: GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>CommunityMainPage(

                   CommunityId:documentSnapshot.data()['communityId'],
                   photoUrl:documentSnapshot.data()['communityImg'],
                   description :documentSnapshot.data()['description'],
                      title :documentSnapshot.data()['title'],
                      members:   members ,

                  ))),
                  child: Stack(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: CachedImage(
                          documentSnapshot.data()['communityImg'], width: MediaQuery
                            .of(context)
                            .size
                            .width ,height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,fit: BoxFit.cover,),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment:Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(documentSnapshot.data()['title'], softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Row(

                                  children: [
                                    Icon(Icons.group,color: Colors.white,),
                                    Text("${members.length} members", softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );



          },


          query: FirebaseFirestore.instance.collection('Community')
              .where("members",arrayContains: currentUser.id)
              .orderBy('timestamp',descending: false),

        ),
      );

    }

  }
}

class SearchCommunity extends StatefulWidget {
  @override
  _SearchCommunityState createState() => _SearchCommunityState();
}

class _SearchCommunityState extends State<SearchCommunity> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = CommunityModel.fromDocument(tripSnapshot).title.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    var data = await  FirebaseFirestore.instance.collection('Community')
        .orderBy('timestamp',descending: false)

        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a Community...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,

          suffixIcon: IconButton(
            icon: Icon(Icons.clear,
                color: Colors.white),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: Container(
        color:Colors.grey.shade200,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCommunity(context, _resultsList[index]),
                )

            ),
          ],
        ),
      ),
    );
  }
}
Widget buildCommunity(BuildContext context, DocumentSnapshot document) {
  final prod = CommunityModel.fromDocument(document);
  // final tripType = trip.types();

  return InkWell(
  child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: ClipRRect(
    borderRadius: BorderRadius.all (Radius.circular(20.0)),
    child: GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>CommunityMainPage(

        CommunityId:prod.communityId,
        photoUrl:prod.communityImg,
        description :prod.description,
        title :prod.title,
        members:   prod.members ,

      ))),
      child: Stack(

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: CachedImage(
              prod.communityImg, width: MediaQuery
                .of(context)
                .size
                .width ,height: MediaQuery
                .of(context)
                .size
                .height / 3,fit: BoxFit.cover,),
          ),
          Positioned.fill(
            child: Align(
              alignment:Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(prod.title, softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    Row(

                      children: [
                        Icon(Icons.group,color: Colors.white,),
                        Text("${prod.members.length} members", softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ),
  ),
  ),

    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>CommunityMainPage(

      CommunityId:prod.communityId,
      photoUrl:prod.communityImg,
      description :prod.description,
      title :prod.title,
      members:   prod.members ,

    ))),
  );
}
