import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/models/auction_model.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/progress.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';


class AuctionWishList extends StatefulWidget {

  @override
  _AuctionWishListState createState() => _AuctionWishListState();
}

class _AuctionWishListState extends State<AuctionWishList> {
  String AQuery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Wishlist"),),
      body: PaginateFirestore(
        emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),)),
        key:ValueKey<String>(AQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String postId = documentSnapshot.data()['postId'];
          String username = documentSnapshot.data()['username'];
          String photoUrl = documentSnapshot.data()['photoUrl'];
          String image = documentSnapshot.data()['image'];
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children:[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 7.0,),
                    Text(
                      username,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),

              ),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuctionModel(
                      postId: postId,
                      ownerId: ownerId,
                    ),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(image)),),
              Divider(color: kGrey,),
            ],

          );

        },
        query: wishRef.doc(currentUser.id).collection("userAucWish").orderBy("timestamp", descending: true)
      ),
    );
  }
}
