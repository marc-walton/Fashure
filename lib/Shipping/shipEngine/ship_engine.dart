import 'package:fashow/Shipping/postmen/Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fashow/Shipping/shipEngine/models.dart';
class ShipEngine extends StatefulWidget {

  @override
  _ShipEngineState createState() => _ShipEngineState();
}
class _ShipEngineState extends State<ShipEngine> {

  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var headers = {
      'content-type': 'application/json',
      'postmen-api-key': 'c6c935cc-0736-4245-9645-977b93958855',
    };

    var data = '{ "async": false, "shipper_accounts": '
        '[ { "id": "6f43fe77-b056-45c3-bce4-9fec4040da0c" } ],'
        ' "is_document": false, "shipment": '
        '{ "ship_from": { "contact_name": "[FedEx] Contact name", '
        '"company_name": "[FedEx] Testing Company", "street1": "5/F Hull Lane", '
        '"country": "HKG", "type": "business", "postal_code": null, '
        '"city": "Sham Shui Po", "phone": "8095545803", "street2": "Hull", '
        '"tax_id": null, "street3": null, "state": null,'
        ' "email": "fedex@test.com", "fax": null },'
        ' "ship_to": { "contact_name": "Dr. Moises Corwin",'
        ' "phone": "1-140-225-6410", "email": "Giovanna42@yahoo.com",'
        ' "street1": "28292 Daugherty Orchard", "city": "Beverly Hills"'
        ', "postal_code": "90209", "state": "CA", "country": "USA", "type": "residential" },'
        ' "parcels": [ { "description": "Food XS", "box_type": "custom",'
        ' "weight": { "value": 2, "unit": "kg" }, "dimension": { "width": 20, "height": 40, "depth": 40, "unit": "cm" }, "items": [ { "description": "Food Bar", "origin_country": "USA", "quantity": 2, "price": { "amount": 3, "currency": "USD" }, "weight": { "value": 0.6, "unit": "kg" }, "sku": "imac2014" } ] } ] }}';    var response = await http.post('https://sandbox-api.postmen.com/v3/rates', headers: headers, body: data);

    if (response.statusCode == 200) {
      String responseBody = response.body;
      var data = json.decode(responseBody);
      print("WFVWEFVEFVWEFV$data");

      PostMen rates = new PostMen.fromJson(data);
      print("iyvcuttvuktvvjv${rates.meta}");
      return Scaffold(
        body: ListView.builder(
          itemCount: rates.data.rates.length,
          itemBuilder: (context,index){
            String date = rates.data.rates[index].deliveryDate.split("T").first;
            String name = rates.data.rates[index].serviceName;
            return Column(
              children: [
                Text("${rates.data.rates.length}"),
                Text("${rates.data.rates[index].serviceName}"),

               name.contains("FedEx")?Text("sokcsdc"):Text("sd"),
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
            );
          },

        ),
      );
    } else {
      print(response.statusCode);
      print("WEGWEVEW${response.body}");
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
