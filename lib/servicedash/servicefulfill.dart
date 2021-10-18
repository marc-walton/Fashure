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
    FirebaseFirestore.instance.collection('users')
        .where("id",isEqualTo:"${widget.ownerId}")
        .snapshots().listen((snapshot){snapshot.docs.forEach((doc){

      setState(() {
        client = doc.data()['client'];

      });});

    });
    client++;

    FirebaseFirestore.instance.collection('users')
        .doc(widget.ownerId)
        .update({'client': client,
    });
  }
  submit(){
    FirebaseFirestore.instance.collection('serviceSeller')
        .doc(widget.ownerId)
        .collection('sellerService')
        .doc(widget.orderId)
        .update({
      'fulfilled':'true',
      "timestamp": timestamp,

      'remarks': courierIdController.text??"",
      'orderStatus':'Order Shipped',
    });
    FirebaseFirestore.instance.collection('serviceCustomer')
        .doc(widget.cusId)
        .collection('customerService')
        .doc(widget.orderId)
        .update({
      'fulfilled':'true',
      "timestamp": timestamp,

      'remarks': courierIdController.text ?? "",
      'orderStatus':'Order Shipped',
    }); FirebaseFirestore.instance.collection('feed')
        .doc(widget.cusId)
        .collection('feedItems')
        .doc(widget.orderId)
        .update({'message':'Your order is being shipped!',
      "timestamp": timestamp,
      "type": "ServicePayment",
      "username": currentUser.displayName,
      "userId": widget.ownerId,
      "userProfileImg": currentUser.photoUrl,
      "postId": widget.orderId,
      // "mediaUrl": mediaUrl,
      "read": 'false',
    });FirebaseFirestore.instance.collection('feed')
        .doc(widget.ownerId)
        .collection('feedItems')
        .doc(widget.orderId)
        .update({'message':'You fulfilled an order!',
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
    full =full.replaceAll("D","");
    full = full + "D";
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,

         ),

        body: Container(
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation : 0.1,
                        primary:  Colors.black, ),
                      onPressed: () {

                          // ignore: unnecessary_statements
                          submit();
                          Navigator.pop(context);

                      },
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
