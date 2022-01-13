import 'package:fashow/blogsview.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
class BlogScreen extends StatelessWidget {
  final String userId;
  final String blogId;

  BlogScreen({this.userId, this.blogId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: blogRef
          .doc(userId)
          .collection('userBlog')
          .doc(blogId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Blog blog = Blog.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(

            appBar: AppBar(
              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  blog.username,
                  style: TextStyle(color: Colors.white),
                ),
              ),),
            body: Container(
              child: blog
            ),
          ),
        );
      },
    );
  }
}