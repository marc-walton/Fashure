import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/model/adressservice.dart';
import 'package:fashow/payments/Servicepayment.dart';
import 'package:fashow/user.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/progress.dart';
import 'package:uuid/uuid.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter/cupertino.dart';
import 'package:fashow/invoice.dart';

class InvoiceView extends StatefulWidget {
  final String ownerId;
  final String title;
  final String description;
  final String cusid;
  final String Address;
  final String advancepay;
  final String finalpay;
  final String fulfilled;
  final String orderId;
  final String ordersstatus;
final String advance;
final String due;
final String cusName;
final String cusImg;

  const InvoiceView({Key key, this.cusName, this.cusImg, this.advance, this.due, this.ownerId, this.title, this.description, this.cusid, this.Address, this.advancepay, this.finalpay, this.fulfilled, this.orderId, this.ordersstatus}) : super(key: key);

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  String reviewId = Uuid().v4();
  TextEditingController reviewController = TextEditingController();

  var rating = 0.0;
  currency({String advance,String finalpay}){
    if(currentUser.country == 'India'){
      Text('Advance payment: ₹$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: ₹$finalpay');
    }
    else if (currentUser.country == 'China'){
      Text('Advance payment: ¥$advance');

      SizedBox( height: 8.0,);
      Text('Payment on delivery: ¥$finalpay');
    }
    else if(currentUser.country=='US'){

      Text('Advance payment: \u0024$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: \u0024$advance');
    }
    else if(currentUser.country=='Europe'){
      Text('Advance payment: €$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: €$finalpay');

    }
    else if(currentUser.country=='UK'){
      Text('Advance payment: £$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: £$finalpay');
    }
    else{

      Text('Advance payment: \u0024$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: \u0024$advance');
    }
  }
  paymentbutton({String amount,String due,String custId,String cusName,String cusImg,String ownerId,String orderId}){
    //installment
    if(widget.advancepay == 'false'||widget.finalpay == 'false'|| widget.Address == "") {
      Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
              OrderId: orderId,
              cusId: custId,
              username: cusName,
              profileimg: cusImg,)));

          },
          color: kblue,
          child: Text('Pay Advance',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    //one-time payment
    if(widget.advancepay == 'false'||widget.finalpay == 'true'|| widget.Address == "") {
      Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
              OrderId: orderId,
              cusId: custId,
              username: cusName,
              profileimg: cusImg,
            )));

          },
          color: kblue,
          child: Text('Pay Now',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    if(widget.advancepay == 'true'||widget.finalpay == 'false')
    {
      Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSer(Amount:due,OrderId: orderId,
              OwnerId: ownerId,profileimg: cusImg,username: cusName,)));

          },
          color: kblue,
          child: Text('Pay Due',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }


  }
  Rating({String fulfill,String OwnerId}){
    if(fulfill=='true') {
      Center(
        child: Column(
          children:[
            Text('Please rate the order',style: TextStyle(
                color: Colors.white),),
            SmoothStarRating(
              allowHalfRating: true,
              filledIconData: Icons.blur_off,
              halfFilledIconData: Icons.blur_on,
              rating: rating,
              size: 35,
              starCount: 5,
              onRated: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            TextField(
              controller: reviewController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                labelText: 'Review',labelStyle: TextStyle(color: kText),
                hintText: 'Review',
              ),
              textAlign: TextAlign.start,
            )
          ],
        ),
      );
      Firestore.instance.collection('Reviews')
          .document(OwnerId).collection('userReviews').document(reviewId)
          .setData({
        'userId': OwnerId,
        'rating': rating,
        'review':reviewController.text,
        'reviewId' : reviewId
      });
      Firestore.instance.collection('feed')
          .document(OwnerId)
          .collection('feedItems')
          .document(reviewId)
          .setData({
        "type": "ReviewC",
        "username": currentUser.username,
        "userId": OwnerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": reviewId,
        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'You received an order!',
      });
    }
    else{return
      Text('');}
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('serviceCustomer')
            .document(currentUser.id)
            .collection('customerService')
        .document(widget.orderId)
            .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Invoice invoice = Invoice.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(

            appBar: AppBar(
              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Invoice',
                  style: TextStyle(                  fontFamily :"MajorMonoDisplay",
                      color: Colors.white),
                ),
              ),),
            body: Container( decoration: BoxDecoration(
                gradient: fabGradient
            ) ,
              alignment: Alignment.center,
              child: ListView(
                children: <Widget>[
                  Container(
                    color: kPrimaryColor,
                    child: invoice,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
