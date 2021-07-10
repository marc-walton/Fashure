import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
class OrderFulfill extends StatefulWidget {
  final String ownerId;
  final String orderId;
 final String cusId;
 final String prodId;
 final String shopmediaUrl;

  const OrderFulfill({Key key, this.ownerId, this.orderId, this.cusId, this.prodId, this.shopmediaUrl}) : super(key: key);
  @override
  _OrderFulfillState createState() => _OrderFulfillState();
}

class _OrderFulfillState extends State<OrderFulfill> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController courierIdController = TextEditingController();
  TextEditingController courierController = TextEditingController();

submit(){
  FirebaseFirestore.instance.collection('ordersSeller')
      .doc(widget.ownerId)
      .collection('sellerOrder')
      .doc(widget.orderId)
      .update({
    'fulfilled':'true',
    'courierId': courierIdController.text??"",
    'courier': courierController.text??"",

    'orderStatus':'Order Shipped',
    "timestamp": timestamp,

  });
  FirebaseFirestore.instance.collection('ordersCustomer')
      .doc(widget.cusId)
      .collection('userOrder')
      .doc(widget.orderId)
      .update({
    'fulfilled':'true',
    'courierId': courierIdController.text??"",
      'courier': courierController.text??"",

    'orderStatus':'Order Shipped',
    "timestamp": timestamp,

  }); FirebaseFirestore.instance.collection('feed')
      .doc(widget.cusId)
      .collection('feedItems')
      .doc(widget.orderId)
      .update({'message':'Your order is being shipped!',
    "timestamp": timestamp,
    "type": "Payment",
    "userId": widget.ownerId,
    "mediaUrl":widget.shopmediaUrl,
    "postId": widget.prodId,
    "username": currentUser.displayName,
    "userProfileImg": currentUser.photoUrl,
    "read": 'false',
  });FirebaseFirestore.instance.collection('feed')
      .doc(widget.ownerId)
      .collection('feedItems')
      .doc(widget.orderId)
      .update({'message':'You fulfilled an order!',
    "timestamp": timestamp,
    "type": "PaymentO",
    "userId": widget.ownerId,
    "mediaUrl":widget.shopmediaUrl,
    "postId": widget.prodId,
    "username": currentUser.displayName,
    "userProfileImg": currentUser.photoUrl,
    "read": 'false',
  });
}
  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Scaffold(appBar: AppBar(
        backgroundColor: kPrimaryColor,

      ),
        body: Container( decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                Container(child: Column(children:[
                  SizedBox(height: 20.0,),
                  Center(child: Text('Enter Shipment tracking ID',style: TextStyle(color: kText,fontSize: 20.0)),),
                  SizedBox(height: 20.0,),

                  TextFormField(
                    style: TextStyle(color: kText),
                    controller: courierController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                      labelText: 'Delivery provider name',labelStyle: TextStyle(color: kText),
                      hintText: 'Delivery provider mame',
                    ),
                    textAlign: TextAlign.center,
                    validator: (text) {
                      if ( text.isEmpty) {
                        return 'Delivery provider name is empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0,),

                  TextFormField(
                    style: TextStyle(color: kText),
                    controller: courierIdController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                      labelText: 'Tracking ID(optional)',labelStyle: TextStyle(color: kText),
                      hintText: 'Tracking ID',
                    ),
                    textAlign: TextAlign.center,

                  ),

                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          // ignore: unnecessary_statements
                          submit();
                          Navigator.pop(context);
                        }
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
