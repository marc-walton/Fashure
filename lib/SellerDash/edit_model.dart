import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';

import 'package:fashow/progress.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fashow/Constants.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Profile.dart';
class ProdEdit extends StatefulWidget {
  final String prodId;
  final String ownerId;
  final String username;
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
  final String gender;
// final String selectedSizes;

  final String productname;
  final String details;
  final String color;
  final String composition;
  final String washandcare;
  final String sizeandfit;
  final String shopmediaUrl;
  final String photoUrl;
  final int freesize;
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
  final int  Shoe8;
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
  final int  Shoe21;
  final int mto;
  final User currentUser;

  ProdEdit({
    this.prodId,
    this.ownerId,
    this.username,
    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
    // this.selectedSizes,

    this.gender,
    this.details,
    this.productname,
    this.color,
    this.composition,
    this.washandcare,
    this.sizeandfit,
    this.shopmediaUrl,
    this.freesize,
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
    this.photoUrl,
    this.currentUser,
  });

  factory ProdEdit.fromDocument(DocumentSnapshot doc) {

    return ProdEdit(
      prodId: doc['prodId'],
      ownerId: doc['ownerId'],
      username: doc['displayName'],

      eur: doc['eur'],
      usd: doc['usd'],
      inr: doc['inr'],
      cny: doc['cny'],
      gbp: doc['gbp'],
      gender: doc['Gender'],
      // selectedSizes: doc['selectedSizes'],
      mto: doc['mtoQuantity'],
      xxxs: doc['xxxsQuantity'],
      xxs: doc['xxsQuantity'],
      xs: doc['xsQuantity'],
      s: doc['sQuantity'],
      m: doc['mQuantity'],
      l: doc['lQuantity'],
      xl: doc['xlQuantity'],
      xxl: doc['xxlQuantity'],
      xxxl: doc['xxxlQuantity'],
      fourxl: doc['4xlQuantity'],
      fivexl: doc['5xlQuantity'],
      sixxl: doc['6xlQuantity'],
      sevenxl: doc['7xlQuantity'],
      eightxl: doc['8xlQuantity'],
      Shoe1: doc['Shoe1'],
      Shoe2: doc['Shoe2'],
      Shoe3: doc['Shoe3'],
      Shoe4: doc['Shoe4'],
      Shoe5: doc['Shoe5'],
      Shoe6: doc['Shoe6'],
      Shoe7: doc['Shoe7'],
      Shoe8: doc['Shoe8'],
      Shoe9: doc['Shoe9'],
      Shoe10: doc['Shoe10'],
      Shoe11: doc['Shoe11'],
      Shoe12: doc['Shoe12'],
      Shoe13: doc['Shoe13'],
      Shoe14: doc['Shoe14'],
      Shoe15: doc['Shoe15'],
      Shoe16: doc['Shoe16'],
      Shoe17: doc['Shoe17'],
      Shoe18: doc['Shoe18'],
      Shoe19: doc['Shoe19'],
      Shoe20: doc['Shoe20'],
      Shoe21: doc['Shoe21'],
      productname: doc['productname'],
      details: doc['details'],
      shopmediaUrl: doc['shopmediaUrl'],
      color:doc['color'],
      composition:doc['composition'],
      washandcare:doc['washandcare'],
      sizeandfit:doc['sizeandfit'],
      photoUrl:doc['photoUrl'],
      freesize:doc['freesizeQuantity'],
    );
  }


  @override
  _ProdEditState createState() => _ProdEditState(
    prodId: this.prodId,
    ownerId: this.ownerId,
    username: this.username,
    eur:this.eur,
    usd:this.usd,
    inr:this.inr,
    cny: this.cny,
    gbp: this.gbp,
    mto:this.mto,
    gender:this.gender,
    details:this.details,
    productname: this.productname,
    color: this.color,
    composition: this.composition,
    washandcare: this.washandcare,
    sizeandfit: this.sizeandfit,
    shopmediaUrl: this.shopmediaUrl,
    photoUrl:this.photoUrl,
    freesize:this.freesize,
    xxxs: this.xxxs,
    xxs: this.xxs,
    xs: this.xs,
    s: this.s,
    m: this.m,
    l: this.l,
    xl: this.xl,
    xxl: this.xxl,
    xxxl: this.xxxl,
    fourxl: this.fourxl,
    fivexl: this.fivexl,
    sixxl: this.sixxl,
    sevenxl: this.sevenxl,
    eightxl: this.eightxl,
    Shoe1:this.Shoe1,
    Shoe2:this.Shoe2,
    Shoe3:this.Shoe3,
    Shoe4:this.Shoe4,
    Shoe5:this.Shoe5,
    Shoe6:this.Shoe6,
    Shoe7:this.Shoe7,
    Shoe8:this.Shoe8,
    Shoe9:this.Shoe9,
    Shoe10:this.Shoe10,
    Shoe11:this.Shoe11,
    Shoe12:this.Shoe12,
    Shoe13:this.Shoe13,
    Shoe14:this.Shoe14,
    Shoe15:this.Shoe15,
    Shoe16:this.Shoe16,
    Shoe17:this.Shoe17,
    Shoe18:this.Shoe18,
    Shoe19:this.Shoe19,
    Shoe20:this.Shoe20,
    Shoe21:this.Shoe21,
  );
}

class _ProdEditState extends State<ProdEdit>
  with AutomaticKeepAliveClientMixin<ProdEdit> {

  TextEditingController xxxscontroller = TextEditingController();
  TextEditingController xxscontroller = TextEditingController();
  TextEditingController xscontroller = TextEditingController();
  TextEditingController scontroller = TextEditingController();
  TextEditingController mcontroller = TextEditingController();
  TextEditingController lcontroller = TextEditingController();
  TextEditingController xlcontroller = TextEditingController();
  TextEditingController xxlcontroller = TextEditingController();
  TextEditingController xxxlcontroller = TextEditingController();
  TextEditingController fourxlcontroller = TextEditingController();
  TextEditingController fivexlcontroller = TextEditingController();
  TextEditingController sixxlcontroller = TextEditingController();
  TextEditingController sevenxlcontroller = TextEditingController();
  TextEditingController eightxlcontroller = TextEditingController();
  TextEditingController mtocontroller = TextEditingController();
  TextEditingController freesizecontroller = TextEditingController();
  TextEditingController Shoe1controller = TextEditingController();
  TextEditingController Shoe2controller = TextEditingController();
  TextEditingController Shoe3controller = TextEditingController();
  TextEditingController Shoe4controller = TextEditingController();
  TextEditingController Shoe5controller = TextEditingController();
  TextEditingController Shoe6controller = TextEditingController();
  TextEditingController Shoe7controller = TextEditingController();
  TextEditingController Shoe8controller = TextEditingController();
  TextEditingController Shoe9controller = TextEditingController();
  TextEditingController Shoe10controller = TextEditingController();
  TextEditingController Shoe11controller = TextEditingController();
  TextEditingController Shoe12controller = TextEditingController();
  TextEditingController Shoe13controller = TextEditingController();
  TextEditingController Shoe14controller = TextEditingController();
  TextEditingController Shoe15controller = TextEditingController();
  TextEditingController Shoe16controller = TextEditingController();
  TextEditingController Shoe17controller = TextEditingController();
  TextEditingController Shoe18controller = TextEditingController();
  TextEditingController Shoe19controller = TextEditingController();
  TextEditingController Shoe20controller = TextEditingController();
  TextEditingController Shoe21controller = TextEditingController();
  bool isUploading = false;


//  var colorOptions = ['Blue ', 'yellow', 'red','brown','pink','green','black','grey','white','Neutral',];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  String usersize;
  final String currentUserId = currentUser?.id;
  final String prodId;
  final String ownerId;
  final String username;
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
  final String gender;

  final String productname;
  final String details;
  final String color;
  final String composition;
  final String washandcare;
  final String sizeandfit;
  final String shopmediaUrl;
  final String photoUrl;
  final int freesize;
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
  final int  Shoe8;
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
  final int  Shoe21;
  final int mto;
  bool isLoading = false;


  _ProdEditState({
    this.prodId,
    this.ownerId,
    this.username,
    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
    // this.selectedSizes,

    this.gender,
    this.details,
    this.productname,
    this.color,
    this.freesize,
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
    this.composition,
    this.washandcare,
    this.sizeandfit,
    this.shopmediaUrl,
    this.photoUrl,
  });


  void initState() {
    // initialize controller
    // parse();

    super.initState();
    getSizes();  }

  getSizes() async {
    setState(() {
      isLoading = true;

    });
     xxxscontroller.text = xxxs.toString();
    xxxscontroller.text = xxxs.toString();
    xxscontroller.text = xxs.toString();
    xscontroller.text = xs.toString();
    scontroller.text = s.toString();
    mcontroller.text = m.toString();
    lcontroller.text = l.toString();
    xlcontroller.text = xl.toString();
    xxlcontroller.text = xxl.toString();
    xxxlcontroller.text = xxxl.toString();
    fourxlcontroller.text = fourxl.toString();
    fivexlcontroller.text = fivexl.toString();
    sixxlcontroller.text = sixxl.toString();
    sevenxlcontroller.text = sevenxl.toString();
    eightxlcontroller.text = eightxl.toString();
    mtocontroller.text = mto.toString();
     freesizecontroller.text = freesize.toString();
     Shoe1controller.text = Shoe1.toString();
     Shoe2controller.text = Shoe2.toString();
     Shoe3controller.text = Shoe3.toString();
     Shoe4controller.text = Shoe4.toString();
     Shoe5controller.text = Shoe5.toString();
     Shoe6controller.text = Shoe6.toString();
     Shoe7controller.text = Shoe7.toString();
     Shoe8controller.text = Shoe8.toString();
     Shoe9controller.text = Shoe9.toString();
     Shoe10controller.text =Shoe10.toString();
     Shoe11controller.text =Shoe11.toString();
     Shoe12controller.text =Shoe12.toString();
     Shoe13controller.text =Shoe13.toString();
      Shoe14controller.text =Shoe14.toString();

     Shoe15controller.text =Shoe15.toString();
     Shoe16controller.text =Shoe16.toString();
     Shoe17controller.text =Shoe17.toString();
     Shoe18controller.text =Shoe18.toString();
     Shoe19controller.text =Shoe19.toString();
     Shoe20controller.text =Shoe20.toString();
     Shoe21controller.text =Shoe21.toString();

    setState(() {
      isLoading = false;
    });
  }


  AddSize(){
    if(gender=='Men') {
      return
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return
              Column(
                children: [

                  Expanded(
                    child: Container(
                      // color: kPrimaryColor,
                      child: ContainedTabBarView(
                        tabs: [
                          Text('Clothing',style:TextStyle(color:Colors.black)),
                          Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                        ],
                        views: [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXXS'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXS'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XS'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('S'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('M'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('L'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fourxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fivexlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sixxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sevenxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: eightxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                              // ConstrainedBox(
                              //   constraints: new BoxConstraints(
                              //     minHeight: 5.0,
                              //     maxHeight: 40.0,
                              //   ),
                              //   child: Expanded(
                              //     child: ListView(
                              //         shrinkWrap: true,
                              //         // scrollDirection: Axis.vertical,
                              //         children:[
                              //         ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('3-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                        ],
                        onChange: (index) => print(index),

                      ),
                    ),
                  ),

                ],
              );
          },
        );
    }
    else if(gender=='Women') {
      return
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return
              Column(
                children: [
                  Expanded(
                    child: Container(
                      // color: kPrimaryColor,
                      child: ContainedTabBarView(
                        tabs: [
                          Text('Clothing',style:TextStyle(color:Colors.black)),
                          Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                        ],
                        views: [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXXS'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXS'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XS'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('S'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('M'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('L'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fourxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fivexlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sixxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sevenxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: eightxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),



                            ],
                          ),

                        ],
                        onChange: (index) => print(index),

                      ),
                    ),
                  ),
                ],
              );
          },
        );
    }
    else  if(gender=='Baby-Boys'||gender=='Baby-Girls') {
      return
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return
              Column(
                children: [

                  Expanded(
                    child: Container(
                      // color: kPrimaryColor,
                      child: ContainedTabBarView(
                        tabs: [
                          Text('Clothing',style:TextStyle(color:Colors.black)),
                          Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                        ],
                        views: [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('0-3 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3-6 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-9 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-12 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12-18 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('18-24 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('0-3 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3-6 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-12 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12-18 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('18-24 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),




                            ],
                          ),

                        ],
                        onChange: (index) => print(index),

                      ),
                    ),
                  ),

                ],
              );

          },
        );
    }

    else if(gender=='Kids-Boys'||gender=='Kids-Girls') {
      return
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return
              Column(
                children: [


                  Expanded(
                    child: Container(
                      // color: kPrimaryColor,
                      child: ContainedTabBarView(
                        tabs: [
                          Text('Clothing',style:TextStyle(color:Colors.black)),
                          Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                        ],
                        views: [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3-4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4-5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5-6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7-8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8-9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10-11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11-12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fourxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('2 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('2 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),




                            ],
                          ),

                        ],
                        onChange: (index) => print(index),

                      ),
                    ),
                  ),

                ],
              );

          },
        );
    }

    else if(gender=='Teen-Boys'||gender=='Teen-Girls') {
      return
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return
              Column(
                children: [

                  Expanded(
                    child: Container(
                      // color: kPrimaryColor,
                      child: ContainedTabBarView(
                        tabs: [
                          Text('Clothing',style:TextStyle(color:Colors.black)),
                          Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                        ],
                        views: [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('16'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('16'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),






                            ],
                          ),

                        ],
                        onChange: (index) => print(index),

                      ),
                    ),
                  ),

                ],
              );

          },
        );
    }


  }


  createProdInFirestore(
      {
        int freesizeQuantity,
        int xxxsQuantity,
        int xxsQuantity,
        int xsQuantity,
        int sQuantity,
        int mQuantity,
        int lQuantity,
        int xlQuantity,
        int xxlQuantity,
        int xxxlQuantity,
        int fourxlQuantity,
        int fivexlQuantity,
        int sixxlQuantity,
        int sevenxlQuantity,
        int eightxlQuantity,
        int Shoe1,
        int Shoe2,
        int Shoe3,
        int Shoe4,
        int Shoe5,
        int Shoe6,
        int Shoe7,
        int Shoe8,
        int Shoe9,
        int Shoe10,
        int Shoe11,
        int Shoe12,
        int Shoe13,
        int Shoe14,
        int Shoe15,
        int Shoe16,
        int Shoe17,
        int Shoe18,
        int Shoe19,
        int Shoe20,
        int Shoe21,
        int mtoQuantity,


      }) {
    productsRef
        .document(widget.currentUser.id)
        .collection("userProducts")
        .document(prodId)
        .updateData({

      "freesizeQuantity": freesizeQuantity,
      "xxxsQuantity": xxxsQuantity,
      "xxsQuantity": xxsQuantity,
      "xsQuantity": xsQuantity,
      "sQuantity": sQuantity,
      "mQuantity": mQuantity,
      "lQuantity": lQuantity,
      "xlQuantity": xlQuantity,
      "xxlQuantity": xxlQuantity,
      "xxxlQuantity": xxxlQuantity,
      "4xlQuantity": fourxlQuantity,
      "5xlQuantity": fivexlQuantity,
      "6xlQuantity": sixxlQuantity,
      "7xlQuantity": sevenxlQuantity,
      "8xlQuantity": eightxlQuantity,
      "Shoe1":Shoe1,
      "Shoe2":Shoe2,
      "Shoe3":Shoe3,
      "Shoe4":Shoe4,
      "Shoe5":Shoe5,
      "Shoe6":Shoe6,
      "Shoe7":Shoe7,
      "Shoe8":Shoe8,
      "Shoe9":Shoe9,
      "Shoe10":Shoe10,
      "Shoe11":Shoe11,
      "Shoe12":Shoe12,
      "Shoe13":Shoe13,
      "Shoe14":Shoe14,
      "Shoe15":Shoe15,
      "Shoe16":Shoe16,
      "Shoe17":Shoe17,
      "Shoe18":Shoe18,
      "Shoe19":Shoe19,
      "Shoe20":Shoe20,
      "Shoe21":Shoe21,
      "mtoQuantity": mtoQuantity,

    });



  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit without uploading?'),
        actions: <Widget>[
          new FlatButton(

            onPressed: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new FlatButton(

            onPressed: () async {Navigator.of(context).pop(true);

            },
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }

  handleSubmit() async {
    Fluttertoast.showToast(
        msg: "Please wait:Uploading", timeInSecForIos: 4);

    setState(() {
      isUploading = true;
    });
    Fluttertoast.showToast(
        msg: "Please wait:Uploading", timeInSecForIos: 4);

    if(gender=='Men'){
      await createProdInFirestore(

        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
        Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
        Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
        Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
        Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
        Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,




      );
    }
    if(gender=='Women'){
      createProdInFirestore(

        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


      );
    }
    if(gender=='Baby-Boys'||gender=='Baby-Girls'){
      createProdInFirestore(

        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,
        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,




      );
    }
    if(gender=='Kids-Boys'||gender=='Kids-Girls'){ createProdInFirestore(

      xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
      xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
      xsQuantity:  int.tryParse(xscontroller.text )?? 0,
      sQuantity: int.tryParse(scontroller.text) ?? 0,

      mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
      freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


      mQuantity:  int.tryParse(mcontroller.text) ?? 0,
      lQuantity:  int.tryParse(lcontroller.text) ?? 0,
      xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
      xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
      xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
      fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

      Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
      Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
      Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
      Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
      Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
      Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
      Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
      Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
      Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
      Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
      Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
      Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
      Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
      Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



    );
    }
    if(gender=='Teen-Boys'||gender=='Teen-Girls'){ createProdInFirestore(

      xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
      xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
      xsQuantity:  int.tryParse(xscontroller.text )?? 0,
      sQuantity: int.tryParse(scontroller.text) ?? 0,

      mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
      freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
      Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
      Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
      Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
      Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



    );
    }

  }
  postindia(){
    return FutureBuilder(
      future: usersRef.document(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        User user = User.fromDocument(snapshot.data);
        bool isPostOwner = currentUserId == ownerId;
        return Container(
          margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),

          child: Expanded(
            child: Column(
              children:  [
                Stack(
                  children:     <Widget> [

                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.only
                              (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                            child: Container(
                                height: MediaQuery.of(context).size.height * 0.65,

                                width:     MediaQuery.of(context).size.width,
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: cachedNetworkImage(shopmediaUrl)))),
                      ],
                    ),


                  ],
                ),





              ],
            ),
          ),

        );
      },
    );
  }

  buildPostHeader() {
    bool isPostOwner = currentUserId == ownerId;

    return WillPopScope
      (
      onWillPop: _onBackPressed,
      child: Scaffold(
        key:  scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: kSecondaryColor),
              onPressed:_onBackPressed),
          title: Text(
            'Update Inventory',
            style: TextStyle(color: Colors.white),
          ),

        ),
        body:isLoading
            ? circularProgress()
            : Container(
          decoration: BoxDecoration(
              gradient: fabGradient
          ),
          alignment: Alignment.center,
              child: Stack(
          children:[
              Column(
                children: <Widget>[
                  isUploading ? linearProgress() : Text(""),

                  postindia(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      FloatingActionButton.extended(
                        backgroundColor: kblue,
                        onPressed: ()=>AddSize(),
                        label: Text('Update Inventory',style:TextStyle(color: Colors.white) ,),
                      ),
                      FloatingActionButton(
                        mini: true,
                        backgroundColor:Colors.white.withOpacity(0.5),
                        child:Icon(Icons.delete,color:Colors.red,),
                        onPressed: () {
                          {
                            !isPostOwner?showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0)), //this right here
                                    child: Container(
                                      height: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(

                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text('Report this post?',style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20.0),)),),
//        ),FlatButton(
//        onPressed: () {Navigator.pop(context);  Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));
//        },
//
//        child: Text('Delete this post?',style: TextStyle(
//            color: Colors.blueAccent,
//            fontWeight: FontWeight.bold,
//            fontSize: 20.0),),
//        ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  // ignore: unnecessary_statements
                                }):handleDeletePost(context);
                          }
                          // do something
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0,),

                  RaisedButton(
                    color: kblue,

                    onPressed: () async{
                      isUploading ? null : handleSubmit();

                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),

                  SizedBox( height: 8.0,),

                  (_inProcess)?Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.95,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ):Center()
                ],
              ),
              (_inProcess)?Container(

                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ):Center(),
              isUploading ? Center(child:  CircularProgressIndicator()) : Text(""),
          ],
        ),
            ),
      ),
    );

  }


  handleDeletePost(BuildContext parentContext) {
    return showDialog(

        context: parentContext,
        builder: (context) {
          return ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: SimpleDialog(

              backgroundColor: kSecondaryColor,
              title: Text("Remove this post?",style: TextStyle(color: kText),),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    deletePost();
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                    style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          );
        });
  }

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably
  deletePost() async {
    // delete post itself
    productsRef
        .document(ownerId)
        .collection('userProducts')
        .document(prodId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
    storageRef.child("prod_$prodId.jpg").delete();
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .document(ownerId)
        .collection("feedItems")
        .where('prodId', isEqualTo: prodId)
        .getDocuments();
    activityFeedSnapshot.documents.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await productcommentsRef
        .document(prodId)
        .collection('comments')
        .getDocuments();
    commentsSnapshot.documents.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

//      Firestore.instance.collectionGroup("userCart").document(prodId).delete();

  }



  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return            buildPostHeader();

  }
}

