import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
class OrderFulfill extends StatefulWidget {
  final String ownerId;
  final String orderId;

  const OrderFulfill({Key key, this.ownerId, this.orderId}) : super(key: key);
  @override
  _OrderFulfillState createState() => _OrderFulfillState();
}

class _OrderFulfillState extends State<OrderFulfill> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController courierIdController = TextEditingController();
submit(){
  Firestore.instance.collection('ordersSeller')
      .document(widget.ownerId)
      .collection('sellerOrder')
      .document(widget.orderId)
      .updateData({
    'fulfilled':'true',
    'courierId': courierIdController.text,
    'orderStatus':'Order Shipped',
    "timestamp": timestamp,

  });
  Firestore.instance.collection('ordersCustomer')
      .document(currentUser.id)
      .collection('userOrder')
      .document(widget.orderId)
      .updateData({
    'fulfilled':'true',
    'courierId': courierIdController.text,
    'orderStatus':'Order Shipped',
    "timestamp": timestamp,

  }); Firestore.instance.collection('feed')
      .document(currentUser.id)
      .collection('feedItems')
      .document(widget.orderId)
      .updateData({'message':'Your order is being shipped!',
    "timestamp": timestamp,

  });Firestore.instance.collection('feed')
      .document(widget.ownerId)
      .collection('feedItems')
      .document(widget.orderId)
      .updateData({'message':'You fulfilled an order!',
    "timestamp": timestamp,

  });
}
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
backgroundColor: kPrimaryColor,
      body: Form(
        key: _formKey,
        child: ListView(
          // scrollDirection: Axis.vertical,
          children: [
            Container(child: Column(children:[
              Center(child: Text('Enter Shipment tracking ID',style: TextStyle(color: kText)),),
              TextFormField(
                style: TextStyle(color: kText),
                controller: courierIdController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                  labelText: 'Tracking ID',labelStyle: TextStyle(color: kText),
                  hintText: 'Tracking ID',
                ),
                textAlign: TextAlign.center,
                validator: (text) {
                  if ( text.isEmpty) {
                    return 'Tracking ID is empty';
                  }
                  return null;
                },
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
                  child: Text('Submit',style: TextStyle(color: kText)),
                ),
              )
            ]),),

          ],
        ),
      ),
    );
  }
}
