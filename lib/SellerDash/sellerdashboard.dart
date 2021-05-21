import 'package:fashow/SellerDash/SellerOrders.dart';
import 'package:fashow/SellerDash/SellerPayments.dart';
import 'package:fashow/SellerDash/SellerSettings.dart';
import 'package:fashow/SellerDash/SellerShop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/user.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
class SellerDash extends StatefulWidget {
  @override
  _SellerDashState createState() => _SellerDashState();
}

class _SellerDashState extends State<SellerDash> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  int data;
  int datao;

  int order;
  int service;
  int shop;
  int ser;
  int shoppay;
  int serpay;

  int serdata;
  void initState() {
    super.initState();

    geto();
    getop();
  }

  geto() async {
    QuerySnapshot snapshot = await Firestore.instance.collection('ordersSeller')
        .document(currentUser.id)
        .collection('sellerOrder')
        .where('read',isEqualTo: 'false')
        .getDocuments();
    setState(() {
      shop = snapshot.documents.length ?? 0;
    });

  }
  getop() async {
    QuerySnapshot snapshot = await  Firestore.instance.collection('Payments')
        .document(currentUser.id)
        .collection('ServicePayments')
        .where('fulfilled',isEqualTo: 'true')
        .where('read',isEqualTo: 'false')
        .getDocuments();
    setState(() {
      shoppay = snapshot.documents.length ?? 0;
    });

  }
   ord()  {

    return  Badge(
      shape: BadgeShape.circle,
      padding: EdgeInsets.all(7),
      badgeContent: Text('$shop ',style: TextStyle(color: kText),),
    );
  }
  pay()  {

    return  Badge(
      shape: BadgeShape.circle,
      padding: EdgeInsets.all(7),
      badgeContent: Text('$shoppay ',style: TextStyle(color: kText),),
    );
  }

  @override

    Widget build(BuildContext context) {
      return DefaultTabController(
        length:4,
        child: Scaffold(
          key:  scaffoldKey,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,
            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Shop Orders",
                style: TextStyle(color: Colors.white),
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: kIcon,
//                indicatorSize: TabBarIndicatorSize.label,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)
//                           ),
//                           color: Colors.white),

              tabs:[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      Text('Orders'),
                      ord(),
                    ],
                  ),
                ),FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      Text('My payments'),
                      pay(),
                    ],
                  ),
                ),

                FittedBox(fit: BoxFit.contain,child: Text("My Shop",style:  TextStyle(color:kText),)),
                FittedBox(fit: BoxFit.contain,child: Text("Settings",style:  TextStyle(color:kText),)),
                              ],
            ),
          ),
          body:

          Container( decoration: BoxDecoration(
              gradient: fabGradient
          ) ,
            alignment: Alignment.center,
            child: TabBarView(
                children:<Widget> [
                  SellerOrders(),
                  SellerPayments(),
                  SellerShop(),
                  SellerSetting(),

                ]),
          ),

        ),
      );
    }

}
