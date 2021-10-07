import 'package:fashow/Support/SupportButton.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fashow/collcomments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/model/tags.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Profile.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/Product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
List <Widget>listOfImages = <Widget>[];
class Coll extends StatefulWidget {
  final String collId;
  final String ownerId;
  final String username;
  final List collmediaUrl;
  // List<NetworkImage> _listOfImages = <NetworkImage>[];

  final String title;
   final String currency;
final String photoUrl;

  final String source;
  final dynamic likes;
int index;
  Coll({
    this.collId,
    this.ownerId,
    this.username,
    this.collmediaUrl,
    this.title,
    this.source,
    this.likes,
    this.photoUrl,

    this.currency,
  });

  factory Coll.fromDocument(DocumentSnapshot doc) {

    return Coll(
     currency:doc.data()['currency'],
      collId: doc.data()['collId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      collmediaUrl: doc.data()['collmediaUrl'],
      title: doc.data()['title'],
      source:doc.data()['source'],
      likes: doc.data()['claps'],
      photoUrl: doc.data()['photoUrl'],

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
  _CollState createState() => _CollState(
    collId: this.collId,
    ownerId: this.ownerId,
    username: this.username,
    collmediaUrl: this.collmediaUrl,
    title: this.title,
    source:this.source,
    likes: this.likes,
    photoUrl: this.photoUrl,

    likeCount: getLikeCount(this.likes),
  );
}

class _CollState extends State<Coll> {
  final String currentUserId = currentUser?.id;
  final String collId;
  final String ownerId;
  final String username;
   final String currency;
final String photoUrl;

  final List collmediaUrl;
  final String title;
  final String source;
  int likeCount;
  Map likes;
  bool isLiked;
  var images =[];
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();

  bool showHeart = false;
  _CollState({
    this.collId,
    this.ownerId,
    this.username,
    this.collmediaUrl,
    this.title,
    this.likes,
    this.source,
    this.likeCount,
    this.currency,
    this.photoUrl,

  });

  @override
  void initState() {
    super.initState();
    // images();

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
    collRef
        .doc(collId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
    for ( var imageFile in collmediaUrl) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .doc(ownerId)
        .collection("feedItems")
        .where('collId', isEqualTo: collId)
        .get();
    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await collcommentsRef
        .doc(collId)
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
      collRef

          .doc(collId)
          .update({'claps.$currentUserId': false});
     removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      collRef

          .doc(collId)
          .update({'claps.$currentUserId': true});
     addLikeToActivityFeed();
      setState(() {
        likeCount += 1;
        isLiked = true;
        likes[currentUserId] = true;
//        showHeart = true;
      });
//      Timer(Duration(milliseconds: 500), () {
//        setState(() {
//          showHeart = false;
//        });
//      });
    }
  }

  addLikeToActivityFeed() {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(collId)
          .set({
        "type": "CollectionLikes",
        "username": currentUser.displayName,
        "userId": ownerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": collId,
       "mediaUrl": collmediaUrl.first,
        "timestamp": timestamp,
        "read":'false'
      });
    }
  }

  removeLikeFromActivityFeed() {
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(collId)
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
        .doc(collId)
        .set({
      "type": "COLL",
      "userId": ownerId,
      "postId": collId,
      "timestamp": timestamp,
    });
  }


pics(){
return
 FutureBuilder <QuerySnapshot>(
          future:     collRef
          .doc(ownerId).collection('userCollections')
          .where('collId' ,isEqualTo: '$collId')
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
                        snapshot.data.docs[index].data()['collmediaUrl']
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
                                        .data.docs[index].data()['shopmediaUrl'][i])),),
                                );
                            },
                          );
                        },                        child: CachedNetworkImage(imageUrl:snapshot
                            .data.docs[index].data()['collmediaUrl'][i]),
                      ));
                    }
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10.0),

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          CarouselSlider(
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
  tagView(){
    return
      StreamBuilder(
        stream:  collRef
            .doc(ownerId)
            .collection("userCollections")
            .doc(collId)
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

                    image: ds['image'],
                    prodId: collId,

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
          SizeConfig().init(context);

          return
            Container(   color:trans,    height: MediaQuery.of(context).size.height/2 -30,child:tagView(),);
        });
  }
buildPostHeader() {
  bool isPostOwner = currentUserId == ownerId;
  return  ListView(
      shrinkWrap: true,
      scrollDirection:Axis.vertical,

      children: [Column(
        children: <Widget>[
          ListTile(
            leading:  GestureDetector(
              onTap: () => showProfile(context, profileId: ownerId),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(photoUrl),
                backgroundColor: Colors.grey,
              ),
            ),
            title:  GestureDetector(
              onTap: () => showProfile(context, profileId:ownerId),
              child: Text(
                username,
                style: TextStyle(
                  color:kText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: IconButton(icon: Icon(Icons.more_horiz,color:kText,),
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
          ),
          ListTile(
            leading:
            Text(title,
              style: TextStyle(
                color: kText,
                fontWeight: FontWeight.bold,
              ),),
          ),

          pics()  ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: collmediaUrl.asMap().entries.map((entry) {
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
            future:  collRef
                .doc(ownerId)
                .collection("userCollections")
                .doc(collId)
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
          ListTile(
            leading: Text(source,
              style: TextStyle(
                color:kText,
                fontWeight: FontWeight.bold,
              ),),
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
              SizedBox(width: 5.0,),
              Container(
//                  margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "$likeCount ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
//                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 20.0)),
              GestureDetector(
                onTap: () => showComments(
                  context,
                  collId: collId,
                  ownerId: ownerId,
                  mediaUrl: collmediaUrl.first,
                ),
                child: Icon(
                  Icons.mode_comment_outlined,
                  size: 28.0,
                  color: kText,
                ),

              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: collmediaUrl.first,),
              ),
            ],
          ),
        ],

      ),

      ]
  );

  }

  @override
  Widget build(BuildContext context) {
    isLiked = (likes[currentUserId] == true);
    return
      buildPostHeader();
  }
}

showComments(BuildContext context,
    {String collId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return CollComments(
      collId: collId,
      collOwnerId: ownerId,
     blogMediaUrl: mediaUrl,
    );
  }));
}
