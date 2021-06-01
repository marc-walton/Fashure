import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/payments/Buyview.dart';
import 'package:get/get.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
// import 'package:frankfurter/frankfurter.dart';
import 'package:fashow/user.dart';
import 'package:fashow/add_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddressBuy extends StatefulWidget {
  final User currentUser;
  final String Amount;
final String Size;
final String prodId;
final String OwnerId;
  final String eur;
  final String usd;
  final String inr;
  final String gbp;
  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;
  AddressBuy({  this.usd,
    this.eur,
    this.inr,
    this.gbp,
    this.currentUser,this.productname,this.Amount,this.Size,this.prodId,this.OwnerId,this.profileimg,this.username,this.mediaUrl});
  @override
  _AddressBuyState createState() => _AddressBuyState();
}

class _AddressBuyState extends State<AddressBuy>  with AutomaticKeepAliveClientMixin<AddressBuy> {

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
 Widget nm(){
    return
    Container(
      child: StreamBuilder(
          stream: Firestore.instance
              .collection('Address').document(currentUser.id)
              .collection('useraddress')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                children: [
                  Text('You haven\'t saved an address' ),
                  // AddAdress(parentContext:context),
                ],
              );
            } else {
              return ListView.builder (
                // key: PageStorageKey(''),
                //   scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];

                    return

                      addressview(
                        Type: ds['type'],
                        Fullname: ds['fullname'],
                        Addresss: ds['address'],
                        City:  ds['city'],
                        State: ds['state'],
                        Country:  ds['country'],
                        Zip : ds['zip'],
                        Dialcode: ds['dialcode'],
                        Phone:  ds['phone'],
                        userSize:widget.Size,
                        prodId: widget.prodId,
                        total:widget.Amount,
                        ownerId: widget.OwnerId,
                        profileimg: widget.profileimg,
                        username: widget.username,
                        mediaUrl: widget.mediaUrl,
                          productname:widget.productname,
                      );
                  }
              );
            }
          }

      ),
    );
  }


  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
backgroundColor: kPrimaryColor,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Delivery address",
            style: TextStyle(color: Colors.white),
          ),
        ),
          actions: <Widget>[
            RaisedButton(
              color:kblue,
                child: Text('Add address',            style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  return
                    Get.to(AddAdress()) ;
                }
            ),
  ]
      ),
      body:
      Container(
        decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
        alignment: Alignment.center,
        child: StreamBuilder(
            stream: Firestore.instance
                .collection('Address').document(currentUser.id)
                .collection('useraddress')

                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('You haven\'t saved an address' );

              } else {
                return new ListView.builder (
                  // key: PageStorageKey(''),
                  //   scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];

                      return new

  addressview(
                      Type: ds['type'],
                        Fullname: ds['fullname'],
                        Addresss: ds['address'],
                        City:  ds['city'],
                        State: ds['state'],
                        Country:  ds['country'],
                        Zip : ds['zip'],
                        Dialcode: ds['code'],
                        Phone:  ds['phone'],
                        eur:widget.eur,
                        usd:widget.usd,
                        inr:widget.inr,
                        gbp:widget.gbp,
                        userSize:widget.Size,
                        prodId: widget.prodId,
                        total:widget.Amount,
                        ownerId: widget.OwnerId,
                        profileimg: widget.profileimg,
                        username: widget.username,
                        mediaUrl: widget.mediaUrl,
                        productname:widget.productname,
                      );


                    }
                );
              }
            }

        ),
      ),

    );
  }
}
class addressview extends StatelessWidget {
 final String Type ;
 final String Fullname ;
 final String Addresss ;
 final String City;
 final String State;
 final String Country;
 final String Zip;
 final String  Dialcode ;
 final String Phone;
 final String userSize;
 final String prodId;
 final String total;
 final String ownerId;
 final String profileimg;
 final String username;
 final String mediaUrl;
 final String productname;
 final String eur;
 final String usd;
 final String inr;
 final String gbp;
 SharedPreferences adPrefs;
addressview({  this.usd,
  this.eur,
  this.inr,
  this.gbp, this.Type,this.productname, this.Fullname, this.Addresss, this.City, this.State, this.Country, this.Zip, this.Dialcode, this.Phone, this.userSize, this.prodId, this.total, this.ownerId, this.profileimg, this.username, this.mediaUrl});
  @override
  Widget build(BuildContext context) {
    return

      Column(
        children:[

          Card(
            margin: EdgeInsets.all(3.0),
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10),
            ),
            color:Colors.white,
            child: Padding(
              padding:EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(Type,style:TextStyle(color:kText)),
                  Text(Fullname,style:TextStyle(color:kText)),
                  Text('$Addresss,$City,$State,$Country',style:TextStyle(color:kText)),
                  Text(Zip,style:TextStyle(color:kText)),
                  Text('$Dialcode,$Phone',style:TextStyle(color:kText)),
                    GFButton(
                      onPressed: () async
                      {

                        adPrefs = await SharedPreferences.getInstance();
                        await adPrefs.setString('type', Type);
                        await adPrefs.setString('fullname',Fullname);
                        await adPrefs.setString('address', Addresss);
                        await adPrefs.setString('city',City);
                        await adPrefs.setString('state', State);
                        await adPrefs.setString('country',Country);
                        await adPrefs.setString('zip',Zip);
                        await adPrefs.setString('code',Dialcode);
                        await adPrefs.setString('phone',Phone);
                        print('presses');
                        Get.off(
                            BuyView(
                              userSize:userSize,
                              prodId: prodId,
                              total:total,
                              ownerId: ownerId,
                              eur:eur,
                              usd:usd,
                              inr:inr,
                              gbp:gbp,
                              profileimg: profileimg,
                              username: username,
                              mediaUrl: mediaUrl,
                              productname:productname,)
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>));
                        // Navigator.pop(context);
                      },
                      text: "Select",
                      shape: GFButtonShape.pills,

                    ),
                ],

                ),
                ]
              ),

            ),
          ),
    ],
      );
  }
}
