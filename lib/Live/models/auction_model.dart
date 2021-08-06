import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Live/countdown_timer/current_remaining_time.dart';
import 'package:fashow/Live/countdown_timer/flutter_countdown_timer.dart';
import 'package:fashow/model/address_auction.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:flutter/cupertino.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
List <Widget>_listOfImages = <Widget>[];

class AuctionModel extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String photoUrl;
  final String endingTime;
  final bool hasEnded;
  final dynamic likes;
 final List images;
 final int year  ;
 final int month  ;
 final int day ;
 final int hour  ;
 final int minute  ;
  final int second  ;

 final  topBid1  ;
 final  topBid2 ;
 final  topBid3 ;
 final String topBidder1 ;
 final String topBidder2;
 final String topBidder3;
 final String topBidderImg1;
 final String topBidderImg2;
 final String topBidderImg3;
 final String topBidderId1 ;
 final String topBidderId2 ;
 final String topBidderId3 ;
  final usd ;
  final inr ;
 final int minimumBid;
  final String description;
  final int amount;
  AuctionModel({
    this.postId,
    this.ownerId,
    this.username,
    this.photoUrl,
    this.endingTime,
    this.hasEnded,
    this.likes,
     this.images,
    this.year, this.month,
    this.day, this.hour,
    this.minute, this.second,
    this.topBid1, this.topBid2,
    this.topBid3, this.topBidder1,
    this.topBidder2, this.topBidder3,
    this.topBidderImg1, this.topBidderImg2
    , this.topBidderImg3, this.topBidderId1,
    this.topBidderId2, this.topBidderId3,
    this.usd, this.inr, this.minimumBid,
    this.description, this.amount,

  });

  factory AuctionModel.fromDocument(DocumentSnapshot doc) {
    return AuctionModel(
      postId: doc.data()['postId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      endingTime: doc.data()['endingTime'],
      hasEnded: doc.data()['hasEnded'],
      photoUrl: doc.data()['photoUrl'],
      likes: doc.data()['likes'],
       images: doc.data()['images'],
      year: doc.data()['year'],
      month: doc.data()['month'],
      day: doc.data()['day'],
      hour: doc.data()['hour'],
      minute: doc.data()['minute'],
      second: doc.data()['second'],
      topBid1: doc.data()['topBid1'],
      topBid2: doc.data()['topBid2'],
      topBid3: doc.data()['topBid3'],
      topBidder1: doc.data()['topBidder1'],
      topBidder2: doc.data()['topBidder2'],
      topBidder3: doc.data()['topBidder3'],
      topBidderImg1: doc.data()['topBidderImg1'],
      topBidderImg2: doc.data()['topBidderImg2'],
      topBidderImg3: doc.data()['topBidderImg3'],
     topBidderId1: doc.data()['topBidderId1'],
      topBidderId2: doc.data()['topBidderId2'],
      topBidderId3: doc.data()['topBidderId3'],
      usd: doc.data()['usd'],
      inr: doc.data()['inr'],
      minimumBid: doc.data()['minimumBid'],
      description: doc.data()['description'],
      amount: doc.data()['amount'],

    );
  }

  int getLikeCount(likes) {
    //if no likesm return 0
    if (likes == null) {
      return 0;
    }
    int count = 0;
    // if the key is explicitly set to true, add a like
    likes.values.forEach((val) {
      if (val == true) {
        count += 1;
      }
    });
    return count;
  }

  @override
  _AuctionModelState createState() => _AuctionModelState(
        postId: this.postId,
        ownerId: this.ownerId,
        username: this.username,
        hasEnded: this.hasEnded,
        photoUrl: this.photoUrl,
        endingTime: this.endingTime,
        likes: this.likes,
        likeCount: getLikeCount(this.likes),
      images: this.images,
    year: this.year,
    month: this.month,
    day: this.day,
    hour:  this.hour,
    minute:  this.minute,
    second: this.second,
    topBid1: this.topBid1,
    topBid2: this.topBid2,
    topBid3: this.topBid3,
    topBidder1:  this.topBidder1,
    topBidder2:  this.topBidder2,
    topBidder3: this.topBidder3,
    topBidderImg1:  this.topBidderImg1,
    topBidderImg2:  this.topBidderImg2,
    topBidderImg3 :this.topBidderImg3,
    topBidderId1:  this.topBidderId1,
    topBidderId2: this.topBidderId2,
    topBidderId3: this.topBidderId3,
    usd: this.usd,
    inr: this.inr,
    minimumBid:  this.minimumBid,
    description: this.description,
    amount:  this.amount,
      );
}

class _AuctionModelState extends State<AuctionModel> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String ownerId;
  final String photoUrl;
  final List images;
  final int year  ;
  final int month  ;
  final int day ;
  final int hour  ;
  final int minute  ;
  final int second  ;

  final  topBid1  ;
  final  topBid2 ;
  final  topBid3 ;
  final String topBidder1 ;
  final String topBidder2;
  final String topBidder3;
  final String topBidderImg1;
  final String topBidderImg2;
  final String topBidderImg3;
  final String topBidderId1 ;
  final String topBidderId2 ;
  final String topBidderId3 ;
  final usd ;
  final inr ;
  final int minimumBid;
  final String description;
  final int amount;
  final String username;
  final String endingTime;
  final bool hasEnded;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  TextEditingController TextController = TextEditingController();

  _AuctionModelState({
      this.year, this.month,
      this.day, this.hour,
      this.minute, this.second,
      this.topBid1, this.topBid2, this.topBid3,
      this.topBidder1, this.topBidder2, this.topBidder3,
      this.topBidderImg1, this.topBidderImg2, this.topBidderImg3,
      this.topBidderId1, this.topBidderId2, this.topBidderId3,
      this.usd, this.inr, this.minimumBid, this.description,
      this.amount,
    this.postId,
    this.ownerId,
    this.username,
    this.endingTime,
    this.hasEnded,
    this.likes,
    this.likeCount,
    this.photoUrl,
     this.images,

  });

  deletePost({List url,String Id,String postId,}) async {
    var collection = bidsRef
        .doc(Id)
        .collection("userBids")
        .doc(postId)
        .collection("Items");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    // delete post itself
    bidsRef.doc(Id).collection("userBids").doc(postId).get().then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

    for (var imageFile in url) {
      var photo = FirebaseStorage.instance.refFromURL(imageFile);
      await photo.delete();
    }
  }
  handleDeletePost({ parentContext,String ownerId,String postId,List images}) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SimpleDialog(
              backgroundColor: kSecondaryColor,
              title: Text(
                "Remove this post?",
                style: TextStyle(color: kText),
              ),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    deletePost(url:images,Id:ownerId,postId: postId);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
  }

  addLikeToActivityFeed({String ownerId,String postId,String mediaUrl}) {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(postId)
          .set({
        "type": "fav",
        "username": currentUser.displayName,
        "userId": ownerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": mediaUrl,
        "timestamp": timestamp,
      });
    }
  }

  removeLikeFromActivityFeed({String ownerId,String postId,}) {
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(postId)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    }
  }

  report({String postId,String ownerId}) {
    Fluttertoast.showToast(
        msg: "Your report has been submitted", timeInSecForIos: 4);
    FirebaseFirestore.instance
        .collection('reports')
        .doc(ownerId)
        .collection("userReports")
        .doc(postId)
        .set({
      "type": "auction",
      "userId": ownerId,
      "postId": postId,
      "timestamp": timestamp,
    });
  }
  auctionEnd({String ownerId,String postId,String photoUrl,String images,String name}){

    activityFeedRef
        .doc(ownerId)
        .collection("feedItems")
        .doc(postId)
        .set({
      "type": "topBid",
      "username": name,
      "userId": ownerId,
      "userProfileImg": photoUrl,
      "postId": postId,
      "mediaUrl": images,
      "timestamp": timestamp,
      "read": 'false',
    });

  }

  buildPostHeader() {
    bool isPostOwner = currentUserId == ownerId;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [



          Row(
            children: [
              GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(photoUrl),
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width:10),
              GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child: Text(
                  username,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              !isPostOwner
                  ?  IconButton(

                  onPressed: () {
                    bool _isFav =
                        likes[currentUserId] == true;
                    if (!_isFav) {
                      Fluttertoast.showToast(
                          msg: "Added to wishlist! ", timeInSecForIos: 4);
                      bidsRef
                          .doc(ownerId)
                          .collection('userBids')
                          .doc(postId)
                          .update({
                        'likes.$currentUserId': true
                      });
                      addLikeToActivityFeed(
                          ownerId: ownerId,
                          postId: postId,
                          mediaUrl: images.first);
                      wishRef
                          .doc(currentUser.id)
                          .collection("userAucWish")
                          .doc(postId)
                          .set({
                        "username": username,
                        "postId": postId,
                        "timestamp": timestamp,
                        "photoUrl": photoUrl,
                        "image": images.first,
                        "ownerId": ownerId,
                      });
                      setState(() {
                        isLiked = true;
                        likes[currentUserId] = true;
                      });
                    }
                    else if (_isFav) {
                      bidsRef
                          .doc(ownerId)
                          .collection('userBids')
                          .doc(postId)
                          .update({
                        'likes.$currentUserId': false
                      });
                      removeLikeFromActivityFeed(
                          ownerId: ownerId,
                          postId: postId);

                      var docReference = wishRef
                          .doc(currentUser.id)
                          .collection("userAucWish")
                          .doc(postId);
                      docReference.delete();
                      setState(() {
                        isLiked = false;
                        likes[currentUserId] = false;
                      });
                    }
                  },
                  icon: isLiked
                      ? Icon(Icons.bookmark_outlined)
                      : Icon(Icons.bookmark_outline)):Container(),
              IconButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: kText,
                  ),
                  onPressed: () {
                    !isPostOwner
                        ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: kSecondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0)), //this right here
                            child: GestureDetector(
                              onTap: () {
                                report(postId:postId,ownerId: ownerId);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Report this post?',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                          // ignore: unnecessary_statements
                        })
                        : handleDeletePost(parentContext:context,ownerId: ownerId,postId: postId,images:images);
                  }),
            ],
          ),


          ListView.builder(physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection:Axis.vertical,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                _listOfImages = [];
                for (int i = 0;
                i <
                    images.length;
                i++) {
                  _listOfImages.add(CachedNetworkImage(imageUrl:images[i]));
                }
                return Container(
                    margin: EdgeInsets.all(1.0),

                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child:
                    CarouselSlider(
                        items: _listOfImages,
                        options: CarouselOptions(
                          aspectRatio: 16/9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          pauseAutoPlayOnManualNavigate: true,
                          pauseAutoPlayOnTouch: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        )
                    )
                );
              }
          ),

          SizedBox(
              height:
              SizeConfig.blockSizeVertical * 2),
          ExpansionTile(
              title: Text("Description:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold)),
              children: [ Row(
                children: [
                  Text("$description"),
                ],
              )]
          ),

          SizedBox(
              height:
              SizeConfig.blockSizeVertical * 2),

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text("Opening bid:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold)),
              Text("\u0024  $usd"),
            ],
          ),
          SizedBox(
              height:
              SizeConfig.blockSizeVertical * 2),
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text("Current bid:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold)),
              Text("\u0024  ${usd + amount} "),
            ],
          ),
          SizedBox(
              height:
              SizeConfig.blockSizeVertical * 2),
          CountdownTimer(
            endTime:  DateTime.utc(year, month, 5, 15, 40, second).millisecondsSinceEpoch,
            onEnd: auctionEnd(images: images.first,postId: postId,ownerId: ownerId,photoUrl: photoUrl,name: username),
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {
                return Center(child: Text('Auction has ended!' , style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal*6, fontWeight: FontWeight.bold),));
              }
              return

                Row(
                  children: [
                    LabelText(label: "days",value:"${time.days?? 0}" ,),
                    LabelText(label: "hours",value:"${time.hours??0}" ,),
                    LabelText(label: "min",value:"${time.min?? 0}" ,),
                    LabelText(label: "sec",value:"${time.sec?? 0}" ,),


                  ],
                );
            },
          ),

          ExpansionTile(title:
          Text(
            "Top Bids",
            style: TextStyle(
              color: kText,
              fontWeight: FontWeight.bold,
            ),
          ),
            children: [
              GestureDetector(
                onTap: () => showProfile(context, profileId: topBidderId1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(leading:
                  CircleAvatar(
                    backgroundImage:
                    CachedNetworkImageProvider(topBidderImg1),
                    backgroundColor: Colors.grey,
                  ),

                    title:Text(
                      topBidder1,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing:    Text("\u0024  $topBid1"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showProfile(context, profileId: topBidderId2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(leading:
                  CircleAvatar(
                    backgroundImage:
                    CachedNetworkImageProvider(topBidderImg2),
                    backgroundColor: Colors.grey,
                  ),

                    title:Text(
                      topBidder2,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing:    Text("\u0024  $topBid2"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showProfile(context, profileId: topBidderId3),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(leading:
                  CircleAvatar(
                    backgroundImage:
                    CachedNetworkImageProvider(topBidderImg3),
                    backgroundColor: Colors.grey,
                  ),

                    title:Text(
                      topBidder3,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing:    Text("\u0024  $topBid3"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              height:
              SizeConfig.blockSizeVertical * 2),

          !hasEnded ?   ElevatedButton(
            onPressed: () {
              if (amount >= 0 && amount <= 300) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                print(a);
                a >= 300
                    ?change = 25: change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "minimumBid": change,
                  "topBid1": top,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });
              }
              else if (amount >= 301 && amount <=800) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                a >= 800
                    ?   change = 50:change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "topBid1": top,
                  "minimumBid":change,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });

              }
              else if (amount >= 801 && amount <= 1500) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                a >= 1500
                    ?   change = 100:change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)
                    .update({
                  "amount": a,
                  "topBid1": top,
                  "minimumBid":change,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });
              }
              else if (amount >= 1501 && amount <= 2500) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                a >= 2500
                    ?   change = 150:change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "minimumBid": change,
                  "topBid1": top,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });
              }
              else if (amount >= 2501 && amount <= 3500) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                a >= 3500
                    ?   change = 200:change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "minimumBid": change,
                  "topBid1": top,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });
              }
              else if (amount >= 3501 && amount <= 4500) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                a >= 4500
                    ?   change = 250:change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "minimumBid": change,
                  "topBid1": top,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });
              }
              else if (amount >= 4501 && amount <= 5500) {
                var change;
                var a = amount + minimumBid;
                var top = usd + a;
                a >= 5500
                    ?   change = 300:change = minimumBid;
                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "minimumBid": change,
                  "topBid1": top,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });
              }
              else if (amount >= 5501) {
                var a = amount + minimumBid;
                var top = usd + a;

                bidsRef
                    .doc(ownerId)
                    .collection("userBids")
                    .doc(postId)

                    .update({
                  "amount": a,
                  "topBid1": top,
                  "topBidder1": currentUser
                      .displayName,
                  "topBidderImg1":
                  currentUser.photoUrl,
                  "topBidderId1":
                  currentUser.id,
                  "topBid2": topBid1,
                  "topBidder2": topBidder1,
                  "topBidderImg2":
                  topBidderImg1,
                  "topBidderId2":
                  topBidderId1,
                  "topBid3": topBid2,
                  "topBidder3": topBidder2,
                  "topBidderImg3":
                  topBidderImg2,
                  "topBidderId3":
                  topBidderId2,
                });

              }
              bool _isFav = likes[currentUserId] == true;
              if (!_isFav) {
                Fluttertoast.showToast(
                    msg: "Added to wishlist! ", timeInSecForIos: 4);
                bidsRef
                    .doc(ownerId)
                    .collection('userBids')
                    .doc(postId)
                    .update({
                  'likes.$currentUserId': true
                });
                addLikeToActivityFeed(
                    ownerId: ownerId,
                    postId: postId,
                    mediaUrl: images.first);
                wishRef
                    .doc(currentUser.id)
                    .collection("userAucWish")
                    .doc(postId)
                    .set({
                  "username": username,
                  "postId": postId,
                  "timestamp": timestamp,
                  "photoUrl": photoUrl,
                  "image": images.first,
                  "ownerId": ownerId,
                });
                setState(() {
                  isLiked = true;
                  likes[currentUserId] = true;
                });
              }
            },
            child: Text(
                "Place Bid(\u0024 $minimumBid)"),
          ):
          hasEnded ? currentUser.id == topBidderId1?

          ElevatedButton(onPressed: () {showDialog<void>(
            context: context,
            // useRootNavigator:true,

            barrierDismissible: true,
            // false = user must tap button, true = tap outside dialog
            builder: (BuildContext dialogContext) {
              return
                Dialog(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),
                  child:
                  Container(
                    height:400,

                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:[
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: TextStyle(color: kText),
                                controller: TextController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Comment',
                                  labelStyle: TextStyle(color: kText),
                                ),
                                textAlign: TextAlign.center,

                              ),
                            ),
                            //Customised
                            Container(
                              // alignment:Alignment.centerLeft,
                              child:   FloatingActionButton.extended(
                                backgroundColor: kblue,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>AddressAuction(Amount: topBid1,
                                    prodId: postId,
                                    productname: description,
                                    OwnerId:ownerId,
                                    profileimg:photoUrl,
                                    username: username,
                                    mediaUrl: images.first,
                                    mtoText: TextController.text,

                                  )));
                                  //Get.back();
                                },
                                label: Text('Done',style:TextStyle(color:  Colors.white) ,),
                              ),
                            ),
                          ],) ,
                      ),
                    ),
                  ),

                );
            },
          );},
              child: Text("Buy Now"))

              :
          Container():
          Container(),
          SizedBox(
              height:
              SizeConfig.blockSizeVertical * 2),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    isLiked = (likes[currentUserId] == true);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
      ],
    );
  }
}

