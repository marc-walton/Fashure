import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:fashow/Product_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BuyNow extends StatefulWidget {
  final String buynowamount;
  final String prodId;
  final String ownerId;
  final String size;
  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;
  final String eur;
  final String usd;
  final String inr;
  final String gbp;
  final int xxxs;
  final int xxs;
  final int xs;
  final int s;
  final int m;
  final int l;
  final int xl;
  final int xxl;
  final int xxxl;
  final int fourxl;
  final int fivexl;
  final int sixxl;
  final int sevenxl;
  final int eightxl;
  final int Shoe1;
  final int Shoe2;
  final int Shoe3;
  final int Shoe4;
  final int Shoe5;
  final int Shoe6;
  final int Shoe7;
  final int Shoe8;
  final int Shoe9;
  final int Shoe10;
  final int Shoe11;
  final int Shoe12;
  final int Shoe13;
  final int Shoe14;
  final int Shoe15;
  final int Shoe16;
  final int Shoe17;
  final int Shoe18;
  final int Shoe19;
  final int Shoe20;
  final int Shoe21;
  final int mto;
  final int freeSize;
  final int Ring1;
  final int Ring2;
  final int Ring3;
  final int Ring4;
  final int Ring5;
  final int Ring6;
  final int Ring7;
  final int Ring8;
  final int Ring9;
  final int Ring10;
  final int Ring11;
  final int Ring12;
  final int Ring13;
  final int Ring14;
  final int Ring15;
  final int Ring16;
  final int Ring17;
  final int Ring18;
  final int Ring19;
  final int Ring20;
  final int  Ring21;
  final int  Ring22;
  final int  Ring23;
  final int custom12;
  final int custom22;
  final int custom32;
  final int custom42;
  final int custom52;
  final int custom62;
  final int custom72;
  final int  custom82;
  final int custom92;
  final int custom102;
  final int color1;
  final int color2;
  final int color3;
  final int color4;
  final int color5;
  final int color6;
  final int color7;
  final int color8;
  final int color9;
  final int color10;
  final String colorText;
  final String mtoText;
  final String shipcost;
  final String custompriceusd;
  final String custompriceinr;
  final String shipcostusd;
  final String shipcostuser;
  final String customusd;
  final String custominr;
  final String price;
  final String customprice;
  final String country;
  final String color;
  final String usersize;

  BuyNow({this.buynowamount,
    this.Ring1, this.Ring2, this.Ring3, this.Ring4, this.Ring5, this.Ring6,
    this.Ring7, this.Ring8, this.Ring9, this.Ring10, this.Ring11, this.Ring12,
    this.Ring13, this.Ring14, this.Ring15, this.Ring16, this.Ring17, this.Ring18,
    this.Ring19, this.Ring20, this.Ring21, this.Ring22, this.Ring23,
    this.custom12, this.custom22, this.custom32, this.custom42, this.custom52,
    this.custom62, this.custom72, this.custom82, this.custom92, this.custom102,
    this.color1, this.color2, this.color3, this.color4, this.color5, this.color6,
    this.color7, this.color8, this.color9, this.color10, this.colorText, this.mtoText,
    this.eur,
    this.usd,
    this.inr,
    this.gbp,
    this.freeSize,
    this.mto,
    this.xxxs,
    this.xxs,
    this.xs,
    this.s,
    this.m,
    this.l,
    this.xl,
    this.xxl,
    this.xxxl,
    this.fourxl,
    this.fivexl,
    this.sixxl,
    this.sevenxl,
    this.eightxl,
    this.Shoe1,
    this.Shoe2,
    this.Shoe3,
    this.Shoe4,
    this.Shoe5,
    this.Shoe6,
    this.Shoe7,
    this.Shoe8,
    this.Shoe9,
    this.Shoe10,
    this.Shoe11,
    this.Shoe12,
    this.Shoe13,
    this.Shoe14,
    this.Shoe15,
    this.Shoe16,
    this.Shoe17,
    this.Shoe18,
    this.Shoe19,
    this.Shoe20,
    this. Shoe21,
    this.prodId,
    this.ownerId,
    this.productname,
    this.size,
    this.usersize,

    this.profileimg,this.username,this.mediaUrl, this.shipcost, this.custompriceusd, this.custompriceinr, this.shipcostusd, this.shipcostuser, this.customusd, this.custominr, this.price, this.customprice, this.country, this.color});

  @override
  _BuyNowState createState() => _BuyNowState(   xxxs: xxxs,
    xxs: xxs,
    xs: xs,
    s: s,
    m: m,
    l: l,
    xl: xl,
    xxl: xxl,
    xxxl: xxxl,
    fourxl: fourxl,
    fivexl: fivexl,
    sixxl: sevenxl,
    eightxl: eightxl,
    Shoe1: Shoe1,
    Shoe2: Shoe2,
    Shoe3: Shoe3,
    Shoe4: Shoe4,
    Shoe5: Shoe5,
    Shoe6: Shoe6,
    Shoe7: Shoe7,
    Shoe8: Shoe8,
    Shoe9: Shoe9,
    Shoe10: Shoe10,
    Shoe11: Shoe11,
    Shoe12: Shoe12,
    Shoe13: Shoe13,
    Shoe14: Shoe14,
    Shoe15: Shoe15,
    Shoe16: Shoe16,
    Shoe17: Shoe17,
    Shoe18: Shoe18,
    Shoe19: Shoe19,
    Shoe20: Shoe20,
    Shoe21: Shoe21,
    mto: mto,
    freeSize: freeSize,
    usersize: usersize,

  );
}

class _BuyNowState extends State<BuyNow> {

  int Ring1;
  int Ring2;
  int Ring3;
  int Ring4;
  int Ring5;
  int Ring6;
  int Ring7;
  int Ring8;
  int Ring9;
  int Ring10;
  int Ring11;
  int Ring12;
  int Ring13;
  int Ring14;
  int Ring15;
  int Ring16;
  int Ring17;
  int Ring18;
  int Ring19;
  int Ring20;
  int  Ring21;
  int  Ring22;
  int  Ring23;
  int custom12;
  int custom22;
  int custom32;
  int custom42;
  int custom52;
  int custom62;
  int custom72;
  int  custom82;
  int custom92;
  int custom102;
  int color1;
  int color2;
  int color3;
  int color4;
  int color5;
  int color6;
  int color7;
  int color8;
  int color9;
  int color10;
  String colorText;
  String mtoText;
  String orderId = Uuid().v4();
  int xxxs;
  int xxs;
  int xs;
  int s;
  int m;
  int l;
  int xl;
  int xxl;
  int xxxl;
  int fourxl;
  int fivexl;
  int sixxl;
  int sevenxl;
  int eightxl;
  int Shoe1;
  int Shoe2;
  int Shoe3;
  int Shoe4;
  int Shoe5;
  int Shoe6;
  int Shoe7;
  int Shoe8;
  int Shoe9;
  int Shoe10;
  int Shoe11;
  int Shoe12;
  int Shoe13;
  int Shoe14;
  int Shoe15;
  int Shoe16;
  int Shoe17;
  int Shoe18;
  int Shoe19;
  int Shoe20;
  int Shoe21;
  int mto;
  int freeSize;
  String usersize;

  _BuyNowState({
    this.usersize,
    this.Ring1, this.Ring2, this.Ring3, this.Ring4, this.Ring5, this.Ring6,
    this.Ring7, this.Ring8, this.Ring9, this.Ring10, this.Ring11, this.Ring12,
    this.Ring13, this.Ring14, this.Ring15, this.Ring16, this.Ring17, this.Ring18,
    this.Ring19, this.Ring20, this.Ring21, this.Ring22, this.Ring23,
    this.custom12, this.custom22, this.custom32, this.custom42, this.custom52,
    this.custom62, this.custom72, this.custom82, this.custom92, this.custom102,
    this.color1, this.color2, this.color3, this.color4, this.color5, this.color6,
    this.color7, this.color8, this.color9, this.color10, this.colorText, this.mtoText,
    this.freeSize,
    this.mto,
    this.xxxs,
    this.xxs,
    this.xs,
    this.s,
    this.m,
    this.l,
    this.xl,
    this.xxl,
    this.xxxl,
    this.fourxl,
    this.fivexl,
    this.sixxl,
    this.sevenxl,
    this.eightxl,
    this.Shoe1,
    this.Shoe2,
    this.Shoe3,
    this.Shoe4,
    this.Shoe5,
    this.Shoe6,
    this.Shoe7,
    this.Shoe8,
    this.Shoe9,
    this.Shoe10,
    this.Shoe11,
    this.Shoe12,
    this.Shoe13,
    this.Shoe14,
    this.Shoe15,
    this.Shoe16,
    this.Shoe17,
    this.Shoe18,
    this.Shoe19,
    this.Shoe20,
    this.Shoe21,

  });

  SharedPreferences adPrefs;
  String key = 'rzp_test_Ut90sdJd5tSty5';

  Razorpay _razorpay;


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
  payment(){
    FirebaseFirestore.instance.collection('Payments')
        .doc(widget.ownerId)
        .collection('AuctionPayments')
        .doc(orderId)
        .set({
      'ownerId':widget.ownerId,
      'orderId':orderId,
 "Text":mtoText??"",
      'fulfilled':'false',
      "timestamp": timestamp,
      "userCountry": currentUser.country,
      'postId':widget.prodId,
      'description':widget.productname,
    });
  }
  openCheckout()  {
    if (currentUser.country == 'India') {
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

    else{
      var options = {
        'key': key,
        'amount':"${widget.buynowamount}",
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

  onSuccess()async{
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

    FirebaseFirestore.instance.collection('ordersAuctionS')
        .doc(widget.ownerId)
        .collection('auctionSOrder')
        .doc(orderId)
        .set({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'orderId':orderId,
      'cusId':currentUser.id,
      'fulfilled':'false',
      'Accepted':'false',
      'orderStatus':'awaiting seller acceptance',

      "timestamp": timestamp,
      "description": widget.productname,
      "mediaUrl": widget.mediaUrl,
      "Text": widget.mtoText??"",

      'courierId': "awaiting seller fulfilment",
      'courier': "awaiting seller fulfilment",
      'read':'false',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    });
    FirebaseFirestore.instance.collection('ordersCustomer')
        .doc(widget.ownerId)
        .collection('userOrder')
        .doc(orderId)
        .set({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'orderId':orderId,
      'cusId':currentUser.id,
      "Text": widget.mtoText??"",

      "timestamp": timestamp,
      "description": widget.productname,
      "mediaUrl": widget.mediaUrl,
      'courierId': "awaiting seller fulfillment",
      'courier': "awaiting seller fulfillment",

      'fulfilled':'false',
      'Accepted':'false',
      'orderStatus':'awaiting seller acceptance',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    }); FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "PaymentA",
      "username": widget.username,
      "userId": widget.ownerId,
      "userProfileImg": widget.profileimg,
      "mediaUrl":widget.mediaUrl,
      "postId": widget.prodId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'Your order has been placed!',
    });FirebaseFirestore.instance.collection('feed')
        .doc(widget.ownerId)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "PaymentOA",
      "username": currentUser.displayName,
      "userId": widget.ownerId,
      "userProfileImg": currentUser.photoUrl,
      "mediaUrl":widget.mediaUrl,
      "timestamp": timestamp,
      "postId": widget.prodId,

      "read": 'false',
      'message':'You received an order!',
    });
    payment();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onSuccess();

    Get.offAll( ActivityFeed());
    Fluttertoast.showToast(
        msg: "Payment SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.offAll( ProductScreen(
      prodId: widget.prodId,
      userId: widget.ownerId,
    ),) ;

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