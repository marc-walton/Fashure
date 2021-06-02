import 'package:timeago/timeago.dart' as timeago;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';


class CollComments extends StatefulWidget {
  final String collId;
  final String collOwnerId;
 final String blogMediaUrl;

  CollComments({
    this.collId,
    this.collOwnerId,
   this.blogMediaUrl,
  });

  @override
  CollCommentsState createState() => CollCommentsState(
    collId: this.collId,
    collOwnerId: this.collOwnerId,
   blogMediaUrl: this.blogMediaUrl,
  );
}

class CollCommentsState extends State<CollComments> {
  TextEditingController collcommentController = TextEditingController();
  final String collId;
  final String collOwnerId;
 final String blogMediaUrl;

  CollCommentsState({
    this.collId,
    this.collOwnerId,
   this.blogMediaUrl,
  });

  buildComments() {
    return StreamBuilder(
      stream: collcommentsRef
          .document(collId)
          .collection('collComments')
          .orderBy("timestamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<CollComment> Collcomments = [];
        snapshot.data.documents.forEach((doc) {
          Collcomments.add(CollComment.fromDocument(doc));
        });
        return ListView(
          children: Collcomments,
        );
      },
    );
  }

  addComment() {
    collcommentsRef.document(collId).collection("collComments").add({
      "username": currentUser.displayName,
      "comment": collcommentController.text,
      "timestamp": timestamp,
      "avatarUrl": currentUser.photoUrl,
      "userId": currentUser.id
    });
    bool isNotPostOwner = collOwnerId != currentUser.id;
   if (isNotPostOwner) {
     activityFeedRef.document(collOwnerId).collection('feedItems').add({
       "type": "Collectioncomment",
       "commentData": collcommentController.text,
       "username": currentUser.displayName,
       "userId": currentUser.id,
       "userProfileImg": currentUser.photoUrl,
       "postId": collId,
       "mediaUrl": blogMediaUrl,
       "timestamp": timestamp,
       "read":"false"
     });
   }
    collcommentController.clear();
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
      body: Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(child: buildComments()),
            Divider(),
            ListTile(
              title: ClipRRect(borderRadius: BorderRadius.circular(30.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: collcommentController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText:  "Write a comment...",
                      hintStyle: TextStyle(color: Colors.white)
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

class   CollComment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  CollComment({
    this.username,
    this.userId,
    this.avatarUrl,
    this.comment,
    this.timestamp,
  });

  factory CollComment.fromDocument(DocumentSnapshot doc) {
    return CollComment(
      username: doc['username'],
      userId: doc['userId'],
      comment: doc['comment'],
      timestamp: doc['timestamp'],
      avatarUrl: doc['avatarUrl'],
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