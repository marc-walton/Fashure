import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/user.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/size_config.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
class UserBids extends StatefulWidget {

  @override
  _UserBidsState createState() => _UserBidsState();
}

class _UserBidsState extends State<UserBids> {
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

            return StickyHeader(
              header: bidon? Container():Container(
                height: 50.0,
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: ListTile(
                    trailing: FloatingActionButton.extended(label:  Text("Start Auction"),
                      onPressed: (){
                        bidsRef.doc(currentUser.id)
                            .collection("userBids")
                            .doc(postId)
                            .update({
                          "endingTime": timestamp.add(Duration(hours: bidTimer)),
                          "bidOn": true,
                        });
                      },
                    )
                ),
              ),
              content: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: currentUser.id),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        CircleAvatar(
                          backgroundImage:
                          CachedNetworkImageProvider(currentUser.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Text(
                          currentUser.displayName,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    child: FutureBuilder(
                      future: bidsRef
                          .doc(ownerId)
                          .collection("userBids")
                          .doc(postId)
                          .collection("Items")
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Text('text');
                        }
                        return  ListView.builder(
                          shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              String a = snapshot.data.docs[index]["images"];
                              String topBid1 = snapshot.data.docs[index]["topBid1"];
                              String topBid2 = snapshot.data.docs[index]["topBid2"];
                              String topBid3 = snapshot.data.docs[index]["topBid3"];
                              String topBidder1 = snapshot.data.docs[index]["topBidder1"];
                              String topBidder2 = snapshot.data.docs[index]["topBidder2"];
                              String topBidder3 = snapshot.data.docs[index]["topBidder3"];
                              String topBidderImg1 = snapshot.data.docs[index]["topBidderImg1"];
                              String topBidderImg2 = snapshot.data.docs[index]["topBidderImg2"];
                              String topBidderImg3 = snapshot.data.docs[index]["topBidderImg3"];
                              String topBidderId1 = snapshot.data.docs[index]["topBidderId1"];
                              String topBidderId2 = snapshot.data.docs[index]["topBidderId2"];
                              String topBidderId3 = snapshot.data.docs[index]["topBidderId3"];
                              int usd = snapshot.data.docs[index]['usd'];
                              String description = snapshot.data.docs[index]['description'];
                              int amount = snapshot.data.docs[index]['amount'];
                              int minimumBid = snapshot.data.docs[index]['minimumBid'];
                              String docId = snapshot.data.docs[index]['docId'];

                              if (a.isEmpty) {
                                return Container();
                              }
                              return new Bidsm(
                                a:a ,
                                topBid1:topBid1 ,
                                topBid2:topBid2 ,
                                topBid3:topBid3 ,
                                topBidder1:topBidder1 ,
                                 topBidder2:topBidder2 ,
                                 topBidder3:topBidder3 ,
                                topBidderImg1:topBidderImg1 ,
                                topBidderImg2:topBidderImg2 ,
                                 topBidderImg3:topBidderImg3 ,
                                topBidderId1:topBidderId1 ,
                                 topBidderId2: topBidderId2 ,
                                topBidderId3:topBidderId3 ,
                                 usd: usd ,
                                description:description ,
                                amount: amount ,
                              );
                            });
                      },
                    ),
                  ),
                  Divider(
                    color: kGrey,
                  ),
                ],
              ),
          );
        },
        query: bidsRef
            .doc(currentUser.id)
            .collection("userBids")
            .orderBy('timestamp',descending: true)
            .where("bidOn", isEqualTo: false)

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
class Bidsm extends StatelessWidget {
 final String a ;
 final String topBid1 ;
 final String topBid2 ;
 final String topBid3 ;
 final String topBidder1 ;
final  String topBidder2 ;
final  String topBidder3 ;
 final String topBidderImg1 ;
 final String topBidderImg2 ;
final  String topBidderImg3 ;
 final String topBidderId1 ;
final  String topBidderId2 ;
 final String topBidderId3 ;
final  int usd ;
 final String description ;
 final int amount ;

  const Bidsm({Key key, this.a, this.topBid1, this.topBid2, this.topBid3, this.topBidder1, this.topBidder2, this.topBidder3, this.topBidderImg1, this.topBidderImg2, this.topBidderImg3, this.topBidderId1, this.topBidderId2, this.topBidderId3, this.usd, this.description, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.4,
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                    imageUrl:a),
              ),
            ),
            SizedBox(
                height:
                SizeConfig.blockSizeVertical * 2),

            Row(
              children: [
                Text("Description:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold)),
                ExpandableText(
                  " $description",
                ),

              ],
            ),
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
            GestureDetector(
              onTap: () => showProfile(context, profileId: topBidderId1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(title:
                CircleAvatar(
                  backgroundImage:
                  CachedNetworkImageProvider(topBidderImg1),
                  backgroundColor: Colors.grey,
                ),

                  leading:Text(
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
                child: ListTile(title:
                CircleAvatar(
                  backgroundImage:
                  CachedNetworkImageProvider(topBidderImg2),
                  backgroundColor: Colors.grey,
                ),

                  leading:Text(
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
                child: ListTile(title:
                CircleAvatar(
                  backgroundImage:
                  CachedNetworkImageProvider(topBidderImg3),
                  backgroundColor: Colors.grey,
                ),

                  leading:Text(
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

            SizedBox(
                height:
                SizeConfig.blockSizeVertical * 2),

          ],
        ),
      ),
    );
  }
}
