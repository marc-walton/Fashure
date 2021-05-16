import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
class ServiceFulfill extends StatefulWidget {
  final String ownerId;
  final String orderId;

  const ServiceFulfill({Key key, this.ownerId, this.orderId}) : super(key: key);
  @override
  _ServiceFulfillState createState() => _ServiceFulfillState();
}

class _ServiceFulfillState extends State<ServiceFulfill> {
  final _formKey = GlobalKey<FormState>();
  int client;

  TextEditingController courierIdController = TextEditingController();
  Client(){
    StreamBuilder(
      stream:Firestore.instance.collection('users')
          .document(widget.ownerId).snapshots(),
      builder:(context,snapshot){
         client = snapshot.data['client'];
        setState(() {
          Firestore.instance.collection('users')
              .document(widget.ownerId)
              .updateData({'client': client++,
          });
        });
        return
          Container();
      },
    );
  }
  submit(){
    Firestore.instance.collection('ordersSeller')
        .document(widget.ownerId)
        .collection('sellerOrder')
        .document(widget.orderId)
        .updateData({
      'fulfilled':'true',
      "timestamp": timestamp,

      'remarks': courierIdController.text??"",
      'orderStatus':'Order Shipped',
    });
    Firestore.instance.collection('ordersCustomer')
        .document(currentUser.id)
        .collection('userOrder')
        .document(widget.orderId)
        .updateData({
      'fulfilled':'true',
      "timestamp": timestamp,

      'remarks': courierIdController.text ?? "",
      'orderStatus':'Order Shipped',
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

  Client();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: _formKey,
        child: ListView(
          // scrollDirection: Axis.vertical,
          children: [
            Container(child: Column(children:[
              // Center(child: Text('Remarks',style: TextStyle(color: kText)),),
              Text('Remarks',style: TextStyle(color: kText)),
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
              Center(
                child: RaisedButton(
                  onPressed: () {

                      // ignore: unnecessary_statements
                      submit();
                      Navigator.pop(context);

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