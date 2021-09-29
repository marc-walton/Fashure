import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/ActivityFeed.dart';

class ClientReview extends StatefulWidget {
  final String profileId;

  const ClientReview({Key key, this.profileId}) : super(key: key);

  @override
  _ClientReviewState createState() => _ClientReviewState();
}

class _ClientReviewState extends State<ClientReview> {
  reviews() {
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['userId'];
          var rating =   documentSnapshot.data()['rating'];
          String review  = documentSnapshot.data()['review'];

          return
            FutureBuilder(
              future: usersRef.doc(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                 Users user = Users.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Card(  child: Column(
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
                     ),
                      ),
                      SmoothStarRating(
                        isReadOnly: true,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        rating: rating,
                        size: 35,
                        starCount: 5,

                      ),
                      SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Expanded(child: Text(review,style: TextStyle(color:kText),)),
                        ],
                      ),
                    ],

                  ),),
                );

              },
            );
        },
        query: FirebaseFirestore.instance.collection('Reviews').doc(widget.profileId)
            .collection('userReviews').orderBy('timestamp',descending: true)


    );

  }
  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar:  AppBar(backgroundColor: kPrimaryColor,
        title:  FittedBox(fit:BoxFit.contain,
          child: Text('Client Reviews',
            style: TextStyle(
                fontFamily :"MajorMonoDisplay",
                color: Colors.white),
          ),
        ),
        iconTheme: new IconThemeData(color: kIcon),
      ),

      body:
           Container(
             child:  reviews(),
           ),


    );
  }
}
