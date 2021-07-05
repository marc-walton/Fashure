import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/payments/Buyview.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
// import 'package:frankfurter/frankfurter.dart';
import 'package:fashow/user.dart';
import 'package:fashow/add_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddressBuy extends StatefulWidget {
  final Users currentUser;
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
  final int xxxs;
  final int xxs;
  final int xs;
  final int s;
  final int m;
  final int l;
  final int xl;
  final int xxl;
  final int xxxl;
  final int fourxl;
  final int fivexl;
  final int sixxl;
  final int sevenxl;
  final int eightxl;
  final int Shoe1;
  final int Shoe2;
  final int Shoe3;
  final int Shoe4;
  final int Shoe5;
  final int Shoe6;
  final int Shoe7;
  final int Shoe8;
  final int Shoe9;
  final int Shoe10;
  final int Shoe11;
  final int Shoe12;
  final int Shoe13;
  final int Shoe14;
  final int Shoe15;
  final int Shoe16;
  final int Shoe17;
  final int Shoe18;
  final int Shoe19;
  final int Shoe20;
  final int Shoe21;
  final int mto;
  final int freeSize;
  AddressBuy({
    this.freeSize,
    this.mto,
    this.xxxs,
    this.xxs,
    this.xs,
    this.s,
    this.m,
    this.l,
    this.xl,
    this.xxl,
    this.xxxl,
    this.fourxl,
    this.fivexl,
    this.sixxl,
    this.sevenxl,
    this.eightxl,
    this.Shoe1,
    this.Shoe2,
    this.Shoe3,
    this.Shoe4,
    this.Shoe5,
    this.Shoe6,
    this.Shoe7,
    this.Shoe8,
    this.Shoe9,
    this.Shoe10,
    this.Shoe11,
    this.Shoe12,
    this.Shoe13,
    this.Shoe14,
    this.Shoe15,
    this.Shoe16,
    this.Shoe17,
    this.Shoe18,
    this.Shoe19,
    this.Shoe20,
    this. Shoe21,
    this.usd,
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
          stream: FirebaseFirestore.instance
              .collection('Address').doc(currentUser.id)
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
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

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
                        xxxs: widget.xxxs,
                        xxs: widget.xxs,
                        xs: widget.xs,
                        s: widget.s,
                        m: widget.m,
                        l: widget.l,
                        xl: widget.xl,
                        xxl: widget.xxl,
                        xxxl: widget.xxxl,
                        fourxl: widget.fourxl,
                        fivexl: widget.fivexl,
                        sixxl: widget.sevenxl,
                        eightxl:widget. eightxl,
                        Shoe1: widget.Shoe1,
                        Shoe2: widget.Shoe2,
                        Shoe3: widget.Shoe3,
                        Shoe4: widget.Shoe4,
                        Shoe5: widget.Shoe5,
                        Shoe6: widget.Shoe6,
                        Shoe7: widget.Shoe7,
                        Shoe8: widget.Shoe8,
                        Shoe9: widget.Shoe9,
                        Shoe10: widget.Shoe10,
                        Shoe11: widget.Shoe11,
                        Shoe12: widget.Shoe12,
                        Shoe13: widget.Shoe13,
                        Shoe14: widget.Shoe14,
                        Shoe15: widget.Shoe15,
                        Shoe16: widget.Shoe16,
                        Shoe17: widget.Shoe17,
                        Shoe18: widget.Shoe18,
                        Shoe19: widget.Shoe19,
                        Shoe20: widget.Shoe20,
                        Shoe21: widget.Shoe21,
                        mto: widget.mto,
                        freeSize: widget.freeSize,
                      );
                  }
              );
            }
          }

      ),
    );
  }
  void initState() {
    super.initState();
    print(widget.fourxl);

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
            stream: FirebaseFirestore.instance
                .collection('Address').doc(currentUser.id)
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
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];

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
                        xxxs: widget.xxxs,
                        xxs: widget.xxs,
                        xs: widget.xs,
                        s: widget.s,
                        m: widget.m,
                        l: widget.l,
                        xl: widget.xl,
                        xxl: widget.xxl,
                        xxxl: widget.xxxl,
                        fourxl: widget.fourxl,
                        fivexl: widget.fivexl,
                        sixxl: widget.sevenxl,
                        eightxl:widget. eightxl,
                        Shoe1: widget.Shoe1,
                        Shoe2: widget.Shoe2,
                        Shoe3: widget.Shoe3,
                        Shoe4: widget.Shoe4,
                        Shoe5: widget.Shoe5,
                        Shoe6: widget.Shoe6,
                        Shoe7: widget.Shoe7,
                        Shoe8: widget.Shoe8,
                        Shoe9: widget.Shoe9,
                        Shoe10: widget.Shoe10,
                        Shoe11: widget.Shoe11,
                        Shoe12: widget.Shoe12,
                        Shoe13: widget.Shoe13,
                        Shoe14: widget.Shoe14,
                        Shoe15: widget.Shoe15,
                        Shoe16: widget.Shoe16,
                        Shoe17: widget.Shoe17,
                        Shoe18: widget.Shoe18,
                        Shoe19: widget.Shoe19,
                        Shoe20: widget.Shoe20,
                        Shoe21: widget.Shoe21,
                        mto: widget.mto,
                        freeSize: widget.freeSize,
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
 final int xxxs;
 final int xxs;
 final int xs;
 final int s;
 final int m;
 final int l;
 final int xl;
 final int xxl;
 final int xxxl;
 final int fourxl;
 final int fivexl;
 final int sixxl;
 final int sevenxl;
 final int eightxl;
 final int Shoe1;
 final int Shoe2;
 final int Shoe3;
 final int Shoe4;
 final int Shoe5;
 final int Shoe6;
 final int Shoe7;
 final int Shoe8;
 final int Shoe9;
 final int Shoe10;
 final int Shoe11;
 final int Shoe12;
 final int Shoe13;
 final int Shoe14;
 final int Shoe15;
 final int Shoe16;
 final int Shoe17;
 final int Shoe18;
 final int Shoe19;
 final int Shoe20;
 final int Shoe21;
 final int mto;
 final int freeSize;
 SharedPreferences adPrefs;
addressview({  this.usd,
  this.eur,
  this.inr,
  this.gbp,
  this.freeSize,
  this.mto,
  this.xxxs,
  this.xxs,
  this.xs,
  this.s,
  this.m,
  this.l,
  this.xl,
  this.xxl,
  this.xxxl,
  this.fourxl,
  this.fivexl,
  this.sixxl,
  this.sevenxl,
  this.eightxl,
  this.Shoe1,
  this.Shoe2,
  this.Shoe3,
  this.Shoe4,
  this.Shoe5,
  this.Shoe6,
  this.Shoe7,
  this.Shoe8,
  this.Shoe9,
  this.Shoe10,
  this.Shoe11,
  this.Shoe12,
  this.Shoe13,
  this.Shoe14,
  this.Shoe15,
  this.Shoe16,
  this.Shoe17,
  this.Shoe18,
  this.Shoe19,
  this.Shoe20,
  this. Shoe21,
  this.Type,this.productname, this.Fullname, this.Addresss, this.City, this.State, this.Country, this.Zip, this.Dialcode, this.Phone, this.userSize, this.prodId, this.total, this.ownerId, this.profileimg, this.username, this.mediaUrl});
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
                              productname:productname,
                              xxxs: xxxs,
                              xxs: xxs,
                              xs: xs,
                              s: s,
                              m: m,
                              l: l,
                              xl: xl,
                              xxl: xxl,
                              xxxl: xxxl,
                              fourxl: fourxl,
                              fivexl: fivexl,
                              sixxl: sevenxl,
                              eightxl: eightxl,
                              Shoe1: Shoe1,
                              Shoe2: Shoe2,
                              Shoe3: Shoe3,
                              Shoe4: Shoe4,
                              Shoe5: Shoe5,
                              Shoe6: Shoe6,
                              Shoe7: Shoe7,
                              Shoe8: Shoe8,
                              Shoe9: Shoe9,
                              Shoe10: Shoe10,
                              Shoe11: Shoe11,
                              Shoe12: Shoe12,
                              Shoe13: Shoe13,
                              Shoe14: Shoe14,
                              Shoe15: Shoe15,
                              Shoe16: Shoe16,
                              Shoe17: Shoe17,
                              Shoe18: Shoe18,
                              Shoe19: Shoe19,
                              Shoe20: Shoe20,
                              Shoe21: Shoe21,
                              mto: mto,
                              freeSize: freeSize,)
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
