import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Live/countdown_timer/current_remaining_time.dart';
import 'package:fashow/Live/countdown_timer/flutter_countdown_timer.dart';
import 'package:fashow/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_collection/firestore_collection.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/size_config.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:carousel_slider/carousel_slider.dart';


List <Widget>_listOfImages = <Widget>[];

class UserBids extends StatefulWidget {

  @override
  _UserBidsState createState() => _UserBidsState();
}

class _UserBidsState extends State<UserBids> {
  FirestoreCollection _fireCollection = FirestoreCollection(
    collection: bidsRef
        .doc(currentUser.id)
        .collection("userBids"),

    initializeOnStart: true,
    // first page will fetched immediately
    offset: 15,
    // page size
    serverOnly: false,
    // cache first
    live: true,
    // notifies to newest documents
    query: bidsRef
        .doc(currentUser.id)
        .collection("userBids")

        .where("bidOn", isEqualTo: false),
    queryOrder: QueryOrder(orderField: 'timestamp'),
  );
  final String currentUserId = currentUser?.id;

  deletePost({List url,String Id,String postId, }) async {
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
  handleDeletePost({ parentContext,String ownerId,String postId,List images,}) {
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
                          icon: Icon(
                            Icons.more_vert_outlined,
                            color: kText,
                          ),
                          onPressed: () {
                             handleDeletePost(parentContext:context,ownerId: ownerId,postId: postId,images: images);
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


                ],
              ),
            );

          },
          query:  FirebaseFirestore.instance.collectionGroup("userBids")
              .orderBy('timestamp',descending: true)
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
      appBar: AppBar(backgroundColor: Colors.black,),
      body: getUserBids(),
    );
  }
}
