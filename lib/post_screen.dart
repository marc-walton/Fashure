import 'package:flutter/material.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/post.dart';
class PostScreen extends StatelessWidget {
  final String userId;
  final String postId;

  PostScreen({this.userId, this.postId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: postsRef
          .document(userId)
          .collection('userPosts')
          .document(postId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Post post = Post.fromDocument(snapshot.data);
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
                    color: kPrimaryColor,
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