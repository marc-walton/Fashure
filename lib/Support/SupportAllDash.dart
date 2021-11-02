import 'package:alert_dialog/alert_dialog.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/SellerDash/SellerSettings.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Support/SupportDash.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/servicedash/ServiceORDERS.dart';
import 'package:fashow/servicedash/Payments_service.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
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
  String Id = Uuid().v4();

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

  cashOut(){
    FirebaseFirestore.instance.collection('Payments')
        .doc(currentUser.id)
        .collection('CommissionPayments')
        .doc(Id)
        .set({

      "amount":currentUser.Earnings,
      "Currency":currentUser.currency,

      'fulfilled':'false',
      "timestamp": timestamp,

    });
    FirebaseFirestore.instance.collection('users')
        .doc(currentUser.id)
        .update({

      "Earnings":0,

    });
    Fluttertoast.showToast(
        msg: "Cash out in process", timeInSecForIos: 4);
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
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Earnings",
                            style: TextStyle(color: Colors.white),
                          ),
                          currentUser.currency == "INR"? Row(
                            children: [
                              Text("${cf.format(currentUser.Earnings, CurrencyFormatter.inr)}",
                              ),
                            ],
                          ):
                          currentUser.currency == "EUR"?Row(
                            children: [
                              Text("${cf.format(currentUser.Earnings, CurrencyFormatter.eur)}",
                              ),
                            ],
                          ):
                          currentUser.currency == "GBP"?Row(
                            children: [
                              Text("${cf.format(currentUser.Earnings, CurrencyFormatter.gbp)}",
                              ),
                            ],
                          ):Row(
                            children: [
                              Text("${cf.format(currentUser.Earnings, CurrencyFormatter.usd)}",
                              ),
                            ],
                          ),
                        ],
                      ),
                       VerticalDivider(color: Colors.white,),
                       Column(
                        children: [
                          Text(
                            "Total Earnings",
                            style: TextStyle(color: Colors.white),
                          ),
                          currentUser.currency == "INR"? Row(
                            children: [
                              Text("${cf.format(currentUser.TotalEarnings, CurrencyFormatter.inr)}",
                                 ),
                            ],
                          ):
                          currentUser.currency == "EUR"?Row(
                            children: [
                              Text("${cf.format(currentUser.TotalEarnings, CurrencyFormatter.eur)}",
                                 ),
                            ],
                          ):
                          currentUser.currency == "GBP"?Row(
                            children: [
                              Text("${cf.format(currentUser.TotalEarnings, CurrencyFormatter.gbp)}",
                                 ),
                            ],
                          ):Row(
                            children: [
                              Text("${cf.format(currentUser.TotalEarnings, CurrencyFormatter.usd)}",
                                 ),
                            ],
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){
                  if(currentUser.currency=="INR"&& currentUser.Earnings < 1000.00){
                    return
                      alert(
                      context,
                      content:  Text("${cf.format(1000, CurrencyFormatter.inr)}",
                      ),

                      title: Text("Minimum cash out ",
                      ),

                      textOK: Text("OK",
                      ),
                    );
                  }
                  else if(currentUser.Earnings < 25.00){
                    alert(
                      context,
                     content:  currentUser.currency == "EUR"?Text("${cf.format(25, CurrencyFormatter.eur)}",
                       ):
                     currentUser.currency == "GBP"?Text("${cf.format(25, CurrencyFormatter.gbp)}",
                       ):
                     Text("${cf.format(25, CurrencyFormatter.usd)}",
                       ),
                      title: Text("Minimum cash out ",
                      ),

                      textOK: Text("OK",
                      ),
                    );
                  }
                  else{
                    cashOut();
                  }


                }, child: Text("Cash out"))
              ],
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: Container(
                height: 60.0,
                child: TabBar(
                  labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
                  ///outline
                  unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
                  labelPadding: EdgeInsets.only(left:2,right: 8,),

                  isScrollable: true,
                  labelColor: Colors.white,


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
              SupportDash(),
              ServicePayments(),
              SellerSetting(),
            ]),

      ),
    );
  }

}
