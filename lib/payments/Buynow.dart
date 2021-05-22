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

  BuyNow({this.buynowamount,
    this.eur,
    this.usd,
    this.inr,
    this.gbp,
  this.prodId,
  this.ownerId,
    this.productname,
  this.size,
  this.profileimg,this.username,this.mediaUrl});

  @override
  _BuyNowState createState() => _BuyNowState();
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
  size();
  }

  @override
  void dispose() {
  super.dispose();
  _razorpay.clear();
  size();
  }
  payment(){
    StreamBuilder(
      stream: productsRef
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
      // .orderBy('timestamp', descending: true)
          .snapshots(),
      builder:  (context, snapshot){
        Firestore.instance.collection('Payments')
            .document(widget.ownerId)
            .collection('SellerPayments')
            .document(orderId)
            .setData({
          'ownerId':widget.ownerId,
          'orderId':orderId,
          'eur':widget.eur,
          'usd':widget.usd,
          'inr':widget.inr,
          'gbp':widget.gbp,


          'fulfilled':'false',
          "timestamp": timestamp,
          "userCountry": currentUser.id,
          'prodId':widget.prodId,
          'productname':snapshot.data.documents['productname'],
        });
return Container();
      },

    );

  }
  size(){  Firestore.instance.collectionGroup('userProducts')
    .where("prodId",isEqualTo:"${widget.prodId}")
    .snapshots().listen((snapshot){snapshot.documents.forEach((doc){

  setState(() {
    xxxs = doc.data['xxxsQuantity'];
    xxs = doc.data['xxsQuantity'];
    xs = doc.data['xsQuantity'];
    s = doc.data['sQuantity'];
    m = doc.data['mQuantity'];
    l = doc.data['lQuantity'];
    xl = doc.data['xlQuantity'];
    xxl = doc.data['xxlQuantity'];
    xxxl = doc.data['xxxlQuantity'];
    fourxl = doc.data['fourxlQuantity'];
    fivexl = doc.data['fivexlQuantity'];
    sixxl = doc.data['sixxlQuantity'];
    sevenxl = doc.data['sevenxlQuantity'];
    eightxl = doc.data['eightxlQuantity'];
    Shoe1 = doc.data['Shoe1'];
    Shoe2 = doc.data['Shoe2'];
    Shoe3 = doc.data['Shoe3'];
    Shoe4 = doc.data['Shoe4'];
    Shoe5 = doc.data['Shoe5'];
    Shoe6 = doc.data['Shoe6'];
    Shoe7 = doc.data['Shoe7'];
    Shoe8 = doc.data['Shoe8'];
    Shoe9 = doc.data['Shoe9'];
    Shoe10 = doc.data['Shoe10'];
    Shoe11 = doc.data['Shoe11'];
    Shoe12 = doc.data['Shoe12'];
    Shoe13 = doc.data['Shoe13'];
    Shoe14 = doc.data['Shoe14'];
    Shoe15 = doc.data['Shoe15'];
    Shoe16 = doc.data['Shoe16'];
    Shoe17 = doc.data['Shoe17'];
    Shoe18 = doc.data['Shoe18'];
    Shoe19 = doc.data['Shoe19'];
    Shoe20 = doc.data['Shoe20'];
    Shoe21 = doc.data['Shoe21'];
    mto = doc.data['mtoQuantity'];
    freeSize = doc.data['freesizeQuantity'];
    print(freeSize);
    print(xxxs);

  });});

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
  else if (currentUser.country == 'China') {
  var options = {
  'key': key,
  'amount': "${widget.buynowamount}00",
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
  subtractQuantity()async{

    if(widget.size=='XXXS'){
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxxsQuantity':xxxs,
      });
    }
    else if(widget.size=='XXS'){
       xxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='XS'){
       xs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xsQuantity':xs,

      });
    }
    else if(widget.size=='S'){
       s--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'sQuantity':s,

      });
    }
    else if(widget.size=='M'){
       m--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mQuantity':m,

      });
    }
    else if(widget.size=='L'){
       l--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'lQuantity':l,

      });
    }
    else if(widget.size=='XL'){
      xl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xlQuantity':xl,

      });
    }
    else if(widget.size=='XXL'){
      xxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxlQuantity':xxl,

      });
    }
    else if(widget.size=='XXXL'){
      xxxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxxlQuantity':xxxl,

      });
    }
    else if(widget.size=='4XL'){
      fourxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'fourxlQuantity':fourxl,

      });
    }
    else if(widget.size=='5XL'){
      fivexl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'fivexlQuantity':fivexl,

      });
    }
    else if(widget.size=='6XL'){
      sixxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'sixxlQuantity':sixxl,

      });
    }
    else if(widget.size=='7XL'){
      sevenxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'sevenxlQuantity':sevenxl,

      });
    }
    else if(widget.size=='8XL'){
      eightxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'eightxlQuantity':eightxl,

      });
    }
    else  if(widget.size=='MTO XXXS'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XXS'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XS'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO S'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO L'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XXL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO XXXL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 4XL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 5XL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 6XL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 7XL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='MTO 8XL'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='Free Size'){
      freeSize--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'freesizeQuantity':freeSize,

      });
    }
    else if(widget.size=='(US)3-1/2'){
      Shoe1--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='(US)4'){
      Shoe2--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='(US)4-1/2'){
      Shoe3--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='(US)5'){
      Shoe4--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='(US)5-1/2'){
      Shoe5--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='(US)6'){
      Shoe6--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='(US)6-1/2'){
      Shoe7--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='(US)7'){
      Shoe8--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='(US)7-1/2'){
      Shoe9--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='(US)8'){
      Shoe10--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='(US)8-1/2'){
      Shoe11--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='(US)9'){
      Shoe12--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='(US)9-1/2'){
      Shoe13--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='(US)10'){
      Shoe14--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe14':Shoe14,

      });
    }
    else if(widget.size=='(US)10-1/2'){
      Shoe15--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe15':Shoe15,

      });
    }
    else if(widget.size=='(US)11'){
      Shoe16--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe16':Shoe16--,

      });
    }
    else if(widget.size=='(US)11-1/2'){
      Shoe17--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe17':Shoe17,

      });
    }
    else if(widget.size=='(US)12'){
      Shoe18--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe18':Shoe18,

      });
    }
    else if(widget.size=='(US)12-1/2'){
      Shoe19--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe19':Shoe19,

      });
    }
    else if(widget.size=='(US)13'){
      Shoe20--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe20':Shoe20,

      });
    }
    else if(widget.size=='(US)13-1/2'){
      Shoe21--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe21':Shoe21,

      });
    }
//W
    else if(widget.size=='5'){
      Shoe1--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='5-1/2'){
      Shoe2--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='6'){
      Shoe3--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='6-1/2'){
      Shoe4--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='7'){
      Shoe5--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='7-1/2'){
      Shoe6--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='8'){
      Shoe7--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='8-1/2'){
      Shoe8--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='9'){
      Shoe9--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='9-1/2'){
      Shoe10--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='10'){
      Shoe11--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='10-1/2'){
      Shoe12--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='12'){
      Shoe13--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='13'){
      Shoe14--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe14':Shoe14,

      });
    }
    else if(widget.size=='14'){
      Shoe15--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe15':Shoe15,

      });
    }
    else if(widget.size=='15-1/2'){
      Shoe16--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe16':Shoe16,

      });
    }
//B
    if(widget.size=='0-3 M'){
      xxxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxxsQuantity':xxxs,

      });
    }
    else if(widget.size=='3-6 M'){
      xxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='6-9 M'){
      xs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xsQuantity':xs,

      });
    }
    else if(widget.size=='9-12 M'){
      s--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'sQuantity':s,

      });
    }
    else if(widget.size=='12-18 M'){
      m--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mQuantity':m,

      });
    }
    else if(widget.size=='18-24 M'){
      l--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'lQuantity':l,

      });
    }
    else if(widget.size=='MTO 0-3 M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 3-6 M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 6-9 M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 9-12 M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 12-18 M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 18-24 M'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,

      });
    }
    else if(widget.size=='S 0-3 M'){
      Shoe1--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='S 3-6 M'){
      Shoe2--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='6 M'){
      Shoe3--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='9 M'){
      Shoe4--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='S 9-12 M'){
      Shoe5--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='S 12-18 M'){
      Shoe6--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='S 18-24 M'){
      Shoe7--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe7':Shoe7,

      });
    }

    //K
    if(widget.size=='2 Y'){
      xxxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxxsQuantity':xxxs,

      });
    }
    else if(widget.size=='3-4 Y'){
      xxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='4-5 Y'){
      xs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xsQuantity':xs,

      });
    }
    else if(widget.size=='5-6 Y'){
      s--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'sQuantity':s,

      });
    }
    else if(widget.size=='6-7 Y'){
      m--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mQuantity':m,

      });
    }
    else if(widget.size=='7-8 Y'){
      l--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'lQuantity':l,

      });
    }
    else if(widget.size=='8-9 Y'){
      xl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xlQuantity':xl,

      });
    }
    else if(widget.size=='9-10 Y'){
      xxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxlQuantity':xxl,

      });
    }
    else if(widget.size=='10-11 Y'){
      xxxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxxlQuantity':xxxl,

      });
    }
    else if(widget.size=='11-12 Y'){
      fourxl--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'fourxlQuantity':fourxl,

      });
    }
    else if(widget.size=='MTO 2 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 3-4 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 4-5 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 5-6 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 6-7 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 7-8 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 8-9 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 9-10 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 10-11 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 11-12 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='2 Y'){
      Shoe1--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='2-1/2 Y'){
      Shoe2--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='3 Y'){
      Shoe3--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='3-1/2 Y'){
      Shoe4--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe4':Shoe4,

      });
    }
    else if(widget.size=='4 Y'){
      Shoe5--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe5':Shoe5,

      });
    }
    else if(widget.size=='5 Y'){
      Shoe6--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe6':Shoe6,

      });
    }
    else if(widget.size=='6 Y'){
      Shoe7--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe7':Shoe7,

      });
    }
    else if(widget.size=='7 Y'){
      Shoe8--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe8':Shoe8,

      });
    }
    else if(widget.size=='8 Y'){
      Shoe9--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe9':Shoe9,

      });
    }
    else if(widget.size=='8-1/2 Y'){
      Shoe10--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe10':Shoe10,

      });
    }
    else if(widget.size=='9 Y'){
      Shoe11--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe11':Shoe11,

      });
    }
    else if(widget.size=='10 Y'){
      Shoe12--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe12':Shoe12,

      });
    }
    else if(widget.size=='11 Y'){
      Shoe13--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe13':Shoe13,

      });
    }
    else if(widget.size=='12 Y'){
      Shoe14--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe14':Shoe14,

      });
    }
    //T
    if(widget.size=='13 Y'){
      xxxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxxsQuantity':xxxs,

      });
    }
    else if(widget.size=='14 Y'){
      xxs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xxsQuantity':xxs,

      });
    }
    else if(widget.size=='15 Y'){
      xs--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'xsQuantity':xs,

      });
    }
    else if(widget.size=='16 Y'){
      s--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'sQuantity':s,

      });
    }
    else if(widget.size=='MTO 13 Y'){
       mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 14 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 15 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='MTO 16 Y'){
      mto--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'mtoQuantity':mto,
      });
    }
    else if(widget.size=='S 13 Y'){
      Shoe1--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe1':Shoe1,

      });
    }
    else if(widget.size=='S 14 Y'){
      Shoe2--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe2':Shoe2,

      });
    }
    else if(widget.size=='S 15 Y'){
      Shoe3--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe3':Shoe3,

      });
    }
    else if(widget.size=='S 16 Y'){
      Shoe4--;
      Firestore.instance.collection('products')
          .document(widget.ownerId)
          .collection('userProducts')
          .document(widget.prodId)
          .updateData({'Shoe4':Shoe4,

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
    // StreamBuilder(
    //     stream: cartRef.document(currentUser.id)
    //         .collection('userCart')
    //         .orderBy('timestamp', descending:true)
    //         .snapshots(),
    //     // ignore: missing_return
    //     builder: (context, snapshot) {
    //
    //       prodId = snapshot.data['prodId'];
    //       ownerId = snapshot.data['ownerId'];
    //       widget.size = snapshot.data['userSize'];
    //     });
    Firestore.instance.collection('ordersSeller')
        .document(widget.ownerId)
        .collection('sellerOrder')
        .document(orderId)
        .setData({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'size':widget.size,
      'orderId':orderId,
      'fulfilled':'false',
      "timestamp": timestamp,

      'orderStatus':'Processing',
      'read':'false',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    });
    Firestore.instance.collection('ordersCustomer')
        .document(currentUser.id)
        .collection('userOrder')
        .document(orderId)
        .setData({'prodId':widget.prodId,
      'ownerId':widget.ownerId,
      'size':widget.size,
      'orderId':orderId,
      "timestamp": timestamp,

      'fulfilled':'false',
      'orderStatus':'Processing',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    }); Firestore.instance.collection('feed')
        .document(currentUser.id)
        .collection('feedItems')
        .document(orderId)
        .setData({
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
    });Firestore.instance.collection('feed')
        .document(widget.ownerId)
        .collection('feedItems')
        .document(orderId)
        .setData({
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
    subtractQuantity();

  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onSuccess();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ActivityFeed()));
  Fluttertoast.showToast(
  msg: "Payment SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.to( ProductScreen(
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
  return openCheckout();
  }

}