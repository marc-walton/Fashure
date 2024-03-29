
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/payments/Buyview.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/size_config.dart';
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
  var eur;
  var usd;
  var inr;
  var gbp;
  var userVariationQuantity;
  var userSizeQuantity;
 var userColorQuantity;
  final String  userVariationImg ;

  final bool freeship;
  final bool freeworldship;

  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;

   final String colorText;
    final String mtoText;
     var shipcost;
  var shipcostuser;
  var custompriceusd;
  var custompriceinr;
  var price;
  var customprice;
    final String country;
    final String color;
 final String displaysize;
 final String customIndex;
  final String userCustom;


  AddressBuy({
    this.shipcost,
    this.shipcostuser,
    this.custompriceusd,
    this.custompriceinr,
    this.price,
    this.customprice,
    this.country,
    this.color,
 this.displaysize,
this.customIndex,
this.userCustom,

    this.usd,
    this.eur,
    this.inr,
    this.gbp,
    this.currentUser,this.productname,this.Amount,this.Size,this.prodId,this.OwnerId,this.profileimg,this.username,this.mediaUrl,
     this.colorText, this.mtoText, this.freeship, this.freeworldship, this.userVariationImg,
    this.userVariationQuantity,
    this.userSizeQuantity, this.userColorQuantity, });

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

      ),
      body:
      Container(
        color:Colors.grey.shade200,
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

                      return Column(
                        children: [
                          new

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
                            countryISO: currentUser.countryISO,

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
                            freeship:widget.freeship,
                            freeworldship:widget.freeworldship,
                            displaysize:widget.displaysize,
                            customIndex:widget.customIndex,
                            userCustom:widget.userCustom,
                            userVariationQuantity:widget.userVariationQuantity,
                            userSizeQuantity: widget.userSizeQuantity,
                            userColorQuantity:widget.userColorQuantity,

                            userVariationImg:    widget.userVariationImg ?? "" ,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              margin: EdgeInsets.all(3.0),
                              shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(10),
                              ),
                              color:Colors.white,
                              child: Padding(
                                padding:EdgeInsets.only(left: 5.0),
                                child: Column(
                                    children: [
                                      GFButton(
                                        onPressed: ()
                                        {
                                          Get.to(AddAdress()) ;


                                        },
                                        text: "Add address",
                                        shape: GFButtonShape.pills,
                                        color: Colors.black,
                                      ),
                                    ]
                                ),

                              ),
                            ),
                          ),

                        ],
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
 var eur;
var usd;
 var inr;
 var gbp;
 final String mtoText;
  final String countryISO;
 final String customIndex;
 final String userCustom;

 final bool freeship;
final bool freeworldship;

 SharedPreferences adPrefs;

 final String colorText;
 var shipcost;
 var custompriceusd;
 var custompriceinr;
 var shipcostusd;
 var shipcostuser;
 var customusd;
 var custominr;
 var price;
 var customprice;
 final String country;
 final String color;
final String displaysize;
 var userVariationQuantity;
 var userSizeQuantity;
 var userColorQuantity;

 final String  userVariationImg ;




 addressview({  this.usd,
  this.eur,
  this.inr,
  this.gbp,
this.displaysize,
this.countryISO,
this.customIndex,
this.userCustom,


   this.shipcostuser,
   this.custompriceusd,
   this.custompriceinr,
   this.price,
   this.customprice,
   this.country,
   this.color,

   this.colorText, this.mtoText,
  this.Type,this.productname, this.Fullname, this.Addresss, this.City, this.State, this.Country, this.Zip, this.Dialcode, this.Phone, this.userSize, this.prodId, this.total, this.ownerId, this.profileimg, this.username, this.mediaUrl,
  this.shipcostusd,  this.customusd, this.custominr, this.shipcost, this.freeship, this.freeworldship, this.userVariationImg,
      this.userVariationQuantity,
   this.userSizeQuantity, this.userColorQuantity});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return

      Column(
        children:[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
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
                    Text(Type,style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3,fontWeight: FontWeight.bold)),
                    Text(Fullname,style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),
                    Text('$Addresss,',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),
                     Text('$City',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),
                    Text('$State,',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),
                    Text('$Country',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),
                          Text('$countryISO',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),

                    Text(Zip,style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),
                    Text('$Dialcode,$Phone',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 3)),
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
                           await adPrefs.setString('countryIso',countryISO);

                          Get.off(()=>
                              BuyView(
                                displaysize:displaysize,
                                userSize:userSize,
                                prodId: prodId,
                                total:total,
                                ownerId: ownerId,
                                eur:eur,
                                usd:usd,
                                inr:inr,
                                gbp:gbp,
                                freeship:freeship,
                                freeworldship:freeworldship,
                                userVariationQuantity:userVariationQuantity,
                                userSizeQuantity: userSizeQuantity,
                                userColorQuantity:userColorQuantity,

                                userVariationImg:    userVariationImg ?? "" ,
                                profileimg: profileimg,
                                username: username,
                                mediaUrl: mediaUrl,
                                productname:productname,

                                mtoText: mtoText,
                                colorText: colorText,
                                customIndex:customIndex,
                                userCustom:userCustom,

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
                        text: "Deliver to this address",
                        shape: GFButtonShape.pills,
color: Colors.black,
                      ),
                  ],

                  ),
                  ]
                ),

              ),
            ),
          ),
    ],
      );
  }
}
