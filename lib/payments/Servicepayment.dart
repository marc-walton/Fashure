import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
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
    if (currentUser.country == 'India') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}00",
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
    else if (currentUser.country == 'USA') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}00",
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
    else if (currentUser.country == 'Europe') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}00",
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
    else if (currentUser.country == 'UK') {
      var options = {
        'key': key,
        'amount':"${widget.Amount}00",
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
    else if (currentUser.country == 'China') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}00",
        'name': currentUser.id,
        'description': 'Payment',
        'currency': 'CNY',

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
        'amount': "${widget.Amount}00",
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
    Firestore.instance.collection('Payments')
        .document(widget.OwnerId)
        .collection('ServicePayments')
        .document(widget.OrderId)
        .setData({
      'ownerId':widget.OwnerId,
      'orderId':widget.OrderId,
      "timestamp": timestamp,
      "userCountry": currentUser.id,
      'eur':widget.eur,
      'usd':widget.usd,
      'inr':widget.inr,
      'gbp':widget.gbp,
      'Feur':widget.Feur,
      'Fusd':widget.Fusd,
      'Finr':widget.Finr,
      'Fgbp':widget.Fgbp,

      'fulfilled':'false',
    });
  }
  onSuccess(){

    if(widget.advancepay == 'false'||widget.finalpay == 'false')
    {

        Firestore.instance.collection('serviceCustomer')
            .document(widget.cusId)
            .collection('customerService')
            .document(widget.OrderId)
            .updateData({
          'advancepay': 'true',
          'finalpay': 'false',

        });
        Firestore.instance.collection('serviceSeller')
            .document(widget.OwnerId)
            .collection('sellerService')
            .document(widget.OrderId)
            .updateData({
          'advancepay': 'true',
          'finalpay': 'false',
          'read': 'false',

        });
        Firestore.instance.collection('feed')
            .document(currentUser.id)
            .collection('feedItems')
            .document(widget.OrderId)
            .setData({
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
        Firestore.instance.collection('feed')
            .document(widget.OwnerId)
            .collection('feedItems')
            .document(widget.OrderId)
            .setData({
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
  else  if(widget.Finr == "")
    {

        Firestore.instance.collection('serviceCustomer')
            .document(widget.OwnerId)
            .collection('customerService')
            .document(widget.OrderId)
            .updateData({
          'advancepay':'true',
          'finalpay':'true',
          "timestamp": timestamp,

        });
        Firestore.instance.collection('serviceSeller')
            .document(widget.OwnerId)
            .collection('sellerService')
            .document(widget.OrderId)
            .updateData({
          'advancepay':'true',
          'finalpay':'true',
          'read':'false',
          "timestamp": timestamp,


        }); Firestore.instance.collection('feed')
            .document(currentUser.id)
            .collection('feedItems')
            .document(widget.OrderId)
            .setData({
          "type": "ServicePayment",
          "username": widget.username,
          "userId": widget.OwnerId,
          "userProfileImg": widget.profileimg,
          "postId": widget.OrderId,
          // "mediaUrl": mediaUrl,
          "timestamp": timestamp,
          "read": 'false',
          'message':'Payment Successful on an Invoice!',
        });Firestore.instance.collection('feed')
            .document(widget.OwnerId)
            .collection('feedItems')
            .document(widget.OrderId)
            .setData({
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
  else  if(widget.advancepay == 'true'||widget.finalpay == 'false')
    {

        Firestore.instance.collection('serviceCustomer')
            .document(widget.OwnerId)
            .collection('customerService')
            .document(widget.OrderId)
            .updateData({
          'advancepay':'true',
          'finalpay':'true',
          "timestamp": timestamp,


        });
        Firestore.instance.collection('serviceSeller')
            .document(widget.OwnerId)
            .collection('sellerService')
            .document(widget.OrderId)
            .updateData({
          'advancepay':'true',
          'finalpay':'true',
          'read':'false',
          "timestamp": timestamp,


        }); Firestore.instance.collection('feed')
            .document(currentUser.id)
            .collection('feedItems')
            .document(widget.OrderId)
            .setData({
          "type": "ServicePayment",
          "username": widget.username,
          "userId": widget.OwnerId,
          "userProfileImg": widget.profileimg,
          "postId": widget.OrderId,
          // "mediaUrl": mediaUrl,
          "timestamp": timestamp,
          "read": 'false',
          'message':'Payment Successful on an Invoice!',
        });Firestore.instance.collection('feed')
            .document(widget.OwnerId)
            .collection('feedItems')
            .document(widget.OrderId)
            .setData({
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
    return  WillPopScope(
        onWillPop:()=>     Get.offAll( Orders()) ,

    child:openCheckout());
  }
}
