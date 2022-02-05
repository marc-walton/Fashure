
import 'package:fashow/Communities/Community_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashow/HomePage.dart';

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fashow/Constants.dart';

import 'package:uuid/uuid.dart';


class ShareButton extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String description;
  final String type;
  final String imageURL;
  final String productname;
  final String usd;
  final String eur;
  final String inr;
  final String gbp;

  final Uri uri;

  const ShareButton({Key key, this.postId, this.ownerId, this.description, this.type, this.imageURL, this.uri, this.productname, this.usd, this.eur, this.inr, this.gbp}) : super(key: key);
  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  TextEditingController _searchController = TextEditingController();
   TextEditingController _desController = TextEditingController();

  String postId = Uuid().v4();
 String CommunityId;

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
post(){
  FirebaseFirestore.instance.collection('Community')
      .doc(CommunityId)
      .collection('communityPosts')
      .doc(postId)
      .set({
    "type":widget.type,
    'ownerId':currentUser.id,
    'username':currentUser.displayName,
    'photoUrl':currentUser.photoUrl,
    'postId':postId,
    "location":"",
    "country":  currentUser.country,
    "currency":  currentUser.currency,
    "image":widget.imageURL,
    "communityId":CommunityId,

    "likes": {},
    "timestamp": timestamp,

    'description':_desController.text??"",
    "name":widget.productname??"",
    "usd":widget.usd??"",
    "eur":widget.eur??"",
    "inr":widget.inr??"",
    "gbp":widget.gbp??"",
    "taggedId":widget.postId,
     "taggedOwnerId":widget.ownerId,

    "taggerId":currentUser.id,
    "taggerImg":currentUser.photoUrl,
    "taggerName":currentUser.username,
    "taggerCurrency":currentUser.currency,

  });
}
  getUsersPastTripsStreamSnapshots() async {
    if (currentUser.communityId.length == 0) {
      return Center(child: Text("Please join a community to start sharing"),);
    }
    else {
      var data = await FirebaseFirestore.instance.collection('Community')
          .where('members', arrayContains: currentUser.id)
          .orderBy('timestamp', descending: false)

          .get();
      setState(() {
        _allResults = data.docs;
      });
      searchResultsList();
      return "complete";
    }
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
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
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buCard(context, _resultsList[index]),
                )

            ),
          ],
        ),
      ),
    );
  }
  Widget buCard(BuildContext context, DocumentSnapshot document) {
    final user = CommunityModel.fromDocument(document);
    // final tripType = trip.types();

    return new Container(
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(  user.communityImg,),
              ),
              title: Text(
                user.title,
                style:
                TextStyle(color:kText, fontWeight: FontWeight.bold),
              ),

            ),
          ),


          onTap: ()  {
            CommunityId = user.communityId;
            showDialog(context: context, builder: (context){
              return
                  AlertDialog(title:Text("Description"),
                    content:TextField(
                      style:TextStyle(color: kText),

                      controller: _desController,
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: InputBorder.none,
                      ),
                    ),
                  actions: [
                    TextButton(
                      child: Text('Share'),
                      onPressed: (){
                        post();
                      },
                    ),
                  ],
                  );
            });
            Get.back();
             Get.back();

          },
        ),
      ),
    );
  }

}
