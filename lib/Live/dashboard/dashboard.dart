import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:badges/badges.dart';
import 'package:fashow/Live/dashboard/auction_orders.dart';
import 'package:fashow/Live/dashboard/payments.dart';
import 'package:fashow/SellerDash/SellerSettings.dart';

import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/user.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
class AuctionDash extends StatefulWidget {
  final  int selectedPage;

  const AuctionDash({Key key, this.selectedPage}) : super(key: key);
  @override
  _AuctionDashState createState() => _AuctionDashState();
}

class _AuctionDashState extends State<AuctionDash> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  int data  = 0;
  int datao = 0;

  int order = 0;
  int service = 0;
  int shop = 0;
  int ser = 0;
  int shoppay = 0;
  int serpay = 0;

  int serdata = 0;
  void initState() {
    super.initState();

    geto();
    getop();
  }

  geto() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('ordersAuctionS')
        .doc(currentUser.id)
        .collection('auctionSOrder')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      shop = snapshot.docs.length ?? 0;
    });

  }
  getop() async {
    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Payments')
        .doc(currentUser.id)
        .collection('AuctionPayments')
        .where('fulfilled',isEqualTo: 'true')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      shoppay = snapshot.docs.length ?? 0;
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
      initialIndex:widget.selectedPage ?? 0,

      length:3,
      child: Scaffold(
        key:  scaffoldKey,
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,
            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Shop Orders",
                style: TextStyle(color: Colors.white),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(130.0),
              child: Container(
                height: 60.0,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,
                  indicatorSize:TabBarIndicatorSize.tab,
                  indicator:BubbleTabIndicator(indicatorHeight:40.0,
                    indicatorColor: kblue,
                  ),
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

                    FittedBox(fit: BoxFit.contain,child: Text("Settings")),
                  ],
                ),
              ),
            ),
          ),
        ),
        body:

        Container( decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
          alignment: Alignment.center,
          child: TabBarView(
              children:<Widget> [
                AuctionOrders(),
                AuctionPayments(),

                SellerSetting(),

              ]),
        ),

      ),
    );
  }

}
