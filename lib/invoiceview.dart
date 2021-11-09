import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/model/adressservice.dart';
import 'package:fashow/payments/Servicepayment.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/progress.dart';
import 'package:uuid/uuid.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter/cupertino.dart';
import 'package:fashow/invoice.dart';

class InvoiceView extends StatefulWidget {
  final String ownerId;

  final String orderId;


  const InvoiceView({Key key, this.ownerId, this.orderId, }) : super(key: key);

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('serviceSeller')
            .doc(widget.ownerId)
            .collection('sellerService')
        .doc(widget.orderId)
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
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",
                      color: Colors.white),
                ),
              ),),
            body: Container(color:Cont,
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
