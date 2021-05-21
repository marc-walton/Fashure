import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/sellerdashboard.dart';
import 'package:fashow/servicedash/ServiceDash.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';

class AllDash extends StatefulWidget {
  @override
  _AllDashState createState() => _AllDashState();
}

class _AllDashState extends State<AllDash> {
  void initState() {
    super.initState();
    gets();
    getsp();
    geto();
    getop();
  }

  int data;
   int datao;

  int order;
  int service;
int shop;
int ser;
int shoppay;
int serpay;

  int serdata;
  orderbadge(){
    return
      Badge(
        shape: BadgeShape.circle,
        padding: EdgeInsets.all(7),
        badgeContent: Text('$shop ',style: TextStyle(color: kText),),
      );

  }
  gets() async {
    QuerySnapshot snapshot = await Firestore.instance.collection('serviceSeller')
        .document(currentUser.id)
        .collection('sellerService')
        .where('read',isEqualTo: 'false')
        .getDocuments();
    setState(() {
      serdata = snapshot.documents.length ?? 0;
    });
}
getsp() async {
    QuerySnapshot snapshot = await  Firestore.instance.collection('Payments')
        .document(currentUser.id)
        .collection('ServicePayments')
        .where('fulfilled',isEqualTo: 'true')
        .where('read',isEqualTo: 'false')
        .getDocuments();
    setState(() {
      service = serdata + snapshot.documents.length ?? 0;
    });

  }
 geto() async {
    QuerySnapshot snapshot = await Firestore.instance.collection('ordersSeller')
        .document(currentUser.id)
        .collection('sellerOrder')
        .where('read',isEqualTo: 'false')
        .getDocuments();
    setState(() {
      data = snapshot.documents.length ?? 0;
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
      shop = data + snapshot.documents.length ?? 0;
    });

  }

  servicebadge(){
    return
      Badge(
        shape: BadgeShape.circle,
        padding: EdgeInsets.all(7),
        badgeContent: Text('$service ',style: TextStyle(color: kText),),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length:2,
        child: Scaffold(
          backgroundColor: kSecondaryColor,
          // key:  scaffoldKey,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,

            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Dashboard",
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
                      Text('Shop'),
                      orderbadge(),
                    ],
                  ),
                ),  FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      Text('Freelance'),
                      servicebadge(),
                    ],
                  ),
                ),

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
                  SellerDash(),
                  ServiceDash(),


                ]),
          ),

        ),
      ),
    );

  }
}
