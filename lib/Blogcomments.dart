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


class BlogComments extends StatefulWidget {
  final String blogId;
  final String blogOwnerId;
 final String blogMediaUrl;

  BlogComments({
    this.blogId,
    this.blogOwnerId,
   this.blogMediaUrl,
  });

  @override
  BlogCommentsState createState() => BlogCommentsState(
    blogId: this.blogId,
    blogOwnerId: this.blogOwnerId,
   blogMediaUrl: this.blogMediaUrl,
  );
}

class BlogCommentsState extends State<BlogComments> {
  TextEditingController blogcommentController = TextEditingController();
  final String blogId;
  final String blogOwnerId;
 final String blogMediaUrl;

  BlogCommentsState({
    this.blogId,
    this.blogOwnerId,
   this.blogMediaUrl,
  });

  buildComments() {
    return StreamBuilder(
      stream: blogcommentsRef
          .document(blogId)
          .collection('blogComments')
          .orderBy("timestamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<BlogComment> Blogcomments = [];
        snapshot.data.documents.forEach((doc) {
          Blogcomments.add(BlogComment.fromDocument(doc));
        });
        return ListView(
          children: Blogcomments,
        );
      },
    );
  }

  addComment() {
    blogcommentsRef.document(blogId).collection("blogComments").add({
      "username": currentUser.username,
      "comment": blogcommentController.text,
      "timestamp": timestamp,
      "avatarUrl": currentUser.photoUrl,
      "userId": currentUser.id
    });
    bool isNotPostOwner = blogOwnerId != currentUser.id;
   if (isNotPostOwner) {
     activityFeedRef.document(blogOwnerId).collection('feedItems').add({
       "type": "blogcomment",
       "commentData": blogcommentController.text,
       "username": currentUser.username,
       "userId": currentUser.id,
       "userProfileImg": currentUser.photoUrl,
       "postId": blogId,
       "mediaUrl": blogMediaUrl,
       "timestamp": timestamp,
       "read":"false"
     });
   }
    blogcommentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar:AppBar(
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
                  controller: blogcommentController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText:  "Write a comment...",
                      hintStyle: TextStyle(color: kText)
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

class   BlogComment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  BlogComment({
    this.username,
    this.userId,
    this.avatarUrl,
    this.comment,
    this.timestamp,
  });

  factory BlogComment.fromDocument(DocumentSnapshot doc) {
    return BlogComment(
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