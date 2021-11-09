import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/chatcached_image.dart';
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
        emptyDisplay: Center(child: Text("No reviews",style: TextStyle(
          fontWeight: FontWeight.bold,

        ),)),        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['userId'];
          var rating =   documentSnapshot.data()['rating'];
          String review  = documentSnapshot.data()['review'];
          String reviewerId  = documentSnapshot.data()['reviewerId'];
          String reviewerName  = documentSnapshot.data()['reviewerName'];
          String reviewerImg  = documentSnapshot.data()['reviewerImg'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Card(  child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => showProfile(context, profileId: reviewerId),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(reviewerImg),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      reviewerName,
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
        query: FirebaseFirestore.instance.collection('FreelanceReviews').doc(widget.profileId)
            .collection('Reviews').orderBy('timestamp',descending: true)

    );

  }
  sellerReviews() {
    return  PaginateFirestore(
        isLive: true,
        emptyDisplay: Center(child: Text("No reviews",style: TextStyle(
          fontWeight: FontWeight.bold,

        ),)),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['userId'];
          var rating =   documentSnapshot.data()['rating'];
          String review  = documentSnapshot.data()['review'];
          String prodId  = documentSnapshot.data()['prodId'];
          String image  = documentSnapshot.data()['image'];
          String reviewerId  = documentSnapshot.data()['reviewerId'];
          String reviewerName  = documentSnapshot.data()['reviewerName'];
          String reviewerImg  = documentSnapshot.data()['reviewerImg'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => showProfile(context, profileId:reviewerId),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(reviewerImg),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      reviewerName,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResaleScreen(
                              userId: ownerId,
                              postId: prodId,
                            ),
                          ),
                        ),
                        child: Container(child: CachedImage(image,width: 60,)),
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
                    Text(review,style: TextStyle(color: kText),),
                  ],
                ),
                Divider(color: kGrey,),
              ],

            ),
          );
        },
        query: FirebaseFirestore.instance.collection('ResaleReviews')
            .doc(widget.profileId).collection('resaleReviews')
            .orderBy('timestamp',descending: true)


    );

  }

  @override
  Widget build(BuildContext context) {
    return       DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar:  AppBar(backgroundColor: kPrimaryColor,
          title:  Text('Reviews',
            style: TextStyle(
                fontFamily :"MajorMonoDisplay",
                color: Colors.white),
          ),
          bottom:                        TabBar(
            ///filled
            labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
            ///outline
            unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
            isScrollable:true,
            indicatorWeight : 0.1,
            tabs: [

       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text("Freelance reviews",),
       ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text("Seller reviews",),
),



            ],
          ),

        ),

        body:
        TabBarView(
          children: <Widget>[
            Container(
              child:reviews(),
            ),  Container(
              child: sellerReviews(),
            ),
          ],
        ),


      ),
    );
  }
}
