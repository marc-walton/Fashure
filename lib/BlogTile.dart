import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/post.dart';
import 'package:fashow/blogsview.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/custom_image.dart';
class BlogTile extends StatelessWidget {
  final Blog blog;

  BlogTile(this.blog);

  showBlog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogScreen(
          blogId: blog.blogId,
          userId: blog.ownerId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBlog(context),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: cachedNetworkImage(blog.blogmediaUrl)),
    );
  }
}