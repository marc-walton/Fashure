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
  BuyNow({this.buynowamount,
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
  this.profileimg,this.username,this.mediaUrl});

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
    freeSize: freeSize,);
}

class _BuyNowState extends State<BuyNow> {


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
  _BuyNowState({

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
        .collection('SellerPayments')
        .doc(orderId)
        .set({
      'ownerId':widget.ownerId,
      'orderId':orderId,
      'eur':widget.eur,
      'usd':widget.usd,
      'inr':widget.inr,
      'gbp':widget.gbp,


      'fulfilled':'false',
      "timestamp": timestamp,
      "userCountry": currentUser.country,
      'prodId':widget.prodId,
      'productname':widget.productname,
    });
  }
  openCheckout()  {
  if (currentUser.country == 'India') {
  var options = {
  'key': key,
  'amount': "${widget.buynowamount}00",
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
  'amount': "${widget.buynowamount}00",
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
  'amount': "${widget.buynowamount}00",
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
  'amount': "${widget.buynowamount}00",
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
  'amount':"${widget.buynowamount}00",
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
  subtractQuantity(){

    if(widget.size=='XXXS'){
      xxxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':xxxs,
      });
    }
    else if(widget.size=='XXS'){
       xxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='XS'){
       xs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':xs,

      });
    }
    else if(widget.size=='S'){
       s--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':s,

      });
    }
    else if(widget.size=='M'){
       m--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mQuantity':m,

      });
    }
    else if(widget.size=='L'){
       l--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'lQuantity':l,

      });
    }
    else if(widget.size=='XL'){
      xl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xlQuantity':xl,

      });
    }
    else if(widget.size=='XXL'){
      xxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxlQuantity':xxl,

      });
    }
    else if(widget.size=='XXXL'){
      xxxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxlQuantity':xxxl,

      });
    }
    else if(widget.size=='4XL'){

      fourxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'4xlQuantity':fourxl,

      });

    }
    else if(widget.size=='5XL'){
      fivexl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'5xlQuantity':fivexl,

      });
    }
    else if(widget.size=='6XL'){
      sixxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'6xlQuantity':sixxl,

      });
    }
    else if(widget.size=='7XL'){
      sevenxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'7xlQuantity':sevenxl,

      });
    }
    else if(widget.size=='8XL'){
      eightxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'8xlQuantity':eightxl,

      });
    }
    else  if(widget.size=='MTO XXXS'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XXS'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XS'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO S'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO L'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XXL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XXXL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 4XL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 5XL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 6XL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 7XL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 8XL'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='Free Size'){
      freeSize--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'freesizeQuantity':freeSize,

      });
    }
    else if(widget.size=='(US)3-1/2'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='(US)4'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='(US)4-1/2'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='(US)5'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='(US)5-1/2'){
      Shoe5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='(US)6'){
      Shoe6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='(US)6-1/2'){
      Shoe7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='(US)7'){
      Shoe8--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='(US)7-1/2'){
      Shoe9--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='(US)8'){
      Shoe10--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='(US)8-1/2'){
      Shoe11--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='(US)9'){
      Shoe12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='(US)9-1/2'){
      Shoe13--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='(US)10'){
      Shoe14--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':Shoe14,

      });
    }
    else if(widget.size=='(US)10-1/2'){
      Shoe15--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe15':Shoe15,

      });
    }
    else if(widget.size=='(US)11'){
      Shoe16--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe16':Shoe16--,

      });
    }
    else if(widget.size=='(US)11-1/2'){
      Shoe17--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe17':Shoe17,

      });
    }
    else if(widget.size=='(US)12'){
      Shoe18--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe18':Shoe18,

      });
    }
    else if(widget.size=='(US)12-1/2'){
      Shoe19--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe19':Shoe19,

      });
    }
    else if(widget.size=='(US)13'){
      Shoe20--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe20':Shoe20,

      });
    }
    else if(widget.size=='(US)13-1/2'){
      Shoe21--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe21':Shoe21,

      });
    }
//W
    else if(widget.size=='5'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='5-1/2'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='6'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='6-1/2'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='7'){
      Shoe5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='7-1/2'){
      Shoe6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='8'){
      Shoe7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='8-1/2'){
      Shoe8--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='9'){
      Shoe9--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='9-1/2'){
      Shoe10--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='10'){
      Shoe11--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='10-1/2'){
      Shoe12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='12'){
      Shoe13--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='13'){
      Shoe14--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':Shoe14,

      });
    }
    else if(widget.size=='14'){
      Shoe15--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe15':Shoe15,

      });
    }
    else if(widget.size=='15-1/2'){
      Shoe16--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe16':Shoe16,

      });
    }
//B
    if(widget.size=='0-3 M'){
      xxxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':xxxs,

      });
    }
    else if(widget.size=='3-6 M'){
      xxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='6-9 M'){
      xs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':xs,

      });
    }
    else if(widget.size=='9-12 M'){
      s--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':s,

      });
    }
    else if(widget.size=='12-18 M'){
      m--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mQuantity':m,

      });
    }
    else if(widget.size=='18-24 M'){
      l--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'lQuantity':l,

      });
    }
    else if(widget.size=='MTO 0-3 M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 3-6 M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 6-9 M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 9-12 M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 12-18 M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 18-24 M'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='S 0-3 M'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='S 3-6 M'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='6 M'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='9 M'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='S 9-12 M'){
      Shoe5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='S 12-18 M'){
      Shoe6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='S 18-24 M'){
      Shoe7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':Shoe7,

      });
    }

    //K
    if(widget.size=='2 Y'){
      xxxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':xxxs,

      });
    }
    else if(widget.size=='3-4 Y'){
      xxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='4-5 Y'){
      xs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':xs,

      });
    }
    else if(widget.size=='5-6 Y'){
      s--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':s,

      });
    }
    else if(widget.size=='6-7 Y'){
      m--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mQuantity':m,

      });
    }
    else if(widget.size=='7-8 Y'){
      l--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'lQuantity':l,

      });
    }
    else if(widget.size=='8-9 Y'){
      xl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xlQuantity':xl,

      });
    }
    else if(widget.size=='9-10 Y'){
      xxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxlQuantity':xxl,

      });
    }
    else if(widget.size=='10-11 Y'){
      xxxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxlQuantity':xxxl,

      });
    }
    else if(widget.size=='11-12 Y'){
      fourxl--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'4xlQuantity':fourxl,

      });
    }
    else if(widget.size=='MTO 2 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 3-4 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 4-5 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 5-6 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 6-7 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 7-8 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 8-9 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 9-10 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 10-11 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 11-12 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='2 Y'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='2-1/2 Y'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='3 Y'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='3-1/2 Y'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='4 Y'){
      Shoe5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='5 Y'){
      Shoe6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='6 Y'){
      Shoe7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='7 Y'){
      Shoe8--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='8 Y'){
      Shoe9--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='8-1/2 Y'){
      Shoe10--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='9 Y'){
      Shoe11--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='10 Y'){
      Shoe12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='11 Y'){
      Shoe13--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='12 Y'){
      Shoe14--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':Shoe14,

      });
    }
    //T
    if(widget.size=='13 Y'){
      xxxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':xxxs,

      });
    }
    else if(widget.size=='14 Y'){
      xxs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='15 Y'){
      xs--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':xs,

      });
    }
    else if(widget.size=='16 Y'){
      s--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':s,

      });
    }
    else if(widget.size=='MTO 13 Y'){
       mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 14 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 15 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 16 Y'){
      mto--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='S 13 Y'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='S 14 Y'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='S 15 Y'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='S 16 Y'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
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

    FirebaseFirestore.instance.collection('ordersSeller')
        .doc(widget.ownerId)
        .collection('sellerOrder')
        .doc(orderId)
        .set({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'size':widget.size,
      'orderId':orderId,
      'cusId':currentUser.id,
      'fulfilled':'false',
      "timestamp": timestamp,
 "productname": widget.productname,
 "shopmediaUrl": widget.mediaUrl,
      'courierId': "awaiting seller fulfilment",
      'courier': "awaiting seller fulfilment",
      'orderStatus':'Processing',
      'read':'false',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    });
    FirebaseFirestore.instance.collection('ordersCustomer')
        .doc(currentUser.id)
        .collection('userOrder')
        .doc(orderId)
        .set({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'size':widget.size,
      'orderId':orderId,
      'cusId':currentUser.id,

      "timestamp": timestamp,
      "productname": widget.productname,
      "shopmediaUrl": widget.mediaUrl,
      'courierId': "awaiting seller fulfillment",
      'courier': "awaiting seller fulfillment",

      'fulfilled':'false',
      'orderStatus':'Processing',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    }); FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "Payment",
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
      "type": "PaymentO",
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
    subtractQuantity();
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