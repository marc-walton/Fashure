import 'package:fashow/methods/flutter_country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashow/HomePage.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fashow/user.dart';
import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAdress extends StatefulWidget {
  final Users currentUser;

  const AddAdress({Key key, this.currentUser}) : super(key: key);

  @override
  _AddAdressState createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController nicknamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController zipcontroller = TextEditingController();
  TextEditingController telephonecontroller = TextEditingController();
  String country = 'India';
  String dialcode = '+91';
  SharedPreferences adPrefs;
  String fullname;
  String type;
  String address;
  String city;
  String state;
  String zip;
  String phone;
  String countr;
  String code;
  String countryISO = "";
  Country _selected;

  File file;
  bool isUploading = false;
  String addId = Uuid().v4();
  List<String> selectedSizes = <String>[];
  String dropdownValue = 'Women';

//  var colorOptions = ['Blue ', 'yellow', 'red','brown','pink','green','black','grey','white','Neutral',];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;

  Saveaddress(){
    Fluttertoast.showToast(
        msg: "Please wait:Uploading", timeInSecForIos: 4);

    addressRef
        .doc(currentUser.id)
        .collection("useraddress")
        .doc(addId)
        .set({
      "userId": currentUser.id,
      "username": currentUser.displayName,
      "photoUrl": currentUser.photoUrl,
      "displayName": currentUser.displayName,
      "fullname":namecontroller.text,
      "type":nicknamecontroller.text,
      "address":addresscontroller.text,
      "city":citycontroller.text,
      "state":statecontroller.text,
      "zip":zipcontroller.text,
      "phone":telephonecontroller.text,
      "country":country,
      "countryISO":currentUser.countryISO,

      "code":dialcode,

    });
  }
Widget form(){
    return
  Form(
  key: _formKey,
  child: ListView(
    shrinkWrap:true,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),

        child: TextFormField(
          keyboardType: TextInputType.name,
          maxLines: null,
          controller: namecontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: 'Full name',
            hintStyle: TextStyle(color: kText),

          ),
          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Name is empty';
            }
            return null;
          },
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
        child: TextFormField(
          keyboardType: TextInputType.name,
          maxLines: null,
          controller: nicknamecontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: 'Type of address is empty(Home,Work..)',
            hintStyle: TextStyle(color: kText),

          ),

          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Type of address is empty';
            }
            return null;
          },
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
        child: TextFormField(
          keyboardType: TextInputType.streetAddress,
          maxLines: null,
          controller: addresscontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: 'Address',
            hintStyle: TextStyle(color: kText),

          ),

          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Address is empty';
            }
            return null;
          },
        ),
      ),


      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: null,
          controller: citycontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: 'City',
            hintStyle: TextStyle(color: kText),

          ),

          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'City is empty';
            }
            return null;
          },
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: null,
          controller: statecontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: 'State',
            hintStyle: TextStyle(color: kText),

          ),

          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'State is empty';
            }
            return null;
          },
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: null,
          controller: zipcontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: 'Zip Code',

            hintStyle: TextStyle(color: kText),

          ),


          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Zip Code is empty';
            }
            return null;
          },
        ),
      ),
 Center(
        child: CountryPicker(
          dense: false,
          showFlag: true,  //displays flag, true by default
          showDialingCode: true, //displays dialing code, false by default
          showName: false, //displays country name, true by default
          showCurrency: false, //eg. 'British pound'
          showCurrencyISO: false, //eg. 'GBP'
          onChanged: (Country select) {
            setState(() {
              _selected = select;
              country = select.name;
              dialcode = select.dialingCode;

              countryISO = select.isoCode;

            });
          },
          selectedCountry:_selected,
        ),
      ),

      Container(
        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          maxLines: null,
          controller: telephonecontroller,
          style:TextStyle(color: kText),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
            hintText: '$dialcode Mobile number',

            hintStyle: TextStyle(color: kText),

          ),

          textAlign: TextAlign.start,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Mobile number is empty';
            }
            return null;
          },
        ),
      ),

      Row(
        children: [
          RaisedButton(
            child: Text('Cancel'),
            onPressed: ()=>Get.back(),
          ),
          SizedBox(width: 5.0,),
          RaisedButton(
              child: Text('Save'),
              onPressed: () async {
               await Saveaddress();
               // Get.snackbar(title:"Address added!"{
               // colorText: kText,
               // barBlur: 20,
               // });
                Get.back();

              }
          )

        ],
      ),


    ],
  )
    );
}
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          key:  scaffoldKey,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kSecondaryColor),
                onPressed:()=>Navigator.pop(context)),
            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Add address",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body:
          Container( decoration: BoxDecoration(
              gradient: fabGradient
          ) ,
              alignment: Alignment.center,child: form()),



      );



  }
}
