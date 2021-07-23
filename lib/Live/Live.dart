import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Live/user_bids.dart';
import 'package:fashow/Live/wish_auctions.dart';
import 'package:fashow/model/address_auction.dart';
// import 'package:fashow/Live/video_comments.dart';
import 'package:fashow/post.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/user.dart';
import 'package:fashow/utils/universal_variables.dart';
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

import 'package:fashow/Live/host.dart';
import 'package:fashow/Live/join.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class LiveTv extends StatefulWidget {
  @override
  _LiveTvState createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> with TickerProviderStateMixin {
  final String currentUserId = currentUser?.id;

  final FlareControls flareControls = FlareControls();
  final databaseReference = FirebaseFirestore.instance;
  String videoId;
  String mediaUrl;
  String OwnerId;

  List<Live> list = [];
  bool ready = false;
  Live liveUser;
  var name;
  var image;
  var username;
  var ownerId;

  bool showHeart = false;
  var postUsername;
  String followingList;
  List<Post> posts;
  List<String> listOfImages = <String>[];

  String version = 'Unknown';
  final int appID = 1234567890;
  final String appSign =
      'abcdefghijklmnopqrstuvwzyv123456789abcdefghijklmnopqrstuvwzyz123';
  TextEditingController TextController = TextEditingController();

  // Specify test environment and app scenario
  final bool isTestEnv = true;
  final ZegoScenario scenario = ZegoScenario.General;
  deletePost({List url,String Id,String postId}) async {
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
  auctionTimer({var endingTime,String ownerId,String postId}){
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
  handleDeletePost({ parentContext,String ownerId,String postId}) {
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
                    deletePost(url:listOfImages,Id:ownerId,postId: postId);
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

  report(String postId) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'FashureTV',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'MajorMonoDisplay'),
            ),
          ),
          backgroundColor: kPrimaryColor,
          actions:[
            IconButton(
                onPressed: (){
                  WidgetsBinding.instance.addPostFrameCallback((_){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>UserBids())) .then((value) {
                      setState(() {});
                    });
                  },) ;
                },
                icon: Icon(FrinoIcons.f_gavel)),
 IconButton(
                onPressed: (){
                  WidgetsBinding.instance.addPostFrameCallback((_){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AuctionWishList())) .then((value) {
                      setState(() {});
                    });
                  },) ;
                },
                icon: Icon(FrinoIcons.f_gavel))

          ]
        ),
        body: Container(
          decoration: BoxDecoration(gradient: fabGradient),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.live_tv_sharp,
                    color: Colors.black,
                  ),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Go Live',
                        style: TextStyle(
                            fontSize: 30,
                            color: kText,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Container(
                height: 250,
                child: getStories(),
              ),
              Center(
                child: getvid(),
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag:'shop',
          backgroundColor: Colors.black38,
          onPressed: (){
            WidgetsBinding.instance.addPostFrameCallback((_){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Upload_bid(currentUser:currentUser))) .then((value) {
                setState(() {});
              });
            },) ;    } ,
          child: Icon(Icons.add_box),
        ),

      ),
    );
  }

  @override
  void initState() {
    loadSharedPref();
    list = [];
    liveUser = new Live(username: name, me: true, image: image);
    setState(() {
      list.add(liveUser);
    });
    dbChangeListen();

  }

  Future<void> loadSharedPref() async {
    // final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = currentUser.displayName;
      username = currentUser.id;
      image = currentUser.photoUrl;
      ownerId = currentUser.id;
    });
  }

  void dbChangeListen() {
    databaseReference
        .collection('liveuser')
        .orderBy("time", descending: true)
        .snapshots()
        .listen((result) {
      // Listens to update in appointment collection

      setState(() {
        list = [];
        liveUser =
            new Live(username: name, me: true, image: image, ownerId: ownerId);
        list.add(liveUser);
      });
      result.docs.forEach((result) {
        setState(() {
          list.add(new Live(
              username: result.data()['name'],
              image: result.data()['image'],
              channelId: result.data()['channel'],
              me: false));
        });
      });
    });
  }

  Widget getStories() {
    return ListView(
        scrollDirection: Axis.horizontal, children: getUserStories());
  }

  List<Widget> getUserStories() {
    List<Widget> stories = [];
    for (Live users in list) {
      stories.add(getStory(users));
    }
    return stories;
  }

  Widget getStory(Live users) {
    return Container(
      margin: EdgeInsets.only(left: 1.0, right: 4.0, bottom: 1.0, top: 1.0),
      child: Column(
        children: <Widget>[
          Container(
              height: 150,
              width: 150,
              child: GestureDetector(
                onTap: () {
                  if (users.me == true) {
                    // Host function
                    onCreate(username: users.username, image: users.image);
                  } else {
                    // Join function
                    onJoin(
                        channelName: users.username,
                        channelId: users.channelId,
                        username: username,
                        hostImage: users.image,
                        userImage: image);
                  }
                },
                child: Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    !users.me
                        ? Container(
                            height: 150,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.indigo,
                                      Colors.blue,
                                      Colors.cyan
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    CachedNetworkImage(
                      imageUrl: users.image,
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Container(
                          width: 92.0,
                          height: 92.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    users.me
                        ? Container(
                            height: 95,
                            width: 95,
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: new BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 13.5,
                                color: Colors.white,
                              ),
                            ))
                        : Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  height: 17,
                                  width: 25,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            4.0) //         <--- border radius here
                                        ),
                                    gradient: LinearGradient(
                                        colors: [Colors.black, Colors.black],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                  ),
                                ),
                                Container(
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              2.0) //         <--- border radius here
                                          ),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.indigo,
                                            Colors.blueAccent
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        'LIVE',
                                        style: TextStyle(
                                            fontSize: 7,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ],
                            ))
                  ],
                ),
              )),
          SizedBox(
            height: 3,
          ),
          Text(
            users.username ?? '',
            style: TextStyle(color: kText),
          )
        ],
      ),
    );
  }

  Widget getvid() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          color: kText,
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Video feed coming soon!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
  getBids() {
    bool isLiked;
    bool isPostOwner = currentUserId == ownerId;

    SizeConfig().init(context);
    PaginateFirestore(
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

          String ownerId = documentSnapshot.data()['ownerId'];
          String postId = documentSnapshot.data()['postId'];
            String username = documentSnapshot.data()['username'];
String photoUrl = documentSnapshot.data()['photoUrl'];

  String endingTime = documentSnapshot.data()['endingTime'];
  bool hasEnded = documentSnapshot.data()['hasEnded'];
 Map likes = documentSnapshot.data()['likes'];

          return         StickyHeader(
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
                                    report(postId);
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
                            : handleDeletePost(parentContext:context,ownerId: ownerId,postId: postId);
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
          );

        },
        query: FirebaseFirestore.instance.collectionGroup("userBids")
        .orderBy('timestamp',descending: true)
            .where("bidOn", isEqualTo: true)

    );
  }
  auctionEnd({String ownerId}){

    usersRef.doc(ownerId).update({
      'Bidding':false,
    });


  }
  Future<void> onJoin(
      {channelName, channelId, username, hostImage, userImage}) async {
    // update input validation
    if (channelName.isNotEmpty) {
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => JoinPage(
            channelName: channelName,
            channelId: channelId,
            username: username,
            hostImage: hostImage,
            userImage: userImage,
          ),
        ),
      );
    }
  }

  Future<void> onCreate({username, image}) async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic();
    var date = DateTime.now();
    var currentTime = '${DateFormat("dd-MM-yyyy hh:mm:ss").format(date)}';
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: username,
          time: currentTime,
          image: image,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: new ConstrainedBox(
              constraints: widget.isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 50.0),
              child: new Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      widget.isExpanded
          ? new ConstrainedBox(constraints: new BoxConstraints())
          : new FlatButton(
          child: const Text('...'),
          onPressed: () => setState(() => widget.isExpanded = true))
    ]);
  }
}