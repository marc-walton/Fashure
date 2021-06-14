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
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {
      setState(() {
        total += int.parse(doc.data()['eur']);
      });
    });
    return total.toString();
  }
  else  if(currentUser.country=='India') {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {
      setState(() {
        total += int.parse(doc.data()['inr']);
      });
    });
    return total.toString();
  }
  else  if(currentUser.country=='UK') {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {
      setState((){
          total += int.parse(doc.data()['gbp']);

      });
    });
    return total.toString();
  }
  else if(currentUser.country=='China') {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {
      setState(() {
        total += int.parse(doc.data()['cny']);
      });
    });
    return total.toString();
  }
  else if(currentUser.country=='USA') {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {
      setState(() {
        total += int.parse(doc.data()['usd']);
      });
    });
    return total.toString();
  }
  else{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {
      setState(() {
        total += int.parse(doc.data()['usd']);
      });
    });
    return total.toString();
  }
}
payment()async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
      .doc(currentUser.id)
      .collection('userCart')
      .orderBy('timestamp', descending: true)
      .get();
  snapshot.docs.forEach((doc) {
    FirebaseFirestore.instance.collection('Payments')
        .doc(doc.data()['ownerId'],)
        .collection('SellerPayments')
        .doc(orderId)
        .set({
      'ownerId':doc.data()['ownerId'],
      'orderId':orderId,
      'eur':doc.data()['eur'],
      'usd':doc.data()['usd'],
      'inr':doc.data()['inr'],
      'cny':doc.data()['cny'],
      'gbp':doc.data()['gbp'],
      "timestamp": timestamp,
    "userCountry": currentUser.id,
      'fulfilled':'false',
      'prodId':doc.data()['prodId'],
      'productname':doc.data()['productname'],

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
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
        .doc(currentUser.id)
        .collection('userCart')
        .orderBy('timestamp', descending: true)
        .get();
    snapshot.docs.forEach((doc) {

      prodId = doc.data()['prodId'];
      ownerId = doc.data()['ownerId'];
      StreamBuilder(
          stream: productsRef.doc(prodId)
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
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='XXS'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxsQuantity':xxs--,

        });
      }
      else if(size=='XS'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xsQuantity':xs--,

        });
      }
      else if(size=='S'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'sQuantity':s--,

        });
      }
      else if(size=='M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mQuantity':m--,

        });
      }
      else if(size=='L'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'lQuantity':l--,

        });
      }
      else if(size=='XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xlQuantity':xl--,

        });
      }
      else if(size=='XXL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxlQuantity':xxl--,

        });
      }
      else if(size=='XXXL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxxlQuantity':xxxl--,

        });
      }
      else if(size=='4XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'fourxlQuantity':fourxl--,

        });
      }
      else if(size=='5XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'fivexlQuantity':fivexl--,

        });
      }
      else if(size=='6XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'sixxlQuantity':sixxl--,

        });
      }
      else if(size=='7XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'sevenxlQuantity':sevenxl--,

        });
      }
      else if(size=='8XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'eightxlQuantity':eightxl--,

        });
      }
      else  if(size=='MTO XXXS'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XXS'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XS'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO S'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO L'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XXL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO XXXL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 4XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 5XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 6XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 7XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='MTO 8XL'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='Free Size'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'freesizeQuantity':freeSize--,

        });
      }
      else if(size=='(US)3-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe1':Shoe1--,

        });
      }
      else if(size=='(US)4'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe2':Shoe2--,

        });
      }
      else if(size=='(US)4-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe3':Shoe3--,

        });
      }
      else if(size=='(US)5'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe4':Shoe4--,

        });
      }
      else if(size=='(US)5-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe5':Shoe5--,

        });
      }
      else if(size=='(US)6'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe6':Shoe6--,

        });
      }
      else if(size=='(US)6-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe7':Shoe7--,

        });
      }
      else if(size=='(US)7'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe8':Shoe8--,

        });
      }
      else if(size=='(US)7-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe9':Shoe9--,

        });
      }
      else if(size=='(US)8'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe10':Shoe10--,

        });
      }
      else if(size=='(US)8-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe11':Shoe11--,

        });
      }
      else if(size=='(US)9'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe12':Shoe12--,

        });
      }
      else if(size=='(US)9-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe13':Shoe13--,

        });
      }
      else if(size=='(US)10'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe14':Shoe14--,

        });
      }
      else if(size=='(US)10-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe15':Shoe15--,

        });
      }
      else if(size=='(US)11'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe16':Shoe16--,

        });
      }
      else if(size=='(US)11-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe17':Shoe17--,

        });
      }
      else if(size=='(US)12'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe18':Shoe18--,

        });
      }
      else if(size=='(US)12-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe19':Shoe19--,

        });
      }
      else if(size=='(US)13'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe20':Shoe2--,

        });
      }
      else if(size=='(US)13-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe21':Shoe2--,

        });
      }
//W
      else if(size=='5'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe1':Shoe1--,

        });
      }
      else if(size=='5-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe2':Shoe2--,

        });
      }
      else if(size=='6'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe3':Shoe3--,

        });
      }
      else if(size=='6-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe4':Shoe4--,

        });
      }
      else if(size=='7'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe5':Shoe5--,

        });
      }
      else if(size=='7-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe6':Shoe6--,

        });
      }
      else if(size=='8'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe7':Shoe7--,

        });
      }
      else if(size=='8-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe8':Shoe8--,

        });
      }
      else if(size=='9'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe9':Shoe9--,

        });
      }
      else if(size=='9-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe10':Shoe10--,

        });
      }
      else if(size=='10'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe11':Shoe11--,

        });
      }
      else if(size=='10-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe12':Shoe12--,

        });
      }
      else if(size=='12'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe13':Shoe13--,

        });
      }
      else if(size=='13'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe14':Shoe14--,

        });
      }
      else if(size=='14'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe15':Shoe15--,

        });
      }
      else if(size=='15-1/2'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe16':Shoe16--,

        });
      }
//B
      if(size=='0-3 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='3-6 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxsQuantity':xxs--,

        });
      }
      else if(size=='6-9 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xsQuantity':xs--,

        });
      }
      else if(size=='9-12 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'sQuantity':s--,

        });
      }
      else if(size=='12-18 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mQuantity':m--,

        });
      }
      else if(size=='18-24 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'lQuantity':l--,

        });
      }
      else if(size=='MTO 0-3 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 3-6 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 6-9 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 9-12 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 12-18 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 18-24 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,

        });
      }
      else if(size=='S 0-3 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe1':Shoe1--,

        });
      }
      else if(size=='S 3-6 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe2':Shoe2--,

        });
      }
      else if(size=='6 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe3':Shoe3--,

        });
      }
      else if(size=='9 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe4':Shoe4--,

        });
      }
      else if(size=='S 9-12 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe5':Shoe5--,

        });
      }
      else if(size=='S 12-18 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe6':Shoe6--,

        });
      }
      else if(size=='S 18-24 M'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe7':Shoe7--,

        });
      }

      //K
      if(size=='2 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='3-4 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxsQuantity':xxs--,

        });
      }
      else if(size=='4-5 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xsQuantity':xs--,

        });
      }
      else if(size=='5-6 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'sQuantity':s--,

        });
      }
      else if(size=='6-7 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mQuantity':m--,

        });
      }
      else if(size=='7-8 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'lQuantity':l--,

        });
      }
      else if(size=='8-9 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xlQuantity':xl--,

        });
      }
      else if(size=='9-10 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxlQuantity':xxl--,

        });
      }
      else if(size=='10-11 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxxlQuantity':xxxl--,

        });
      }
      else if(size=='11-12 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'fourxlQuantity':fourxl--,

        });
      }
      else if(size=='MTO 2 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 3-4 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 4-5 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 5-6 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 6-7 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 7-8 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 8-9 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 9-10 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 10-11 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 11-12 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='2 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe1':Shoe1--,

        });
      }
      else if(size=='2-1/2 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe2':Shoe2--,

        });
      }
      else if(size=='3 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe3':Shoe3--,

        });
      }
      else if(size=='3-1/2 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe4':Shoe4--,

        });
      }
      else if(size=='4 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe5':Shoe5--,

        });
      }
      else if(size=='5 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe6':Shoe6--,

        });
      }
      else if(size=='6 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe7':Shoe7--,

        });
      }
      else if(size=='7 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe8':Shoe8--,

        });
      }
      else if(size=='8 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe9':Shoe9--,

        });
      }
      else if(size=='8-1/2 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe10':Shoe10--,

        });
      }
      else if(size=='9 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe11':Shoe11--,

        });
      }
      else if(size=='10 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe12':Shoe12--,

        });
      }
      else if(size=='11 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe13':Shoe13--,

        });
      }
      else if(size=='12 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe14':Shoe14--,

        });
      }
      //T
      if(size=='13 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxxsQuantity':xxxs--,

        });
      }
      else if(size=='14 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xxsQuantity':xxs--,

        });
      }
      else if(size=='15 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'xsQuantity':xs--,

        });
      }
      else if(size=='16 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'sQuantity':s--,

        });
      }
      else if(size=='MTO 13 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 14 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 15 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='MTO 16 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'mtoQuantity':mto--,
        });
      }
      else if(size=='S 13 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe1':Shoe1--,

        });
      }
      else if(size=='S 14 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe2':Shoe2--,

        });
      }
      else if(size=='S 15 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe3':Shoe3--,

        });
      }
      else if(size=='S 16 Y'){
        FirebaseFirestore.instance.collection('products')
            .doc(ownerId)
            .collection('userProducts')
            .doc(prodId)
            .set({'Shoe4':Shoe4--,

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
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('cart')
      .doc(currentUser.id)
      .collection('userCart')
      .orderBy('timestamp', descending: true)
      .get();
  snapshot.docs.forEach((doc) {
    FirebaseFirestore.instance.collection('ordersSeller')
        .doc(doc.data()['ownerId'])
        .collection('sellerOrder')
        .doc(orderId)
        .set({'prodId':doc.data()['prodId'],
      'ownerId':doc.data()['ownerId'],
      'size':doc.data()['userSize'],
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      'read':'false',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    });
    FirebaseFirestore.instance.collection('ordersCustomer')
        .doc(currentUser.id)
        .collection('userOrder')
        .doc(orderId)
        .set({'prodId':doc.data()['prodId'],
      'ownerId':doc.data()['ownerId'],
      'size':doc.data()['userSize'],
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      'Address':'$Fullname\n,$Addresss\n,$City,$State,$Country\n,$Zip\n,$Code $Phone',
    }); FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "Payment",
      "username": doc.data()['username'],
      "userId": doc.data()['ownerId'],
      "userProfileImg": doc.data()['avatarUrl'],
      "mediaUrl":doc.data()['shopmediaUrl'],
      "postId": orderId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'Your order has been placed!',
    });
    FirebaseFirestore.instance.collection('feed')
        .doc(doc.data()['ownerId'],)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "PaymentO",
      "username": currentUser.displayName,
      "userId": doc.data()['ownerId'],
      "userProfileImg": currentUser.photoUrl,
      "mediaUrl":doc.data()['shopmediaUrl'],
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
