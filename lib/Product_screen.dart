import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/Products.dart';

class ProductScreen extends StatelessWidget {
  final String userId;
  final String prodId;

  ProductScreen({this.userId, this.prodId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productsRef
          .doc(userId)
          .collection('userProducts')
          .doc(prodId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Prod prod = Prod.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(

            body: ListView(
              children: <Widget>[Container(
                       child: prod,
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}