import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/model/address_model.dart';
import 'package:http/http.dart' as http;
import 'package:fashow/Shipping/postmen/Create_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateShipment extends StatefulWidget {
final bool returns;
final String service;
final String id;
final String cusStreet1;
final  String cusCountry_code;
final String cusType;
final String cusPostal_code;
final  String cusPhone_code;
final String cusName;
final  String cusEmail;

final String cusPhone;
final String cusState;
final  String cusCity;
final  String description;
final  String boxType;
final  int weight;
final  int width;
final  int height;
final  int depth;
final  int quantity;
final  int price;
final  int hs;
final  String orderId;

  const CreateShipment({Key key, this.returns, this.service, this.id, this.cusStreet1, this.cusCountry_code,
    this.cusType, this.cusPostal_code, this.cusPhone_code, this.cusName, this.cusEmail, this.cusPhone, 
    this.cusState, this.cusCity, this.description, this.boxType, this.weight, 
    this.width, this.height, this.depth, this.quantity, this.price, this.hs,this.orderId, }) : super(key: key);

  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
  Address userAddress;

  void initState() {
    super.initState();
    getAddress();

  }
  getAddress() async {

    DocumentSnapshot doc = await
    sellerAddressRef
        .doc(currentUser.id)
        .get();
    userAddress = Address.fromDocument(doc);
  }
  @override
  getData() async {
    var headers = {
      'content-type': 'application/json',
      'postmen-api-key': 'c6c935cc-0736-4245-9645-977b93958855',
    };
    var data = '{"async":false,'
        '"billing":{"paid_by":"shipper"},'
        '"customs":{'
        '"billing":{'
        '"paid_by":"recipient"},'
        '"terms_of_trade":"ddp",'
        '"purpose":"merchandise"},'
        '"return_shipment":${widget.returns},'
        '"is_document":false,'
        '"service_type":"${widget.service}",'
        '"paper_size":"4x8",'
        '"shipper_account":{"id":"${widget.id}"},'
        '"references":["referenceid"],'
        '"shipment":{'
        '"parcels":[{"description":"${widget.description}",'
        '"box_type":"${widget.boxType}",'
        '"weight":{"value":${widget.weight},'
        '"unit":"kg}"},'
        '"dimension":{"width":${widget.width},'
        '"height":${widget.height},'
        '"depth":${widget.depth},'
        '"unit":"cm"},'
        '"items":[{'
        '"description":"${widget.description}",'
        '"origin_country":"${userAddress.country_code}",'
        '"quantity":${widget.quantity},'
        '"price":{"amount":${widget.price},'
        '"currency":"${currentUser.currencyISO}"},'
        '"weight":{"value":${widget.weight},'
        '"unit":"kg"},'
        '"hs_code":"${widget.hs}"}]}],'
        '"ship_from":{"contact_name":"${userAddress.name}.",'
        '"company_name":"${userAddress.name}",'
        '"street1":"${userAddress.street1}",'
        '"city":"${userAddress.city}",'
        '"state":"${userAddress.state}",'
        '"postal_code":"${userAddress.postal_code}",'
        '"country":"${userAddress.country_code}",'
        '"phone":"${userAddress.phone_code}${userAddress.phone}",'
        '"email":"${currentUser.email}",'
        '"type":"${userAddress.type}"},'
        '"ship_to":{"contact_name":"${widget.cusName}",'
        '"street1":"${widget.cusStreet1}",'
        '"street2":"null",'
        '"city":"${widget.cusCity}",'
        '"state":"${widget.cusState}",'
        '"postal_code":"${widget.cusPostal_code}",'
        '"country":"${widget.cusCountry_code}",'
        '"phone":"${widget.cusPhone_code}${widget.cusPhone}",'
        '"email":"${widget.cusEmail}",'
        '"type":"${widget.cusType}"}}}';

    var response = await http.post('https://sandbox-api.postmen.com/v3/labels', headers: headers, body: data);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var data = json.decode(responseBody);

      CreateModel rates = new CreateModel.fromJson(data);
      String date = rates.data.rate.deliveryDate.split("T").first;
      String name = rates.data.rate.serviceName;
      FirebaseFirestore.instance.collection('ordersSeller')
          .doc(currentUser.id)
          .collection('sellerOrder')
          .doc(widget.orderId)
          .update({

        "shipmentCreated":true,
         "label":"${rates.data.files.label.url}",
         "labelId":"${rates.data.id}",
      "TrackingNo":"${rates.data.trackingNumbers}",
        "invoice":"${rates.data.files.invoice.url}",

      });
      return Scaffold(
        body: ListView(
          children:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                          leading: name.toLowerCase().contains("fedex")?Image.asset("assets/logos/fedex.png"):Text("sd"),
                          title: Text("${rates.data.rate.serviceName}")),


                      Row(
                        children: [
                          Text("Delivery date:"),
                          Text("$date"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("transit time:"),
                          Text("${rates.data.rate.transitTime}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Package weight:"),
                          Text("${rates.data.rate.chargeWeight.value}"),
                          Text("${rates.data.rate.chargeWeight.unit}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Total shipping cost"), Text("\u0024"),
                          Text("${rates.data.rate.totalCharge.amount}"),
                        ],
                      ),
 Row(
                        children: [
                          ElevatedButton(
                              onPressed: () async { await launch(rates.data.files.label.url); },
                              child: Text("Download Label")),
                          ElevatedButton(
                              onPressed: () async { await launch(rates.data.files.invoice.url); },

                              child: Text("Download Invoice")),
                        ],
                      ),
                      Text("You can also download from your dashboard")

                    ],
                  ),
                ),
              )
          ],

        ),
      );
    } else {
      print(response.statusCode);
      print("${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("fbrfgrrnrnr");
            return snapshot.data;
          } else if (snapshot.hasError) {
            print("jm");
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),

    );
  }
}
