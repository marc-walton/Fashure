import 'package:fashow/Communities/post.dart';
import 'package:fashow/Communities/post_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/post.dart';
import 'package:fashow/post_screen.dart';
import 'package:fashow/custom_image.dart';
class PostTile extends StatelessWidget {
  final CommunityPost post;

  PostTile(this.post);

  showPost(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommunityPostScreen(
          postId: post.postId,
          communityId: post.communityId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPost(context),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: cachedNetworkImage(post.mediaUrl.first)),
    );
  }
}