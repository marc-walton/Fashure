// ingore_for_file: prefer_expression_function_bodies

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
 final int Ring1;
  final int Ring2;
  final int Ring3;
  final int Ring4;
  final int Ring5;
  final int Ring6;
  final int Ring7;
  final int Ring8;
  final int Ring9;
  final int Ring10;
  final int Ring11;
  final int Ring12;
  final int Ring13;
  final int Ring14;
  final int Ring15;
  final int Ring16;
  final int Ring17;
  final int Ring18;
  final int Ring19;
  final int Ring20;
  final int  Ring21;
  final int  Ring22;
  final int  Ring23;
  final int custom12;
  final int custom22;
  final int custom32;
  final int custom42;
  final int custom52;
  final int custom62;
  final int custom72;
  final int  custom82;
  final int custom92;
  final int custom102;
  final int color1;
  final int color2;
  final int color3;
  final int color4;
  final int color5;
  final int color6;
  final int color7;
  final int color8;
  final int color9;
  final int color10;
   final String colorText;
    final String mtoText;
    final String shipcost;
    final String shipcostuser;
    final String custompriceusd;
    final String custompriceinr;
      final String price;
    final String customprice;
    final String country;
    final String color;


  AddressBuy({
    this.freeSize,
    this.shipcost,
    this.shipcostuser,
    this.custompriceusd,
    this.custompriceinr,
    this.price,
    this.customprice,
    this.country,
    this.color,

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
    this.currentUser,this.productname,this.Amount,this.Size,this.prodId,this.OwnerId,this.profileimg,this.username,this.mediaUrl,
    this.Ring1, this.Ring2, this.Ring3, this.Ring4, this.Ring5, this.Ring6,
    this.Ring7, this.Ring8, this.Ring9, this.Ring10, this.Ring11, this.Ring12,
    this.Ring13, this.Ring14, this.Ring15, this.Ring16, this.Ring17, this.Ring18,
    this.Ring19, this.Ring20, this.Ring21, this.Ring22, this.Ring23,
    this.custom12, this.custom22, this.custom32, this.custom42, this.custom52,
    this.custom62, this.custom72, this.custom82, this.custom92, this.custom102,
    this.color1, this.color2, this.color3, this.color4, this.color5, this.color6,
    this.color7, this.color8, this.color9, this.color10, this.colorText, this.mtoText, });

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
  void initState() {
    super.initState();

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
                         Ring1: widget.Ring1,
                        Ring2: widget.Ring2,
                        Ring3: widget.Ring3,
                        Ring4: widget.Ring4,
                        Ring5: widget.Ring5,
                        Ring6: widget.Ring6,
                        Ring7: widget.Ring7,
                        Ring8: widget.Ring8,
                        Ring9: widget.Ring9,
                        Ring10: widget.Ring10,
                        Ring11: widget.Ring11,
                        Ring12: widget.Ring12,
                        Ring13: widget.Ring13,
                        Ring14: widget.Ring14,
                        Ring15: widget.Ring15,
                        Ring16: widget.Ring16,
                        Ring17: widget.Ring17,
                        Ring18: widget.Ring18,
                        Ring19: widget.Ring19,
                        Ring20: widget.Ring20,
                        Ring21: widget.Ring21,
                         Ring22: widget.Ring22,
                         Ring23: widget.Ring23,
                        color1: widget.color1,
                        color2: widget.color2,
                        color3: widget.color3,
                        color4: widget.color4,
                        color5: widget.color5,
                        color6: widget.color6,
                        color7: widget.color7,
                        color8: widget.color8,
                        color9: widget.color9,
                        color10: widget.color10,
                        custom12: widget.custom12,
                        custom22: widget.custom22,
                        custom32: widget.custom32,
                        custom42: widget.custom42,
                        custom52: widget.custom52,
                        custom62: widget.custom62,
                        custom72: widget.custom72,
                        custom82: widget.custom82,
                        custom92: widget.custom92,
                        custom102: widget.custom102,
                        mto: widget.mto,
                        mtoText: widget.mtoText,
                         colorText: widget.colorText,
                        shipcost: widget.shipcost,
                        shipcostuser: widget.shipcostuser,
                        custompriceusd: widget.custompriceusd,
                        custompriceinr: widget.custompriceinr,
                        price: widget.price,
                        customprice: widget.customprice,
                        country: widget.country,
                        color: widget.color,

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
 final String mtoText;

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
 final int Ring1;
 final int Ring2;
 final int Ring3;
 final int Ring4;
 final int Ring5;
 final int Ring6;
 final int Ring7;
 final int Ring8;
 final int Ring9;
 final int Ring10;
 final int Ring11;
 final int Ring12;
 final int Ring13;
 final int Ring14;
 final int Ring15;
 final int Ring16;
 final int Ring17;
 final int Ring18;
 final int Ring19;
 final int Ring20;
 final int  Ring21;
 final int  Ring22;
 final int  Ring23;
 final int custom12;
 final int custom22;
 final int custom32;
 final int custom42;
 final int custom52;
 final int custom62;
 final int custom72;
 final int  custom82;
 final int custom92;
 final int custom102;
 final int color1;
 final int color2;
 final int color3;
 final int color4;
 final int color5;
 final int color6;
 final int color7;
 final int color8;
 final int color9;
 final int color10;
 final String colorText;
 final String shipcost;
 final String custompriceusd;
 final String custompriceinr;
 final String shipcostusd;
 final String shipcostuser;
 final String customusd;
 final String custominr;
 final String price;
 final String customprice;
 final String country;
 final String color;





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

   this.shipcostuser,
   this.custompriceusd,
   this.custompriceinr,
   this.price,
   this.customprice,
   this.country,
   this.color,

   this.Ring1, this.Ring2, this.Ring3, this.Ring4, this.Ring5, this.Ring6,
   this.Ring7, this.Ring8, this.Ring9, this.Ring10, this.Ring11, this.Ring12,
   this.Ring13, this.Ring14, this.Ring15, this.Ring16, this.Ring17, this.Ring18,
   this.Ring19, this.Ring20, this.Ring21, this.Ring22, this.Ring23,
   this.custom12, this.custom22, this.custom32, this.custom42, this.custom52,
   this.custom62, this.custom72, this.custom82, this.custom92, this.custom102,
   this.color1, this.color2, this.color3, this.color4, this.color5, this.color6,
   this.color7, this.color8, this.color9, this.color10, this.colorText, this.mtoText,
  this.Type,this.productname, this.Fullname, this.Addresss, this.City, this.State, this.Country, this.Zip, this.Dialcode, this.Phone, this.userSize, this.prodId, this.total, this.ownerId, this.profileimg, this.username, this.mediaUrl,
  this.shipcostusd,  this.customusd, this.custominr, this.shipcost});
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
                              Ring1: Ring1,
                              Ring2: Ring2,
                              Ring3: Ring3,
                              Ring4: Ring4,
                              Ring5: Ring5,
                              Ring6: Ring6,
                              Ring7: Ring7,
                              Ring8: Ring8,
                              Ring9: Ring9,
                              Ring10: Ring10,
                              Ring11: Ring11,
                              Ring12: Ring12,
                              Ring13: Ring13,
                              Ring14: Ring14,
                              Ring15: Ring15,
                              Ring16: Ring16,
                              Ring17: Ring17,
                              Ring18: Ring18,
                              Ring19: Ring19,
                              Ring20: Ring20,
                              Ring21: Ring21,
                              Ring22: Ring22,
                              Ring23: Ring23,
                              color1: color1,
                              color2: color2,
                              color3: color3,
                              color4: color4,
                              color5: color5,
                              color6: color6,
                              color7: color7,
                              color8: color8,
                              color9: color9,
                              color10: color10,
                              custom12: custom12,
                              custom22: custom22,
                              custom32: custom32,
                              custom42: custom42,
                              custom52: custom52,
                              custom62: custom62,
                              custom72: custom72,
                              custom82: custom82,
                              custom92: custom92,
                              custom102: custom102,
                              mto: mto,
                              mtoText: mtoText,
                              colorText: colorText,
                              freeSize: freeSize,

                              shipcost:shipcost,
                              shipcostuser:shipcostuser,
                              custompriceusd:custompriceusd,
                              custompriceinr:custompriceinr,
                              price:price,
                              customprice:customprice,
                              country:country,
                              color:color,

                            )
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
