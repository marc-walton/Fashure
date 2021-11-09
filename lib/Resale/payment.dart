import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Resale/userCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Payment extends StatefulWidget {
  List<String> OwnerId ;
  String Amount ;
  List<String> resaleId ;
  List<String> profileimg ;
  List<String> username ;
  List<String> images ;
  List<String> title ;
  List<String>  country;
  List<String>  size;
  List  shipcost;
  List  color;

  List  usd;
  List  eur;
  List  gbp;
  List  inr;
  List<bool>  ship;
  Payment({
    this.OwnerId,
    this.Amount,
    this.resaleId,
    this.profileimg,
    this.username,
    this.images,
    this.title,
    this. country,
    this.size,
    this. shipcost,
    this. inr,
    this. eur,
    this. gbp,
    this. usd,
    this. ship,
    this. color,


  });
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay _razorpay;

String key = 'rzp_test_Ut90sdJd5tSty5';

String orderId = Uuid().v4();
List id = [1,2,3,4,5,6,7,8,9,10];
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
   update()  {
     for(var i=0;i < widget.OwnerId.length;i++) {

       FirebaseFirestore.instance.collection('Resale')
         .doc(widget.OwnerId[i].toString())
         .collection('userResale').doc(widget.resaleId[i].toString())
          .update({"sold": true});

           }
  }
  payment(){
    for(var i=0;i < widget.OwnerId.length;i++) {
      FirebaseFirestore.instance.collection('Payments')
          .doc(widget.OwnerId[i].toString())
          .collection('SellerPayments')
          .doc("$orderId${id[i].toString()}")
          .set({
        "resale": true,
        "total":0,
        'ownerId': widget.OwnerId[i].toString(),
        'orderId':"$orderId${id[i].toString()}",
        'eur': widget.eur[i],
        'usd': widget.usd[i],
        'inr': widget.inr[i],
        'gbp': widget.gbp[i],
        "sellerCountry": widget.country[i].toString(),
        "variation": "",
        "mtoText": "",
        'shipcostuser': widget.shipcost[i] ?? 0,
        'customprice': 0,
        "size": widget.size[i].toString(),
        "color": widget.color[i].toString(),
        'fulfilled': 'false',
        "timestamp": timestamp,
        "userCountry": currentUser.country,
        'prodId': widget.resaleId[i].toString(),
        'productname': widget.title[i].toString(),
      });
    }
  }
  openCheckout()  {
    if (currentUser.currency == 'INR') {
      var options = {
        'key': key,
        'amount': "${widget.Amount}",
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
        'amount': "${widget.Amount}",
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
        'amount':"${widget.Amount}",
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
  onSuccess()async {
    adPrefs = await SharedPreferences.getInstance();
    String Fullname = adPrefs.getString('fullname') ?? '';
    String Type = adPrefs.getString('type') ?? '';
    String Addresss = adPrefs.getString('address') ?? '';
    String City = adPrefs.getString('city') ?? '';
    String State = adPrefs.getString('state') ?? '';
    String Zip = adPrefs.getString('zip') ?? '';
    String Phone = adPrefs.getString('phone') ?? '';
    String Country = adPrefs.getString('country') ?? '';
    String Code = adPrefs.getString('code') ?? '';
    String countryISO = adPrefs.getString('countryISO') ?? '';
    for(var i=0;i < widget.OwnerId.length;i++) {
      FirebaseFirestore.instance.collection('ordersSeller')
          .doc(widget.OwnerId[i].toString())
          .collection('sellerOrder')
          .doc("$orderId${id[i].toString()}")
          .set({
        "resale":true,
        'prodId': widget.resaleId[i].toString(),
        'ownerId': widget.OwnerId[i].toString(),
        'size': widget.size[i].toString(),
        'orderId': "$orderId${id[i].toString()}",
        'cusId': currentUser.id,
        'cusName': currentUser.displayName,
        'cusImg': currentUser.photoUrl,

        'fulfilled': 'false',
        'Accepted': 'false',
        'orderStatus': 'awaiting seller acceptance',
        'eur': widget.eur[i],
        'usd': widget.usd[i],
        'inr': widget.inr[i],
        'gbp': widget.gbp[i],
        'shipcostuser': widget.shipcost[i] ?? 0,
        'customprice': "",
        "timestamp": timestamp,
        "productname": widget.title[i].toString(),
        "shopmediaUrl": widget.images[i].toString(),
        "mtoText":  "",
        "variation":"",
        "color": widget.color[i].toString() ?? "",
        "shipmentCreated": false,
        'courierId': "awaiting seller fulfilment",
        'courier': "awaiting seller fulfilment",
        'read': 'false',
        'Address': '$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
      });
      FirebaseFirestore.instance.collection('ordersCustomer')
          .doc(currentUser.id)
          .collection('userOrder')
          .doc("$orderId${id[i].toString()}")
          .set({
        "resale":true,
        'prodId': widget.resaleId[i].toString(),
        'ownerId': widget.OwnerId[i].toString(),
        'size': widget.size[i].toString(),
        'orderId': "$orderId${id[i].toString()}",
        'cusId': currentUser.id,
        'cusName': currentUser.displayName,
        'cusImg': currentUser.photoUrl,

        'fulfilled': 'false',
        'Accepted': 'false',
        'orderStatus': 'awaiting seller acceptance',
        'eur': widget.eur[i],
        'usd': widget.usd[i],
        'inr': widget.inr[i],
        'gbp': widget.gbp[i],
        'shipcostuser': widget.shipcost[i] ?? 0,
        'customprice': 0,
        "timestamp": timestamp,
        "productname": widget.title[i].toString(),
        "shopmediaUrl": widget.images[i].toString(),
        "mtoText":  "",
        "variation":"",
        "color": widget.color[i].toString() ?? "",
        "shipmentCreated": false,
        'courierId': "awaiting seller fulfilment",
        'courier': "awaiting seller fulfilment",
        'read': 'false',
        'Address': '$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',

        "TrackingNo": "",
        "invoice": "",



      });
      FirebaseFirestore.instance.collection('feed')
          .doc(currentUser.id)
          .collection('feedItems')
          .doc("$orderId${id[i].toString()}")
          .set({
        "type": "PaymentResale",
        "username": widget.username[i].toString(),
        "userId": widget.OwnerId[i].toString(),
        "userProfileImg": widget.profileimg[i].toString(),
        "mediaUrl": widget.images[i].toString(),
        "postId": widget.resaleId[i].toString(),
        "timestamp": timestamp,
        "read": 'false',
        'message': 'Your order has been placed!',
      });
      FirebaseFirestore.instance.collection('feed')
          .doc(widget.OwnerId[i].toString())
          .collection('feedItems')
          .doc("$orderId${id[i].toString()}")
          .set({
        "type": "PaymentResaleO",
        "username": currentUser.displayName,
        "userId": widget.OwnerId[i].toString(),
        "userProfileImg": currentUser.photoUrl,
        "mediaUrl": widget.images[i].toString(),
        "timestamp": timestamp,
        "postId": widget.resaleId[i].toString(),

        "read": 'false',
        'message': 'You received an order!',
      });
    }
    payment();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {

    onSuccess();
    update();
    Get.offAll( ActivityFeed());
    Fluttertoast.showToast(
        msg: "Payment SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.offAll(UserCart()) ;

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
    return openCheckout();
  }
}
