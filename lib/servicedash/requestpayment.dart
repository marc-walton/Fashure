import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fashow/progress.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:uuid/uuid.dart';
class ReqPay extends StatefulWidget {
  final String reciever;
final String recievername;
final String recieverUrl;

  const ReqPay({Key key, this.reciever,this.recievername,this.recieverUrl}) : super(key: key);

  @override
  _ReqPayState createState() => _ReqPayState();
}

class _ReqPayState extends State<ReqPay>{
String orderId = Uuid().v4();
bool isUploading = false;

final scaffoldKey = new GlobalKey<ScaffoldState>();
final _formKey = GlobalKey<FormState>();
bool _inProcess = false;
  TextEditingController detailsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController totalController = TextEditingController();
var inrtousd;
var inrtocny;
var inrtogbp;
var inrtoeur;
var usdtoinr;
var usdtocny;
var usdtogbp;
var usdtoeur;
var cnytoinr;
var cnytousd;
var cnytogbp;
var cnytoeur;
var gbptoinr;
var gbptocny;
var gbptousd;
var gbptoeur;
var eurtoinr;
var eurtousd;
var eurtocny;
var eurtogbp;
var Finrtousd;
var Finrtocny;
var Finrtogbp;
var Finrtoeur;
var Fusdtoinr;
var Fusdtocny;
var Fusdtogbp;
var Fusdtoeur;
var Fcnytoinr;
var Fcnytousd;
var Fcnytogbp;
var Fcnytoeur;
var Fgbptoinr;
var Fgbptocny;
var Fgbptousd;
var Fgbptoeur;
var Feurtoinr;
var Feurtousd;
var Feurtocny;
var Feurtogbp;
var userprice;
var totalprice;
void INRUSD() async {

  if (currentUser.country == 'India') {
    var resultUSD = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: advanceController.text ?? 0);
    // String date = result.date; // Returns the last updated date
    setState(() {
      inrtousd = resultUSD.rate;
      inrtousd = inrtousd.round();

      var usd = double.tryParse(advanceController.text ?? 0);
      userprice = usd.round();
    });

    print("$inrtousd");
    var resultGBP = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: advanceController.text ?? 0);
// Returns the last updated date
    setState(() {
      inrtogbp = resultGBP.rate;
      inrtogbp = inrtogbp.round();

    });

    print("$inrtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount:advanceController.text ?? 0);
    setState(() {
      inrtoeur = resultEUR.rate;
      inrtoeur = inrtoeur.round();

    });

    print("$inrtoeur");
    var resultCNY = await Currency.getConversion(
        from: 'INR', to: 'CNY', amount: advanceController.text);
    setState(() {
      inrtocny = resultCNY.rate;
      inrtocny = inrtocny.round();

    });

    print("$inrtocny");
  }
  else if (currentUser.country == 'China') {
    var resultUSD = await Currency.getConversion(
        from: 'CNY', to: 'USD', amount: advanceController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      cnytousd = resultUSD.rate;
      cnytousd = cnytousd.round();

      var usd = double.tryParse(advanceController.text);
      userprice = usd.round();
    });
    print("$cnytousd");
    var resultGBP = await Currency.getConversion(
        from: 'CNY', to: 'GBP', amount: advanceController.text);
// Returns the last updated date
    setState(() {
      cnytogbp = resultGBP.rate;
      cnytogbp = cnytogbp.round();

    });
    print("$cnytogbp");
    var resultEUR = await Currency.getConversion(
        from: 'CNY', to: 'EUR', amount: advanceController.text);
    setState(() {
      cnytoeur = resultEUR.rate;
      cnytoeur = cnytoeur.round();

    });

    print("$cnytoeur");
    var resultINR = await Currency.getConversion(
        from: 'CNY', to: 'INR', amount: advanceController.text);
    setState(() {
      cnytoinr = resultINR.rate;
      cnytoinr = cnytoinr.round();

    });

    print("$cnytoinr");
  }
  else if (currentUser.country == 'Europe') {
    var resultUSD = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: advanceController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      eurtousd = resultUSD.rate;
      eurtousd = eurtousd.round();

      var usd = double.tryParse(advanceController.text);
      userprice = usd.round();
    });

    print("$eurtousd");
    var resultGBP = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: advanceController.text);
// Returns the last updated date
    setState(() {
      eurtogbp = resultGBP.rate;
      eurtogbp = eurtogbp.round();

    });

    print("$eurtogbp");
    var resultCNY = await Currency.getConversion(
        from: 'EUR', to: 'CNY', amount: advanceController.text);
    setState(() {
      eurtocny = resultCNY.rate;
      eurtocny = eurtocny.round();

    });

    print("$eurtocny");
    var resultINR = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: advanceController.text);
    setState(() {
      eurtoinr = resultINR.rate;
      eurtoinr = eurtoinr.round();

    });

    print("$eurtoinr");
  }
  else if (currentUser.country == 'UK') {
    var resultUSD = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: advanceController.text);
    // String date = result.date; // Returns the last updated date
    var resultEUR = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: advanceController.text);
    var resultCNY = await Currency.getConversion(
        from: 'GBP', to: 'CNY', amount: advanceController.text);
    var resultINR = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: advanceController.text);

    setState(() {
      gbptousd = resultUSD.rate;
      // int usd = int.tryParse(gbptousd);
      gbptousd = gbptousd.round();
      var usd = double.tryParse(advanceController.text);
      userprice = usd.round();
      gbptoeur = resultEUR.rate;
      gbptoeur = gbptoeur.round();

      gbptocny = resultCNY.rate;
      gbptocny = gbptocny.round();
      gbptoinr = resultINR.rate;
      gbptoinr = gbptoinr.round();



    });

// Returns the last updated date

  }
  else if (currentUser.country == 'USA') {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: advanceController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      usdtogbp = resultGBP.rate;
      usdtogbp = usdtogbp.round();

      var usd = double.tryParse(advanceController.text);
      userprice = usd.round();

    });

    print("$usdtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: advanceController.text);
// Returns the last updated date
    setState(() {
      usdtoeur = resultEUR.rate;
      usdtoeur = usdtoeur.round();


    });
    print("$usdtoeur");
    var resultCNY = await Currency.getConversion(
        from: 'USD', to: 'CNY', amount: advanceController.text);
    setState(() {
      usdtocny = resultCNY.rate;
      usdtocny = usdtocny.round();

    });
    print("$usdtocny");
    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: advanceController.text);
    setState(() {
      usdtoinr = resultINR.rate;
      usdtoinr = usdtoinr.round();

    });

    print("$usdtoinr");
  }
  else  {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: advanceController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      usdtogbp = resultGBP.rate;
      usdtogbp = usdtogbp.round();

      var usd = double.tryParse(advanceController.text);
      userprice = usd.round();

    });

    print("$usdtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: advanceController.text);
// Returns the last updated date
    setState(() {
      usdtoeur = resultEUR.rate;
      usdtoeur = usdtoeur.round();


    });
    print("$usdtoeur");
    var resultCNY = await Currency.getConversion(
        from: 'USD', to: 'CNY', amount: advanceController.text);
    setState(() {
      usdtocny = resultCNY.rate;
      usdtocny = usdtocny.round();

    });
    print("$usdtocny");
    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: advanceController.text);
    setState(() {
      usdtoinr = resultINR.rate;
      usdtoinr = usdtoinr.round();

    });

    print("$usdtoinr");
  }
}
void FINRUSD() async {
  // final frankfurter = Frankfurter();
  //
  // final latest = await frankfurter.latest(from: Currency('EUR'));
  // latest.forEach(print);
  //
  // final rate = await frankfurter.getRate(
  //   from: Currency('EUR'),
  //   to: Currency('GBP'),
  // );
  if (currentUser.country == 'India') {
    var resultUSD = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: totalController.text ?? 0);
    // String date = result.date; // Returns the last updated date
    setState(() {


      Finrtousd = resultUSD.rate;
      Finrtousd = Finrtousd.round();

      var usd = double.tryParse(totalController.text ?? 0);
      totalprice = usd.round();
    });

    print("$Finrtousd");
    var resultGBP = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: totalController.text ?? 0);
// Returns the last updated date
    setState(() {
      Finrtogbp = resultGBP.rate;
      Finrtogbp = Finrtogbp.round();

    });

    print("$Finrtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount:totalController.text ?? 0);
    setState(() {
      Finrtoeur = resultEUR.rate;
      Finrtoeur = Finrtoeur.round();

    });

    print("$Finrtoeur");
    var resultCNY = await Currency.getConversion(
        from: 'INR', to: 'CNY', amount: totalController.text ?? 0);
    setState(() {
      Finrtocny = resultCNY.rate;
      Finrtocny = Finrtocny.round();

    });

    print("$Finrtocny");
  }
  else if (currentUser.country == 'China') {
    var resultUSD = await Currency.getConversion(
        from: 'CNY', to: 'USD', amount: totalController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      Fcnytousd = resultUSD.rate;
      Fcnytousd = Fcnytousd.round();

      var usd = double.tryParse(totalController.text);
      totalprice = usd.round();
    });
    print("$Fcnytousd");
    var resultGBP = await Currency.getConversion(
        from: 'CNY', to: 'GBP', amount: totalController.text);
// Returns the last updated date
    setState(() {
      Fcnytogbp = resultGBP.rate;
      Fcnytogbp = Fcnytogbp.round();

    });
    print("$Fcnytogbp");
    var resultEUR = await Currency.getConversion(
        from: 'CNY', to: 'EUR', amount: totalController.text);
    setState(() {
      Fcnytoeur = resultEUR.rate;
      Fcnytoeur = Fcnytoeur.round();

    });

    print("$Fcnytoeur");
    var resultINR = await Currency.getConversion(
        from: 'CNY', to: 'INR', amount: totalController.text);
    setState(() {
      Fcnytoinr = resultINR.rate;
      Fcnytoinr = Fcnytoinr.round();

    });

    print("$Fcnytoinr");
  }
  else if (currentUser.country == 'Europe') {
    var resultUSD = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: totalController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      Feurtousd = resultUSD.rate;
      Feurtousd = Feurtousd.round();

      var usd = double.tryParse(totalController.text);
      totalprice = usd.round();
    });

    print("$Feurtousd");
    var resultGBP = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: totalController.text);
// Returns the last updated date
    setState(() {
      Feurtogbp = resultGBP.rate;
      Feurtogbp = Feurtogbp.round();

    });

    print("$Feurtogbp");
    var resultCNY = await Currency.getConversion(
        from: 'EUR', to: 'CNY', amount: totalController.text);
    setState(() {
      Feurtocny = resultCNY.rate;
      Feurtocny = Feurtocny.round();

    });

    print("$Feurtocny");
    var resultINR = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: totalController.text);
    setState(() {
      Feurtoinr = resultINR.rate;
      Feurtoinr = Feurtoinr.round();

    });

    print("$Feurtoinr");
  }
  else if (currentUser.country == 'UK') {
    var resultUSD = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: totalController.text);
    // String date = result.date; // Returns the last updated date
    var resultEUR = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: totalController.text);
    var resultCNY = await Currency.getConversion(
        from: 'GBP', to: 'CNY', amount: totalController.text);
    var resultINR = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: totalController.text);

    setState(() {
      Fgbptousd = resultUSD.rate;
      // int usd = int.tryParse(gbptousd);
      Fgbptousd = Fgbptousd.round();
      var usd = double.tryParse(totalController.text);
      totalprice = usd.round();
      Fgbptoeur = resultEUR.rate;
      Fgbptoeur = Fgbptoeur.round();

      Fgbptocny = resultCNY.rate;
      Fgbptocny = Fgbptocny.round();
      Fgbptoinr = resultINR.rate;
      Fgbptoinr = Fgbptoinr.round();



    });

// Returns the last updated date

  }
  else if (currentUser.country == 'USA') {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: totalController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      Fusdtogbp = resultGBP.rate;
      Fusdtogbp = Fusdtogbp.round();

      var usd = double.tryParse(totalController.text);
      totalprice = usd.round();

    });

    print("$Fusdtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: totalController.text);
// Returns the last updated date
    setState(() {
      Fusdtoeur = resultEUR.rate;
      Fusdtoeur = Fusdtoeur.round();


    });
    print("$Fusdtoeur");
    var resultCNY = await Currency.getConversion(
        from: 'USD', to: 'CNY', amount: totalController.text);
    setState(() {
      Fusdtocny = resultCNY.rate;
      Fusdtocny = Fusdtocny.round();

    });
    print("$Fusdtocny");
    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: totalController.text);
    setState(() {
      Fusdtoinr = resultINR.rate;
      Fusdtoinr = Fusdtoinr.round();

    });

    print("$Fusdtoinr");
  }
  else  {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: totalController.text);
    // String date = result.date; // Returns the last updated date
    setState(() {
      Fusdtogbp = resultGBP.rate;
      Fusdtogbp = Fusdtogbp.round();

      var usd = double.tryParse(totalController.text);
      totalprice = usd.round();

    });

    print("$Fusdtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: totalController.text);
// Returns the last updated date
    setState(() {
      Fusdtoeur = resultEUR.rate;
      Fusdtoeur = Fusdtoeur.round();


    });
    print("$Fusdtoeur");
    var resultCNY = await Currency.getConversion(
        from: 'USD', to: 'CNY', amount: totalController.text);
    setState(() {
      Fusdtocny = resultCNY.rate;
      Fusdtocny = Fusdtocny.round();

    });
    print("$Fusdtocny");
    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: totalController.text);
    setState(() {
      Fusdtoinr = resultINR.rate;
      Fusdtoinr = Fusdtoinr.round();

    });

    print("$Fusdtoinr");
  }
}

currency(){
    if(currentUser.country == 'India'){
      return
    Column(
      children:[
    Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
  child: TextFormField(
    style:TextStyle(color:kText),

    keyboardType: TextInputType.number,
  maxLines: null,
  controller: advanceController,
  decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

  labelText: 'Advance Payment',labelStyle: TextStyle(color: kText),
  hintText: '₹',
  ),
  textAlign: TextAlign.center,
  validator: (text) {
  if (text.isEmpty) {
  return 'Advance Payment is empty';
  }
  return null;
  },
  ),
  ),
  SizedBox( height: 8.0,),
        Text('If one-time payment.Leave payment on delivery empty', style: TextStyle(
          // fontFamily :"MajorMonoDisplay",
          // fontSize:  35.0 ,
            color: Colors.red),),

        Container(
  margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
  child: TextFormField(
    style:TextStyle(color:kText),
    keyboardType: TextInputType.number,

  maxLines: null,
  controller: totalController,
  decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

  labelText: 'Payment on delivery',labelStyle: TextStyle(color: kText),
  hintText: '₹' ,
  ),
  textAlign: TextAlign.center,
  // validator: (text) {
  // if (text.isEmpty) {
  // return 'Final Payment is empty';
  // }
  // return null;
  // },
  ),
  ),
      ]
    );

    }
    else if(currentUser.country=='US'){
      return
        Column(
            children:[
        Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
  child: TextFormField(
    style:TextStyle(color:kText),

    keyboardType: TextInputType.number,
  maxLines: null,
  controller: advanceController,
  decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

  labelText: 'Advance Payment',labelStyle: TextStyle(color: kText),
  hintText: '\u0024',
  ),
  textAlign: TextAlign.center,
  validator: (text) {
  if (text.isEmpty) {
  return 'Advance Payment is empty';
  }
  return null;
  },
  ),
  ),
  SizedBox( height: 8.0,),
              Text('If one-time payment.Leave payment on delivery empty', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                // fontSize:  35.0 ,
                  color: Colors.red),),

              Container(
  margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
  child: TextFormField(
    style:TextStyle(color:kText),

    keyboardType: TextInputType.number,
  maxLines: null,
  controller: totalController,
  decoration: InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

  labelText: 'Payment on delivery',labelStyle: TextStyle(color: kText),
  hintText: '\u0024' ,
  ),
  textAlign: TextAlign.center,
  // validator: (text) {
  //   if (text.isEmpty) {
  //     return 'Final Payment is empty';
  //   }
  //   return null;
  // },
  ),
  ),
            ]
        );


    }
    else if(currentUser.country=='Europe'){
      return
        Column(
            children:[
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                child: TextFormField(
                  style:TextStyle(color:kText),

                  keyboardType: TextInputType.number,
                  maxLines: null,
                  controller: advanceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                    labelText: 'Advance Payment',labelStyle: TextStyle(color: kText),
                    hintText: '€',
                  ),
                  textAlign: TextAlign.center,
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'Advance Payment is empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox( height: 8.0,),
              Text('If one-time payment.Leave payment on delivery empty', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                // fontSize:  35.0 ,
                  color: Colors.red),),

              Container(
                margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                child: TextFormField(
                  style:TextStyle(color:kText),

                  keyboardType: TextInputType.number,
                  maxLines: null,
                  controller: totalController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                    labelText: 'Payment on delivery',labelStyle: TextStyle(color: kText),
                    hintText: '€' ,
                  ),
                  // textAlign: TextAlign.center,
                  // validator: (text) {
                  //   if (text.isEmpty) {
                  //     return 'Final Payment is empty';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ]
        );


    }
     else if(currentUser.country=='UK'){
      return
        Column(
            children:[
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                child: TextFormField(
                  style:TextStyle(color:kText),

                  keyboardType: TextInputType.number,
                  maxLines: null,
                  controller: advanceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                    labelText: 'Advance Payment',labelStyle: TextStyle(color: kText),
                    hintText: '£',
                  ),
                  textAlign: TextAlign.center,
                  // validator: (text) {
                  //   if (text.isEmpty) {
                  //     return 'Advance Payment is empty';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox( height: 8.0,),
              Text('If one-time payment.Leave payment on delivery empty', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                // fontSize:  35.0 ,
                  color: Colors.red),),

              Container(
                margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                child: TextFormField(
                  style:TextStyle(color:kText),

                  keyboardType: TextInputType.number,
                  maxLines: null,
                  controller: totalController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                    labelText: 'Payment on delivery',labelStyle: TextStyle(color: kText),
                    hintText: '£' ,
                  ),
                  // textAlign: TextAlign.center,
                  // validator: (text) {
                  //   if (text.isEmpty) {
                  //     return 'Final Payment is empty';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ]
        );

    }
    else{
      return
        Column(
            children:[
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                child: TextFormField(
                  style:TextStyle(color:kText),

                  keyboardType: TextInputType.number,
                  maxLines: null,
                  controller: advanceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                    labelText: 'Advance Payment',labelStyle: TextStyle(color: kText),
                    hintText: '\u0024',
                  ),
                  textAlign: TextAlign.center,
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'Advance Payment is empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox( height: 8.0,),
              Text('If one-time payment.Leave payment on delivery empty', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                // fontSize:  35.0 ,
                  color: Colors.red),),

              Container(
                margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                child: TextFormField(
                  style:TextStyle(color:kText),

                  keyboardType: TextInputType.number,
                  maxLines: null,
                  controller: totalController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                    labelText: 'Payment on delivery',labelStyle: TextStyle(color: kText),
                    hintText: '\u0024' ,
                  ),
                  textAlign: TextAlign.center,
                  // validator: (text) {
                  //   if (text.isEmpty) {
                  //     return 'Final Payment is empty';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ]
        );


    }
  }
  Servicecatalog(){
    Fluttertoast.showToast(
        msg: "Please wait:Uploading", timeInSecForIos: 4);
print(currentUser.country);
    setState(() {
      isUploading = true;

    });
  if(currentUser.country == 'India') {
    FirebaseFirestore.instance.collection('serviceCustomer')
      .doc(widget.reciever)
      .collection('customerService')
      .doc(orderId)
      .set({
    'cusId':widget.reciever,
    'cusname':widget.recievername,
    "cusProfileImg": widget.recieverUrl,
    'ownerId':currentUser.id,
    'username':currentUser.displayName,
    'photoUrl':currentUser.photoUrl,
  'orderId':orderId,
  'fulfilled':'false',
  'orderStatus':'Processing',
  "usd": inrtousd.toString() ?? "",
  "cny": inrtocny.toString() ?? "",
  "gbp": inrtogbp.toString() ?? "",
  "eur": inrtoeur.toString() ?? "",
  "inr": userprice.toString() ?? "",
    "Fusd": Finrtousd.toString() ?? "",
  "Fcny": Finrtocny.toString() ?? "",
  "Fgbp": Finrtogbp.toString() ?? "",
  "Feur": Finrtoeur.toString() ?? "",
  "Finr": totalprice.toString() ?? "",
      "timestamp": timestamp,

      // 'advance':advanceController.text,
  // 'final':totalController.text ?? "0",
  'title':titleController.text,
  'description':detailsController.text,
  'advancepay':'false',
  'finalpay':'false',
  });
  FirebaseFirestore.instance.collection('serviceSeller')
      .doc(currentUser.id)
      .collection('sellerService')
      .doc(orderId)
      .set({
    'cusId':widget.reciever,
    'cusname':widget.recievername,
    "cusProfileImg": widget.recieverUrl,
    'ownerId':currentUser.id,
    'username':currentUser.displayName,
    'photoUrl':currentUser.photoUrl,
    'orderId':orderId,
    'fulfilled':'false',
    'orderStatus':'Processing',
    "usd": inrtousd.toString() ?? "",
    "cny": inrtocny.toString() ?? "",
    "gbp": inrtogbp.toString() ?? "",
    "eur": inrtoeur.toString() ?? "",
    "inr": userprice.toString() ?? "",
    "Fusd": Finrtousd.toString() ?? "",
    "Fcny": Finrtocny.toString() ?? "",
    "Fgbp": Finrtogbp.toString() ?? "",
    "Feur": Finrtoeur.toString() ?? "",
    "Finr": totalprice.toString() ?? "",
    "timestamp": timestamp,

    // 'final':totalController.text ?? "0",
    'title':titleController.text,
    'description':detailsController.text,    'a'
        'dvancepay':'false',
    'finalpay':'false',

  });
  FirebaseFirestore.instance.collection('feed')
      .doc(currentUser.id)
      .collection('feedItems')
      .doc(orderId)
      .set({
    "type": "ReqPaymentI",
    "username": widget.recievername,
    "userId": widget.reciever,
    "userProfileImg": widget.recieverUrl,

    "postId": orderId,
    // "mediaUrl": mediaUrl,
    "timestamp": timestamp,
    "read": 'false',
    'message':'Your invoice has been sent!',
  });
  FirebaseFirestore.instance.collection('feed')
      .doc(widget.reciever)
      .collection('feedItems')
      .doc(orderId)
      .set({
    "type": "ReqPayment",
    "username": currentUser.displayName,
    "userId": currentUser.id,
    "userProfileImg": currentUser.photoUrl,
    "postId": orderId,
    // "mediaUrl": mediaUrl,
    "timestamp": timestamp,
    "read": 'false',
    'message':'You received an order invoice!',
  });
  // Navigator.pop(context);

  }
    else if(currentUser.country=='Europe') {
  FirebaseFirestore.instance.collection('serviceCustomer')
      .doc(widget.reciever)
      .collection('customerService')
      .doc(orderId)
      .set({
  'cusId':widget.reciever,
  'cusname':widget.recievername,
  "cusProfileImg": widget.recieverUrl,
  'ownerId':currentUser.id,
  'username':currentUser.displayName,
  'photoUrl':currentUser.photoUrl,
  'orderId':orderId,
  'fulfilled':'false',
  'orderStatus':'Processing',
  "usd": eurtousd.toString() ?? "",
  "cny": eurtocny.toString() ?? "",
  "gbp": eurtogbp.toString() ?? "",
    "eur": userprice.toString() ?? "0",
  "inr": eurtoinr.toString() ?? "",
"Fusd": Feurtousd.toString() ?? "",
  "Fcny": Feurtocny.toString() ?? "",
  "Fgbp": Feurtogbp.toString() ?? "",
  "Feur": totalprice.toString() ?? "",
  "Finr": Feurtoinr.toString() ?? "",
    "timestamp": timestamp,


  // 'advance':advanceController.text,
  // 'final':otalController.text ?? "0"totalController.text ?? "0",
  'title':titleController.text,
  'description':detailsController.text,
  'advancepay':'false',
  'finalpay':'false',
  });
  FirebaseFirestore.instance.collection('serviceSeller')
      .doc(currentUser.id)
      .collection('sellerService')
      .doc(orderId)
      .set({
    'cusId':widget.reciever,
    'cusname':widget.recievername,
    "cusProfileImg": widget.recieverUrl,
    'ownerId':currentUser.id,
    'username':currentUser.displayName,
    'photoUrl':currentUser.photoUrl,
    'orderId':orderId,
    'fulfilled':'false',
    'orderStatus':'Processing',
    "usd": eurtousd.toString() ?? "",
    "cny": eurtocny.toString() ?? "",
    "gbp": eurtogbp.toString() ?? "",
    "eur": userprice.toString() ?? "",
    "inr": eurtoinr.toString() ?? "",
    "Fusd": Feurtousd.toString() ?? "",
    "Fcny": Feurtocny.toString() ?? "",
    "Fgbp": Feurtogbp.toString() ?? "",
    "Feur": totalprice.toString() ?? "",
    "Finr": Feurtoinr.toString() ?? "",
    "timestamp": timestamp,


    // 'advance':advanceController.text,
    // 'final':totalController.text ?? "0",
    'title':titleController.text,
    // 'title':titleController.text,
    'description':detailsController.text,
    'advancepay':'false',
    'finalpay':'false',

  });
FirebaseFirestore.instance.collection('feed')
    .doc(currentUser.id)
    .collection('feedItems')
    .doc(orderId)
    .set({
  "type": "ReqPaymentI",
  "username": widget.recievername,
  "userId": widget.reciever,
  "userProfileImg": widget.recieverUrl,

  "postId": orderId,
  // "mediaUrl": mediaUrl,
  "timestamp": timestamp,
  "read": 'false',
  'message':'Your invoice has been sent!',
});
FirebaseFirestore.instance.collection('feed')
    .doc(widget.reciever)
    .collection('feedItems')
    .doc(orderId)
    .set({
  "type": "ReqPayment",
  "username": currentUser.displayName,
  "userId": currentUser.id,
  "userProfileImg": currentUser.photoUrl,
  "postId": orderId,
  // "mediaUrl": mediaUrl,
  "timestamp": timestamp,
  "read": 'false',
  'message':'Your received an order invoice!',
});
  }
  else if(currentUser.country=='USA') {
  FirebaseFirestore.instance.collection('serviceCustomer')
    .doc(widget.reciever)
    .collection('customerService')
    .doc(orderId)
    .set({
  'cusId':widget.reciever,
  'cusname':widget.recievername,
  "cusProfileImg": widget.recieverUrl,
  'ownerId':currentUser.id,
  'username':currentUser.displayName,
  'photoUrl':currentUser.photoUrl,
  'orderId':orderId,
  'fulfilled':'false',
  'orderStatus':'Processing',
  "cny": usdtocny.toString() ?? "",
  "gbp": usdtogbp.toString() ?? "",
  "eur": usdtoeur.toString() ?? "",
  "inr": usdtoinr.toString() ?? "",
  "usd": userprice.toString() ?? "",
  "Fcny": Fusdtocny.toString() ?? "",
  "Fgbp": Fusdtogbp.toString() ?? "",
  "Feur": Fusdtoeur.toString() ?? "",
  "Finr": Fusdtoinr.toString() ?? "",
  "Fusd": totalprice.toString() ?? "",
    "timestamp": timestamp,

  // 'advance':advanceController.text,
  // 'final':otalController.text ?? "0"totalController.text ?? "0",
  'title':titleController.text,
  'description':detailsController.text,
  'advancepay':'false',
  'finalpay':'false',
});
FirebaseFirestore.instance.collection('serviceSeller')
    .doc(currentUser.id)
    .collection('sellerService')
    .doc(orderId)
    .set({
  'cusId':widget.reciever,
  'cusname':widget.recievername,
  "cusProfileImg": widget.recieverUrl,
  'ownerId':currentUser.id,
  'username':currentUser.displayName,
  'photoUrl':currentUser.photoUrl,
  'orderId':orderId,
  'fulfilled':'false',
  'orderStatus':'Processing',
  "cny": usdtocny.toString() ?? "",
  "gbp": usdtogbp.toString() ?? "",
  "eur": usdtoeur.toString() ?? "",
  "inr": usdtoinr.toString() ?? "",
  "usd": userprice.toString() ?? "",
  "Fcny": Fusdtocny.toString() ?? "",
  "Fgbp": Fusdtogbp.toString() ?? "",
  "Feur": Fusdtoeur.toString() ?? "",
  "Finr": Fusdtoinr.toString() ?? "",
  "Fusd": totalprice.toString() ?? "",
  "timestamp": timestamp,
  // 'advance':advanceController.text,
  // 'final':totalController.text ?? "0",
  'title':titleController.text,
  // 'title':titleController.text,
  'description':detailsController.text,
  'advancepay':'false',
  'finalpay':'false',

});
FirebaseFirestore.instance.collection('feed')
    .doc(currentUser.id)
    .collection('feedItems')
    .doc(orderId)
    .set({
  "type": "ReqPaymentI",
  "username": widget.recievername,
  "userId": widget.reciever,
  "userProfileImg": widget.recieverUrl,
  "postId": orderId,
  // "mediaUrl": mediaUrl,
  "timestamp": timestamp,
  "read": 'false',
  'message':'Your invoice has been sent!',
});
FirebaseFirestore.instance.collection('feed')
    .doc(widget.reciever)
    .collection('feedItems')
    .doc(orderId)
    .set({
  "type": "ReqPayment",
  "username": currentUser.displayName,
  "userId": currentUser.id,
  "userProfileImg": currentUser.photoUrl,
  "postId": orderId,
  // "mediaUrl": mediaUrl,
  "timestamp": timestamp,
  "read": 'false',
  'message':'Your received an order invoice!',
});
}
  else if(currentUser.country=='UK') {
  FirebaseFirestore.instance.collection('serviceCustomer')
      .doc(widget.reciever)
      .collection('customerService')
      .doc(orderId)
      .set({
  'cusId':widget.reciever,
  'cusname':widget.recievername,
  "cusProfileImg": widget.recieverUrl,
  'ownerId':currentUser.id,
  'username':currentUser.displayName,
  'photoUrl':currentUser.photoUrl,
  'username':currentUser.displayName,
  'photoUrl':currentUser.photoUrl,
  'orderId':orderId,
  'fulfilled':'false',
  'orderStatus':'Processing',
  "usd": gbptousd.toString() ?? "",
  "cny": gbptocny.toString() ?? "",
  "gbp": userprice.toString() ?? "",
  "eur": gbptoeur.toString() ?? "",
  "inr": gbptoinr.toString() ?? "",
    "Fusd": Fgbptousd.toString() ?? "",
  "Fcny": Fgbptocny.toString() ?? "",
  "Fgbp": totalprice.toString() ?? "",
  "Feur": Fgbptoeur.toString() ?? "",
  "Finr": Fgbptoinr.toString() ?? "",
    "timestamp": timestamp,

  // 'advance':advanceController.text,
  // 'final':otalController.text ?? "0"totalController.text ?? "0",
  'title':titleController.text,
  'description':detailsController.text,
  'advancepay':'false',
  'finalpay':'false',
  });
  FirebaseFirestore.instance.collection('serviceSeller')
      .doc(currentUser.id)
      .collection('sellerService')
      .doc(orderId)
      .set({
    'cusId':widget.reciever,
    'cusname':widget.recievername,
    "cusProfileImg": widget.recieverUrl,
    'ownerId':currentUser.id,
    'username':currentUser.displayName,
    'photoUrl':currentUser.photoUrl,
    'username':currentUser.displayName,
    'photoUrl':currentUser.photoUrl,
    'orderId':orderId,
    'fulfilled':'false',
    'orderStatus':'Processing',
    "usd": gbptousd.toString() ?? "",
    "cny": gbptocny.toString() ?? "",
    "gbp": userprice.toString() ?? "",
    "eur": gbptoeur.toString() ?? "",
    "inr": gbptoinr.toString() ?? "",
    "Fusd": Fgbptousd.toString() ?? "",
    "Fcny": Fgbptocny.toString() ?? "",
    "Fgbp": totalprice.toString() ?? "",
    "Feur": Fgbptoeur.toString() ?? "",
    "Finr": Fgbptoinr.toString() ?? "",
    "timestamp": timestamp,

    // 'advance':advanceController.text,
    // 'final':totalController.text ?? "0",
    // 'title':titleController.text,
    'title':titleController.text,
    'description':detailsController.text,
    'advancepay':'false',
    'finalpay':'false',

  });
FirebaseFirestore.instance.collection('feed')
    .doc(currentUser.id)
    .collection('feedItems')
    .doc(orderId)
    .set({
  "type": "ReqPaymentI",
  "username": widget.recievername,
  "userId": widget.reciever,
  "userProfileImg": widget.recieverUrl,

  "postId": orderId,
  // "mediaUrl": mediaUrl,
  "timestamp": timestamp,
  "read": 'false',
  'message':'Your invoice has been sent!',
});
FirebaseFirestore.instance.collection('feed')
    .doc(widget.reciever)
    .collection('feedItems')
    .doc(orderId)
    .set({
  "type": "ReqPayment",
  "username": currentUser.displayName,
  "userId": currentUser.id,
  "userProfileImg": currentUser.photoUrl,
  "postId": orderId,
  // "mediaUrl": mediaUrl,
  "timestamp": timestamp,
  "read": 'false',
  'message':'Your received an order invoice!',
});
  }
else {
    FirebaseFirestore.instance.collection('serviceCustomer')
        .doc(widget.reciever)
        .collection('customerService')
        .doc(orderId)
        .set({
      'cusId':widget.reciever,
      'cusname':widget.recievername,
      "cusProfileImg": widget.recieverUrl,
      'ownerId':currentUser.id,
      'username':currentUser.displayName,
      'photoUrl':currentUser.photoUrl,
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      "cny": usdtocny.toString() ?? "",
      "gbp": usdtogbp.toString() ?? "",
      "eur": usdtoeur.toString() ?? "",
      "inr": usdtoinr.toString() ?? "",
      "usd": userprice.toString() ?? "",
      "Fcny": Fusdtocny.toString() ?? "",
      "Fgbp": Fusdtogbp.toString() ?? "",
      "Feur": Fusdtoeur.toString() ?? "",
      "Finr": Fusdtoinr.toString() ?? "",
      "Fusd": totalprice.toString() ?? "",
      "timestamp": timestamp,

      // 'advance':advanceController.text,
      // 'final':otalController.text ?? "0"totalController.text ?? "0",
      'title':titleController.text,
      'description':detailsController.text,
      'advancepay':'false',
      'finalpay':'false',
    });
    FirebaseFirestore.instance.collection('serviceSeller')
        .doc(currentUser.id)
        .collection('sellerService')
        .doc(orderId)
        .set({
      'cusId':widget.reciever,
      'cusname':widget.recievername,
      "cusProfileImg": widget.recieverUrl,
      'ownerId':currentUser.id,
      'username':currentUser.displayName,
      'photoUrl':currentUser.photoUrl,
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      "cny": usdtocny.toString() ?? "",
      "gbp": usdtogbp.toString() ?? "",
      "eur": usdtoeur.toString() ?? "",
      "inr": usdtoinr.toString() ?? "",
      "usd": userprice.toString() ?? "",
      "Fcny": Fusdtocny.toString() ?? "",
      "Fgbp": Fusdtogbp.toString() ?? "",
      "Feur": Fusdtoeur.toString() ?? "",
      "Finr": Fusdtoinr.toString() ?? "",
      "Fusd": totalprice.toString() ?? "",
      "timestamp": timestamp,
      // 'advance':advanceController.text,
      // 'final':totalController.text ?? "0",
      'title':titleController.text,
      // 'title':titleController.text,
      'description':detailsController.text,
      'advancepay':'false',
      'finalpay':'false',

    });
    FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "ReqPaymentI",
      "username": widget.recievername,
      "userId": widget.reciever,
      "userProfileImg": widget.recieverUrl,
      "postId": orderId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'Your invoice has been sent!',
    });
    FirebaseFirestore.instance.collection('feed')
        .doc(widget.reciever)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "ReqPayment",
      "username": currentUser.displayName,
      "userId": currentUser.id,
      "userProfileImg": currentUser.photoUrl,
      "postId": orderId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'Your received an order invoice!',
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar:  AppBar(      backgroundColor: kPrimaryColor,

        title: FittedBox(
          fit:BoxFit.contain,
          child: Text('Create new  invoice',
            style: TextStyle(
                fontFamily :"MajorMonoDisplay",
                // fontSize:  35.0 ,
                color: Colors.white),),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),

      body:
      Container(decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Stack(
          children:[
            Container(
              child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  isUploading ? linearProgress() : Text(""),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                    child: TextFormField(
                      style:TextStyle(color:kText),
                      controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Title',labelStyle: TextStyle(color: kText),
                        hintText: 'Title',
                      ),
                      textAlign: TextAlign.center,
                      validator: (text) {
                        if ( text.isEmpty) {
                          return 'Title is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox( height: 8.0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                    child: TextFormField(
                      style:TextStyle(color:kText),

                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: detailsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Description',labelStyle: TextStyle(color: kText),
                        hintText: 'Description',
                      ),
                      textAlign: TextAlign.center,
                      validator: (text) {
                        if (text.isEmpty) {
                          return 'Description is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox( height: 8.0,),
                  Divider(color: kGrey,),
                  Text('Payment', style: TextStyle(
    // fontFamily :"MajorMonoDisplay",
    fontSize:  15.0 ,
    color: Colors.white),),
              currency(),

 Container(
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                    child: RaisedButton(
                      onPressed:() async{
                        Fluttertoast.showToast(
                            msg: "Please wait:Uploading", timeInSecForIos: 4);

                        await INRUSD();
                        await FINRUSD();

                        if(_formKey.currentState.validate()) {
                          // ignore: unnecessary_statements
                          isUploading ? null : Servicecatalog();
                          Navigator.pop(context);
                        }

                      },
                      color: kblue,
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          Text('Send Invoice', style: TextStyle(
                          // fontFamily :"MajorMonoDisplay",
                          //   fontSize:  ,
                            color: Colors.white),),
    ],
                      ),
                    )
                  ),

                ],
              ),

          ),
            ),
            (_inProcess)?Container(

              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.95,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):Center(),
            isUploading ? Center(child:  CircularProgressIndicator()) : Text(""),
        ],
        ),
      ),

    );
  }
}
