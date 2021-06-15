import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  final dynamic likes;

  Post({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      postId: doc.data()['postId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      location: doc.data()['location'],
      description: doc.data()['description'],
      mediaUrl: doc.data()['mediaUrl'],
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
  _PostState createState() => _PostState(
    postId: this.postId,
    ownerId: this.ownerId,
    username: this.username,
    location: this.location,
    description: this.description,
    mediaUrl: this.mediaUrl,
    likes: this.likes,
    likeCount: getLikeCount(this.likes),
  );
}

class _PostState extends State<Post> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;

  _PostState({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
    this.likeCount,
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
    storageRef.child("post_$postId.jpg").delete();
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
        "mediaUrl": mediaUrl,
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
      "type": "shop",
      "userId": ownerId,
      "postId": postId,
      "timestamp": timestamp,
    });
  }

  buildPostHeader() {
    return FutureBuilder(
      future: usersRef.doc(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
         Users user = Users.fromDocument(snapshot.data);
        bool isPostOwner = currentUserId == ownerId;
        return  Container(
          margin: EdgeInsets.only(top:1.0,left: 10.0,right: 10.0, bottom: 1.0 ),
         child: Column(
           children:  <Widget> [
             ListTile(
               leading: GestureDetector(
                 onTap: () => showProfile(context, profileId: user.id),

                 child: CircleAvatar(
                   backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                   backgroundColor: Colors.grey,
                 ),
               ),
               title: GestureDetector(
                 onTap: () => showProfile(context, profileId: user.id),
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

             ),SizedBox( height:0.0,),
        GestureDetector(
        onDoubleTap: handleLikePost,
        child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
        ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: cachedNetworkImage(mediaUrl)),

//           products(),

        ],
        )
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
                 FloatingActionButton(
                   heroTag: 'null',

                   mini: true,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                   onPressed: handleLikePost,
                   child:
                   ImageIcon(
                     isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                     color: kText,
                   ),
                 ),
//                Padding(padding: EdgeInsets.only(right: 1.0)),
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
                 FloatingActionButton(
                   heroTag: null,

                   mini: true,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                   onPressed: () => showComments(
                     context,
                     postId: postId,
                     ownerId: ownerId,
                     mediaUrl: mediaUrl,
                   ),
                   child: Icon(
                     Icons.chat,
                     size: 28.0,
                     color: kText,
                   ),
                 ),

               ],
             ),
             Container(
               height: 400,
               child: Column(
//                 shrinkWrap: true,
                 children: <Widget>[
Comments(postId: postId,postMediaUrl: mediaUrl,postOwnerId: ownerId,)
                 ],
               ),
             ),
//            SizedBox( height:10.0,),

           ],
         ) ,


        );
      },
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
    {String postId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Comments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
    );
  }));
}