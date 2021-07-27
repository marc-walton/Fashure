import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fashow/Shipping/postmen/Create_model.dart';
import 'package:flutter/material.dart';

class CreateShipment extends StatefulWidget {

  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
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
        '"terms_of_trade":"ddu",'
        '"purpose":"gift"},'
        '"return_shipment":false,'
        '"is_document":false,'
        '"service_type":"dhl_express_worldwide",'
        '"paper_size":"4x8",'
        '"shipper_account":{"id":"00000000-0000-0000-0000-000000000000"},'
        '"references":["referenceid"],'
        '"shipment":{'
        '"parcels":[{"description":"Food XS",'
        '"box_type":"custom",'
        '"weight":{"value":2,'
        '"unit":"kg"},'
        '"dimension":{"width":20,'
        '"height":40,'
        '"depth":40,'
        '"unit":"cm"},'
        '"items":[{'
        '"description":"Food Bar",'
        '"origin_country":"USA",'
        '"quantity":2,'
        '"price":{"amount":3,'
        '"currency":"USD"},'
        '"weight":{"value":0.6,'
        '"unit":"kg"},'
        '"sku":"Epic_Food_Bar",'
        '"hs_code":"1234.12"}]}],'
        '"ship_from":{"contact_name":"Nottingham Inc.",'
        '"company_name":"Nottingham Inc.",'
        '"street1":"2511 S. Main St.",'
        '"city":"Grove","state":"OK",'
        '"postal_code":"74344",'
        '"country":"USA",'
        '"phone":"1-403-504-5496",'
        '"email":"test@test.com",'
        '"type":"business"},'
        '"ship_to":{"contact_name":"Rick McLeod (RM Consulting)",'
        '"street1":"71 Terrace Crescent NE",'
        '"street2":"This is the second streeet",'
        '"city":"Medicine Hat",'
        '"state":"Alberta",'
        '"postal_code":"T1C1Z9",'
        '"country":"CAN",'
        '"phone":"1-403-504-5496",'
        '"email":"test@test.test",'
        '"type":"residential"}}}';

    var response = await http.post('https://sandbox-api.postmen.com/v3/labels', headers: headers, body: data);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var data = json.decode(responseBody);

      CreateModel rates = new CreateModel.fromJson(data);
      String date = rates.data.rate.deliveryDate.split("T").first;
      String name = rates.data.rate.serviceName;
      return Scaffold(
        body: ListView(
          children:[
              GestureDetector(
                onTap: (){},
                child: Padding(
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

                      ],
                    ),
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
