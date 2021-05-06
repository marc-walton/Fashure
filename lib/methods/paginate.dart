import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:image/image.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';
class paginate extends StatefulWidget {
  paginate({String ownerId,
      String prodId,
      String shopmediaUrl,
      String productname,
      String inr,
      String cny,
      String usd,
      String gbp,
      String eur});

  @override
  _paginateState createState() => _paginateState();
}

class _paginateState extends State<paginate> {
  @required String ownerId ;
  String prodId ;
  String shopmediaUrl ;
  String productname ;
  String price ;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usersRef.document(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
        return Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => showProfile(context, profileId: user.id),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  user.displayName,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(user.username,
                  style: TextStyle(color: kIcon),),),
            ),

            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    prodId: prodId,
                    userId: ownerId,
                  ),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                ],),),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(productname, style: TextStyle(
                    color: kText, fontSize: 20.0, fontWeight: FontWeight.bold),),
                Text('₹$price', style: TextStyle(color: kText,fontSize: 20.0, fontWeight: FontWeight.bold)),
                GFButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        prodId: prodId,
                        userId: ownerId,
                      ),
                    ),
                  ),
                  text: "More",
                  icon: Icon(Icons.card_travel),
                  shape: GFButtonShape.pills,

                ),
              ],
            ),

            Divider(color: kGrey,),
          ],

        );

      },
    );
  }
}

