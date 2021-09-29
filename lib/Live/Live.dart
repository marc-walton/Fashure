import 'dart:async';
import 'package:custom_timer/custom_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Live/countdown_timer/current_remaining_time.dart';
import 'package:fashow/Live/models/video_item.dart';
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
import 'package:video_player/video_player.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
List<Widget> _listOfImages = <Widget>[];

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

  int days;
  int hours;
  int minutes;
  int seconds;
  // Specify test environment and app scenario
  final bool isTestEnv = true;
  final ZegoScenario scenario = ZegoScenario.General;
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
                icon: Icon(FrinoIcons.f_bookmark))

          ]
        ),
        body: Container(
          decoration: BoxDecoration(gradient: fabGradient),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
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
                height:SizeConfig.screenHeight*0.22,
                child: getStories(),
              ),
              Container(
                height:SizeConfig.screenHeight*0.65,
                child: ListView(
                  children: <Widget>[

                    VideoItems(
                      videoPlayerController: VideoPlayerController.network(
                          'https://www.instagram.com/tv/CUAiiIbh9Cu/?utm_source=ig_web_copy_link'
                      ),
                      looping: false,
                      autoplay: true,
                    ),

                  ],
                ),
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
  getUserBids(){

    bool isPostOwner = currentUserId == ownerId;

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
                    endTime:  DateTime.utc(year, month,7, 20, 30, second).millisecondsSinceEpoch,
                    onEnd: auctionEnd(images: images.first,postId: postId,ownerId: ownerId,photoUrl: photoUrl,name: username),

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
          query:  FirebaseFirestore.instance.collectionGroup("userBids")
              .orderBy('timestamp',descending: true)
      );
  }
getBids (){
    return
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children:[
          LabelText(label:"days",value:"0"),
          LabelText(label:"hours",value:"0"),
          LabelText(label:"min",value:"0"),
         LabelText(label:"sec",value:"00"),
        ]),
        Container(
          color: kText,
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "coming soon!",
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
        SizedBox(
            height:
            SizeConfig.blockSizeVertical * 2),
        ExpansionTile(title:
        Text(
          "Description",
          style: TextStyle(
            color: kText,
            fontWeight: FontWeight.bold,
          ),
        ),
          children: [
           Text("Description"),

          ],
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
            Text("\u0024 "),
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
            Text("\u0024   "),
          ],
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



          ],
        ),
        SizedBox(
            height:
            SizeConfig.blockSizeVertical * 2),
     ElevatedButton(

          child: Text(
              "Place Bid(\u0024 )"),
        )
      ],
    ),
  );
}
  auctionEnd ({String ownerId,String postId,String photoUrl,String images,String name})  {

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
    bidsRef.doc(ownerId)
        .collection("userBids")
        .doc(postId)
        .update({
      "hasEnded":true,});
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
          channelName: currentUser.displayName,
          time: currentTime,
          uid:currentUser.id,
          image: currentUser.photoUrl,
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
class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: SizeConfig.blockSizeHorizontal*4, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
              fontSize: SizeConfig.blockSizeHorizontal*3.5,
            ),
          ),
        ],
      ),
    );
  }
}