import 'package:fashow/collsview.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
class CollScreen extends StatelessWidget {
  final String userId;
  final String collId;

  CollScreen({this.userId, this.collId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collRef
          .doc(userId)
      .collection('userCollections')
          .doc(collId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Coll coll = Coll.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(

            appBar: AppBar(

              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  coll.username,
                  style: TextStyle(color: Colors.white),
                ),
              ),),
            body: Container(

              child: ListView(
                children: <Widget>[

                  Container(
                    child: coll,
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