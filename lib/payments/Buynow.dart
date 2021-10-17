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
  var eur;
  var usd;
  var inr;
  var gbp;

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
  final String customIndex;
  final String userCustom;
  var userVariationQuantity;
  var userSizeQuantity;
  var userColorQuantity;

  final String  userVariationImg ;
  BuyNow({this.buynowamount,
 this.colorText, this.mtoText,
    this.eur,
     this.customIndex,
     this.userCustom,

    this.usd,
    this.inr,
    this.gbp,
    this.userSizeQuantity,

  this.prodId,
  this.ownerId,
    this.productname,
  this.size,
    this.usersize,

  this.profileimg,this.username,this.mediaUrl, this.shipcost, this.custompriceusd, this.custompriceinr,
    this.shipcostusd, this.shipcostuser, this.customusd, this.custominr, this.price, this.customprice,
    this.country, this.color, this.userVariationImg,
    this.userVariationQuantity,
     this.userColorQuantity});

  @override
  _BuyNowState createState() => _BuyNowState(

    userSizeQuantity: userSizeQuantity,
   usersize: usersize,
     userColorQuantity:userColorQuantity,
    userVariationQuantity:userVariationQuantity,

  );
}

class _BuyNowState extends State<BuyNow> {
var userSizeQuantity;
  var userVariationQuantity;
  var userColorQuantity;

   String colorText;
   String mtoText;
  String orderId = Uuid().v4();

  String usersize;

  _BuyNowState({
    this.usersize,
    this.colorText, this.mtoText,
    this.userSizeQuantity,
    this.userColorQuantity,
    this.userVariationQuantity,


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
"sellerCountry": widget.country,
"variation":widget.userCustom,
      "mtoText": widget.mtoText??"",

      "size":widget.size,
      "color":widget.color,
      'fulfilled':'false',
      "timestamp": timestamp,
      "userCountry": currentUser.country,
      'prodId':widget.prodId,
      'productname':widget.productname,
    });
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
else if (currentUser.currency == 'EUR') {
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
else if (currentUser.currency == 'GBP') {
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

  subtractQuantity(){

    if(widget.size=='XXXS'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':userSizeQuantity,
      });
    }
    else if(widget.size=='XXS'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='XS'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='S'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='L'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'lQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='XL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='XXL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxlQuantity':userSizeQuantity,

      });
    }

    else if(widget.size=='XXXL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='4XL'){

      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'4xlQuantity':userSizeQuantity,

      });

    }
    else if(widget.size=='5XL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'5xlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='6XL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'6xlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='7XL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'7xlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='8XL'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'8xlQuantity':userSizeQuantity,

      });
    }

    else if(widget.size=='MTO'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mtoQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='Free Size'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'freesizeQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 3 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 4'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 4 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 5 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 6'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 6 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 7'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 7 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 8'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 8 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 9'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 9 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 10'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 10 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe15':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 11'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe16':userSizeQuantity--,

      });
    }
    else if(widget.size=='(US) 11 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe17':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 12'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe18':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 12 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe19':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 13'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe20':userSizeQuantity,

      });
    }
    else if(widget.size=='(US) 13 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe21':userSizeQuantity,

      });
    }
    else if(widget.size=='(R 4'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring1':userSizeQuantity,

      });
    }
     else if(widget.size=='(R 4.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring2':userSizeQuantity,

      });
    }
      else if(widget.size=='(R 5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring3':userSizeQuantity,

      });
    }
         else if(widget.size=='(R 5.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring4': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 6'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring5':  userSizeQuantity,

      });
    }
           else if(widget.size=='(R 6.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring6':  userSizeQuantity,

      });
    }
           else if(widget.size=='(R 7'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring7': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 7.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring8': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 8'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring9': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 8.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring10': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 9'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring11': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 9.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring12': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 10'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring13': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 10.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring14': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 11'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring15': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 11.5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring16': userSizeQuantity,

      });
    }
           else if(widget.size=='(R 12'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring17':userSizeQuantity,

      });
    }
           else if(widget.size=='(R 12.5'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring18':userSizeQuantity,

      });
    }
           else if(widget.size=='(R 13'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring19':userSizeQuantity,

      });
    }
           else if(widget.size=='(R 13.5'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring20':userSizeQuantity,

      });
    }
           else if(widget.size=='(R 14'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring21':userSizeQuantity,

      });
    }
           else if(widget.size=='(R 14.5'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring22':userSizeQuantity,

      });
    }
           else if(widget.size=='(R 15'){
     userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring23':userSizeQuantity,

      });
    }


//W
    else if(widget.size=='5'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':userSizeQuantity,

      });
    }
    else if(widget.size=='5 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':userSizeQuantity,

      });
    }
    else if(widget.size=='6'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':userSizeQuantity,

      });
    }
    else if(widget.size=='6 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':userSizeQuantity,

      });
    }
    else if(widget.size=='7'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':userSizeQuantity,

      });
    }
    else if(widget.size=='7 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':userSizeQuantity,

      });
    }
    else if(widget.size=='8'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':userSizeQuantity,

      });
    }
    else if(widget.size=='8 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':userSizeQuantity,

      });
    }
    else if(widget.size=='9'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':userSizeQuantity,

      });
    }
    else if(widget.size=='9 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':userSizeQuantity,

      });
    }
    else if(widget.size=='10'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':userSizeQuantity,

      });
    }
    else if(widget.size=='10 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':userSizeQuantity,

      });
    }
    else if(widget.size=='12'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':userSizeQuantity,

      });
    }
    else if(widget.size=='13'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':userSizeQuantity,

      });
    }
    else if(widget.size=='14'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe15':userSizeQuantity,

      });
    }
    else if(widget.size=='15 ½'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe16':userSizeQuantity,

      });
    }
//B
    if(widget.size=='0-3 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='3-6 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='6-9 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='9-12 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='12-18 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='18-24 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'lQuantity':userSizeQuantity,

      });
    }

    else if(widget.size=='S 0-3 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':userSizeQuantity,

      });
    }
    else if(widget.size=='S 3-6 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':userSizeQuantity,

      });
    }
    else if(widget.size=='6 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':userSizeQuantity,

      });
    }
    else if(widget.size=='9 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':userSizeQuantity,

      });
    }
    else if(widget.size=='S 9-12 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':userSizeQuantity,

      });
    }
    else if(widget.size=='S 12-18 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':userSizeQuantity,

      });
    }
    else if(widget.size=='S 18-24 M'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':userSizeQuantity,

      });
    }

    //K
    if(widget.size=='2 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='3-4 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='4-5 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='5-6 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='6-7 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'mQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='7-8 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'lQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='8-9 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='9-10 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='10-11 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxlQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='11-12 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'4xlQuantity':userSizeQuantity,

      });
    }

    else if(widget.size=='S 2 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':userSizeQuantity,

      });
    }
    else if(widget.size=='S 2 ½ Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':userSizeQuantity,

      });
    }
    else if(widget.size=='S 3 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':userSizeQuantity,

      });
    }
    else if(widget.size=='S 3 ½ Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':userSizeQuantity,

      });
    }
    else if(widget.size=='S 4 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':userSizeQuantity,

      });
    }
    else if(widget.size=='S 5 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':userSizeQuantity,

      });
    }
    else if(widget.size=='S 6 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':userSizeQuantity,

      });
    }
    else if(widget.size=='S 7 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':userSizeQuantity,

      });
    }
    else if(widget.size=='S 8 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':userSizeQuantity,

      });
    }
    else if(widget.size=='S 8 ½ Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':userSizeQuantity,

      });
    }
    else if(widget.size=='S 9 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':userSizeQuantity,

      });
    }
    else if(widget.size=='S 10 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':userSizeQuantity,

      });
    }
    else if(widget.size=='S 11 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':userSizeQuantity,

      });
    }
    else if(widget.size=='S 12 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':userSizeQuantity,

      });
    }
    //T
    if(widget.size=='13 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='14 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xxsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='15 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'xsQuantity':userSizeQuantity,

      });
    }
    else if(widget.size=='16 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'sQuantity':userSizeQuantity,

      });
    }

    else if(widget.size=='S 13 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':userSizeQuantity,

      });
    }
    else if(widget.size=='S 14 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':userSizeQuantity,

      });
    }
    else if(widget.size=='S 15 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':userSizeQuantity,

      });
    }
    else if(widget.size=='S 16 Y'){
      userSizeQuantity--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':userSizeQuantity,

      });
    }
  }
subtractColor(){
  if(widget.color=='col 1'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color1':userColorQuantity,
    });
  }
else if(widget.color=='col 2'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color2':userColorQuantity,
    });
  }
else if(widget.color=='col 3'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color3':userColorQuantity,
    });
  }
else if(widget.color=='col 4'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color4':userColorQuantity,
    });
  }
else if(widget.color=='col 5'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color5':userColorQuantity,
    });
  }
else if(widget.color=='col 6'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color6':userColorQuantity,
    });
  }
else if(widget.color=='col 7'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color7':userColorQuantity,
    });
  }
else if(widget.color=='col 8'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color8':userColorQuantity,
    });
  }
else if(widget.color=='col 9'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color9':userColorQuantity,
    });
  }
else if(widget.color=='col 10'){
    userColorQuantity--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color10':userColorQuantity,
    });
  }

}
subtractCustom(){
   if(widget.customIndex=='(Variation 1'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity1':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 2'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity2':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 3'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity3':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 4'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity4':userVariationQuantity,

  });
  }

  else if(widget.customIndex=='(Variation 5'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity5':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 6'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity6':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 7'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity7':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 8'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity8':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 9'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity9':userVariationQuantity,

  });
  }
  else if(widget.customIndex=='(Variation 10'){
  userVariationQuantity--;
  FirebaseFirestore.instance.collection('products')
      .doc(widget.ownerId)
      .collection('userProducts')
      .doc(widget.prodId)
      .update({'variationQuantity10':userVariationQuantity,

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
 String countryISO = adPrefs.getString('countryISO') ?? '';

    FirebaseFirestore.instance.collection('ordersSeller')
        .doc(widget.ownerId)
        .collection('sellerOrder')
        .doc(orderId)
        .set({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'size':widget.usersize,
      'orderId':orderId,
      'cusId':currentUser.id,
      'cusName':currentUser.displayName,
      'cusImg':currentUser.photoUrl,

      'fulfilled':'false',
      'Accepted':'false',
      'orderStatus':'awaiting seller acceptance',
      'eur':widget.eur,
      'usd':widget.usd,
      'inr':widget.inr,
      'gbp':widget.gbp,

      "timestamp": timestamp,
 "productname": widget.productname,
 "shopmediaUrl": widget.mediaUrl,
   "mtoText": widget.mtoText??"",
      "variation":widget.userCustom??"",
      "color": widget.color??"",
"shipmentCreated":false,
      'courierId': "awaiting seller fulfilment",
      'courier': "awaiting seller fulfilment",
      'read':'false',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',


    });
    FirebaseFirestore.instance.collection('ordersCustomer')
        .doc(currentUser.id)
        .collection('userOrder')
        .doc(orderId)
        .set({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'size':widget.usersize,
      'orderId':orderId,
      'cusId':currentUser.id,
      "mtoText": widget.mtoText??"",
      "color": widget.color??"",
      'eur':widget.eur,
      'usd':widget.usd,
      'inr':widget.inr,
      'gbp':widget.gbp,

      "TrackingNo":"",
    "invoice":"",
      "timestamp": timestamp,
      "productname": widget.productname,
      "shopmediaUrl": widget.mediaUrl,
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
    subtractColor();
    subtractCustom();
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