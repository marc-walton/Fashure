import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Live/Live.dart';
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
List <String>listOfImages = <String>[];

class AuctionModel extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String photoUrl;
  final String endingTime;
  final bool hasEnded;
  final dynamic likes;

  AuctionModel({
    this.postId,
    this.ownerId,
    this.username,
    this.photoUrl,
    this.endingTime,
    this.hasEnded,
    this.likes,
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
      );
}

class _AuctionModelState extends State<AuctionModel> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String ownerId;
  final String photoUrl;

  final String username;
  final String endingTime;
  final bool hasEnded;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  TextEditingController TextController = TextEditingController();

  _AuctionModelState({
    this.postId,
    this.ownerId,
    this.username,
    this.endingTime,
    this.hasEnded,
    this.likes,
    this.likeCount,
    this.photoUrl,
  });

  handleDeletePost(BuildContext parentContext) {
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
                    deletePost(listOfImages);
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

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably
  deletePost(List url) async {
    var collection = bidsRef
        .doc(ownerId)
        .collection("userBids")
        .doc(postId)
        .collection("Items");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    // delete post itself
    bidsRef.doc(ownerId).collection("userBids").doc(postId).get().then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

    for (var imageFile in url) {
      var photo = FirebaseStorage.instance.refFromURL(imageFile);
      await photo.delete();
    }
  }
  auctionTimer({var endingTime,String ownerId}){
    Duration remainingTime;
    Timer.periodic(Duration(seconds: 1), (timer) {
      remainingTime = endingTime.difference(DateTime.now().toUtc());
      if (remainingTime <= Duration.zero) {
        timer.cancel();


        usersRef.doc(ownerId).update({
          'Bidding':false,
        });
        bidsRef
            .doc(ownerId)
            .collection("userBids")
            .doc(postId).update({"hasEnded":true});
        return Text("Auction ended");

      }  else {
        return Text("${remainingTime.inDays}:${remainingTime.inHours}:${remainingTime.inMinutes}:${remainingTime.inSeconds}");
      }
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

  report() {
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

  buildPostHeader() {
    bool isPostOwner = currentUserId == ownerId;

    return Column(
      children: [
        StickyHeader(
          header: Container(
            height: 50.0,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: ListTile(trailing: auctionTimer(endingTime: endingTime)),
          ),
          content:  Column(
          children: <Widget>[
          ListTile(
          leading: GestureDetector(
          onTap: () => showProfile(context, profileId: ownerId),
          child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(photoUrl),
          backgroundColor: Colors.grey,
          ),
          ),
          title: GestureDetector(
          onTap: () => showProfile(context, profileId: ownerId),
          child: Text(
          username,
          style: TextStyle(
          color: kText,
          fontWeight: FontWeight.bold,
          ),
          ),
          ),
          trailing: IconButton(
    icon: Icon(
    Icons.more_horiz,
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
    report();
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
        : handleDeletePost(context);
    }),
    ),
    Container(
    child: StreamBuilder(
    stream: bidsRef
        .doc(ownerId)
        .collection("userBids")
        .doc(postId)
        .collection("Items")
        .snapshots(),
    builder: (BuildContext context,
    AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
    return Text('text');
    }
    return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data.docs.length,
    itemBuilder: (BuildContext context, int index) {
    String a = snapshot.data.docs[index]["images"];
    String topBid1 =
    snapshot.data.docs[index]["topBid1"];
    String topBid2 =
    snapshot.data.docs[index]["topBid2"];
    String topBid3 =
    snapshot.data.docs[index]["topBid3"];
    String topBidder1 =
    snapshot.data.docs[index]["topBidder1"];
    String topBidder2 =
    snapshot.data.docs[index]["topBidder2"];
    String topBidder3 =
    snapshot.data.docs[index]["topBidder3"];
    String topBidderImg1 =
    snapshot.data.docs[index]["topBidderImg1"];
    String topBidderImg2 =
    snapshot.data.docs[index]["topBidderImg2"];
    String topBidderImg3 =
    snapshot.data.docs[index]["topBidderImg3"];
    String topBidderId1 =
    snapshot.data.docs[index]["topBidderId1"];
    String topBidderId2 =
    snapshot.data.docs[index]["topBidderId2"];
    String topBidderId3 =
    snapshot.data.docs[index]["topBidderId3"];
    int usd = snapshot.data.docs[index]['usd'];
    String description =
    snapshot.data.docs[index]['description'];
    int amount = snapshot.data.docs[index]['amount'];
    int minimumBid =
    snapshot.data.docs[index]['minimumBid'];
    String docId = snapshot.data.docs[index]['docId'];
    String images =
    snapshot.data.docs[index]['images'];
    listOfImages = [];
    for (int i = 0;
    i <
        images
            .length;
    i++) {
      listOfImages.add(images);
    }
    if (a.isEmpty) {
    return Container();
    }
    return StickyHeader(
    header: Container(
    height: 50.0,
    color: Colors.transparent,
    padding:
    EdgeInsets.symmetric(horizontal: 16.0),
    alignment: Alignment.centerLeft,
    child: ListTile(
    trailing: IconButton(
    onPressed: () {
    bool _isFav =
    likes[currentUserId] == true;
    if (!_isFav) {
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
    mediaUrl: images);
    wishRef
        .doc(currentUser.id)
        .collection("userAucWish")
        .doc(postId)
        .set({
    "username": username,
    "postId": postId,
    "timestamp": timestamp,
    "photoUrl": photoUrl,
    "image": images,
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
        : Icon(Icons.bookmark_outline))),
    ),
    content: Expanded(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Container(
    height: SizeConfig.screenHeight * 0.4,
    child: ClipRRect(
    borderRadius:
    BorderRadius.circular(20.0),
    child: CachedNetworkImage(
    imageUrl: snapshot.data
        .docs[index]['images']),
    ),
    ),
    SizedBox(
    height:
    SizeConfig.blockSizeVertical *
    2),
    Row(
    children: [
    Text("Description:",
    style: TextStyle(
    fontWeight:
    FontWeight.bold)),
    ExpandableText(
    " $description",
    ),
    ],
    ),
    SizedBox(
    height:
    SizeConfig.blockSizeVertical *
    2),
    Row(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text("Opening bid:",
    style: TextStyle(
    fontWeight:
    FontWeight.bold)),
    Text("\u0024  $usd"),
    ],
    ),
    SizedBox(
    height:
    SizeConfig.blockSizeVertical *
    2),
    Row(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text("Current bid:",
    style: TextStyle(
    fontWeight:
    FontWeight.bold)),
    Text("\u0024  ${usd + amount} "),
    ],
    ),
    SizedBox(
    height:
    SizeConfig.blockSizeVertical *
    2),
    GestureDetector(
    onTap: () => showProfile(context,
    profileId: topBidderId1),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
    title: CircleAvatar(
    backgroundImage:
    CachedNetworkImageProvider(
    topBidderImg1),
    backgroundColor: Colors.grey,
    ),
    leading: Text(
    topBidder1,
    style: TextStyle(
    color: kText,
    fontWeight: FontWeight.bold,
    ),
    ),
    trailing:
    Text("\u0024  $topBid1"),
    ),
    ),
    ),
    GestureDetector(
    onTap: () => showProfile(context,
    profileId: topBidderId2),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
    title: CircleAvatar(
    backgroundImage:
    CachedNetworkImageProvider(
    topBidderImg2),
    backgroundColor: Colors.grey,
    ),
    leading: Text(
    topBidder2,
    style: TextStyle(
    color: kText,
    fontWeight: FontWeight.bold,
    ),
    ),
    trailing:
    Text("\u0024  $topBid2"),
    ),
    ),
    ),
    GestureDetector(
    onTap: () => showProfile(context,
    profileId: topBidderId3),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
    title: CircleAvatar(
    backgroundImage:
    CachedNetworkImageProvider(
    topBidderImg3),
    backgroundColor: Colors.grey,
    ),
    leading: Text(
    topBidder3,
    style: TextStyle(
    color: kText,
    fontWeight: FontWeight.bold,
    ),
    ),
    trailing:
    Text("\u0024  $topBid3"),
    ),
    ),
    ),
    SizedBox(
    height:
    SizeConfig.blockSizeVertical *
    2),
      !hasEnded ?   ElevatedButton(
        onPressed: () {
          if (amount <= 99) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 99
                ? change = minimumBid
                : change = 25;
            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount <= 299) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 299
                ? change = minimumBid
                : change = 50;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount <= 599) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 599
                ? change = minimumBid
                : change = 100;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount <= 1499) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 1499
                ? change = minimumBid
                : change = 200;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount <= 2499) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 2499
                ? change = minimumBid
                : change = 300;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount <= 3499) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 3499
                ? change = minimumBid
                : change = 400;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount <= 4499) {
            int change;
            int a = amount + minimumBid;
            int top = usd + amount;
            amount > 5499
                ? change = minimumBid
                : change = 500;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
          } else if (amount > 5500) {
            int a = amount + minimumBid;
            int top = usd + amount;

            bidsRef
                .doc(ownerId)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .doc(docId)
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
        },
        child: Text(
            "Place Bid(\\u0024 $minimumBid)"),
      ): hasEnded ?   activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(postId)
          .set({
        "type": "topBid",
        "username": username,
        "userId": ownerId,
        "userProfileImg": photoUrl,
        "postId": postId,
        "mediaUrl": images,
        "timestamp": timestamp,
        "read": 'false',
      }):Container(),
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
                                mediaUrl: images,
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
    ],
    ),
    ),
    ),
    );
    });
    },
    ),
    ),
    Divider(
    color: kGrey,
    ),
    ],
    ),
        ),
      ],
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

