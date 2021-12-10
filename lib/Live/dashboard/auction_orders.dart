import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/size_config.dart';

class AuctionOrders extends StatefulWidget {
  @override
  _AuctionOrdersState createState() => _AuctionOrdersState();
}

class _AuctionOrdersState extends State<AuctionOrders> {

  UpcomingOrders(){
    return  PaginateFirestore(
        isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['ownerId'];
          String postId = documentSnapshot.data()['postId'];
          String username = documentSnapshot.data()['username'];
          String photoUrl = documentSnapshot.data()['photoUrl'];

          String endingTime = documentSnapshot.data()['endingTime'];
          bool hasEnded = documentSnapshot.data()['hasEnded'];
          Map likes = documentSnapshot.data()['likes'];

          return
Column(
  children: [
    ListTile(
      leading: GestureDetector(
        onTap: () => showProfile(context, profileId: ownerId),
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(photoUrl),
          backgroundColor: Colors.grey,
        ),
      ),
      title: GestureDetector(
        onTap: () => showProfile(context, profileId: ownerId),
        child: Text(
          username,
          style: TextStyle(
            color: kText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    Container(
      child: StreamBuilder(
        stream: bidsRef
            .doc(ownerId)
            .collection("userBids")
            .doc(postId)
            .collection("Items")
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                String a = snapshot.data.docs[index]["images"];
                String topBid1 =
                snapshot.data.docs[index]["topBid1"];
                String topBid2 =
                snapshot.data.docs[index]["topBid2"];
                String topBid3 =
                snapshot.data.docs[index]["topBid3"];
                String topBidder1 =
                snapshot.data.docs[index]["topBidder1"];
                String topBidder2 =
                snapshot.data.docs[index]["topBidder2"];
                String topBidder3 =
                snapshot.data.docs[index]["topBidder3"];
                String topBidderImg1 =
                snapshot.data.docs[index]["topBidderImg1"];
                String topBidderImg2 =
                snapshot.data.docs[index]["topBidderImg2"];
                String topBidderImg3 =
                snapshot.data.docs[index]["topBidderImg3"];
                String topBidderId1 =
                snapshot.data.docs[index]["topBidderId1"];
                String topBidderId2 =
                snapshot.data.docs[index]["topBidderId2"];
                String topBidderId3 =
                snapshot.data.docs[index]["topBidderId3"];
                int usd = snapshot.data.docs[index]['usd'];
                String description =
                snapshot.data.docs[index]['description'];
                int amount = snapshot.data.docs[index]['amount'];
                int minimumBid =
                snapshot.data.docs[index]['minimumBid'];
                String docId = snapshot.data.docs[index]['docId'];
                String images =
                snapshot.data.docs[index]['images'];

                if (a.isEmpty) {
                  return Container();
                }
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
                                  imageUrl: snapshot.data
                                      .docs[index]['images']),
                            ),
                          ),
                          SizedBox(
                              height:
                              SizeConfig.blockSizeVertical *
                                  2),
                          Row(
                            children: [
                              Text("Description:",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold)),
                              // ExpandableText(
                              //   " $description",
                              // ),
                            ],
                          ),
                          SizedBox(
                              height:
                              SizeConfig.blockSizeVertical *
                                  2),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Opening bid:",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold)),
                              Text("\u0024  $usd"),
                            ],
                          ),
                          SizedBox(
                              height:
                              SizeConfig.blockSizeVertical *
                                  2),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Current bid:",
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold)),
                              Text("\u0024  ${usd + amount} "),
                            ],
                          ),
                          SizedBox(
                              height:
                              SizeConfig.blockSizeVertical *
                                  2),
                          GestureDetector(
                            onTap: () => showProfile(context,
                                profileId: topBidderId1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: CircleAvatar(
                                  backgroundImage:
                                  CachedNetworkImageProvider(
                                      topBidderImg1),
                                  backgroundColor: Colors.grey,
                                ),
                                leading: Text(
                                  topBidder1,
                                  style: TextStyle(
                                    color: kText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing:
                                Text("\u0024  $topBid1"),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => showProfile(context,
                                profileId: topBidderId2),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: CircleAvatar(
                                  backgroundImage:
                                  CachedNetworkImageProvider(
                                      topBidderImg2),
                                  backgroundColor: Colors.grey,
                                ),
                                leading: Text(
                                  topBidder2,
                                  style: TextStyle(
                                    color: kText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing:
                                Text("\u0024  $topBid2"),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => showProfile(context,
                                profileId: topBidderId3),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: CircleAvatar(
                                  backgroundImage:
                                  CachedNetworkImageProvider(
                                      topBidderImg3),
                                  backgroundColor: Colors.grey,
                                ),
                                leading: Text(
                                  topBidder3,
                                  style: TextStyle(
                                    color: kText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing:
                                Text("\u0024  $topBid3"),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                              SizeConfig.blockSizeVertical *
                                  2),

                        ],
                      ),
                    ),
                  );
              });
        },
      ),
    ),
    Divider(
      color: kGrey,
    ),
  ],

);     },
        query:  FirebaseFirestore.instance.collection('ordersSeller')
            .doc(currentUser.id)
            .collection('sellerOrder').orderBy('timestamp',descending: true)
            .where('fulfilled',isEqualTo: 'false')

    );
  }
  OrdersFulfilled(){
    return  PaginateFirestore(
        isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['ownerId'];
          String postId = documentSnapshot.data()['postId'];
          String username = documentSnapshot.data()['username'];
          String photoUrl = documentSnapshot.data()['photoUrl'];

          String endingTime = documentSnapshot.data()['endingTime'];
          bool hasEnded = documentSnapshot.data()['hasEnded'];
          Map likes = documentSnapshot.data()['likes'];

          return
            Column(
              children: [
                ListTile(
                  leading: GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  title: GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child: Text(
                      username,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: StreamBuilder(
                    stream: bidsRef
                        .doc(ownerId)
                        .collection("userBids")
                        .doc(postId)
                        .collection("Items")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text('text');
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            String a = snapshot.data.docs[index]["images"];
                            String topBid1 =
                            snapshot.data.docs[index]["topBid1"];
                            String topBid2 =
                            snapshot.data.docs[index]["topBid2"];
                            String topBid3 =
                            snapshot.data.docs[index]["topBid3"];
                            String topBidder1 =
                            snapshot.data.docs[index]["topBidder1"];
                            String topBidder2 =
                            snapshot.data.docs[index]["topBidder2"];
                            String topBidder3 =
                            snapshot.data.docs[index]["topBidder3"];
                            String topBidderImg1 =
                            snapshot.data.docs[index]["topBidderImg1"];
                            String topBidderImg2 =
                            snapshot.data.docs[index]["topBidderImg2"];
                            String topBidderImg3 =
                            snapshot.data.docs[index]["topBidderImg3"];
                            String topBidderId1 =
                            snapshot.data.docs[index]["topBidderId1"];
                            String topBidderId2 =
                            snapshot.data.docs[index]["topBidderId2"];
                            String topBidderId3 =
                            snapshot.data.docs[index]["topBidderId3"];
                            int usd = snapshot.data.docs[index]['usd'];
                            String description =
                            snapshot.data.docs[index]['description'];
                            int amount = snapshot.data.docs[index]['amount'];
                            int minimumBid =
                            snapshot.data.docs[index]['minimumBid'];
                            String docId = snapshot.data.docs[index]['docId'];
                            String images =
                            snapshot.data.docs[index]['images'];

                            if (a.isEmpty) {
                              return Container();
                            }
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
                                            imageUrl: snapshot.data
                                                .docs[index]['images']),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical *
                                            2),
                                    Row(
                                      children: [
                                        Text("Description:",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold)),
                                        // ExpandableText(
                                        //   " $description",
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical *
                                            2),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Opening bid:",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text("\u0024  $usd"),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical *
                                            2),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Current bid:",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text("\u0024  ${usd + amount} "),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical *
                                            2),
                                    GestureDetector(
                                      onTap: () => showProfile(context,
                                          profileId: topBidderId1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: CircleAvatar(
                                            backgroundImage:
                                            CachedNetworkImageProvider(
                                                topBidderImg1),
                                            backgroundColor: Colors.grey,
                                          ),
                                          leading: Text(
                                            topBidder1,
                                            style: TextStyle(
                                              color: kText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing:
                                          Text("\u0024  $topBid1"),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => showProfile(context,
                                          profileId: topBidderId2),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: CircleAvatar(
                                            backgroundImage:
                                            CachedNetworkImageProvider(
                                                topBidderImg2),
                                            backgroundColor: Colors.grey,
                                          ),
                                          leading: Text(
                                            topBidder2,
                                            style: TextStyle(
                                              color: kText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing:
                                          Text("\u0024  $topBid2"),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => showProfile(context,
                                          profileId: topBidderId3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: CircleAvatar(
                                            backgroundImage:
                                            CachedNetworkImageProvider(
                                                topBidderImg3),
                                            backgroundColor: Colors.grey,
                                          ),
                                          leading: Text(
                                            topBidder3,
                                            style: TextStyle(
                                              color: kText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing:
                                          Text("\u0024  $topBid3"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                        SizeConfig.blockSizeVertical *
                                            2),

                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
                Divider(
                  color: kGrey,
                ),
              ],

            );     },
        query:  FirebaseFirestore.instance.collection('ordersSeller')
            .doc(currentUser.id)
            .collection('sellerOrder').orderBy('timestamp',descending: true)
            .where('fulfilled',isEqualTo: 'false')

    );
  }
  void initState() {
    super.initState();
    update();
  }
  submit({String ownerId,String orderId,String cusId,String shopmediaUrl,String prodId,}){
    FirebaseFirestore.instance.collection('ordersAuctionS')
        .doc(ownerId)
        .collection('auctionSOrder')
        .doc(orderId)
        .update({
      'Accepted':'true',

      'orderStatus':'Processing',
      "timestamp": timestamp,

    });
    FirebaseFirestore.instance.collection('ordersAuctionS')
        .doc(cusId)
        .collection('auctionSOrder')
        .doc(orderId)
        .update({
      'Accepted':'true',

      'orderStatus':'Processing',
      "timestamp": timestamp,

    }); FirebaseFirestore.instance.collection('feed')
        .doc(cusId)
        .collection('feedItems')
        .doc(orderId)
        .update({'message':'Your order has been accepted!',
      "timestamp": timestamp,
      "type": "Payment",
      "userId": ownerId,
      "mediaUrl":shopmediaUrl,
      "postId": prodId,
      "username": currentUser.displayName,
      "userProfileImg": currentUser.photoUrl,
      "read": 'false',
    });FirebaseFirestore.instance.collection('feed')
        .doc(ownerId)
        .collection('feedItems')
        .doc(orderId)
        .update({'message':'You accepted an order!',
      "timestamp": timestamp,
      "type": "PaymentO",
      "userId": ownerId,
      "mediaUrl":shopmediaUrl,
      "postId": prodId,
      "username": currentUser.displayName,
      "userProfileImg": currentUser.photoUrl,
      "read": 'false',
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
      RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,

                    tabs: [
                      Text("Upcoming orders", style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Fulfilled orders", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    ],
                  ),
                ),

                body: Container( decoration: BoxDecoration(
                    gradient: fabGradient
                ) ,
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: TabBarView(
                        children: <Widget>[
                          UpcomingOrders(),
                          OrdersFulfilled(),


                        ]),
                  ),
                ),
              )
          ),
        ),
      );

  }
  main(){
    Column(
      children: [
        ExpansionTile (
          title: Text('Upcoming Orders'),
          maintainState:true,
          children: [
            UpcomingOrders()
          ],
        ),
        ExpansionTile (
          title: Text('Orders Fulfilled'),
          maintainState:true,
          children: [
            OrdersFulfilled()
          ],
        ),

      ],
    );

  }
  update() async {

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('ordersSeller')
        .doc(currentUser.id)
        .collection('sellerOrder').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }

}
