import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashow/orders.dart';
import 'package:get/get.dart';

class PaymentSer extends StatefulWidget {
  final String Amount;
final String finalAmount;
  final String OwnerId;
  final String advancepay;
  final String finalpay;
final String title;

  final String username;
  final String profileimg;
  final String cusId;

  final String OrderId;
  final String eur;
  final String usd;
   final String inr;
   final String gbp;


 final String Feur;
 final String Fusd;
 final String Finr;
 final String Fgbp;


  const PaymentSer({Key key,this.finalAmount,
    this.cusId,
    this.usd,
    this.eur,
    this.inr,
    this.gbp,
this.title,

      this.Fusd,
    this.Feur,
    this.Finr,
    this.Fgbp,

    this.Amount,this.OwnerId,this.OrderId,this.advancepay,this.finalpay,this.username,this.profileimg}) : super(key: key);

  @override
  _PaymentSerState createState() => _PaymentSerState();
}

class _PaymentSerState extends State<PaymentSer> {
  Razorpay _razorpay;
  var total = 0;
  String key = 'rzp_test_Ut90sdJd5tSty5';
  SharedPreferences adPrefs;
String inr;
String usd;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
  openCheckout() async {
    if (currentUser.currency == 'INR') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}",
        'name': currentUser.id,
        'description': 'Payment',
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
    else if (currentUser.currency == 'EUR') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}",
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
    else if (currentUser.currency == 'GBP') {
      var options = {
        'key': key,
        'amount':"${widget.Amount}",
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
    else{
      var options = {
        'key': key,
        'amount': "${widget.Amount}",
        'name': currentUser.id,
        'currency': 'USD',
        'description': 'Payment',
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
  }

  payment(){
    FirebaseFirestore.instance.collection('Payments')
        .doc(widget.OwnerId)
        .collection('ServicePayments')
        .doc(widget.OrderId)
        .update({
      'ownerId':widget.OwnerId,
      'orderId':widget.OrderId,
      "timestamp": timestamp,
      "userCountry": currentUser.country,
      'usd':widget.usd,
      'inr':widget.inr,
       'gbp':widget.gbp,
      'eur':widget.eur,

      'Fusd':widget.Fusd,
      'Finr':widget.Finr,
'Feur':widget.Feur,
      'Fgbp':widget.Fgbp,

'title':widget.title,
      'fulfilled':'false',
    });
  }
  onSuccess(){
    if(widget.Finr == "")
    {

      FirebaseFirestore.instance.collection('serviceCustomer')
          .doc(currentUser.id)
          .collection('customerService')
          .doc(widget.OrderId)
          .update({
        'advancepay':'true',
        'finalpay':'true',
        "timestamp": timestamp,

      });
      FirebaseFirestore.instance.collection('serviceSeller')
          .doc(widget.OwnerId)
          .collection('sellerService')
          .doc(widget.OrderId)
          .update({
        'advancepay':'true',
        'finalpay':'true',
        'read':'false',
        "timestamp": timestamp,


      }); FirebaseFirestore.instance.collection('feed')
          .doc(currentUser.id)
          .collection('feedItems')
          .doc(widget.OrderId)
          .set({
        "type": "ServicePayment",
        "username": widget.username,
        "userId": widget.OwnerId,
        "userProfileImg": widget.profileimg,
        "postId": widget.OrderId,
        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'Payment Successful on an Invoice!',
      });FirebaseFirestore.instance.collection('feed')
          .doc(widget.OwnerId)
          .collection('feedItems')
          .doc(widget.OrderId)
          .set({
        "type": "ServicePaymentI",
        "username": currentUser.displayName,
        "userId": widget.OwnerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": widget.OrderId,
        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'Payment Successful on an Invoice !',
      });}
  else  if(widget.advancepay == 'false')
    {

        FirebaseFirestore.instance.collection('serviceCustomer')
            .doc(currentUser.id)
            .collection('customerService')
            .doc(widget.OrderId)
            .update({
          'advancepay': 'true',
          'finalpay': 'false',

        });
        FirebaseFirestore.instance.collection('serviceSeller')
            .doc(widget.OwnerId)
            .collection('sellerService')
            .doc(widget.OrderId)
            .update({
          'advancepay': 'true',
          'finalpay': 'false',
          'read': 'false',

        });
        FirebaseFirestore.instance.collection('feed')
            .doc(currentUser.id)
            .collection('feedItems')
            .doc(widget.OrderId)
            .set({
          "type": "ServicePayment",
          "username": widget.username,
          "userId": widget.OwnerId,
          "userProfileImg": widget.profileimg,
          "postId": widget.OrderId,
          // "mediaUrl": mediaUrl,
          "timestamp": timestamp,
          "read": 'false',
          'message': 'Payment Successful on an Invoice!',
        });
        FirebaseFirestore.instance.collection('feed')
            .doc(widget.OwnerId)
            .collection('feedItems')
            .doc(widget.OrderId)
            .set({
          "type": "ServicePaymentI",
          "username": currentUser.displayName,
          "userId": widget.OwnerId,
          "userProfileImg": currentUser.photoUrl,
          "postId": widget.OrderId,
          // "mediaUrl": mediaUrl,
          "timestamp": timestamp,
          "read": 'false',
          'message': 'Payment Successful on an Invoice !',
        });


    }
    else  if(widget.finalpay == 'false')
    {

      FirebaseFirestore.instance.collection('serviceCustomer')
          .doc(currentUser.id)
          .collection('customerService')
          .doc(widget.OrderId)
          .update({
        'advancepay':'true',
        'finalpay':'true',
        "timestamp": timestamp,


      });
      FirebaseFirestore.instance.collection('serviceSeller')
          .doc(widget.OwnerId)
          .collection('sellerService')
          .doc(widget.OrderId)
          .update({
        'advancepay':'true',
        'finalpay':'true',
        'read':'false',
        "timestamp": timestamp,


      }); FirebaseFirestore.instance.collection('feed')
          .doc(currentUser.id)
          .collection('feedItems')
          .doc(widget.OrderId)
          .set({
        "type": "ServicePayment",
        "username": widget.username,
        "userId": widget.OwnerId,
        "userProfileImg": widget.profileimg,
        "postId": widget.OrderId,
        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'Payment Successful on an Invoice!',
      });FirebaseFirestore.instance.collection('feed')
          .doc(widget.OwnerId)
          .collection('feedItems')
          .doc(widget.OrderId)
          .set({
        "type": "ServicePaymentI",
        "username": currentUser.displayName,
        "userId": widget.OwnerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": widget.OrderId,

        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'Payment Successful on an Invoice !',
      });

    }




payment();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
    onSuccess();
    Get.offAll( Orders()) ;

    Fluttertoast.showToast(
        msg: "Payment SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIos: 4);
    Get.offAll( Orders()) ;
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
