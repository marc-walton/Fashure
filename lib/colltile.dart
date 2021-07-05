import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/post.dart';
import 'package:fashow/collsview.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/custom_image.dart';
class CollTile extends StatelessWidget {
  final Coll coll;

  CollTile(this.coll);

  showBlog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollScreen(
          collId: coll.collId,
          userId: coll.ownerId,
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
          child: cachedNetworkImage(coll.collmediaUrl)),
    );
  }
}