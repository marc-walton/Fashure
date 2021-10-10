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
var advancePrice;
var totalPrice;
var USD;
var GBP;
var EUR;
var INR;
var USDF;
var GBPF;
var EURF;
var INRF;

void INRUSD() async {
  setState(() {
    isUploading = true;
    advancePrice = double.tryParse(advanceController.text ?? "0.0");
    totalPrice = double.tryParse(totalController.text ??"0.0");

  });
  if(currentUser.currency == "INR") {
    var resultUSD = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: advanceController.text ?? 0);
    var resultEUR = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: advanceController.text ?? 0);
    var resultGBP = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: advanceController.text ?? 0);
 var resultUSDF = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: totalController.text ?? 0);
    var resultEURF = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: totalController.text ?? 0);
    var resultGBPF = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: totalController.text ?? 0);

    setState(() {
      INR = advancePrice ?? 0.00001;
      USD = resultUSD.rate ?? 0.00001;
      EUR = resultEUR.rate ?? 0.00001;
      GBP = resultGBP.rate ?? 0.00001;
  INRF = totalPrice ?? 0.00001;
      USDF = resultUSDF.rate ?? 0.00001;
      EURF = resultEURF.rate ?? 0.00001;
      GBPF = resultGBPF.rate ?? 0.00001;

    }); }
  else if(currentUser.currency == "EUR") {
    var resultUSD = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: advanceController.text ?? 0);
    var resultINR = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: advanceController.text ?? 0);
    var resultGBP = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: advanceController.text ?? 0);
 var resultUSDF = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: totalController.text ?? 0);
    var resultINRF = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: totalController.text ?? 0);
    var resultGBPF = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: totalController.text ?? 0);

    setState(() {
      INR =  resultINR.rate?? 0.00001;
      USD = resultUSD.rate ?? 0.00001;
      EUR = advancePrice ?? 0.00001;
      GBP = resultGBP.rate ?? 0.00001;
  INRF = resultINRF.rate ?? 0.00001;
      USDF = resultUSDF.rate ?? 0.00001;
      EURF =  totalPrice ?? 0.00001;
      GBPF = resultGBPF.rate ?? 0.00001;

    }); }
  else if(currentUser.currency == "GBP") {
    var resultUSD = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: advanceController.text ?? 0);
    var resultINR = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: advanceController.text ?? 0);
    var resultEUR = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: advanceController.text ?? 0);
 var resultUSDF = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: totalController.text ?? 0);
    var resultINRF = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: totalController.text ?? 0);
    var resultEURF = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: totalController.text ?? 0);

    setState(() {
      INR =  resultINR.rate?? 0.00001;
      USD = resultUSD.rate ?? 0.00001;
      EUR = resultEUR.rate  ?? 0.00001;
      GBP =  advancePrice ?? 0.00001;
  INRF = resultINRF.rate ?? 0.00001;
      USDF = resultUSDF.rate ?? 0.00001;
      EURF =  resultEURF.rate  ?? 0.00001;
      GBPF = totalPrice ?? 0.00001;

    }); }
else {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: advanceController.text ?? 0);
    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: advanceController.text ?? 0);
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: advanceController.text ?? 0);
 var resultEURF = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: totalController.text ?? 0);
    var resultINRF = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: totalController.text ?? 0);
    var resultGBPF = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: totalController.text ?? 0);

    setState(() {
      INR =  resultINR.rate?? 0.00001;
      USD = advancePrice ?? 0.00001;
      EUR = resultEUR.rate  ?? 0.00001;
      GBP =   resultGBP.rate ?? 0.00001;
  INRF = resultINRF.rate ?? 0.00001;
      USDF = totalPrice ?? 0.00001;
      EURF =  resultEURF.rate  ?? 0.00001;
      GBPF = resultGBPF.rate ?? 0.00001;

    }); }



}
currency(){
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
                hintText: '${currentUser.currencysym}',
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
                hintText: '${currentUser.currencysym}' ,
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
  Servicecatalog(){
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
      'country':currentUser.country,

      "usd": USD,
      "eur":EUR,
      "gbp":GBP,
      "inr": INR ,
      "Fusd": USDF,
      "Feur":EURF,
      "Fgbp":GBPF,
      "Finr": INRF,
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
      'country':currentUser.country,
      "usd": USD,
      "eur":EUR,
      "gbp":GBP,
      "inr": INR ,
      "Fusd": USDF,
      "Feur":EURF,
      "Fgbp":GBPF,
      "Finr": INRF,
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


                        if(_formKey.currentState.validate()) {
                          // ignore: unnecessary_statements
                          await INRUSD();

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

            isUploading ? Center(child:  CircularProgressIndicator()) : Text(""),
        ],
        ),
      ),

    );
  }
}
