import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fashow/payments/Servicepayment.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
// import 'package:frankfurter/frankfurter.dart';
import 'package:fashow/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddressSer extends StatefulWidget {
  final User currentUser;
  final String Amount;
final String username;
final String profileimg;
final String cusId;
  final String OwnerId;
final String OrderId;

  AddressSer({this.cusId,this.currentUser,this.Amount,this.OwnerId,this.OrderId,this.username,this.profileimg});
  @override
  _AddressSerState createState() => _AddressSerState();
}

class _AddressSerState extends State<AddressSer>  with AutomaticKeepAliveClientMixin<AddressSer> {

  ScrollController _controller;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController nicknamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController zipcontroller = TextEditingController();
  TextEditingController telephonecontroller = TextEditingController();
  String country;
  String dialcode;
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
  File file;
  bool isUploading = false;
  String addId = Uuid().v4();
  List<String> selectedSizes = <String>[];
  String dropdownValue = 'Women';

//  var colorOptions = ['Blue ', 'yellow', 'red','brown','pink','green','black','grey','white','Neutral',];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;

  @override
  Saveaddress()async*{
    addressRef
        .document(widget.currentUser.id)
        .collection("useraddress")
        .document(addId)
        .setData({
      "userId": widget.currentUser.id,
      "username": widget.currentUser.username,
      "photoUrl": widget.currentUser.photoUrl,
      "displayName": widget.currentUser.displayName,
      "fullname":namecontroller.text,
      "type":nicknamecontroller.text,
      "address":addresscontroller.text,
      "city":citycontroller.text,
      "state":statecontroller.text,
      "zip":zipcontroller.text,
      "phone":telephonecontroller.text,
      "country":country,
      "code":dialcode,
    });
  }
  AddAdress(){
    return
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: kSecondaryColor,
              title: Text("Add Address"),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          maxLines: null,
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Full name',
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Type of address is empty(Home,Work..)',
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Address',
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
                      Center(
                        child: CountryListPick(

                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: true,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          initialSelection: '+91',
                          onChanged: (CountryCode code) {
                            print(code.name);
                            print(code.code);
                            print(code.dialCode);
                            print(code.flagUri);
                            setState(() {
                              country = code.name;
                              dialcode = code.dialCode;
                            });
                          },
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: citycontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'City',
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'State',
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Zip Code',
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
                      Row(
                        children: [
                          Container(
                            child: Text('$dialcode'),
                          ),
                          SizedBox(width: 5.0,),
                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLines: null,
                              controller: telephonecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                                hintText: 'Mobile number',
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

                        ],
                      ),
                      Row(
                        children: [
                          RaisedButton(
                            child: Text('Cancel'),
                            onPressed: ()=>Navigator.pop(context),
                          ),
                          SizedBox(width: 5.0,),
                          RaisedButton(
                            child: Text('Save'),
                            onPressed: ()=>Saveaddress(),
                          )

                        ],
                      ),


                    ],
                  ),
                )
              ],
            );
          });

  }
  Showaddress({String Type,
    String Fullname,
    String Addresss,
    String City,
    String State,
    String Country,
    String Zip,
    String  Dialcode,
    String Phone}){
    return
      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return

              Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      getAdress(),
                    ],
                  ),
                ),
              );

          }
      );
  }
  getAdress()async{
    return
      FutureBuilder(
          future: Firestore.instance
              .collection('Address').document(widget.currentUser.id)
              .collection('useraddress')
              .orderBy('timestamp', descending: true)
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                children: [
                  Text('You haven\'t saved an address' ),
                  AddAdress()
                ],
              );
            } else {
              return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Expanded(
                  child: new ListView.builder (
                      key: PageStorageKey(''),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                        String Type = ds['type'];
                        String Fullname = ds['fullname'];
                        String Addresss = ds['address'];
                        String City =  ds['city'];
                        String State = ds['state'];
                        String Country =  ds['country'];
                        String Zip =  ds['zip'];
                        String  Dialcode = ds['dialcode'];
                        String Phone =  ds['phone'];

                        return
                          GestureDetector(
                            onTap: () async {
                              adPrefs = await SharedPreferences.getInstance();
                              await adPrefs.setString('type', ds['type']);
                              await adPrefs.setString('fullname', ds['fullname']);
                              await adPrefs.setString('address',  ds['address']);
                              await adPrefs.setString('city',ds['city']);
                              await adPrefs.setString('state', ds['state']);
                              await adPrefs.setString('country',ds['country']);
                              await adPrefs.setString('zip',ds['zip']);
                              await adPrefs.setString('dialcode',ds['dialcode']);
                              await adPrefs.setString('phone',ds['phone']);

                              Navigator.push(context, MaterialPageRoute(builder: (context) =>PaymentSer(
                                OrderId: widget.OrderId,
                                Amount:widget.Amount,
                                OwnerId: widget.OwnerId,
                                cusId: widget.cusId,
                                username: widget.username,
                                profileimg: widget.profileimg,)));
                              Navigator.pop(context);
                            },
                            child:   Card(
                              child: Expanded(
                                child:  new  Column(children: <Widget>[
                                  Text(Type),
                                  Text(Fullname),
                                  Text(Addresss),
                                  Text(City),
                                  Text(State),
                                  Text(Country),
                                  Text(Zip),
                                  Row(
                                    children: [
                                      Text(Dialcode),
                                      Text(Phone),

                                    ],
                                  ),


                                  Divider(color: kGrey,),
                                ],

                                ),
                              ),
                            ),
                          );
                      }
                  ),
                ),
              );
            }
          }

      );

  }
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      key:  scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kSecondaryColor),
            onPressed:()=>Navigator.pop(context)),
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Delivery address",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body:

      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[

            RaisedButton(
              child: Text('Select address'),
              onPressed: ()=>Showaddress,
            ),


            SizedBox( height: 8.0,),
            RaisedButton(
              child: Text('Add address'),
              onPressed: ()=>AddAdress,
            ),


            (_inProcess)?Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.95,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):Center()
          ],
        ),
      ),
    );
  }
}
