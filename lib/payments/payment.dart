import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Payment extends StatefulWidget {

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay _razorpay;
var total = 0;
String prodId;
String ownerId;
String size;
String key = 'rzp_test_Ut90sdJd5tSty5';

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
cart()async{
  if(currentUser.country=='Europe') {
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      setState(() {
        total += int.parse(doc.data['eur']);
      });
    });
    return total.toString();
  }
  else  if(currentUser.country=='India') {
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      setState(() {
        total += int.parse(doc.data['inr']);
      });
    });
    return total.toString();
  }
  else  if(currentUser.country=='UK') {
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      setState((){
          total += int.parse(doc.data['gbp']);

      });
    });
    return total.toString();
  }
  else if(currentUser.country=='China') {
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      setState(() {
        total += int.parse(doc.data['cny']);
      });
    });
    return total.toString();
  }
  else if(currentUser.country=='USA') {
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      setState(() {
        total += int.parse(doc.data['usd']);
      });
    });
    return total.toString();
  }
  else{
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {
      setState(() {
        total += int.parse(doc.data['usd']);
      });
    });
    return total.toString();
  }
}
payment()async{
  QuerySnapshot snapshot = await Firestore.instance.collection('cart')
      .document(currentUser.id)
      .collection('userCart')
      .orderBy('timestamp', descending: true)
      .getDocuments();
  snapshot.documents.forEach((doc) {
    Firestore.instance.collection('Payments')
        .document(doc.data['ownerId'],)
        .collection('SellerPayments')
        .document(orderId)
        .setData({
      'ownerId':doc.data['ownerId'],
      'orderId':orderId,
      'eur':doc.data['eur'],
      'usd':doc.data['usd'],
      'inr':doc.data['inr'],
      'cny':doc.data['cny'],
      'gbp':doc.data['gbp'],
      "timestamp": timestamp,
    "userCountry": currentUser.id,
      'fulfilled':'false',
      'prodId':doc.data['prodId'],
      'productname':doc.data['productname'],

    });


    });

  return
Container();
}
  openCheckout() async {
    if (currentUser.country == 'India') {
      var options = {
        'key': key,
        'amount': total,
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
        'amount': total,
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
        'amount': total,
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
        'amount': total,
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
        'amount': total,
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
        'amount': total,
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
  subtractQuantity() async {
    QuerySnapshot snapshot = await Firestore.instance.collection('cart')
        .document(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    snapshot.documents.forEach((doc) {

      prodId = doc.data['prodId'];
      ownerId = doc.data['ownerId'];
      StreamBuilder(
          stream: productsRef.document(prodId)
              .collection('userProducts')
              .orderBy('timestamp', descending:true)
              .snapshots(),
          // ignore: missing_return
          builder: (context, snapshot) {
setState(() {
  size = snapshot.data['userSize'];
  xxxs = snapshot.data['xxxsQuantity'];
  xxs = snapshot.data['xxsQuantity'];
  xs = snapshot.data['xsQuantity'];
  s = snapshot.data['sQuantity'];
  m = snapshot.data['mQuantity'];
  l = snapshot.data['lQuantity'];
  xl = snapshot.data['xlQuantity'];
  xxl = snapshot.data['xxlQuantity'];
  xxxl = snapshot.data['xxxlQuantity'];
  fourxl = snapshot.data['fourxlQuantity'];
  fivexl = snapshot.data['fivexlQuantity'];
  sixxl = snapshot.data['sixxlQuantity'];
  sevenxl = snapshot.data['sevenxlQuantity'];
  eightxl = snapshot.data['eightxlQuantity'];
  Shoe1 = snapshot.data['Shoe1'];
  Shoe2 = snapshot.data['Shoe2'];
  Shoe3 = snapshot.data['Shoe3'];
  Shoe4 = snapshot.data['Shoe4'];
  Shoe5 = snapshot.data['Shoe5'];
  Shoe6 = snapshot.data['Shoe6'];
  Shoe7 = snapshot.data['Shoe7'];
  Shoe8 = snapshot.data['Shoe8'];
  Shoe9 = snapshot.data['Shoe9'];
  Shoe10 = snapshot.data['Shoe10'];
  Shoe11 = snapshot.data['Shoe11'];
  Shoe12 = snapshot.data['Shoe12'];
  Shoe13 = snapshot.data['Shoe13'];
  Shoe14 = snapshot.data['Shoe14'];
  Shoe15 = snapshot.data['Shoe15'];
  Shoe16 = snapshot.data['Shoe16'];
  Shoe17 = snapshot.data['Shoe17'];
  Shoe18 = snapshot.data['Shoe18'];
  Shoe19 = snapshot.data['Shoe19'];
  Shoe20 = snapshot.data['Shoe20'];
  Shoe21 = snapshot.data['Shoe21'];
  mto = snapshot.data['mtoQuantity'];
  freeSize = snapshot.data['freesizeQuantity'];
});

          });
      if(size=='XXXS'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='XXS'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxsQuantity':xxs--,

        });
      }
      else if(size=='XS'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xsQuantity':xs--,

        });
      }
      else if(size=='S'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'sQuantity':s--,

        });
      }
      else if(size=='M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mQuantity':m--,

        });
      }
      else if(size=='L'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'lQuantity':l--,

        });
      }
      else if(size=='XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xlQuantity':xl--,

        });
      }
      else if(size=='XXL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxlQuantity':xxl--,

        });
      }
      else if(size=='XXXL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxxlQuantity':xxxl--,

        });
      }
      else if(size=='4XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'fourxlQuantity':fourxl--,

        });
      }
      else if(size=='5XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'fivexlQuantity':fivexl--,

        });
      }
      else if(size=='6XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'sixxlQuantity':sixxl--,

        });
      }
      else if(size=='7XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'sevenxlQuantity':sevenxl--,

        });
      }
      else if(size=='8XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'eightxlQuantity':eightxl--,

        });
      }
      else  if(size=='MTO XXXS'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XXS'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XS'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO S'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO L'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XXL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XXXL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 4XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 5XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 6XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 7XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 8XL'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='Free Size'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'freesizeQuantity':freeSize--,

        });
      }
      else if(size=='(US)3-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe1':Shoe1--,

        });
      }
      else if(size=='(US)4'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe2':Shoe2--,

        });
      }
      else if(size=='(US)4-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe3':Shoe3--,

        });
      }
      else if(size=='(US)5'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe4':Shoe4--,

        });
      }
      else if(size=='(US)5-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe5':Shoe5--,

        });
      }
      else if(size=='(US)6'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe6':Shoe6--,

        });
      }
      else if(size=='(US)6-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe7':Shoe7--,

        });
      }
      else if(size=='(US)7'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe8':Shoe8--,

        });
      }
      else if(size=='(US)7-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe9':Shoe9--,

        });
      }
      else if(size=='(US)8'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe10':Shoe10--,

        });
      }
      else if(size=='(US)8-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe11':Shoe11--,

        });
      }
      else if(size=='(US)9'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe12':Shoe12--,

        });
      }
      else if(size=='(US)9-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe13':Shoe13--,

        });
      }
      else if(size=='(US)10'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe14':Shoe14--,

        });
      }
      else if(size=='(US)10-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe15':Shoe15--,

        });
      }
      else if(size=='(US)11'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe16':Shoe16--,

        });
      }
      else if(size=='(US)11-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe17':Shoe17--,

        });
      }
      else if(size=='(US)12'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe18':Shoe18--,

        });
      }
      else if(size=='(US)12-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe19':Shoe19--,

        });
      }
      else if(size=='(US)13'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe20':Shoe2--,

        });
      }
      else if(size=='(US)13-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe21':Shoe2--,

        });
      }
//W
      else if(size=='5'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe1':Shoe1--,

        });
      }
      else if(size=='5-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe2':Shoe2--,

        });
      }
      else if(size=='6'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe3':Shoe3--,

        });
      }
      else if(size=='6-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe4':Shoe4--,

        });
      }
      else if(size=='7'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe5':Shoe5--,

        });
      }
      else if(size=='7-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe6':Shoe6--,

        });
      }
      else if(size=='8'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe7':Shoe7--,

        });
      }
      else if(size=='8-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe8':Shoe8--,

        });
      }
      else if(size=='9'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe9':Shoe9--,

        });
      }
      else if(size=='9-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe10':Shoe10--,

        });
      }
      else if(size=='10'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe11':Shoe11--,

        });
      }
      else if(size=='10-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe12':Shoe12--,

        });
      }
      else if(size=='12'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe13':Shoe13--,

        });
      }
      else if(size=='13'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe14':Shoe14--,

        });
      }
      else if(size=='14'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe15':Shoe15--,

        });
      }
      else if(size=='15-1/2'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe16':Shoe16--,

        });
      }
//B
      if(size=='0-3 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='3-6 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxsQuantity':xxs--,

        });
      }
      else if(size=='6-9 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xsQuantity':xs--,

        });
      }
      else if(size=='9-12 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'sQuantity':s--,

        });
      }
      else if(size=='12-18 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mQuantity':m--,

        });
      }
      else if(size=='18-24 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'lQuantity':l--,

        });
      }
      else if(size=='MTO 0-3 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 3-6 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 6-9 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 9-12 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 12-18 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 18-24 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,

        });
      }
      else if(size=='S 0-3 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe1':Shoe1--,

        });
      }
      else if(size=='S 3-6 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe2':Shoe2--,

        });
      }
      else if(size=='6 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe3':Shoe3--,

        });
      }
      else if(size=='9 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe4':Shoe4--,

        });
      }
      else if(size=='S 9-12 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe5':Shoe5--,

        });
      }
      else if(size=='S 12-18 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe6':Shoe6--,

        });
      }
      else if(size=='S 18-24 M'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe7':Shoe7--,

        });
      }

      //K
      if(size=='2 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='3-4 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxsQuantity':xxs--,

        });
      }
      else if(size=='4-5 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xsQuantity':xs--,

        });
      }
      else if(size=='5-6 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'sQuantity':s--,

        });
      }
      else if(size=='6-7 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mQuantity':m--,

        });
      }
      else if(size=='7-8 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'lQuantity':l--,

        });
      }
      else if(size=='8-9 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xlQuantity':xl--,

        });
      }
      else if(size=='9-10 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxlQuantity':xxl--,

        });
      }
      else if(size=='10-11 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxxlQuantity':xxxl--,

        });
      }
      else if(size=='11-12 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'fourxlQuantity':fourxl--,

        });
      }
      else if(size=='MTO 2 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 3-4 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 4-5 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 5-6 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 6-7 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 7-8 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 8-9 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 9-10 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 10-11 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 11-12 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='2 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe1':Shoe1--,

        });
      }
      else if(size=='2-1/2 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe2':Shoe2--,

        });
      }
      else if(size=='3 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe3':Shoe3--,

        });
      }
      else if(size=='3-1/2 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe4':Shoe4--,

        });
      }
      else if(size=='4 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe5':Shoe5--,

        });
      }
      else if(size=='5 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe6':Shoe6--,

        });
      }
      else if(size=='6 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe7':Shoe7--,

        });
      }
      else if(size=='7 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe8':Shoe8--,

        });
      }
      else if(size=='8 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe9':Shoe9--,

        });
      }
      else if(size=='8-1/2 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe10':Shoe10--,

        });
      }
      else if(size=='9 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe11':Shoe11--,

        });
      }
      else if(size=='10 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe12':Shoe12--,

        });
      }
      else if(size=='11 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe13':Shoe13--,

        });
      }
      else if(size=='12 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe14':Shoe14--,

        });
      }
      //T
      if(size=='13 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='14 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xxsQuantity':xxs--,

        });
      }
      else if(size=='15 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'xsQuantity':xs--,

        });
      }
      else if(size=='16 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'sQuantity':s--,

        });
      }
      else if(size=='MTO 13 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 14 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 15 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 16 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'mtoQuantity':mto--,
        });
      }
      else if(size=='S 13 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe1':Shoe1--,

        });
      }
      else if(size=='S 14 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe2':Shoe2--,

        });
      }
      else if(size=='S 15 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe3':Shoe3--,

        });
      }
      else if(size=='S 16 Y'){
        Firestore.instance.collection('products')
            .document(ownerId)
            .collection('userProducts')
            .document(prodId)
            .setData({'Shoe4':Shoe4--,

        });
      }
    });

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
  QuerySnapshot snapshot = await Firestore.instance.collection('cart')
      .document(currentUser.id)
      .collection('userCart')
      .orderBy('timestamp', descending: true)
      .getDocuments();
  snapshot.documents.forEach((doc) {
    Firestore.instance.collection('ordersSeller')
        .document(doc.data['ownerId'])
        .collection('sellerOrder')
        .document(orderId)
        .setData({'prodId':doc.data['prodId'],
      'ownerId':doc.data['ownerId'],
      'size':doc.data['userSize'],
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      'read':'false',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    });
    Firestore.instance.collection('ordersCustomer')
        .document(currentUser.id)
        .collection('userOrder')
        .document(orderId)
        .setData({'prodId':doc.data['prodId'],
      'ownerId':doc.data['ownerId'],
      'size':doc.data['userSize'],
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    }); Firestore.instance.collection('feed')
        .document(currentUser.id)
        .collection('feedItems')
        .document(orderId)
        .setData({
      "type": "Payment",
      "username": doc.data['username'],
      "userId": doc.data['ownerId'],
      "userProfileImg": doc.data['avatarUrl'],
      "mediaUrl":doc.data['shopmediaUrl'],
      "postId": orderId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'Your order has been placed!',
    });
    Firestore.instance.collection('feed')
        .document(doc.data['ownerId'],)
        .collection('feedItems')
        .document(orderId)
        .setData({
      "type": "PaymentO",
      "username": currentUser.username,
      "userId": doc.data['ownerId'],
      "userProfileImg": currentUser.photoUrl,
      "mediaUrl":doc.data['shopmediaUrl'],
      "postId": orderId,

      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'You received an order!',
    });



  });

  payment();
  subtractQuantity();


}
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
    onSuccess();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
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
