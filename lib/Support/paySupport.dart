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
class PaySupport extends StatefulWidget {
  final String buynowamount;
  final String userId;
  final String displayName;
  final String imgUrl;
  final String currency;
 final String mediaUrl;

  const PaySupport(
      {Key key, this.buynowamount, this.mediaUrl, this.userId, this.displayName, this.imgUrl, this.currency,
      }) : super(key: key);

  @override
  _PaySupportState createState() => _PaySupportState(
  );
}

class _PaySupportState extends State<PaySupport>
{
  String Id = Uuid().v4();

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
        .doc(widget.userId)
        .collection('supportPayments')
        .doc(Id)
        .set({
      'userId':widget.userId,
      'Id':Id,
      "amount":widget.buynowamount,
"userCurrency":widget.currency??"",
    "senderCurrency":currentUser.currency,
      "imgUrl":widget.imgUrl,
      "displayName":widget.displayName,
         "senderImgUrl":currentUser.photoUrl,
      "senderDisplayName":currentUser.displayName,
        "senderUserId":currentUser.id,
   "mediaUrl":widget.mediaUrl,

      'fulfilled':'false',
      "timestamp": timestamp,

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
  if (currentUser.currency == 'GBP') {
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
if (currentUser.currency == 'EUR') {
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

    else{
      var options = {
        'key': key,
        'amount':"${widget.buynowamount}",
        'name': currentUser.id,
        'currency': 'USD',
        'description': 'Payment',
        'prefill': { 'email': currentUser.email},
        'external': {
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
   FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(Id)
        .set({
      "type": "SupportPaymentSender",
      "username": widget.displayName,
      "userId": widget.userId,
      "userProfileImg": widget.imgUrl,
      "mediaUrl":widget.mediaUrl,
     "postId": Id,

     "timestamp": timestamp,
      "read": 'false',
      'message':'Thank you for the support!',
    });
   FirebaseFirestore.instance.collection('feed')
        .doc(widget.userId)
        .collection('feedItems')
        .doc(Id)
        .set({
      "type": "SupportPaymentReceiver",
      "username": currentUser.displayName,
      "userId": currentUser.id,
      "userProfileImg": currentUser.photoUrl,
      "mediaUrl":widget.mediaUrl,
      "timestamp": timestamp,
      "postId": Id,
      "read": 'false',
      'message':'You received a Support!',
    });
    payment();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onSuccess();
    Get.back( );
    Fluttertoast.showToast(
        msg: "Payment SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.back( );

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