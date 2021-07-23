// ingore_for_file: prefer_expression_function_bodies

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Live/models/buy_confirm.dart';
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
class AddressAuction extends StatefulWidget {
  final Users currentUser;
  final String Amount;
  final String prodId;
  final String OwnerId;

  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;


  final String mtoText;

  final String country;


  AddressAuction({

    this.country,


    this.currentUser,this.productname,this.Amount,this.prodId,this.OwnerId,this.profileimg,this.username,this.mediaUrl,
    this.mtoText,});

  @override
  _AddressAuctionState createState() => _AddressAuctionState();
}

class _AddressAuctionState extends State<AddressAuction>  with AutomaticKeepAliveClientMixin<AddressAuction> {

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

                        prodId: widget.prodId,
                        total:widget.Amount,
                        ownerId: widget.OwnerId,
                        profileimg: widget.profileimg,
                        username: widget.username,
                        mediaUrl: widget.mediaUrl,
                        productname:widget.productname,

                        mtoText: widget.mtoText,

                        country: widget.country,

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
  final String prodId;
  final String total;
  final String ownerId;
  final String profileimg;
  final String username;
  final String mediaUrl;
  final String productname;

  final String mtoText;


  SharedPreferences adPrefs;



  final String country;





  addressview({
    this.country,
    this.mtoText,
    this.Type,this.productname, this.Fullname, this.Addresss, this.City, this.State, this.Country,
    this.Zip, this.Dialcode, this.Phone, this.prodId, this.total, this.ownerId,
    this.profileimg, this.username, this.mediaUrl,
});
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
              color:Colors.white.withOpacity(0.5),
              child: Padding(
                padding:EdgeInsets.only(left: 5.0),
                child: Row(
                    children: [
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(Type,style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 5,fontWeight: FontWeight.bold)),
                          Text(Fullname,style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 5)),
                          Text('$Addresss,',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),
                          Text('$City',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),
                          Text('$State,',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),
                          Text('$Country',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),

                          Text(Zip,style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),
                          Text('$Dialcode,$Phone',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal * 4)),
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
                                  BuyConfirm(

                                    prodId: prodId,
                                    total:total,
                                    ownerId: ownerId,

                                    profileimg: profileimg,
                                    username: username,
                                    mediaUrl: mediaUrl,
                                    productname:productname,

                                    mtoText: mtoText,

                                    country:country,

                                  )
                              );

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
          ),
        ],
      );
  }
}
