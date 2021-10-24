import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Resale/ResalebuyView.dart';
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
class AddressResale extends StatefulWidget {
List<String> OwnerId ;
List<String> Amount ;
List<String> resaleId ;
List<String> profileimg ;
List<String> username ;
List<String> images ;
List<String> title ;
List<String>  country;
List<String>  size;
List<String>  shipcost;
List  usd;
List  eur;
List  gbp;
List  inr;
List<bool>  ship;

AddressResale({
 this.OwnerId,
 this.Amount,
 this.resaleId,
 this.profileimg,
 this.username,
 this.images,
 this.title,
 this. country,
 this.size,
 this. shipcost,
this. inr,
this. eur,
this. gbp,
this. usd,
this. ship,


});
  @override
  _AddressResaleState createState() => _AddressResaleState();
}

class _AddressResaleState extends State<AddressResale> with  AutomaticKeepAliveClientMixin<AddressResale> {

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

                          eur:widget.eur,
                          usd:widget.usd,
                          inr:widget.inr,
                          gbp:widget.gbp,
                          size:widget.size,
                          resaleId: widget.resaleId,
                          OwnerId: widget.OwnerId,

                          profileimg: widget.profileimg,
                          username: widget.username,
                          images: widget.images,
                          title:widget.title,

                          shipcost: widget.shipcost,
                          ship: widget.ship,

                          country: widget.country,

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
  // Widget build(BuildContext context) {
  //
  //   return Container(height: 100,
  //   child: ListView.builder(
  //     scrollDirection: Axis.vertical,
  //     shrinkWrap: true,
  //     itemCount: widget.OwnerId.length,
  //     itemBuilder: (context, index) {
  //       return Card(
  //           child: ListTile(
  //
  //             //same over here
  //             title: Text('${widget.OwnerId[index]}'),
  //             subtitle: Text('${widget.resaleId[index]}'),
  //             trailing: IconButton(
  //                 icon: Icon(Icons.calendar_today), onPressed: null),
  //           ));
  //     },
  //   ),
  //   );
  // }
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
  List<String> OwnerId ;
  List<String> Amount ;
  List<String> resaleId ;
  List<String> profileimg ;
  List<String> username ;
  List<String> images ;
  List<String> title ;
  List<String>  country;
  List<String>  size;
  List<String>  shipcost;
   List<bool>  ship;

  List  usd;
  List  eur;
  List  gbp;
  List  inr;

  SharedPreferences adPrefs;

  addressview({  this.usd,
    this.eur,
    this.inr,
    this.gbp,
    this.ship,

    this.country,

    this.Type,this.title, this.Fullname, this.Addresss, this.City, this.State, this.Country, this.Zip, this.Dialcode, this.Phone,
    this.size, this.profileimg, this.username, this.images,
   this.shipcost, this.OwnerId, this.resaleId, });
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

                              Get.off(()=>
                                  ResaleView(
                                    eur:eur,
                                    usd:usd,
                                    inr:inr,
                                    gbp:gbp,
                                    size:size,
                                    resaleId: resaleId,
                                    OwnerId: OwnerId,

                                    profileimg: profileimg,
                                    username: username,
                                    images: images,
                                    title:title,

                                    shipcost: shipcost,
                                    ship: ship,

                                    country: country,


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
