import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Communities/post.dart';
import 'package:flutter/material.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/post.dart';
class CommunityPostScreen extends StatelessWidget {
  final String communityId;
  final String postId;

  CommunityPostScreen({this.communityId, this.postId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        CommunityPost post = CommunityPost.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(
            backgroundColor: kSecondaryColor,

            appBar: AppBar(
              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  post.username,
                  style: TextStyle(color: Colors.white),
                ),
              ),),
            body: ListView(
              children: <Widget>[
                 Container(
                                  child: post,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}