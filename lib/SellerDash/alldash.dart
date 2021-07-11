import 'package:badges/badges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/sellerdashboard.dart';
import 'package:fashow/servicedash/ServiceDash.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';

class AllDash extends StatefulWidget {
  final  int selectedPage;

  const AllDash({Key key, this.selectedPage}) : super(key: key);
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
        badgeContent: Text('$shop ',style: TextStyle(color: Colors.white),),
      );

  }
  gets() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('serviceSeller')
        .doc(currentUser.id)
        .collection('sellerService')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      serdata = snapshot.docs.length ?? 0;
    });
}
getsp() async {
    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Payments')
        .doc(currentUser.id)
        .collection('ServicePayments')
        .where('fulfilled',isEqualTo: 'true')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      service = serdata + snapshot.docs.length ?? 0;
    });

  }
 geto() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('ordersSeller')
        .doc(currentUser.id)
        .collection('sellerOrder')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      data = snapshot.docs.length ?? 0;
    });

  }
getop() async {
    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Payments')
        .doc(currentUser.id)
        .collection('ServicePayments')
        .where('fulfilled',isEqualTo: 'true')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      shop = data + snapshot.docs.length ?? 0;
    });

  }

  servicebadge(){
    return
      Badge(
        shape: BadgeShape.circle,
        padding: EdgeInsets.all(7),
        badgeContent: Text('$service ',style: TextStyle(color: Colors.white),),
      );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Expanded(
      child: DefaultTabController(
        initialIndex:widget.selectedPage ?? 0,
        length:2,
        child: Scaffold(
          backgroundColor: kSecondaryColor,
          // key:  scaffoldKey,
          appBar:PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "DASHBOARD",
                  style: TextStyle(
                    fontSize: 40,
                      color: Colors.white,
                    fontFamily: "Halfomania"
                  ),
                ),
              ),
              bottom:  PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Container(
                  height: 60.0,
                  child: TabBar(
                    ///filled
                    labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
                    ///outline
                    unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,

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
              ),
            ),
          ),
          body:

          Container(
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
