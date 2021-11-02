import 'package:fashow/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:fashow/Product_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PaySupport extends StatefulWidget {
  final String buynowamount;
  final String userId;
  final String displayName;
  final String imgUrl;
  final String currency;
 final String mediaUrl;

  const PaySupport(
      {Key key, this.buynowamount, this.mediaUrl, this.userId, this.displayName, this.imgUrl, this.currency,
      }) : super(key: key);

  @override
  _PaySupportState createState() => _PaySupportState(
  );
}

class _PaySupportState extends State<PaySupport>
{
  String Id = Uuid().v4();

  SharedPreferences adPrefs;
  String key = 'rzp_test_Ut90sdJd5tSty5';

  Razorpay _razorpay;
 var userPrice;
Users UserDetails;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getUser();
    INRUSD();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
  void INRUSD() async {
    var I;
    var INR;
    var G;
    var U;
    var I1;
    var E1;
    var G1;
    var U1;
    var I2;
    var E2;
    var G2;
    var U2;
var result;

    if(currentUser.currency == "INR") {
      if(widget.currency == "EUR") {
         result = await Currency.getConversion(
          from: 'INR', to: 'EUR', amount: widget.buynowamount.toString() ?? 0);}
      else  if(widget.currency == "GBP") {
         result = await Currency.getConversion(
          from: 'INR', to: 'GBP', amount: widget.buynowamount.toString() ?? 0);}
      else{
         result = await Currency.getConversion(
          from: 'INR', to: 'USD', amount: widget.buynowamount.toString() ?? 0);}


      setState(() {
        INR = result.rate ?? 0.001;

        I = INR.toStringAsFixed(2);
        userPrice = double.tryParse(I);


      }); }
    else if(currentUser.currency == "EUR") {
      if(widget.currency == "INR") {
        result = await Currency.getConversion(
            from: 'EUR', to: 'INR', amount: widget.buynowamount.toString() ?? 0);}
      else  if(widget.currency == "GBP") {
        result = await Currency.getConversion(
            from: 'EUR', to: 'GBP', amount: widget.buynowamount.toString() ?? 0);}
      else{
        result = await Currency.getConversion(
            from: 'EUR', to: 'USD', amount: widget.buynowamount.toString() ?? 0);}


      setState(() {
        INR = result.rate ?? 0.001;

        I = INR.toStringAsFixed(2);
        userPrice = double.tryParse(I);


      }); }
    else if(currentUser.currency == "GBP") {
      if(widget.currency == "INR") {
        result = await Currency.getConversion(
            from: 'GBP', to: 'INR', amount: widget.buynowamount.toString() ?? 0);}
      else  if(widget.currency == "EUR") {
        result = await Currency.getConversion(
            from: 'GBP', to: 'EUR', amount: widget.buynowamount.toString() ?? 0);}
      else{
        result = await Currency.getConversion(
            from: 'GBP', to: 'USD', amount: widget.buynowamount.toString() ?? 0);}


      setState(() {
        INR = result.rate ?? 0.001;

        I = INR.toStringAsFixed(2);
        userPrice = double.tryParse(I);


      }); }
    else {
      if(widget.currency == "INR") {
        result = await Currency.getConversion(
            from: 'USD', to: 'INR', amount: widget.buynowamount.toString() ?? 0);}
      else  if(widget.currency == "EUR") {
        result = await Currency.getConversion(
            from: 'USD', to: 'EUR', amount: widget.buynowamount.toString() ?? 0);}
      else{
        result = await Currency.getConversion(
            from: 'USD', to: 'GBP', amount: widget.buynowamount.toString() ?? 0);}


      setState(() {
        INR = result.rate ?? 0.001;

        I = INR.toStringAsFixed(2);
        userPrice = double.tryParse(I);


      }); }



  }
  getUser()async{
    DocumentSnapshot doc = await usersRef.doc(widget.userId).get();
    UserDetails = Users.fromDocument(doc);
  }
  openCheckout()  {
    if (currentUser.currency == 'INR') {
      var options = {
        'key': key,
        'amount': "${widget.buynowamount}",
        'name': currentUser.id,
        'description': 'Payment',
        'currency': 'INR',


        'prefill': { 'email': currentUser.email},
        'external': {
          'wallets': ['paytm']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e);
      }
    }
  if (currentUser.currency == 'GBP') {
      var options = {
        'key': key,
        'amount': "${widget.buynowamount}",
        'name': currentUser.id,
        'description': 'Payment',
        'currency': 'GBP',


        'prefill': { 'email': currentUser.email},
        'external': {
          'wallets': ['paytm']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e);
      }
    }
if (currentUser.currency == 'EUR') {
      var options = {
        'key': key,
        'amount': "${widget.buynowamount}",
        'name': currentUser.id,
        'description': 'Payment',
        'currency': 'EUR',


        'prefill': { 'email': currentUser.email},
        'external': {
          'wallets': ['paytm']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e);
      }
    }

    else{
      var options = {
        'key': key,
        'amount':"${widget.buynowamount}",
        'name': currentUser.id,
        'currency': 'USD',
        'description': 'Payment',
        'prefill': { 'email': currentUser.email},
        'external': {
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e);
      }
    }
  }
update(){
  FirebaseFirestore.instance.collection('Earnings')
      .doc(widget.userId)
      .collection('support')
      .doc(Id)
      .set({
    "username": currentUser.displayName,
    "userId": currentUser.id,
    "userProfileImg": currentUser.photoUrl,
    "mediaUrl":widget.mediaUrl,
    "timestamp": timestamp,
    "read": 'false',
    "Earnings": UserDetails.currency == currentUser.currency?widget.buynowamount:userPrice,

  });
  FirebaseFirestore.instance.collection('users')
      .doc(widget.userId)
      .update({

    "Earnings":UserDetails.Earnings + UserDetails.currency == currentUser.currency?widget.buynowamount:userPrice,
    "TotalEarnings":UserDetails.TotalEarnings + UserDetails.currency == currentUser.currency?widget.buynowamount:userPrice,

  });
}

  onSuccess()async{
   FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(Id)
        .set({
      "type": "SupportPaymentSender",
      "username": widget.displayName,
      "userId": widget.userId,
      "userProfileImg": widget.imgUrl,
      "mediaUrl":widget.mediaUrl,
     "postId": Id,

     "timestamp": timestamp,
      "read": 'false',
      'message':'Thank you for the support!',
    });
   FirebaseFirestore.instance.collection('feed')
        .doc(widget.userId)
        .collection('feedItems')
        .doc(Id)
        .set({
      "type": "SupportPaymentReceiver",
      "username": currentUser.displayName,
      "userId": currentUser.id,
      "userProfileImg": currentUser.photoUrl,
      "mediaUrl":widget.mediaUrl,
      "timestamp": timestamp,
      "postId": Id,
      "read": 'false',
      'message':'You received a Support!',
    });
    update();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onSuccess();
    Get.back( );
    Fluttertoast.showToast(
        msg: "Payment SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.back( );

    Fluttertoast.showToast(
        msg: "Payment Failed: " + response.code.toString() + " - " + response.message,
        timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  @override
  Widget build(BuildContext context) {
    return  openCheckout();
  }

}