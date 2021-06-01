
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/SellerDash/edit_model.dart';

class EditShop extends StatelessWidget {
  final String userId;
  final String prodId;

  EditShop({this.userId, this.prodId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productsRef
          .document(userId)
          .collection('userProducts')
          .document(prodId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        ProdEdit prod = ProdEdit.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(

            body: Container(
              decoration: BoxDecoration(
                gradient: fabGradient
            ),
              alignment: Alignment.center,
              child: prod,
            ),
          ),
        );
      },
    );
  }
}