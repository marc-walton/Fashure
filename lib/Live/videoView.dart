import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:fashow/Communities/Share_button.dart';
import 'package:fashow/Live/models/video_player.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Support/SupportButton.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/model/hashTag_screen.dart';
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
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:share/share.dart';

class VideoView extends StatefulWidget {
 final String postId;
 final String mediaUrl;
 final String thumbUrl;
  final String ownerId;
 final String username;
 final String photoUrl;
 final String currency;
 final String description;
 final String location;
  final List hashTags;
  final bool hasHashTags;

  final dynamic likes;

  VideoView({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
    this.photoUrl, this.currency,
    this.hashTags, this.hasHashTags, this.thumbUrl,

  });

  factory VideoView.fromDocument(DocumentSnapshot doc) {
    return VideoView(
      postId: doc.data()['postId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      location: doc.data()['location'],
      description: doc.data()['description'],
      mediaUrl: doc.data()['mediaUrl'],
      likes: doc.data()['likes'],
      currency: doc.data()['currency'],
      photoUrl: doc.data()['photoUrl'],
      hashTags: doc.data()['hashTags'],
      hasHashTags: doc.data()['hasHashTags'],
      thumbUrl: doc.data()['thumbUrl'],


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
  _PostState createState() => _PostState(
    postId: this.postId,
    ownerId: this.ownerId,
    username: this.username,
    location: this.location,
    description: this.description,
    mediaUrl: this.mediaUrl,
    likes: this.likes,
    photoUrl: this.photoUrl,
    currency: this.currency,
    hashTags: this.hashTags,
    hasHashTags: this.hasHashTags,
      thumbUrl:this.thumbUrl, 

    likeCount: getLikeCount(this.likes),
  );
}

class _PostState extends State<VideoView> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String mediaUrl;
  final String thumbUrl;
  final String ownerId;
  final String username;
  final String photoUrl;
  final String currency;
  final String description;
  final String location;
  final List hashTags;
  final bool hasHashTags;

  final DynamicLinkService _dynamicLinkService = DynamicLinkService();

  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  List <Widget>listOfImages = <Widget>[];
  String media;
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  var randomTag1;
  var randomTag2;

  _PostState( {
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
    this.likeCount,
    this.photoUrl, this.currency,
    this.hashTags, this.hasHashTags,
    this.thumbUrl,
  });



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
    videoRef
        .doc(ownerId)
        .collection('userVideos')
        .doc(postId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
//    storageRef.child("postnow${postId}").delete();
    var photo =  FirebaseStorage.instance.refFromURL(thumbUrl) ;
    await photo.delete();
     var video =  FirebaseStorage.instance.refFromURL(mediaUrl) ;
    await video.delete();
    
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
    QuerySnapshot commentsSnapshot = await videocommentsRef
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
    bool _isLiked = isLiked;
    if (_isLiked) {
      videoRef
          .doc(ownerId)
          .collection('userVideos')
          .doc(postId)
          .collection("likes")
          .doc(currentUserId).delete();
      // postsRef
      //     .doc(ownerId)
      //     .collection('userPosts')
      //     .doc(postId)
      //     .update({'likes.$currentUserId': false});
      removeLikeFromActivityFeed();
      usersRef.doc(currentUser.id).collection("hashTags").doc(randomTag1).delete();
      usersRef.doc(currentUser.id).collection("hashTags").doc(randomTag2).delete();

      setState(() {
        likeCount -= 1;
        isLiked = false;
        // likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      videoRef
          .doc(ownerId)
          .collection('userVideos')
          .doc(postId)
          .collection("likes")
          .doc(currentUserId).set({});
      // postsRef
      //     .doc(ownerId)
      //     .collection('userPosts')
      //     .doc(postId)
      //     .update({'likes.$currentUserId': true});
      addLikeToActivityFeed();
      usersRef.doc(currentUser.id).collection("hashTags").doc(randomTag1).set({"timestamp":timestamp});
      usersRef.doc(currentUser.id).collection("hashTags").doc(randomTag2).set({"timestamp":timestamp});

      setState(() {
        likeCount += 1;
        isLiked = true;
        // likes[currentUserId] = true;
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
        "type": "Videolike",
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": thumbUrl,
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
      "type": "video",
      "userId": ownerId,
      "postId": postId,
      "timestamp": timestamp,
    });
  }
  tagView(){
    return
      StreamBuilder(
        stream:   videoRef
            .doc(ownerId)
            .collection('userVideos')
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
  buildPostHeader(CTX) {
    bool isPostOwner = currentUserId == ownerId;
    final size = MediaQuery.of(CTX).size;

    return Stack(
      children: [

        VideoPlayerItem(
          videoUrl: mediaUrl,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
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
                              Text(
                                username,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(top: size.height / 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        GestureDetector(
                          onTap: handleLikePost,

                          child: ImageIcon(
                            isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                            color: kText,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showComments(
                            context,
                            postId: postId,
                            ownerId: ownerId,
                            mediaUrl: thumbUrl,
                          ),
                          child: Icon(
                            Icons.mode_comment_outlined,
                            size: 28.0,
                            color: Colors.white,
                          ),

                        ),
                        IconButton(
                          color: Colors.black,
                          onPressed: () {
                            showModalBottomSheet(context: context, builder:(context) {
                              return Center(child:
                              Column(

                                  children:[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation : 0.1,
                                        side: BorderSide.none,

                                        primary:  Colors.black, // background
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            ShareButton(
                                              postId:postId,
                                              ownerId:ownerId,
                                              type:"SharedVideo",
                                              imageURL:thumbUrl,
                                              productname:description,

                                            ),
                                        ));
                                      },
                                      child: Text("Share to a community",style: TextStyle(color: kText),),
                                    ),
                                    FutureBuilder<Uri>(
                                        future: _dynamicLinkService.createDynamicLink( postId:postId,ownerId: ownerId,Description: description,type: "Video",imageURL:thumbUrl),
                                        builder: (context, snapshot) {
                                          if(snapshot.hasData) {
                                            Uri uri = snapshot.data;
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation : 0.1,
                                                side: BorderSide.none,

                                                primary:  Colors.black, // background
                                              ),
                                              onPressed: () {
                                                Share.share(uri.toString());},
                                              child: Text("Share to External Apps",style: TextStyle(color: kText),),
                                            );
                                          } else {
                                            return Container();
                                          }

                                        }
                                    ),


                                  ])
                              );
                            });
                          },
                          // Share.shareFiles(["${shopmediaUrl.first}"],text:"$productname",subject:"${uri.toString()}");},
                          icon: Icon(Icons.send),
                        ),
                        // Column(
                        //   children: [
                        //     InkWell(
                        //       onTap: () =>
                        //           videoController.likeVideo(postId,ownerId),
                        //       child: Icon(
                        //         Icons.favorite,
                        //         size: 40,
                        //         color: videoController.ldata.likes.contains(
                        //             authController.user.uid)
                        //             ? Colors.red
                        //             : Colors.white,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 7),
                        //     Text(
                        //       likes.length.toString(),
                        //       style: const TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     InkWell(
                        //       onTap: () => Navigator.of(context).push(
                        //         MaterialPageRoute(
                        //           builder: (context) => CommentScreen(
                        //             id: id,
                        //           ),
                        //         ),
                        //       ),
                        //       child: const Icon(
                        //         Icons.comment,
                        //         size: 40,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 7),
                        //     Text(
                        //       commentCount.toString(),
                        //       style: const TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     InkWell(
                        //       onTap: () {},
                        //       child: const Icon(
                        //         Icons.reply,
                        //         size: 40,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 7),
                        //     Text(
                        //       shareCount.toString(),
                        //       style: const TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    videoRef
        .doc(ownerId)
        .collection('userVideos')
        .doc(postId)
        .collection("likes")
        .doc(currentUserId).get().then((doc) => doc.exists?isLiked=true:false);
    videoRef
        .doc(ownerId)
        .collection('userVideos')
        .doc(postId)
        .collection("likes")
        .get().then((doc) => doc.docs.length=likeCount);
    // isLiked = (likes[currentUserId] == true);
    randomTag1 = (hashTags.toList()..shuffle()).first;
    randomTag2 = (hashTags.toList()..shuffle()).last;
    usersRef.doc(currentUser.id).collection("hashTags").doc(randomTag1).set({"timestamp":timestamp});
    usersRef.doc(currentUser.id).collection("hashTags").doc(randomTag2).set({"timestamp":timestamp});

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(context),

      ],
    );
  }
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