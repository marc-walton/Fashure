import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fashow/collcomments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
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
import 'package:photo_view/photo_view.dart';
List <Widget>listOfImages = <Widget>[];
class Coll extends StatefulWidget {
  final String collId;
  final String ownerId;
  final String username;
  final List collmediaUrl;
  // List<NetworkImage> _listOfImages = <NetworkImage>[];

  final String title;
   final String headerImage;

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
    this.headerImage,
  });

  factory Coll.fromDocument(DocumentSnapshot doc) {

    return Coll(
     headerImage:doc.data()['headerImage'],
      collId: doc.data()['collId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      collmediaUrl: doc.data()['collmediaUrl'],
      title: doc.data()['title'],
      source:doc.data()['source'],
      likes: doc.data()['claps'],
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
    likeCount: getLikeCount(this.likes),
  );
}

class _CollState extends State<Coll> {
  final String currentUserId = currentUser?.id;
  final String collId;
  final String ownerId;
  final String username;
   final String headerImage;

  final List collmediaUrl;
  final String title;
  final String source;
  int likeCount;
  Map likes;
  bool isLiked;
  var images =[];
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
    this.headerImage,
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
                                height: 400,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
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
buildPostHeader() {

    return
      FutureBuilder(
        future: usersRef.doc(ownerId).get(),
        builder: (context, snapshot) {
          // int count = snapshot.data.lenght;
          if (!snapshot.hasData) {
            return circularProgress();
          }
           Users user = Users.fromDocument(snapshot.data);
         bool isPostOwner = currentUserId == ownerId;
          return  ListView(
            shrinkWrap: true,
scrollDirection:Axis.vertical,

    children: [Column(
      children: <Widget>[
    ListTile(
    leading:  GestureDetector(
      onTap: () => showProfile(context, profileId: user.id),
      child: CircleAvatar(
      backgroundImage: CachedNetworkImageProvider(user.photoUrl),
      backgroundColor: Colors.grey,
      ),
    ),
    title:  GestureDetector(
      onTap: () => showProfile(context, profileId: user.id),
      child: Text(
      user.displayName,
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
    FloatingActionButton(
      heroTag: 'cfg',

      mini: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
    onPressed: handleLikePost,
    child:
    ImageIcon(
    isLiked ? AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
    color: kGrey,
    ),

    ),//                Padding(padding: EdgeInsets.only(right: 1.0)),
    Container(
//                  margin: EdgeInsets.only(left: 20.0),
    child: Text(
    "$likeCount ",
    style: TextStyle(
    color: kText,
    fontSize: 15.0,
//                      fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Padding(padding: EdgeInsets.only(right: 20.0)),
      FloatingActionButton(
        heroTag: null,

        mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        onPressed: () => showComments(
          context,
          collId: collId,
          ownerId: ownerId,
          mediaUrl: headerImage,
        ),
        child:
        Icon(
          Icons.chat,
          size: 28.0,
          color: kGrey,
        ),
      ),//

    ],
    ),
    ],

    ),

]
          );

        },
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
