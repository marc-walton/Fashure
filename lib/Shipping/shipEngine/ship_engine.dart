import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fashow/Shipping/shipEngine/models.dart';
class ShipEngine extends StatefulWidget {

  @override
  _ShipEngineState createState() => _ShipEngineState();
}

class _ShipEngineState extends State<ShipEngine> {
  var rate_id;
  var rate_type ;
  var carrier_id ;
  var shippingAmount;
  var currency;
  var amount;

  Future<ResRate> getData() async {
    var headers = {
      'API-Key': 'TEST_f+y9/tHG+yVxEq3uS3H1ogfezHSCWSq5MsIXUOnIV+Q',
      'Content-Type': 'application/json',
    };
    var data = '{ "rate_options":'
        ' { "carrier_ids": [ "se-634124" ] }, '
        '"shipment": { "validate_address": "no_validation", '
        '"ship_to": { "name": "Amanda Miller", "phone": "555-555-5555", '
        '"address_line1": "525 S Winchester Blvd",'
        ' "city_locality": "San Jose",'
        ' "state_province": "CA",'
        ' "postal_code": "95128", '
        '"country_code": "US",'
        ' "address_residential_indicator": "yes" }, '
        '"ship_from": { '
        '"company_name": "Example Corp.", '
        '"name": "John Doe", '
        '"phone": "111-111-1111",'
        ' "address_line1": "4009 Marathon Blvd",'
        ' "address_line2": "Suite 300",'
        ' "city_locality": "Austin",'
        ' "state_province": "TX",'
        ' "postal_code": "78756",'
        ' "country_code": "US",'
        ' "address_residential_indicator": "no" }, '
        '"packages": [ { "weight": { "value": 1.0, "unit": "ounce" } } ] } }';

    final response = await http.post('https://api.shipengine.com/v1/rates', headers: headers, body: data);
    for (var dataItems in items) {
      print(items);
      for (int i = 0; i < items.length; i++) {
        var id = dataItems["rate_id"];
        var name = dataItems["rate_type"];
        var price = dataItems['carrier_id'];
        var shipping_amount = dataItems['shipping_amount'];
        var datas = json.decode(shipping_amount);
        for (var sh in datas) {
          var currency = dataItems['currency'];

          print(name.toString() +
              '\n' +
              price.toString() +
              '\n' +
              id.toString() +'\n' +
              currency.toString());
        }
      }
    }
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var data = json.decode(response.body);
      print(data);
        print(data["rate_response"]["rates"]);
      return postFromJson(response.body);

    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Center(
      child: FutureBuilder<ResRate>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("fbrfgrrnrnr${snapshot.data.delivery_days}");
            return Text("snapshot.data.rates");
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
