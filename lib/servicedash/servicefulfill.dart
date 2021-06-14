import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
class ServiceFulfill extends StatefulWidget {
  final String ownerId;
  final String orderId;
final String cusId;

  const ServiceFulfill({Key key, this.ownerId, this.orderId, this.cusId}) : super(key: key);
  @override
  _ServiceFulfillState createState() => _ServiceFulfillState();
}

class _ServiceFulfillState extends State<ServiceFulfill> {
  final _formKey = GlobalKey<FormState>();
  int client;

  TextEditingController courierIdController = TextEditingController();
  Client(){
    Firestore.instance.collection('users')
        .where("id",isEqualTo:"${widget.ownerId}")
        .snapshots().listen((snapshot){snapshot.documents.forEach((doc){

      setState(() {
        client = doc.data['client'];

      });});

    });
    client++;

    Firestore.instance.collection('users')
        .document(widget.ownerId)
        .updateData({'client': client,
    });
  }
  submit(){
    Firestore.instance.collection('serviceSeller')
        .document(widget.ownerId)
        .collection('sellerService')
        .document(widget.orderId)
        .updateData({
      'fulfilled':'true',
      "timestamp": timestamp,

      'remarks': courierIdController.text??"",
      'orderStatus':'Order Shipped',
    });
    Firestore.instance.collection('serviceCustomer')
        .document(widget.cusId)
        .collection('customerService')
        .document(widget.orderId)
        .updateData({
      'fulfilled':'true',
      "timestamp": timestamp,

      'remarks': courierIdController.text ?? "",
      'orderStatus':'Order Shipped',
    }); Firestore.instance.collection('feed')
        .document(widget.cusId)
        .collection('feedItems')
        .document(widget.orderId)
        .updateData({'message':'Your order is being shipped!',
      "timestamp": timestamp,
      "type": "ServicePayment",
      "username": currentUser.displayName,
      "userId": widget.ownerId,
      "userProfileImg": currentUser.photoUrl,
      "postId": widget.orderId,
      // "mediaUrl": mediaUrl,
      "read": 'false',
    });Firestore.instance.collection('feed')
        .document(widget.ownerId)
        .collection('feedItems')
        .document(widget.orderId)
        .updateData({'message':'You fulfilled an order!',
      "timestamp": timestamp,
      "type": "ServicePaymentI",
      "username": currentUser.displayName,
      "userId": widget.ownerId,
      "userProfileImg": currentUser.photoUrl,
      "postId": widget.orderId,
      // "mediaUrl": mediaUrl,
      "read": 'false',
    });

  Client();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,

         ),

        body: Container(   decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                Container(child: Column(children:[
                  // Center(child: Text('Remarks',style: TextStyle(color: kText)),),
                  SizedBox(height: 20.0,),

                  TextFormField(
                    style: TextStyle(color: kText),
                    controller: courierIdController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                      labelText: 'Remarks',labelStyle: TextStyle(color: kText),
                      hintText: 'Remarks',
                    ),
                    textAlign: TextAlign.center,

                  ),
                  SizedBox(height: 20.0,),

                  Center(
                    child: RaisedButton(
                      onPressed: () {

                          // ignore: unnecessary_statements
                          submit();
                          Navigator.pop(context);

                      },
                      color: kblue,
                      child: Text('Submit',style: TextStyle(color: Colors.white)),
                    ),
                  )
                ]),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
