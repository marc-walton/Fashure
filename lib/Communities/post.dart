import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:fashow/Communities/comments.dart';
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
class CommunityPost extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String photoUrl;
  final String currency;

  final String location;
  final String communityId;

  final String description;
  final List mediaUrl;
  final dynamic likes;

  CommunityPost({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
    this.photoUrl, this.currency,
  this.communityId,

  });

  factory CommunityPost.fromDocument(DocumentSnapshot doc) {
    return CommunityPost(
      postId: doc.data()['postId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      location: doc.data()['location'],
      description: doc.data()['description'],
    mediaUrl: doc.data()['mediaUrl'],
      likes: doc.data()['likes'],
        currency: doc.data()['currency'],
        photoUrl: doc.data()['photoUrl'],

      communityId: doc.data()['communityId'],


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
  _CommunityPostState createState() => _CommunityPostState(
    postId: this.postId,
    ownerId: this.ownerId,
    username: this.username,
    location: this.location,
    description: this.description,
    mediaUrl: this.mediaUrl,
    likes: this.likes,
      photoUrl: this.photoUrl,
      currency: this.currency,
    communityId: this.communityId,

    likeCount: getLikeCount(this.likes),
  );
}

class _CommunityPostState extends State<CommunityPost> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
   final String communityId;

  final List mediaUrl;
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();

  final String photoUrl;
  final String currency;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  List <Widget>listOfImages = <Widget>[];
  String media;
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  _CommunityPostState( {
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
      this.communityId,

    this.likeCount,
    this.photoUrl, this.currency,
  });


  pics({String userid,String prodid}){
    return
      FutureBuilder<QuerySnapshot> (
          future:    FirebaseFirestore.instance.collection('Community')
              .doc(communityId)
              .collection('communityPosts')
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
                                  height: 400,

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
    FirebaseFirestore.instance.collection('Community')
        .doc(communityId)
        .collection('communityPosts')
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
    QuerySnapshot commentsSnapshot = await communitycommentsRef
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
      FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
          .update({'likes.$currentUserId': false});
      removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
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
        "type": "communitylike",
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": mediaUrl.first,
        "timestamp": timestamp,
        "read": 'false',
        "communityId": communityId,

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
      "type": "communityPost",
      "userId": ownerId,
      "postId": postId,
      "timestamp": timestamp,
    });
  }
  tagView(){
    return
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Community')
            .doc(communityId)
            .collection('communityPosts')
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
  buildPostHeader() {
    bool isPostOwner = currentUserId == ownerId;

    return  Container(
      margin: EdgeInsets.only(top:1.0,left: 10.0,right: 10.0, bottom: 1.0 ),
      child: Column(
        children:  <Widget> [
          FutureBuilder(
            future: usersRef.doc(ownerId).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              Users user = Users.fromDocument(snapshot.data);
              return
                ListTile(
                  leading: GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),

                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  title: GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child: Text(
                      user.username,
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

                );


            },
          ),
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
                   communityId: communityId,

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
                  "$likeCount likes",
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


showComments(BuildContext context,
    {String postId, String ownerId, String mediaUrl, String communityId}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return CommunityComments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
      communityId: communityId,

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