import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fashow/SellerDash/SellerSettings.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/servicedash/ServiceORDERS.dart';
import 'package:fashow/servicedash/Payments_service.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
class EarningsDash extends StatefulWidget {
  final  int selectedPage;

  const EarningsDash({Key key, this.selectedPage}) : super(key: key);
  @override
  _EarningsDashState createState() => _EarningsDashState();
}

class _EarningsDashState extends State<EarningsDash> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  int data = 0;
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
    gets();
    getsp();

  }

  gets() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('serviceSeller')
        .doc(currentUser.id)
        .collection('sellerService')
        .where('read',isEqualTo: 'false')
        .get();
    setState(() {
      ser = snapshot.docs.length ?? 0;
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
      serpay = snapshot.docs.length ?? 0;
    });

  }
  s()  {

    return  Badge(
      shape: BadgeShape.circle,
      padding: EdgeInsets.all(7),
      badgeContent: Text('$ser ',style: TextStyle(color: Colors.white),),
    ); }
  p()  {

    return  Badge(
      shape: BadgeShape.circle,
      padding: EdgeInsets.all(7),
      badgeContent: Text('$serpay ',style: TextStyle(color:  Colors.white),),
    );
  }
  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex:widget.selectedPage ?? 0,

      length:3,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        key:  scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,

            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Support & Influence",
                style: TextStyle(color: Colors.white),
              ),
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
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
                          Text('Support'),
                          s(),
                        ],
                      ),
                    ),FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        children: [
                          Text('Influence'),
                          p(),
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

        TabBarView(
            children:<Widget> [
              ServiceOrders(),
              ServicePayments(),
              SellerSetting(),
            ]),

      ),
    );
  }

}
