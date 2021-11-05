

import 'package:fashow/chatcached_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';


class ResaleComments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  ResaleComments({
    this.postId,
    this.postOwnerId,
    this.postMediaUrl,
  });

  @override
  ResaleCommentsState createState() => ResaleCommentsState(
    postId: this.postId,
    postOwnerId: this.postOwnerId,
    postMediaUrl: this.postMediaUrl,
  );
}

class ResaleCommentsState extends State<ResaleComments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  ResaleCommentsState({
    this.postId,
    this.postOwnerId,
    this.postMediaUrl,
  });

  buildResaleComments() {
    return StreamBuilder(
      stream: resalecommentsRef
          .doc(currentUser.id)
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
    resalecommentsRef.doc(currentUser.id).collection("comments").add({
      "username": currentUser.displayName,
      "comment": commentController.text,
      "timestamp": timestamp,
      "avatarUrl": currentUser.photoUrl,
      "userId": currentUser.id,
      "postId":postId,
      "postMediaUrl":postMediaUrl,
    });
    bool isNotPostOwner = postOwnerId != currentUser.id;
    if (isNotPostOwner) {
      activityFeedRef.doc(postOwnerId).collection('feedItems').add({
        "type": "resaleComment",
        "commentData": commentController.text,
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": postMediaUrl,
        "timestamp": timestamp,
        "read": "false"
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
            Expanded(child: buildResaleComments()),
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
              trailing: OutlineButton( color: kPrimaryColor,
                onPressed: addComment,
                borderSide: BorderSide.none,
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
    final String postMediaUrl;

  final Timestamp timestamp;

  Comment({
    this.username,
    this.userId,
    this.avatarUrl,
    this.postMediaUrl,
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
      postMediaUrl: doc.data()['postMediaUrl'],

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
              trailing: CachedImage(postMediaUrl),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
