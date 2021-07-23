import 'package:fashow/Live/models/auction_model.dart';
import 'package:fashow/blogsview.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
class BidScreen extends StatelessWidget {
  final String userId;
  final String BidId;

  BidScreen({this.userId, this.BidId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:     bidsRef
          .doc(userId)
          .collection("userBids")
          .doc(BidId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        AuctionModel auction = AuctionModel.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(

            appBar: AppBar(
              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  auction.username,
                  style: TextStyle(color: Colors.white),
                ),
              ),),
            body: Container( decoration: BoxDecoration(
                gradient: fabGradient
            ) ,
              alignment: Alignment.center,
              child: ListView(
                children: <Widget>[

                  Container(
                    child: auction,
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}