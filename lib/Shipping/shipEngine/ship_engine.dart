import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Shipping/postmen/Model.dart';
import 'package:fashow/Shipping/postmen/create_label.dart';
import 'package:fashow/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ShipEngine extends StatefulWidget {
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
 final  bool returns;
 final  String orderId;

  const ShipEngine({Key key, this.cusStreet1, this.cusCountry_code, this.cusType,
    this.cusPostal_code, this.cusPhone_code, this.cusName, this.cusEmail, this.cusPhone,
    this.cusState, this.cusCity, this.description, this.boxType, this.weight,
    this.width, this.height, this.depth, this.quantity, this.price, this.hs, this.returns, this.orderId, }) : super(key: key);

  @override
  _ShipEngineState createState() => _ShipEngineState();
}
class _ShipEngineState extends State<ShipEngine> {
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
  getData() async {
    var headers = {
      'content-type': 'application/json',
      'postmen-api-key': 'c6c935cc-0736-4245-9645-977b93958855',
    };


    var data = '{ "async": false,'
        ' "shipper_accounts": '
        '[ { "id": "6f43fe77-b056-45c3-bce4-9fec4040da0c" } ],'
        ' "is_document": false,'
        ' "shipment": '
        '{ "ship_from": { '
        '"contact_name": "${currentUser.displayName}", '
        '"company_name": "${currentUser.displayName}",'
        ' "street1": "${userAddress.street1}", '
        '"country": "${userAddress.country_code}",'
        ' "type": "${userAddress.type}", '
        '"postal_code": "${userAddress.postal_code}", '
        '"city": "${userAddress.city}", '
        '"phone": "${userAddress.phone_code}${userAddress.phone}",'
        ' "street2": "null", '
        '"tax_id": null,'
        ' "street3": null,'
        ' "state": ${userAddress.state},'
        ' "email": "${currentUser.email}",'
        ' "fax": null },'
        ' "ship_to": { "contact_name": "${widget.cusName}",'
        ' "phone": "${widget.cusPhone_code}${widget.cusPhone}",'
        ' "email": "${widget.cusEmail}",'
        ' "street1": "${widget.cusStreet1}",'
        ' "city": "${widget.cusCity}"'
        ', "postal_code": "${widget.cusPostal_code}",'
        ' "state": "${widget.cusState}",'
        ' "country": "${widget.cusCountry_code}",'
        ' "type": "${widget.cusType}" },'
        ' "parcels": [ {'
        ' "description": "${widget.description}",'
        ' "box_type": "${widget.boxType}",'
        ' "weight": { '
        '"value": ${widget.weight},'
        ' "unit": "kg" },'
        ' "dimension": { '
        '"width": ${widget.height},'
        ' "height": ${widget.width},'
        ' "depth": ${widget.depth}, '
        '"unit": "cm" }, '
        '"items": [ {'
        ' "description": "${widget.description}",'
        ' "origin_country": "${widget.cusCountry_code}",'
        ' "quantity": ${widget.quantity},'
        ' "price": { "amount": ${widget.price},'
        ' "currency": "${currentUser.currencyISO}" },'
        ' "weight": { "value": ${widget.weight},'
        ' "unit": "kg" },'
    '"hs_code": "${widget.hs}"'
        '} ] } ] }}';
    var response = await http.post('https://sandbox-api.postmen.com/v3/rates', headers: headers, body: data);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var data = json.decode(responseBody);

      PostMen rates = new PostMen.fromJson(data);
      return Scaffold(
        body: ListView.builder(
          itemCount: rates.data.rates.length,
          itemBuilder: (context,index){
            String date = rates.data.rates[index].deliveryDate.split("T").first;
            String name = rates.data.rates[index].serviceName;
            return

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>CreateShipment(price:widget.price,
                    cusPostal_code:widget.cusPostal_code,cusType:widget.cusType,cusStreet1: widget.cusStreet1,cusCity: widget.cusCity,
                    cusState: widget.cusState,cusCountry_code: widget.cusCountry_code,cusName: widget.cusName,
                    cusEmail: widget.cusEmail,cusPhone: widget.cusPhone,cusPhone_code: widget.cusPhone_code,
                    description: widget.description,width: widget.width,height: widget.height,depth: widget.depth,quantity: 1,
                    boxType: widget.boxType,orderId: widget.orderId,
                    weight:widget.weight,returns: widget.returns,hs: widget.hs,service:  rates.data.rates[index].serviceType,id:  rates.data.rates[index].shipperAccount.id, )));},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                  child: Column(
                    children: [
                      Text("${rates.data.rates.length}"),
                      ListTile(
                          leading: name.toLowerCase().contains("fedex")?Image.asset("assets/logos/fedex.png"):Text("sd"),
                          title: Text("${rates.data.rates[index].serviceName}")),


 Row(
   children: [
     Text("Delivery date:"),
     Text("$date"),
   ],
 ),
Row(
   children: [
     Text("transit time:"),
     Text("${rates.data.rates[index].transitTime}"),
   ],
 ),
 Row(
   children: [
     Text("Package weight:"),
     Text("${rates.data.rates[index].chargeWeight.value}"),
      Text("${rates.data.rates[index].chargeWeight.unit}"),
   ],
 ),
Row(
                          children: [
                            Text("Total shipping cost"), Text("\u0024"),
                            Text("${rates.data.rates[index].totalCharge.amount}"),
                          ],
                        ),

                    ],
                  ),
            ),
                ),
              );
          },

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
