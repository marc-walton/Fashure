import 'package:fashow/SellerDash/SellerOrders.dart';
import 'package:fashow/SellerDash/SellerPayments.dart';
import 'package:fashow/SellerDash/SellerSettings.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';import 'package:fashow/servicedash/ServiceORDERS.dart';
import 'package:fashow/servicedash/Payments_service.dart';
import 'package:fashow/upload_Ecommerce.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/user.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
class ServiceDash extends StatefulWidget {
  @override
  _ServiceDashState createState() => _ServiceDashState();
}

class _ServiceDashState extends State<ServiceDash> {
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
    gets();
    getsp();

  }

  gets() async {
    QuerySnapshot snapshot = await Firestore.instance.collection('serviceSeller')
        .document(currentUser.id)
        .collection('sellerService')
        .where('read',isEqualTo: 'false')
        .getDocuments();
    setState(() {
      ser = snapshot.documents.length ?? 0;
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
      serpay = snapshot.documents.length ?? 0;
    });

  }
 s()  {

    return  Badge(
      shape: BadgeShape.circle,
      padding: EdgeInsets.all(7),
      badgeContent: Text('$ser ',style: TextStyle(color: kText),),
    ); }
p()  {

    return  Badge(
      shape: BadgeShape.circle,
      padding: EdgeInsets.all(7),
      badgeContent: Text('$serpay ',style: TextStyle(color: kText),),
    );
  }
  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      length:3,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        key:  scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Freelance Orders",
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
                   s(),
                  ],
                ),
              ),FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: [
                    Text('My payments'),
                    p(),
                  ],
                ),
              ),

FittedBox(fit: BoxFit.contain,child: Text("Settings",style:  TextStyle(color:kText),)),


            ],
          ),
        ),
        body:

        TabBarView(
            children:<Widget> [
              ServiceOrders(),
              ServicePayments(),
              // SellerShop(),
              SellerSetting(),

            ]),
        // floatingActionButtonLocation:FloatingActionButtonLocation.centerTop ,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: kblue,
        //   onPressed: () async{ Navigator.push(context, MaterialPageRoute(builder: (context) =>Uploadecom(currentUser: currentUser, )));},
        // ),
      ),
    );
  }

}
