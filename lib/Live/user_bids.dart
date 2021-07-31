import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/user.dart';
import 'package:firestore_collection/firestore_collection.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/size_config.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

List <Widget>listOfImages = <Widget>[];

pics({String userid,String prodid}){
  return
    FutureBuilder<QuerySnapshot> (
        future:     productsRef
            .doc(userid)
            .collection('userProducts')
            .where('prodId' ,isEqualTo: '$prodid')
        // .where('ownerId' ,isEqualTo: '$ownerId')
            .get(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return new ListView.builder(physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection:Axis.vertical,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                  listOfImages = [];
                  for (int i = 0;
                  i <
                      snapshot.data.docs[index].data()['shopmediaUrl']
                          .length;
                  i++) {
                    listOfImages.add(CachedNetworkImage(imageUrl:snapshot
                        .data.docs[index].data()['shopmediaUrl'][i]));
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(1.0),

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          CarouselSlider(
                              items: listOfImages,
                              options: CarouselOptions(
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                pauseAutoPlayOnManualNavigate: true,
                                pauseAutoPlayOnTouch: true,
                                // onPageChanged: callbackFunction,
                                scrollDirection: Axis.horizontal,
                              )
                          )
                      ),

                    ],
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );

        });

}
class UserBids extends StatefulWidget {

  @override
  _UserBidsState createState() => _UserBidsState();
}

class _UserBidsState extends State<UserBids> {
  FirestoreCollection _fireCollection = FirestoreCollection(
    collection: bidsRef
        .doc(currentUser.id)
        .collection("userBids"),

    initializeOnStart: true,
    // first page will fetched immediately
    offset: 15,
    // page size
    serverOnly: false,
    // cache first
    live: true,
    // notifies to newest documents
    query: bidsRef
        .doc(currentUser.id)
        .collection("userBids")

        .where("bidOn", isEqualTo: false),
    queryOrder: QueryOrder(orderField: 'timestamp'),
  );
  getUserBids(){
    SizeConfig().init(context);
    return
    PaginateFirestore(
        emptyDisplay: Center(
            child: Text(
              "Nothing found",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            )),
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot) {
          String ownerId = documentSnapshot.data()['ownerId'];
          String postId = documentSnapshot.data()['postId'];
            bool bidon = documentSnapshot.data()['bidOn'];
             int bidTimer = documentSnapshot.data()['bidTimer'];
          List a = documentSnapshot.data()["images"];
          String topBid1 = documentSnapshot.data()["topBid1"];
          String topBid2 = documentSnapshot.data()["topBid2"];
          String topBid3 = documentSnapshot.data()["topBid3"];
          String topBidder1 = documentSnapshot.data()["topBidder1"];
          String topBidder2 = documentSnapshot.data()["topBidder2"];
          String topBidder3 = documentSnapshot.data()["topBidder3"];
          String topBidderImg1 = documentSnapshot.data()["topBidderImg1"];
          String topBidderImg2 = documentSnapshot.data()["topBidderImg2"];
          String topBidderImg3 = documentSnapshot.data()["topBidderImg3"];
          String topBidderId1 = documentSnapshot.data()["topBidderId1"];
          String topBidderId2 = documentSnapshot.data()["topBidderId2"];
          String topBidderId3 = documentSnapshot.data()["topBidderId3"];
          double usd = documentSnapshot.data()['usd'];
   int inr = documentSnapshot.data()['inr'];

          String description = documentSnapshot.data()['description'];
          int amount = documentSnapshot.data()['amount'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                ListView.builder(physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection:Axis.vertical,
              itemCount: a.length,
              itemBuilder: (BuildContext context, int index) {
                // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                listOfImages = [];
                for (int i = 0;
                i <
                   a.length;
                i++) {
                  listOfImages.add(CachedNetworkImage(imageUrl:a[i]));
                }
                return Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(1.0),

                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child:
                        CarouselSlider(
                            items: listOfImages,
                            options: CarouselOptions(
                              aspectRatio: 16/9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              pauseAutoPlayOnManualNavigate: true,
                              pauseAutoPlayOnTouch: true,
                              // onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            )
                        )
                    ),

                  ],
                );
              }
          ),

                SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 2),
ExpansionTile(title: Text("Description:",
    style: TextStyle(
        fontWeight: FontWeight.bold)),
children: [ Row(
  children: [
        Text("$description"),
  ],
)],),

                SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 2),

                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text("Opening bid:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                    Text("\u0024  $usd"),
                  ],
                ),
                SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 2),
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text("Current bid:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                    Text("\u0024  ${usd + amount} "),
                  ],
                ),
                SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 2),
                ExpansionTile(title:
                Text(
                  "Top Bids",
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  children: [
                    GestureDetector(
                      onTap: () => showProfile(context, profileId: topBidderId1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(leading:
                        CircleAvatar(
                          backgroundImage:
                          CachedNetworkImageProvider(topBidderImg1),
                          backgroundColor: Colors.grey,
                        ),

                          title:Text(
                            topBidder1,
                            style: TextStyle(
                              color: kText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:    Text("\u0024  $topBid1"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showProfile(context, profileId: topBidderId2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(leading:
                        CircleAvatar(
                          backgroundImage:
                          CachedNetworkImageProvider(topBidderImg2),
                          backgroundColor: Colors.grey,
                        ),

                          title:Text(
                            topBidder2,
                            style: TextStyle(
                              color: kText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:    Text("\u0024  $topBid2"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showProfile(context, profileId: topBidderId3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(leading:
                        CircleAvatar(
                          backgroundImage:
                          CachedNetworkImageProvider(topBidderImg3),
                          backgroundColor: Colors.grey,
                        ),

                          title:Text(
                            topBidder3,
                            style: TextStyle(
                              color: kText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:    Text("\u0024  $topBid3"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 2),


                SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 2),

              ],
            ),
          );

        },
        query: bidsRef
            .doc(currentUser.id)
            .collection("userBids")
            .orderBy('timestamp',descending: true)

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      body: getUserBids(),
    );
  }
}
