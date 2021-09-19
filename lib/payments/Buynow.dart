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
  var usd;
  var inr;
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
  final String customIndex;
  final String userCustom;

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
     this.customIndex,
     this.userCustom,

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
     color1:color1,
     color2:color2,
     color3:color3,
     color4:color4,
     color5:color5,
     color6:color6,
     color7:color7,
     color8:color8,
     color9:color9,
     color10:color10,
     custom12:custom12,
     custom22:custom22,
     custom32:custom32,
     custom42:custom42,
     custom52:custom52,
     custom62:custom62,
     custom72:custom72,
      custom82:custom82,
     custom92:custom92,
     custom102:custom102,
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

    else if(widget.size=='MTO'){
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
    else if(widget.size=='(US) 3 ½'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='(US) 4'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='(US) 4 ½'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='(US) 5'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='(US) 5 ½'){
      Shoe5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='(US) 6'){
      Shoe6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='(US) 6 ½'){
      Shoe7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='(US) 7'){
      Shoe8--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='(US) 7 ½'){
      Shoe9--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='(US) 8'){
      Shoe10--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='(US) 8 ½'){
      Shoe11--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='(US) 9'){
      Shoe12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='(US) 9 ½'){
      Shoe13--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='(US) 10'){
      Shoe14--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe14':Shoe14,

      });
    }
    else if(widget.size=='(US) 10 ½'){
      Shoe15--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe15':Shoe15,

      });
    }
    else if(widget.size=='(US) 11'){
      Shoe16--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe16':Shoe16--,

      });
    }
    else if(widget.size=='(US) 11 ½'){
      Shoe17--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe17':Shoe17,

      });
    }
    else if(widget.size=='(US) 12'){
      Shoe18--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe18':Shoe18,

      });
    }
    else if(widget.size=='(US) 12 ½'){
      Shoe19--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe19':Shoe19,

      });
    }
    else if(widget.size=='(US) 13'){
      Shoe20--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe20':Shoe20,

      });
    }
    else if(widget.size=='(US) 13 ½'){
      Shoe21--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe21':Shoe21,

      });
    }
    else if(widget.size=='(R 4'){
      Ring1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring1':Ring1,

      });
    }
     else if(widget.size=='(R 4.5'){
      Ring2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring2':Ring2,

      });
    }
      else if(widget.size=='(R 5'){
      Ring3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring3':Ring3,

      });
    }
         else if(widget.size=='(R 5.5'){
      Ring4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring4': Ring4,

      });
    }
           else if(widget.size=='(R 6'){
       Ring5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring5':  Ring5,

      });
    }
           else if(widget.size=='(R 6.5'){
       Ring6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring6':  Ring6,

      });
    }
           else if(widget.size=='(R 7'){
      Ring7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring7': Ring7,

      });
    }
           else if(widget.size=='(R 7.5'){
      Ring8--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring8': Ring8,

      });
    }
           else if(widget.size=='(R 8'){
      Ring9--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring9': Ring9,

      });
    }
           else if(widget.size=='(R 8.5'){
      Ring10--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring10': Ring10,

      });
    }
           else if(widget.size=='(R 9'){
      Ring11--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring11': Ring11,

      });
    }
           else if(widget.size=='(R 9.5'){
      Ring12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring12': Ring12,

      });
    }
           else if(widget.size=='(R 10'){
      Ring13--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring13': Ring13,

      });
    }
           else if(widget.size=='(R 10.5'){
      Ring14--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring14': Ring14,

      });
    }
           else if(widget.size=='(R 11'){
      Ring15--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring15': Ring15,

      });
    }
           else if(widget.size=='(R 11.5'){
      Ring16--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring16': Ring16,

      });
    }
           else if(widget.size=='(R 12'){
     Ring17--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring17':Ring17,

      });
    }
           else if(widget.size=='(R 12.5'){
     Ring18--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring18':Ring18,

      });
    }
           else if(widget.size=='(R 13'){
     Ring19--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring19':Ring19,

      });
    }
           else if(widget.size=='(R 13.5'){
     Ring20--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring20':Ring20,

      });
    }
           else if(widget.size=='(R 14'){
     Ring21--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring21':Ring21,

      });
    }
           else if(widget.size=='(R 14.5'){
     Ring22--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring22':Ring22,

      });
    }
           else if(widget.size=='(R 15'){
     Ring23--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Ring23':Ring23,

      });
    }
 else if(widget.size=='(C 1'){
     custom12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom12':custom12,

      });
    }
 else if(widget.size=='(C 2'){
     custom22--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom22':custom22,

      });
    }
 else if(widget.size=='(C 3'){
     custom32--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom32':custom32,

      });
    }
    else if(widget.size=='(C 4'){
      custom42--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom42':custom42,

      });
    }
  else if(widget.size=='(C 4'){
      custom42--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom42':custom42,

      });
    }
  else if(widget.size=='(C 5'){
      custom52--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom52':custom52,

      });
    }
  else if(widget.size=='(C 6'){
      custom62--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom62':custom62,

      });
    }
  else if(widget.size=='(C 7'){
      custom72--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom72':custom72,

      });
    }
  else if(widget.size=='(C 8'){
      custom82--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom82':custom82,

      });
    }
  else if(widget.size=='(C 9'){
      custom92--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom92':custom92,

      });
    }
  else if(widget.size=='(C 10'){
      custom102--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'custom102':custom102,

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
    else if(widget.size=='5 ½'){
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
    else if(widget.size=='6 ½'){
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
    else if(widget.size=='7 ½'){
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
    else if(widget.size=='8 ½'){
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
    else if(widget.size=='9 ½'){
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
    else if(widget.size=='10 ½'){
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
    else if(widget.size=='15 ½'){
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

    else if(widget.size=='S 2 Y'){
      Shoe1--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='S 2 ½ Y'){
      Shoe2--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='S 3 Y'){
      Shoe3--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='S 3 ½ Y'){
      Shoe4--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='S 4 Y'){
      Shoe5--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='S 5 Y'){
      Shoe6--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='S 6 Y'){
      Shoe7--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='S 7 Y'){
      Shoe8--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='S 8 Y'){
      Shoe9--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='S 8 ½ Y'){
      Shoe10--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='S 9 Y'){
      Shoe11--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='S 10 Y'){
      Shoe12--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='S 11 Y'){
      Shoe13--;
      FirebaseFirestore.instance.collection('products')
          .doc(widget.ownerId)
          .collection('userProducts')
          .doc(widget.prodId)
          .update({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='S 12 Y'){
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
subtractColor(){
  if(widget.color=='col 1'){
    color1--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color1':color1,
    });
  }
else if(widget.color=='col 2'){
    color2--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color2':color2,
    });
  }
else if(widget.color=='col 3'){
    color3--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color3':color3,
    });
  }
else if(widget.color=='col 4'){
    color4--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color4':color4,
    });
  }
else if(widget.color=='col 5'){
    color5--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color5':color5,
    });
  }
else if(widget.color=='col 6'){
    color6--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color6':color6,
    });
  }
else if(widget.color=='col 7'){
    color7--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color7':color7,
    });
  }
else if(widget.color=='col 8'){
    color8--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color8':color8,
    });
  }
else if(widget.color=='col 9'){
    color9--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color9':color9,
    });
  }
else if(widget.color=='col 10'){
    color10--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'color10':color10,
    });
  }

}
subtractCustom(){
  if(widget.customIndex=='Custom 1'){
    custom12--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom12':custom12,
    });
  }
else if(widget.customIndex=='Custom 2'){
    custom22--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom22':custom22,
    });
  }
else if(widget.customIndex=='Custom 3'){
    custom32--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom32':custom32,
    });
  }
else if(widget.customIndex=='Custom 4'){
    custom42--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom42':custom42,
    });
  }
else if(widget.color=='Custom 5'){
    custom52--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom52':custom52,
    });
  }
else if(widget.customIndex=='Custom 6'){
    custom62--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom62':custom62,
    });
  }
else if(widget.customIndex=='Custom 7'){
    custom72--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom72':custom72,
    });
  }
else if(widget.customIndex=='Custom 8'){
    custom82--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom82':custom82,
    });
  }
else if(widget.customIndex=='Custom 9'){
    custom92--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom92':custom92,
    });
  }
else if(widget.customIndex=='Custom 10'){
    custom102--;
    FirebaseFirestore.instance.collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .doc(widget.prodId)
        .update({'custom102':custom102,
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
      'fulfilled':'false',
      'Accepted':'false',
      'orderStatus':'awaiting seller acceptance',

      "timestamp": timestamp,
 "productname": widget.productname,
 "shopmediaUrl": widget.mediaUrl,
   "mtoText": widget.mtoText??"",
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