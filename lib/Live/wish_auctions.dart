import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Live/models/auction_model.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import 'dart:async';
import 'package:custom_timer/custom_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Live/countdown_timer/current_remaining_time.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Live/user_bids.dart';
import 'package:fashow/Live/wish_auctions.dart';
import 'package:fashow/model/address_auction.dart';
// import 'package:fashow/Live/video_comments.dart';
import 'package:fashow/post.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:intl/intl.dart';
import 'package:fashow/Live/models/livemodel.dart';
import 'package:fashow/Live/countdown_timer/flutter_countdown_timer.dart';
import 'package:fashow/Live/host.dart';
import 'package:fashow/Live/join.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
List<Widget> _listOfImages = <Widget>[];

class AuctionWishList extends StatefulWidget {

  @override
  _AuctionWishListState createState() => _AuctionWishListState();
}

class _AuctionWishListState extends State<AuctionWishList> {
  final String currentUserId = currentUser?.id;
  TextEditingController TextController = TextEditingController();
  report({String postId,ownerId}) {
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
  bool AQuery  = false;
  getUserBids(){


    SizeConfig().init(context);
    return
      PaginateFirestore(
          isLive: true,
          emptyDisplay: Center(
              child: Text(
                "Nothing found",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              )),
          itemBuilderType: PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot) {

            int year = documentSnapshot.data()['year'] ;
            int month = documentSnapshot.data()['month'] ;
            int day = documentSnapshot.data()['day'] ;
            int hour = documentSnapshot.data()['hour'] ;
            int minute = documentSnapshot.data()['minute'] ;
            int second = documentSnapshot.data()['second'] ;
            print("$year,$month, $day, $hour, $minute, $second");
            String ownerId = documentSnapshot.data()['ownerId'];
            String postId = documentSnapshot.data()['postId'];

            List images = documentSnapshot.data()["images"];
            var topBid1 = documentSnapshot.data()["topBid1"];
            var topBid2 = documentSnapshot.data()["topBid2"];
            var topBid3 = documentSnapshot.data()["topBid3"];
            String topBidder1 = documentSnapshot.data()["topBidder1"];
            String topBidder2 = documentSnapshot.data()["topBidder2"];
            String topBidder3 = documentSnapshot.data()["topBidder3"];
            String topBidderImg1 = documentSnapshot.data()["topBidderImg1"];
            String topBidderImg2 = documentSnapshot.data()["topBidderImg2"];
            String topBidderImg3 = documentSnapshot.data()["topBidderImg3"];
            String topBidderId1 = documentSnapshot.data()["topBidderId1"];
            String topBidderId2 = documentSnapshot.data()["topBidderId2"];
            String topBidderId3 = documentSnapshot.data()["topBidderId3"];
            var usd = documentSnapshot.data()['usd'];
            var inr = documentSnapshot.data()['inr'];
            String username = documentSnapshot.data()['username'];
            String photoUrl = documentSnapshot.data()['photoUrl'];
            int minimumBid = documentSnapshot.data()['minimumBid'];
            bool hasEnded = documentSnapshot.data()['hasEnded'];
            Map likes = documentSnapshot.data()['likes'];
            bool  isLiked = (likes[currentUserId] == true);
            String description = documentSnapshot.data()['description'];
            int amount = documentSnapshot.data()['amount'];

            return   Padding(
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
                      IconButton(

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
                              : Icon(Icons.bookmark_outline)),
                      IconButton(
                          icon: Icon(
                            Icons.more_vert_outlined,
                            color: kText,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0)), //this right here
                                    child: GestureDetector(
                                      onTap: () {
                                        report(postId:postId,ownerId:ownerId);
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
                                });
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

          },
          query: AQuery? FirebaseFirestore.instance.collectionGroup("userBids")
              .orderBy('timestamp',descending: true).where("likes",whereIn: [currentUser.id==true]):FirebaseFirestore.instance.collectionGroup("userBids")
              .orderBy('timestamp',descending: true).where("likes",whereIn: [currentUser.id==true])
      );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Wishlist"),),
      body: PaginateFirestore(
        emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),)),
        key:ValueKey<bool>(AQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String postId = documentSnapshot.data()['postId'];
          String username = documentSnapshot.data()['username'];
          String photoUrl = documentSnapshot.data()['photoUrl'];
          String image = documentSnapshot.data()['image'];
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children:[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 7.0,),
                    Text(
                      username,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.delete,color: Colors.red,),
                      onPressed: (){
                        var docReference = wishRef.doc(currentUser.id).collection("userAucWish").doc(postId);
                        docReference.delete();
                        bidsRef
                            .doc(ownerId)
                            .collection('userBids')
                            .doc(postId)
                            .update({
                          'likes.$currentUserId': false
                        });
                        setState((){AQuery = !AQuery;});

                      },
                    )
                  ]),
                ),

              ),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuctionModel(
                      postId: postId,
                      ownerId: ownerId,
                    ),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(image)),),
              Divider(color: kGrey,),
            ],

          );

        },
        query: AQuery?wishRef.doc(currentUser.id).collection("userAucWish").orderBy("timestamp", descending: true)
        :wishRef.doc(currentUser.id).collection("userAucWish").orderBy("timestamp", descending: true)
      ),
    );
  }
}
