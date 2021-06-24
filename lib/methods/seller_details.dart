import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SellerSign extends StatefulWidget {

  @override
  _SellerSignState createState() => _SellerSignState();
}

class _SellerSignState extends State<SellerSign> {
  Map<String, dynamic> body;
  @override
  void initState(){
    this.shopment();
  }
  Future<Map<String,dynamic>> shopment() async {
    var headers = {
      'API-Key': 'TEST_f+y9/tHG+yVxEq3uS3H1ogfezHSCWSq5MsIXUOnIV+Q',
      'Content-Type': 'application/json',
    };

    var data = '{ "rate_options": { "carrier_ids": [ "se-634124" ] }, "shipment": { "validate_address": "no_validation", "ship_to": { "name": "Amanda Miller", "phone": "555-555-5555", "address_line1": "525 S Winchester Blvd", "city_locality": "San Jose", "state_province": "CA", "postal_code": "95128", "country_code": "US", "address_residential_indicator": "yes" }, "ship_from": { "company_name": "Example Corp.", "name": "John Doe", "phone": "111-111-1111", "address_line1": "4009 Marathon Blvd", "address_line2": "Suite 300", "city_locality": "Austin", "state_province": "TX", "postal_code": "78756", "country_code": "US", "address_residential_indicator": "no" }, "packages": [ { "weight": { "value": 1.0, "unit": "ounce" } } ] } }';

    var res = await http.post('https://api.shipengine.com/v1/rates', headers: headers, body: data);
    if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
    print(res.body);
    setState(() {
    //  Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(res.body));
   //   print(data['rate_response']);
    //  body = json.decode(data['rate_response']);
    //  print("zbvzb${body}");

      List responseJson = json.decode(res.body.toString());
      List<rates> newsTitle = createNewsList(responseJson);
      return newsTitle;
     // List responseJson = json.decode(response.body.toString());
     // List<News> newsTitle = createNewsList(responseJson["response"]["results"]
      // print(data[0]["rates"]);
    //  body = json.decode(res.body);
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new Container(
        child: new FutureBuilder<Map<String,dynamic>> (
          future: shopment(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(snapshot.data[index].rate_id,
                            style: new TextStyle(
                                fontWeight: FontWeight.bold)
                        ),
                        new Divider()
                      ],
                    );
                  }
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}



List<rates> createNewsList(List data) {
  List<rates> list = new List();
  for (int i = 0; i< data.length; i++) {
    String title = data[i]['rate_id'];

    rates rate = new rates(
        rate_id: title);
    list.add(rate);
  }
  return list;

}


class rates {
  final String rate_id;

  rates({this.rate_id});

  factory rates.fromJson(Map<String, dynamic> json) {

    return new rates(
      rate_id: json['rate_id'],
    );
  }
}
