import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/CollectionsUplaod.dart';
import 'package:fashow/Communities/MainPage.dart';
import 'package:fashow/Shipping/shipEngine/ship_engine.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Support/SupportButton.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/comments.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:share/share.dart';

final CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  class Timeline extends StatefulWidget {
    // final String postId;
    // final String ownerId;
    // final String username;
    // final String location;
    // final String description;
    // final String mediaUrl;
    // final dynamic likes;


    final Users currentUser;

    Timeline({this.currentUser,
    // this.postId,
    //   this.ownerId,
    //   this.username,
    //   this.location,
    //   this.description,
    //   this.mediaUrl,
    //   this.likes,
    });

    @override
    _TimelineState createState() => _TimelineState(
      // postId: this.postId,
      // ownerId: this.ownerId,
      // username: this.username,
      // location: this.location,
      // description: this.description,
      // mediaUrl: this.mediaUrl,
      // likes: this.likes,
      // likeCount: getLikeCount(this.likes),
    );

  }

  class _TimelineState extends State<Timeline>
      with SingleTickerProviderStateMixin {
TabController _tabController;
    List<Post> posts;
    List<String> foollowingList = [];

   List timelinePosts = [];
String postId;
String ownerId;
String username;
String photoUrl;
String currency;

String location;
String description;
List mediaUrl;
int likeCount;
Map likes ;
bool isLiked ;
bool showHeart = false;
List <Widget>listOfImages = <Widget>[];
String media;
DynamicLinkService _dynamicLinkService = DynamicLinkService();
final String currentUserId = currentUser?.id;

int _current = 0;
final CarouselController _ccontroller = CarouselController();
final ScrollController _listScrollController = new ScrollController();
List<Post> products = []; // stores fetched products

bool isLoading = false; // track if products fetching

bool hasMore = true; // flag for more products available or not

int documentLimit = 10; // documents to be fetched per request

DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched

ScrollController _scrollController = ScrollController();

    @override
    void initState() {
      super.initState();
      getFfollowing();


      _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
      // _tabController.addListener(_handleTabIndex);
    }

    @override
    void dispose() {
      // _tabController.removeListener(_handleTabIndex);
      _tabController.dispose();
      super.dispose();
    }


///1
    getTimeline() async {
      QuerySnapshot snapshot = await timelineRef
          .doc(widget.currentUser.id)
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
          return Scaffold( backgroundColor: kPrimaryColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130.0),
              child: AppBar(backgroundColor: appbar,
                  automaticallyImplyLeading: false,

                  title: FittedBox(
                    fit:BoxFit.cover,
                    child: Text(   'FASHURE',
                      style: TextStyle(
                          fontFamily :"Neoneon",
                          fontSize: 40,
                          color: Colors.white),),
                  ),
                  iconTheme: new IconThemeData(color: kIcon),

              bottom:  PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Container(
                  height: 80.0,
                  child: TabBar(
                    ///filled
                    labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
                    ///outline
                    unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
                    // indicatorSize:TabBarIndicatorSize.tab,
                    // indicator:BubbleTabIndicator(indicatorHeight:40.0,
                    //   indicatorColor: kblue,
                    controller: _tabController,
                    tabs: <Widget>[


                      FittedBox(
                        fit:BoxFit.fitWidth,
                        child: Text(   'Feed',
                          style: TextStyle(

                              color: Colors.white),),
                      ),  FittedBox(
                        fit:BoxFit.fitWidth,
                        child: Text(   'Collections',
                          style: TextStyle(

                              color: Colors.white),),
                      ), FittedBox(
                        fit:BoxFit.fitWidth,
                        child: Text(   'Editorial',
                          style: TextStyle(

                              color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
                  actions: <Widget>[



                    IconButton(
                      icon: Icon(
                        Icons.search,

                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Search()));

                        // do something
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));

                        // do something
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child:
                            // currentUser == null?
                            // Container(child: Icon(EvaIcons.personOutline),):
                         Container(child: CachedNetworkImage(imageUrl: widget.currentUser.photoUrl),)
                        
                        ),
                      ),
                    ),

                  ]
              ),
            ),

      body:
      Container(
        color: Colors.grey.shade200,
        child:     RefreshIndicator(
                onRefresh: () => getTimeline(), child: TabBarView(controller: _tabController, children: [
          Feed(currentUser: currentUser),
          Collection(),
          Blog(),

        ]),
        ),
      ),
            floatingActionButton: _bottomButtons()
          );
    }
    Widget _bottomButtons() {
      if(_tabController.index == 1){return
        FloatingActionButton(
          heroTag:'uploadcoll',

          backgroundColor: Colors.black38,
          onPressed: ()
          async{
            Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadColl(currentUser: currentUser)));
          },
          child: Icon(Icons.add_box),
        );}
       else if(_tabController.index == 2){return
        FloatingActionButton(
          heroTag:'uploadblog',

          backgroundColor: Colors.black38,
          onPressed: ()async{
            { Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadEdit(currentUser: currentUser)));
            };

            // Get.to(UploadEdit(currentUser: currentUser));
          },
          // async{ Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadEdit(currentUser: currentUser)));
          // },
          child: Icon(Icons.add_box),
        );}


    }
  }


class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return PaginateView(child:
    PaginateFirestore(
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)  {
      List images =   documentSnapshot.data()['collmediaUrl'];
        String ownerId =   documentSnapshot.data()['ownerId'];
       String username =   documentSnapshot.data()['username'];
      String photoUrl =   documentSnapshot.data()['photoUrl'];
      return Padding(
          padding: const EdgeInsets.all(8.0),

          child:  ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(

              child: Column(children: <Widget>[
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
                ),
                GestureDetector(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollScreen(
                          collId: documentSnapshot.data()['collId'],
                          userId:  documentSnapshot.data()['ownerId'],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height/3,
                          width: MediaQuery.of(context).size.width,
                          child:
                          CachedNetworkImage(
                            imageUrl: images.first,
                          )
                      ),
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,

                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(documentSnapshot.data()['title'],
                                style:  GoogleFonts.balooBhai(color:Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal),),
                            ),
                          ) ),

                    ],
                  ),
                ),

              ],

              ),
            ),
          ));
      },
      query:  FirebaseFirestore.instance.collectionGroup('userCollections').orderBy('timestamp',descending: true),
    )
    );

  }
}

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return  PaginateView(
          child: PaginateFirestore(
          itemBuilderType:
          PaginateBuilderType.listView, //Change types accordingly
          itemBuilder: (index, context, documentSnapshot) {
            List<dynamic> blogMedia =  documentSnapshot.data()['blogmediaUrl'];
            return     Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Card(
                child: Column(children: <Widget>[
                GestureDetector(                      onTap: () => showProfile(context, profileId: documentSnapshot.data()['ownerId']),

                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () => showProfile(context, profileId: documentSnapshot.data()['ownerId']),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(documentSnapshot.data()['photoUrl']),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () => showProfile(context, profileId: documentSnapshot.data()['ownerId']),
                      child: Text(
                        documentSnapshot.data()['username'],
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                  GestureDetector(
                    onTap:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogScreen(
                            blogId: documentSnapshot.data()['blogId'],
                            userId:  documentSnapshot.data()['ownerId'],
                          ),
                        ),
                      );
                    },
                    child:   Container(
                      height: MediaQuery.of(context).size.height/3,

                      width: MediaQuery.of(context).size.width,

                      child:  CachedNetworkImage( imageUrl: blogMedia.first),

                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(documentSnapshot.data()["title"],
                      style:  GoogleFonts.bellotaText(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ) ,

          ],

          ),
              ),)
            );


          },


          query: FirebaseFirestore.instance.collectionGroup('userBlog').orderBy('timestamp',descending: true),

      ),
        );


  }
}

class GlobalFeed extends StatefulWidget {

  final Users currentUser;

  GlobalFeed({this.currentUser,});
  @override
  _GlobalFeedState createState() => _GlobalFeedState();
}

class _GlobalFeedState extends State<GlobalFeed> {
   String postId;
   String ownerId;
   String username;
   String photoUrl;
   String currency;

   String location;
   String description;
   List mediaUrl;
  int likeCount;
  Map likes ;
  bool isLiked ;
  bool showHeart = false;
  List <Widget>listOfImages = <Widget>[];
  String media;
   DynamicLinkService _dynamicLinkService = DynamicLinkService();
  final String currentUserId = currentUser?.id;

  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  final ScrollController _listScrollController = new ScrollController();
  List<Post> products = []; // stores fetched products

  bool isLoading = false; // track if products fetching

  bool hasMore = true; // flag for more products available or not

  int documentLimit = 10; // documents to be fetched per request

  DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched

  ScrollController _scrollController = ScrollController();
  pics({String userid,String prodid}){
    return
      FutureBuilder<QuerySnapshot> (
          future:     postsRef
              .doc(userid)
              .collection('userPosts')

              .where('postId' ,isEqualTo: '$prodid')
          // .where('ownerId' ,isEqualTo: '$ownerId')
              .get(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new ListView.builder(
                  physics:NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  scrollDirection:Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {

                    // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                    listOfImages = [];
                    for (int i = 0;
                    i <
                        snapshot.data.docs[index].data()['mediaUrl']
                            .length;
                    i++) {
                      listOfImages.add(GestureDetector(
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            // useRootNavigator:true,

                            barrierDismissible: true,
                            // false = user must tap button, true = tap outside dialog
                            builder: (BuildContext dialogContext) {

                              return
                                Dialog(

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),
                                  child: Container(
                                    height: 400,
                                    child:PhotoView(imageProvider: CachedNetworkImageProvider
                                      (snapshot
                                        .data.docs[index].data()['mediaUrl'][i])),),
                                );
                            },
                          );

                        },
                        child: CachedNetworkImage(imageUrl:snapshot
                            .data.docs[index].data()['mediaUrl'][i]),
                      ));
                    }
                    return Column(
                      children: <Widget>[
                        Container(

                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child:
                            CarouselSlider(
                              //  items: listOfImages.map((e) { return Builder(builder: (BuildContext context){ return Container();});}),
                                items: listOfImages,
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  height: 300,

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
                        ),

                      ],
                    );
                  }
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          });

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

  handleDeletePost(BuildContext parentContext) {
    return showDialog(

        context: parentContext,
        builder: (context) {
          return ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: SimpleDialog(

              backgroundColor: kSecondaryColor,
              title: Text("Remove this post?",style: TextStyle(color: kText),),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    deletePost();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                    style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          );
        });
  }

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably
  deletePost() async {
    // delete post itself
    postsRef
        .doc(ownerId)
        .collection('userPosts')
        .doc(postId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
//    storageRef.child("postnow${postId}").delete();

    for ( var imageFile in mediaUrl) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .doc(ownerId)
        .collection("feedItems")
        .where('postId', isEqualTo: postId)
        .get();
    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await commentsRef
        .doc(postId)
        .collection('comments')
        .get();
    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleLikePost() {
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      postsRef
          .doc(ownerId)
          .collection('userPosts')
          .doc(postId)
          .update({'likes.$currentUserId': false});
      removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      postsRef
          .doc(ownerId)
          .collection('userPosts')
          .doc(postId)
          .update({'likes.$currentUserId': true});
      addLikeToActivityFeed();
      setState(() {
        likeCount += 1;
        isLiked = true;
        likes[currentUserId] = true;
//        showHeart = true;
      });
    }
  }

  addLikeToActivityFeed() {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(postId)
          .set({
        "type": "like",
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": mediaUrl.first,
        "timestamp": timestamp,
        "read": 'false',
      });
    }
  }

  removeLikeFromActivityFeed() {
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
  report(){
    Fluttertoast.showToast(
        msg: "Your report has been submitted", timeInSecForIos: 4);
    FirebaseFirestore.instance.collection('reports')
        .doc(ownerId)
        .collection("userReports")
        .doc(postId)
        .set({
      "type": "post",
      "userId": ownerId,
      "postId": postId,
      "timestamp": timestamp,
    });
  }
  tagView(){
    return
      StreamBuilder(
        stream:  postsRef
            .doc(ownerId)
            .collection("userPosts")
            .doc(postId)
            .collection("tags")
            .orderBy('timestamp',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.isEmpty){
            return
              Container();
          } else {
            return new ListView.builder(
                scrollDirection :Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return TagItem(
                    Id: ds['prodId'],
                    ownerId: ds['ownerId'],
                    name: ds['name'],
                    usd: ds['usd'],
                    inr: ds['inr'],
                    eur: ds['eur'],
                    gbp: ds['gbp'],
                    taggerId : ds['taggerId'],
                    taggerImg : ds['taggerImg'],
                    taggerName : ds['taggerName'],
                    taggerCurrency : ds['taggerCurrency'],
                    TaggerProdId: ds['prodId'],
                    TaggerOwnerId: ds['ownerId'],
                    image: ds['image'],
                    prodId:postId,

                  );
                }
            );
          }
        },
      );

  }
  viewProducts(){
    return  showMaterialModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {

          return
            Container(   color:trans,    height: MediaQuery.of(context).size.height/2 -30,child:tagView(),);
        });
  }

  getProducts() async {
   //  if (!hasMore) {
   //    print('No More Products');
   //    return;
   //  }
   // else if (isLoading) {
   //    return;
   //  }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await  FirebaseFirestore.instance.collectionGroup('userPosts')
          .orderBy('timestamp',descending: true)
          .limit(documentLimit)
          .get();
      print("wdfsdcdscacsx as s");

    } else {
      querySnapshot = await FirebaseFirestore.instance.collectionGroup('userPosts')
          .orderBy('timestamp',descending: true)
          .startAfterDocument(lastDocument)
          .limit(documentLimit)
          .get();
      print("wfvwvddddddddddddd");
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    List<Post> posts =
    querySnapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    setState(() {
      this.products = posts;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaginateView(
      child: PaginateFirestore(
        isLive:true,
        itemBuilderType:
        PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (index, context, documentSnapshot) {
          bool isPostOwner = currentUserId == documentSnapshot.data()['ownerId'];
          postId= documentSnapshot.data()['postId'];
          ownerId= documentSnapshot.data()['ownerId'];
          username= documentSnapshot.data()['username'];
          location= documentSnapshot.data()['location'];
          description= documentSnapshot.data()['description'];
          mediaUrl= documentSnapshot.data()['mediaUrl'];

          likes= documentSnapshot.data()['likes'];
          isLiked = likes[currentUserId] == true;

          currency= documentSnapshot.data()['currency'];
          photoUrl= documentSnapshot.data()['photoUrl'];
          likeCount = getLikeCount(this.likes);

          return    Container(
            margin: EdgeInsets.only(top:1.0,left: 10.0,right: 10.0, bottom: 1.0 ),
            child: Column(
              children:  <Widget> [
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
                  subtitle: Text(location,
                    style: TextStyle(color: kText),),
                  trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                      onPressed: () {
                        !isPostOwner?showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)), //this right here
                                child: GestureDetector(
                                  onTap: (){report();
                                  Navigator.pop(context);},
                                  child: Container(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(

                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text('Report this post?',style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0),)),),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              // ignore: unnecessary_statements
                            }):handleDeletePost(context);
                      }),

                ),SizedBox( height:0.0,),
                GestureDetector(
                    onDoubleTap: handleLikePost,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                        ClipRRect(borderRadius: BorderRadius.circular(20.0),
                            child: pics(userid:ownerId,prodid: postId)),

//           products(),

                      ],
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: mediaUrl.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _ccontroller.animateToPage(entry.key),
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                FutureBuilder(
                  future:  postsRef
                      .doc(ownerId)
                      .collection("userPosts")
                      .doc(postId)
                      .collection("tags")
                      .orderBy('timestamp',descending: true).get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData||snapshot.data.docs.isEmpty) {
                      return Container();
                    }
                    else {
                      return  Row(
                        children: [
                          SizedBox(width:12.0),
                          GFButton(
                            color: Colors.black,
                            shape:  GFButtonShape.pills,
                            textColor: Colors.black,
                            type : GFButtonType.outline,
                            onPressed: viewProducts,
                            text:"View Products",
                            icon: Icon(
                              Icons.add_shopping_cart,
                              // color: Colors.white,
                              size: 20.0,
                            ),

                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox( height:3.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "$description ",
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),

                    GestureDetector(
                      onTap: handleLikePost,

                      child: ImageIcon(
                        isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                        color: kText,
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      onTap: () => showComments(
                        context,
                        postId: postId,
                        ownerId: ownerId,
                        mediaUrl: mediaUrl.first,
                      ),
                      child: Icon(
                        Icons.mode_comment_outlined,
                        size: 28.0,
                        color: kText,
                      ),

                    ),
                    SizedBox(width: 15.0,),

                    FutureBuilder<Uri>(
                        future: _dynamicLinkService.createDynamicLink( postId:postId,ownerId: ownerId,Description: description,type: "post",imageURL:mediaUrl.first),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            Uri uri = snapshot.data;
                            return IconButton(
                              color: Colors.black,
                              onPressed: () {
                                Share.share(uri.toString());},
                              // Share.shareFiles(["${shopmediaUrl.first}"],text:"$productname",subject:"${uri.toString()}");},
                              icon: Icon(Icons.send),
                            );
                          } else {
                            return Container();
                          }

                        }
                    ),

                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
//                  margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "${getLikeCount(likes)} likes",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                     fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

//            SizedBox( height:10.0,),

              ],
            ) ,


          );


        },


        query: FirebaseFirestore.instance.collectionGroup('userPosts')
            .orderBy('timestamp',descending: true),

      ),
    );
  }


}


class Feed extends StatefulWidget {

  final Users currentUser;

  Feed({this.currentUser,});
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  List<String> foollowingList = [];
  TabController _tabController;

  List timelinePosts = [];
  String postId;
  String ownerId;
  String username;
  String photoUrl;
  String currency;

  String location;
  String description;
  List mediaUrl;
  int likeCount;
  Map likes ;
  bool isLiked ;
  bool showHeart = false;
  List <Widget>listOfImages = <Widget>[];
  String media;
  DynamicLinkService _dynamicLinkService = DynamicLinkService();
  final String currentUserId = currentUser?.id;

  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  final ScrollController _listScrollController = new ScrollController();
  List<Post> products = []; // stores fetched products

  bool isLoading = false; // track if products fetching

  bool hasMore = true; // flag for more products available or not

  int documentLimit = 10; // documents to be fetched per request

  DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched

  ScrollController _scrollController = ScrollController();
  pics({String userid,String prodid}){
    return
      FutureBuilder<QuerySnapshot> (
          future:     postsRef
              .doc(userid)
              .collection('userPosts')

              .where('postId' ,isEqualTo: '$prodid')
          // .where('ownerId' ,isEqualTo: '$ownerId')
              .get(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new ListView.builder(
                  physics:NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  scrollDirection:Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {

                    // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                    listOfImages = [];
                    for (int i = 0;
                    i <
                        snapshot.data.docs[index].data()['mediaUrl']
                            .length;
                    i++) {
                      listOfImages.add(GestureDetector(
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            // useRootNavigator:true,

                            barrierDismissible: true,
                            // false = user must tap button, true = tap outside dialog
                            builder: (BuildContext dialogContext) {

                              return
                                Dialog(

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),
                                  child: Container(
                                    height: 400,
                                    child:PhotoView(imageProvider: CachedNetworkImageProvider
                                      (snapshot
                                        .data.docs[index].data()['mediaUrl'][i])),),
                                );
                            },
                          );

                        },
                        child: CachedNetworkImage(imageUrl:snapshot
                            .data.docs[index].data()['mediaUrl'][i]),
                      ));
                    }
                    return Column(
                      children: <Widget>[
                        Container(

                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child:
                            CarouselSlider(
                              //  items: listOfImages.map((e) { return Builder(builder: (BuildContext context){ return Container();});}),
                                items: listOfImages,
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  height: 300,

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
                        ),

                      ],
                    );
                  }
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          });

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

  handleDeletePost(BuildContext parentContext) {
    return showDialog(

        context: parentContext,
        builder: (context) {
          return ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: SimpleDialog(

              backgroundColor: kSecondaryColor,
              title: Text("Remove this post?",style: TextStyle(color: kText),),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    deletePost();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                    style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          );
        });
  }

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably
  deletePost() async {
    // delete post itself
    postsRef
        .doc(ownerId)
        .collection('userPosts')
        .doc(postId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
//    storageRef.child("postnow${postId}").delete();

    for ( var imageFile in mediaUrl) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .doc(ownerId)
        .collection("feedItems")
        .where('postId', isEqualTo: postId)
        .get();
    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await commentsRef
        .doc(postId)
        .collection('comments')
        .get();
    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleLikePost() {
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      postsRef
          .doc(ownerId)
          .collection('userPosts')
          .doc(postId)
          .update({'likes.$currentUserId': false});
      removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      postsRef
          .doc(ownerId)
          .collection('userPosts')
          .doc(postId)
          .update({'likes.$currentUserId': true});
      addLikeToActivityFeed();
      setState(() {
        likeCount += 1;
        isLiked = true;
        likes[currentUserId] = true;
//        showHeart = true;
      });
    }
  }

  addLikeToActivityFeed() {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(postId)
          .set({
        "type": "like",
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": mediaUrl.first,
        "timestamp": timestamp,
        "read": 'false',
      });
    }
  }

  removeLikeFromActivityFeed() {
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
  report(){
    Fluttertoast.showToast(
        msg: "Your report has been submitted", timeInSecForIos: 4);
    FirebaseFirestore.instance.collection('reports')
        .doc(ownerId)
        .collection("userReports")
        .doc(postId)
        .set({
      "type": "post",
      "userId": ownerId,
      "postId": postId,
      "timestamp": timestamp,
    });
  }
  tagView(){
    return
      StreamBuilder(
        stream:  postsRef
            .doc(ownerId)
            .collection("userPosts")
            .doc(postId)
            .collection("tags")
            .orderBy('timestamp',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.isEmpty){
            return
              Container();
          } else {
            return new ListView.builder(
                scrollDirection :Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return TagItem(
                    Id: ds['prodId'],
                    ownerId: ds['ownerId'],
                    name: ds['name'],
                    usd: ds['usd'],
                    inr: ds['inr'],
                    eur: ds['eur'],
                    gbp: ds['gbp'],
                    taggerId : ds['taggerId'],
                    taggerImg : ds['taggerImg'],
                    taggerName : ds['taggerName'],
                    taggerCurrency : ds['taggerCurrency'],
                    TaggerProdId: ds['prodId'],
                    TaggerOwnerId: ds['ownerId'],
                    image: ds['image'],
                    prodId:postId,

                  );
                }
            );
          }
        },
      );

  }
  viewProducts(){
    return  showMaterialModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {

          return
            Container(   color:trans,    height: MediaQuery.of(context).size.height/2 -30,child:tagView(),);
        });
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


  TimelinePosts(){
    return PaginateView(child:PaginateFirestore(
        emptyDisplay:  buildUsersToFollow() ,
        isLive:true,
        itemBuilderType:
        PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (index, context, documentSnapshot) {
          bool isPostOwner = currentUserId == documentSnapshot.data()['ownerId'];
          postId= documentSnapshot.data()['postId'];
          ownerId= documentSnapshot.data()['ownerId'];
          username= documentSnapshot.data()['username'];
          location= documentSnapshot.data()['location'];
          description= documentSnapshot.data()['description'];
          mediaUrl= documentSnapshot.data()['mediaUrl'];

          likes= documentSnapshot.data()['likes'];
          isLiked = likes[currentUserId] == true;

          currency= documentSnapshot.data()['currency'];
          photoUrl= documentSnapshot.data()['photoUrl'];
          likeCount = getLikeCount(this.likes);

          return    Container(
            margin: EdgeInsets.only(top:1.0,left: 10.0,right: 10.0, bottom: 1.0 ),
            child: Column(
              children:  <Widget> [
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
                  subtitle: Text(location,
                    style: TextStyle(color: kText),),
                  trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                      onPressed: () {
                        !isPostOwner?showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)), //this right here
                                child: GestureDetector(
                                  onTap: (){report();
                                  Navigator.pop(context);},
                                  child: Container(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(

                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text('Report this post?',style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0),)),),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              // ignore: unnecessary_statements
                            }):handleDeletePost(context);
                      }),

                ),SizedBox( height:0.0,),
                GestureDetector(
                    onDoubleTap: handleLikePost,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                        ClipRRect(borderRadius: BorderRadius.circular(20.0),
                            child: pics(userid:ownerId,prodid: postId)),

//           products(),

                      ],
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: mediaUrl.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _ccontroller.animateToPage(entry.key),
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                FutureBuilder(
                  future:  postsRef
                      .doc(ownerId)
                      .collection("userPosts")
                      .doc(postId)
                      .collection("tags")
                      .orderBy('timestamp',descending: true).get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData||snapshot.data.docs.isEmpty) {
                      return Container();
                    }
                    else {
                      return  Row(
                        children: [
                          SizedBox(width:12.0),
                          GFButton(
                            color: Colors.black,
                            shape:  GFButtonShape.pills,
                            textColor: Colors.black,
                            type : GFButtonType.outline,
                            onPressed: viewProducts,
                            text:"View Products",
                            icon: Icon(
                              Icons.add_shopping_cart,
                              // color: Colors.white,
                              size: 20.0,
                            ),

                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox( height:3.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "$description ",
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),

                    GestureDetector(
                      onTap: handleLikePost,

                      child: ImageIcon(
                        isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                        color: kText,
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    GestureDetector(
                      onTap: () => showComments(
                        context,
                        postId: postId,
                        ownerId: ownerId,
                        mediaUrl: mediaUrl.first,
                      ),
                      child: Icon(
                        Icons.mode_comment_outlined,
                        size: 28.0,
                        color: kText,
                      ),

                    ),
                    SizedBox(width: 15.0,),

                    FutureBuilder<Uri>(
                        future: _dynamicLinkService.createDynamicLink( postId:postId,ownerId: ownerId,Description: description,type: "post",imageURL:mediaUrl.first),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            Uri uri = snapshot.data;
                            return IconButton(
                              color: Colors.black,
                              onPressed: () {
                                Share.share(uri.toString());},
                              // Share.shareFiles(["${shopmediaUrl.first}"],text:"$productname",subject:"${uri.toString()}");},
                              icon: Icon(Icons.send),
                            );
                          } else {
                            return Container();
                          }

                        }
                    ),

                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
//                  margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "${getLikeCount(likes)} likes",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

//            SizedBox( height:10.0,),

              ],
            ) ,


          );


        },


        query: timelineRef
            .doc(widget.currentUser.id)
            .collection('timelinePosts')
            .orderBy('timestamp', descending: true)

    ));
  }

  buildUsersToFollow() {
    return StreamBuilder(
      stream:
      usersRef.where('seller',isEqualTo:true).orderBy('timestamp', descending: true).limit(30).snapshots(),
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
      Column(children: [
        DefaultTabController(
            length:3,
            child: Column(
              children: [
                Container(
height: 50,
                  child: TabBar(

                    isScrollable: true,

                    tabs:[
                      Text("Following",style:TextStyle(color: Colors.black) ),
                   Text("Global",style:TextStyle(color: Colors.black) ),
                   Text("Communities",style:TextStyle(color: Colors.black) ),

                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                      children:<Widget> [
                        TimelinePosts(),
  GlobalFeed(),
                        GlobalFeed(),


                      ]),
                ),
              ],
            )
        ),
      ],),);
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

class PaginateView extends StatefulWidget {
  final Widget child;
  const PaginateView({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaginateViewState();
  }
}

class _PaginateViewState extends State<PaginateView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

showComments(BuildContext context,
    {String postId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Comments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
    );
  }));
}
class TagItem extends StatelessWidget {
  final String ownerId ;
  final String prodId ;

  final String Id ;
  final String image ;
  final String name;
  final usd ;
  final inr ;
  final gbp ;
  final eur ;
  String taggerId;
  String  taggerImg;
  String taggerName;
  String taggerCurrency;
  String TaggerOwnerId;
  String TaggerProdId;

  TagItem({
    this.ownerId,
    this.taggerId,
    this.taggerImg,
    this.taggerName,
    this.taggerCurrency,
    this.TaggerOwnerId,
    this.TaggerProdId,

    this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:[
              Container(
                height: MediaQuery.of(context).size.height/3 * 1.2,
                child: InkWell(
                  onTap: () {
                    TaggerId = taggerId;
                    TaggerImg = taggerImg ;
                    TaggerName = taggerName;
                    TaggerCurrency =  taggerCurrency;
                    TaggerOwnerId = TaggerOwnerId;
                    TaggerProdId = TaggerProdId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: Id,
                          userId: ownerId,
                        ),
                      ),
                    );},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedImage(image)),
                ),
              ),
              Row(
                children: [
                  Text(name,
                      style: TextStyle(color: kText,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: [
                  currentUser.currency == "INR"? Row(
                    children: [
                      Text("${cf.format(inr, CurrencyFormatter.inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "EUR"?Row(
                    children: [
                      Text("${cf.format(eur, CurrencyFormatter.eur)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "GBP"?Row(
                    children: [
                      Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):Row(
                    children: [
                      Text("${cf.format(usd, CurrencyFormatter.usd)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ),
                ],
              ),

            ]),
          ),
        ]
    );
  }
}