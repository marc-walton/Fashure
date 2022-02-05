import 'package:timeago/timeago.dart' as timeago;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';


class VideoComments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;
  final String communityId;

  VideoComments({
    this.postId,
    this.postOwnerId,
    this.postMediaUrl,
    this.communityId,

  });

  @override
  VideoCommentsState createState() => VideoCommentsState(
    postId: this.postId,
    postOwnerId: this.postOwnerId,
    postMediaUrl: this.postMediaUrl,

  );
}

class VideoCommentsState extends State<VideoComments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  VideoCommentsState({
    this.postId,
    this.postOwnerId,
    this.postMediaUrl,
  });

  buildComments() {
    return StreamBuilder(
      stream: videocommentsRef
          .doc(postId)
          .collection('comments')
          .orderBy("timestamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<Comment> comments = [];
        snapshot.data.docs.forEach((doc) {
          comments.add(Comment.fromDocument(doc));
        });
        return ListView(
          shrinkWrap: true,
          children: comments,
        );
      },
    );
  }

  addComment() {
    videocommentsRef.doc(postId).collection("comments").add({
      "username": currentUser.displayName,
      "comment": commentController.text,
      "timestamp": timestamp,
      "avatarUrl": currentUser.photoUrl,
      "userId": currentUser.id
    });
    bool isNotPostOwner = postOwnerId != currentUser.id;
    if (isNotPostOwner) {
      activityFeedRef.doc(postOwnerId).collection('feedItems').add({
        "type": "VideoComment",
        "commentData": commentController.text,
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": postMediaUrl,
        "timestamp": timestamp,
        "read": "false",

      });
    }
    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Comments" ,
            style: TextStyle(color: Colors.white),
          ),
        ),),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: buildComments()),
            Divider(),
            ListTile(
              title: ClipRRect(borderRadius: BorderRadius.circular(30.0),
                child: TextFormField(
                  // style: TextStyle(color: Colors.white),

                  controller: commentController,
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: kPrimaryColor,
                    hintText:  "Write a comment...",
                    // hintStyle: TextStyle(color: Colors.white)
                  ),

                ),

              ),
              trailing: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  elevation : 0.1,
                  side: BorderSide.none,

                  primary: commentController.text == "" ?  Colors.white.withOpacity(0.1):Colors.black, // background
                ),
                onPressed: addComment,
                child: Text("Post",style: TextStyle(color: kText),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  Comment({
    this.username,
    this.userId,
    this.avatarUrl,
    this.comment,
    this.timestamp,
  });

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
      username: doc.data()['username'],
      userId: doc.data()['userId'],
      comment: doc.data()['comment'],
      timestamp: doc.data()['timestamp'],
      avatarUrl: doc.data()['avatarUrl'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(25.0),
      child: Container( color: Color(0XFFb3b3ff).withOpacity(0.7),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(comment,style: TextStyle(color: kText),),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(avatarUrl),
              ),
              subtitle: Text(
                timeago.format(timestamp.toDate()),style: TextStyle(color: kSubtitle),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
