
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Tag_Model extends StatelessWidget {
final String ownerId;
final String type;
final String postId;
final List imgUrl;

  const Tag_Model({Key key, this.ownerId, this.type, this.postId, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        type == "shop"?    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              prodId: postId,
              userId: ownerId,
            ),
          ),
        )
            :type=="collection"?    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollScreen(
              collId: postId,
              userId: ownerId,
            ),
          ),
        )
            :type=="resale"?Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResaleScreen(
              postId: postId,
              userId: ownerId,
            ),
          ),
        )
        :type=="editorial"?    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(
              blogId: postId,
              userId: ownerId,
            ),
          ),
        )
            :    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostScreen(
              postId: postId,
              userId: ownerId,
            ),
          ),
        );


      },
      child: Stack(
        children: [
          CachedImage(imgUrl.first),
          Positioned(
            top:10,
            right: 10,
            child: type == "shop"?Icon(Icons.store_rounded,color:Colors.white)
                :type=="collection"?Icon(Icons.collections,color:Colors.white)
                :type=="resale"?Icon(FontAwesomeIcons.recycle,color:Colors.white)
                :type=="editorial"?Icon(Icons.mode_edit,color:Colors.white):Container() ,
          )
        ],
      ),
    );
  }
}
