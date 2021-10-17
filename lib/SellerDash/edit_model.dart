import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/size_config.dart';
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
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class ProdEdit extends StatefulWidget {
  final String prodId;
  final String ownerId;
  final String username;
  var eur;
  var usd;
  var inr;
  var cny;
  var gbp;
  final String gender;
// final String selectedSizes;

  final String productname;
  final String details;
  final String color;
  final String composition;
  final String washandcare;
  final String sizeandfit;
  List shopmediaUrl;
  final String photoUrl;
  var freesize;
  var xxxs;
  var xxs;
  var xs;
  var s;
  var m;
  var l;
  var xl;
  var xxl;
  var xxxl;
  var fourxl;
  var fivexl;
  var sixxl;
  var sevenxl;
  var eightxl;
  var Shoe1;
  var Shoe2;
  var Shoe3;
  var Shoe4;
  var Shoe5;
  var Shoe6;
  var Shoe7;
  var  Shoe8;
  var Shoe9;
  var Shoe10;
  var Shoe11;
  var Shoe12;
  var Shoe13;
  var Shoe14;
  var Shoe15;
  var Shoe16;
  var Shoe17;
  var Shoe18;
  var Shoe19;
  var Shoe20;
  var  Shoe21;
  var color1;
  var color2;
  var color3;
  var color4;
  var color5;
  var color6;
  var color7;
  var color8;
  var color9;
  var color10;
  final String colorText1;
  final String colorText2;
  final String colorText3;
  final String colorText4;
  final String colorText5;
  final String colorText6;
  final String colorText7;
  final String colorText8;
  final String colorText9;
  final String colorText10;

  var Ring1;
  var Ring2;
  var Ring3;
  var Ring4;
  var Ring5;
  var Ring6;
  var Ring7;
  var  Ring8;
  var Ring9;
  var Ring10;
  var Ring11;
  var Ring12;
  var Ring13;
  var Ring14;
  var Ring15;
  var Ring16;
  var Ring17;
  var Ring18;
  var Ring19;
  var Ring20;
  var  Ring21;
  var  Ring22;
  var  Ring23;
  final  variationQuantity1;
  final  variationQuantity2;
  final  variationQuantity3;
  final  variationQuantity4;
  final  variationQuantity5;
  final  variationQuantity6;
  final  variationQuantity7;
  final  variationQuantity8;
  final  variationQuantity9;
  final  variationQuantity10;
   final  variation1;
  final  variation2;
  final  variation3;
  final  variation4;
  final  variation5;
  final  variation6;
  final  variation7;
  final  variation8;
  final  variation9;
  final  variation10;

  var mto;
  final Users currentUser;

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
    this.color1, this.color2, this.color3, this.color4, this.color5, this.color6, this.color7,
    this.color8, this.color9, this.color10,
    this.colorText1, this.colorText2, this.colorText3, this.colorText4, this.colorText5, this.colorText6, this.colorText7,
    this.colorText8, this.colorText9, this.colorText10,

    this.variationQuantity1, this.variationQuantity2, this.variationQuantity3,
    this.variationQuantity4, this.variationQuantity5, this.variationQuantity6, this.variationQuantity7,
    this.variationQuantity8, this.variationQuantity9, this.variationQuantity10,this.variation1, this.variation2, this.variation3,
    this.variation4, this.variation5, this.variation6, this.variation7,
    this.variation8, this.variation9, this.variation10,
    this.Ring1, this.Ring2, this.Ring3, this.Ring4, this.Ring5, this.Ring6, this.Ring7, this.Ring8, this.Ring9,
    this.Ring10, this.Ring11, this.Ring12, this.Ring13, this.Ring14, this.Ring15, this.Ring16, this.Ring17,
    this.Ring18, this.Ring19, this.Ring20, this.Ring21, this.Ring22, this.Ring23,
    this.photoUrl,
    this.currentUser,
  });

  factory ProdEdit.fromDocument(DocumentSnapshot doc) {

    return ProdEdit(
      colorText1: doc.data()['colorText1'],
      colorText2: doc.data()['colorText2'],
      colorText3: doc.data()['colorText3'],
      colorText4: doc.data()['colorText4'],
      colorText5: doc.data()['colorText5'],
      colorText6: doc.data()['colorText6'],
      colorText7: doc.data()['colorText7'],
      colorText8: doc.data()['colorText8'],
      colorText9: doc.data()['colorText9'],
      colorText10: doc.data()['colorText10'],
      prodId: doc.data()['prodId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['displayName'],
      Ring1: doc.data()['Ring1'],
      Ring2: doc.data()['Ring2'],
      Ring3: doc.data()['Ring3'],
      Ring4: doc.data()['Ring4'],
      Ring5: doc.data()['Ring5'],
      Ring6: doc.data()['Ring6'],
      Ring7: doc.data()['Ring7'],
      Ring8: doc.data()['Ring8'],
      Ring9: doc.data()['Ring9'],
      Ring10: doc.data()['Ring10'],
      Ring11: doc.data()['Ring11'],
      Ring12: doc.data()['Ring12'],
      Ring13: doc.data()['Ring13'],
      Ring14: doc.data()['Ring14'],
      Ring15: doc.data()['Ring15'],
      Ring16: doc.data()['Ring16'],
      Ring17: doc.data()['Ring17'],
      Ring18: doc.data()['Ring18'],
      Ring19: doc.data()['Ring19'],
      Ring20: doc.data()['Ring20'],
      Ring21: doc.data()['Ring21'],
      Ring22: doc.data()['Ring22'],
      Ring23: doc.data()['Ring23'],
      color1: doc.data()['color1'],
      color2: doc.data()['color2'],
      color3: doc.data()['color3'],
      color4: doc.data()['color4'],
      color5: doc.data()['color5'],
      color6: doc.data()['color6'],
      color7: doc.data()['color7'],
      color8: doc.data()['color8'],
      color9: doc.data()['color9'],
      color10: doc.data()['color10'],
      eur: doc.data()['eur'],
      usd: doc.data()['usd'],
      inr: doc.data()['inr'],
      cny: doc.data()['cny'],
      gbp: doc.data()['gbp'],
      gender: doc.data()['Gender'],
      // selectedSizes: doc.data()['selectedSizes'],
      mto: doc.data()['mtoQuantity'],
      xxxs: doc.data()['xxxsQuantity'],
      xxs: doc.data()['xxsQuantity'],
      xs: doc.data()['xsQuantity'],
      s: doc.data()['sQuantity'],
      m: doc.data()['mQuantity'],
      l: doc.data()['lQuantity'],
      xl: doc.data()['xlQuantity'],
      xxl: doc.data()['xxlQuantity'],
      xxxl: doc.data()['xxxlQuantity'],
      fourxl: doc.data()['fourxlQuantity'],
      fivexl: doc.data()['fivexlQuantity'],
      sixxl: doc.data()['sixxlQuantity'],
      sevenxl: doc.data()['sevenxlQuantity'],
      eightxl: doc.data()['eightxlQuantity'],
      Shoe1: doc.data()['Shoe1'],
      Shoe2: doc.data()['Shoe2'],
      Shoe3: doc.data()['Shoe3'],
      Shoe4: doc.data()['Shoe4'],
      Shoe5: doc.data()['Shoe5'],
      Shoe6: doc.data()['Shoe6'],
      Shoe7: doc.data()['Shoe7'],
      Shoe8: doc.data()['Shoe8'],
      Shoe9: doc.data()['Shoe9'],
      Shoe10: doc.data()['Shoe10'],
      Shoe11: doc.data()['Shoe11'],
      Shoe12: doc.data()['Shoe12'],
      Shoe13: doc.data()['Shoe13'],
      Shoe14: doc.data()['Shoe14'],
      Shoe15: doc.data()['Shoe15'],
      Shoe16: doc.data()['Shoe16'],
      Shoe17: doc.data()['Shoe17'],
      Shoe18: doc.data()['Shoe18'],
      Shoe19: doc.data()['Shoe19'],
      Shoe20: doc.data()['Shoe20'],
      Shoe21: doc.data()['Shoe21'],
      productname: doc.data()['productname'],
      details: doc.data()['details'],
      shopmediaUrl: doc.data()['shopmediaUrl'],
      color:doc.data()['color'],
      composition:doc.data()['composition'],
      washandcare:doc.data()['washandcare'],
      sizeandfit:doc.data()['sizeandfit'],
      photoUrl:doc.data()['photoUrl'],
      freesize:doc.data()['freesizeQuantity'],
      variationQuantity1: doc.data()['variationQuantity1'],
      variationQuantity2: doc.data()['variationQuantity2'],
      variationQuantity3: doc.data()['variationQuantity3'],
      variationQuantity4: doc.data()['variationQuantity4'],
      variationQuantity5: doc.data()['variationQuantity5'],
      variationQuantity6: doc.data()['variationQuantity6'],
      variationQuantity7: doc.data()['variationQuantity7'],
      variationQuantity8: doc.data()['variationQuantity8'],
      variationQuantity9: doc.data()['variationQuantity9'],
      variationQuantity10: doc.data()['variationQuantity10'],
     variation1: doc.data()['variation1'],
      variation2: doc.data()['variation2'],
      variation3: doc.data()['variation3'],
      variation4: doc.data()['variation4'],
      variation5: doc.data()['variation5'],
      variation6: doc.data()['variation6'],
      variation7: doc.data()['variation7'],
      variation8: doc.data()['variation8'],
      variation9: doc.data()['variation9'],
      variation10: doc.data()['variation10'],

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
    color1:this.color1,
    color2:this.color2,
    color3:this.color3,
    color4:this.color4,
    color5:this.color5,
    color6:this.color6,
    color7:this.color7,
    color8:this.color8,
    color9:this.color9,
    color10:this.color10,
    colorText1:this.colorText1,
    colorText2:this.colorText2,
    colorText3:this.colorText3,
    colorText4:this.colorText4,
    colorText5:this.colorText5,
    colorText6:this.colorText6,
    colorText7:this.colorText7,
    colorText8:this.colorText8,
    colorText9:this.colorText9,
    colorText10:this.colorText10,

    variationQuantity1:this.variationQuantity1,
    variationQuantity2:this.variationQuantity2,
    variationQuantity3:this.variationQuantity3,
    variationQuantity4:this.variationQuantity4,
    variationQuantity5:this.variationQuantity5,
    variationQuantity6:this.variationQuantity6,
    variationQuantity7:this.variationQuantity7,
    variationQuantity8:this.variationQuantity8,
    variationQuantity9:this.variationQuantity9,
    variationQuantity10:this.variationQuantity10,
     variation1:this.variation1,
    variation2:this.variation2,
    variation3:this.variation3,
    variation4:this.variation4,
    variation5:this.variation5,
    variation6:this.variation6,
    variation7:this.variation7,
    variation8:this.variation8,
    variation9:this.variation9,
    variation10:this.variation10,

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
    Ring1:this.Ring1,
    Ring2:this.Ring2,
    Ring3:this.Ring3,
    Ring4:this.Ring4,
    Ring5:this.Ring5,
    Ring6:this.Ring6,
    Ring7:this.Ring7,
    Ring8:this.Ring8,
    Ring9:this.Ring9,
    Ring10:this.Ring10,
    Ring11:this.Ring11,
    Ring12:this.Ring12,
    Ring13:this.Ring13,
    Ring14:this.Ring14,
    Ring15:this.Ring15,
    Ring16:this.Ring16,
    Ring17:this.Ring17,
    Ring18:this.Ring18,
    Ring19:this.Ring19,
    Ring20:this.Ring20,
    Ring21:this.Ring21,
    Ring22:this.Ring22,
    Ring23:this.Ring23,
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
    TextEditingController Ring1controller = TextEditingController();
  TextEditingController Ring2controller = TextEditingController();
  TextEditingController Ring3controller = TextEditingController();
  TextEditingController Ring4controller = TextEditingController();
  TextEditingController Ring5controller = TextEditingController();
  TextEditingController Ring6controller = TextEditingController();
  TextEditingController Ring7controller = TextEditingController();
  TextEditingController Ring8controller = TextEditingController();
  TextEditingController Ring9controller = TextEditingController();
  TextEditingController Ring10controller = TextEditingController();
  TextEditingController Ring11controller = TextEditingController();
  TextEditingController Ring12controller = TextEditingController();
  TextEditingController Ring13controller = TextEditingController();
  TextEditingController Ring14controller = TextEditingController();
  TextEditingController Ring15controller = TextEditingController();
  TextEditingController Ring16controller = TextEditingController();
  TextEditingController Ring17controller = TextEditingController();
  TextEditingController Ring18controller = TextEditingController();
  TextEditingController Ring19controller = TextEditingController();
  TextEditingController Ring20controller = TextEditingController();
  TextEditingController Ring21controller = TextEditingController();
  TextEditingController Ring22controller = TextEditingController();
  TextEditingController Ring23controller = TextEditingController();
  TextEditingController Color1controller = TextEditingController();
  TextEditingController Color2controller = TextEditingController();
  TextEditingController Color3controller = TextEditingController();
  TextEditingController Color4controller = TextEditingController();
  TextEditingController Color5controller = TextEditingController();
  TextEditingController Color6controller = TextEditingController();
  TextEditingController Color7controller = TextEditingController();
  TextEditingController Color8controller = TextEditingController();
  TextEditingController Color9controller = TextEditingController();
  TextEditingController Color10controller = TextEditingController();
    TextEditingController Variation1controller = TextEditingController();
  TextEditingController Variation2controller = TextEditingController();
  TextEditingController Variation3controller = TextEditingController();
  TextEditingController Variation4controller = TextEditingController();
  TextEditingController Variation5controller = TextEditingController();
  TextEditingController Variation6controller = TextEditingController();
  TextEditingController Variation7controller = TextEditingController();
  TextEditingController Variation8controller = TextEditingController();
  TextEditingController Variation9controller = TextEditingController();
  TextEditingController Variation10controller = TextEditingController();

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
  var eur;
  var usd;
  var inr;
  var cny;
  var gbp;
  final String gender;
  var color1;
  var color2;
  var color3;
  var color4;
  var color5;
  var color6;
  var color7;
  var color8;
  var color9;
  var color10;
    final String colorText1;
  final String colorText2;
  final String colorText3;
  final String colorText4;
  final String colorText5;
  final String colorText6;
  final String colorText7;
  final String colorText8;
  final String colorText9;
  final String colorText10;

  final  variationQuantity1;
  final  variationQuantity2;
  final  variationQuantity3;
  final  variationQuantity4;
  final  variationQuantity5;
  final  variationQuantity6;
  final  variationQuantity7;
  final  variationQuantity8;
  final  variationQuantity9;
  final  variationQuantity10;
  final  variation1;
  final  variation2;
  final  variation3;
  final  variation4;
  final  variation5;
  final  variation6;
  final  variation7;
  final  variation8;
  final  variation9;
  final  variation10;
  var Ring1;
  var Ring2;
  var Ring3;
  var Ring4;
  var Ring5;
  var Ring6;
  var Ring7;
  var  Ring8;
  var Ring9;
  var Ring10;
  var Ring11;
  var Ring12;
  var Ring13;
  var Ring14;
  var Ring15;
  var Ring16;
  var Ring17;
  var Ring18;
  var Ring19;
  var Ring20;
  var  Ring21;
  var  Ring22;
  var  Ring23;
  final String productname;
  final String details;
  final String color;
  final String composition;
  final String washandcare;
  final String sizeandfit;
  List shopmediaUrl;
  final String photoUrl;
  var freesize;
  var xxxs;
  var xxs;
  var xs;
  var s;
  var m;
  var l;
  var xl;
  var xxl;
  var xxxl;
  var fourxl;
  var fivexl;
  var sixxl;
  var sevenxl;
  var eightxl;
  var Shoe1;
  var Shoe2;
  var Shoe3;
  var Shoe4;
  var Shoe5;
  var Shoe6;
  var Shoe7;
  var  Shoe8;
  var Shoe9;
  var Shoe10;
  var Shoe11;
  var Shoe12;
  var Shoe13;
  var Shoe14;
  var Shoe15;
  var Shoe16;
  var Shoe17;
  var Shoe18;
  var Shoe19;
  var Shoe20;
  var  Shoe21;
  var mto;
  bool isLoading = false;


  _ProdEditState(
     {
       this.color1, this.color2, this.color3, this.color4, this.color5, this.color6, this.color7,
       this.color8, this.color9, this.color10,
       this.colorText1, this.colorText2, this.colorText3, this.colorText4, this.colorText5, this.colorText6, this.colorText7,
       this.colorText8, this.colorText9, this.colorText10,

       this.variationQuantity1, this.variationQuantity2, this.variationQuantity3,
       this.variationQuantity4, this.variationQuantity5, this.variationQuantity6, this.variationQuantity7,
       this.variationQuantity8, this.variationQuantity9, this.variationQuantity10, this.variation1, this.variation2, this.variation3,
       this.variation4, this.variation5, this.variation6, this.variation7,
       this.variation8, this.variation9, this.variation10,
       this.Ring1, this.Ring2, this.Ring3, this.Ring4, this.Ring5, this.Ring6, this.Ring7, this.Ring8, this.Ring9,
       this.Ring10, this.Ring11, this.Ring12, this.Ring13, this.Ring14, this.Ring15, this.Ring16, this.Ring17,
       this.Ring18, this.Ring19, this.Ring20, this.Ring21, this.Ring22, this.Ring23,
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
     Ring1controller.text = Ring1.toString();
     Ring2controller.text = Ring2.toString();
     Ring3controller.text = Ring3.toString();
     Ring4controller.text = Ring4.toString();
     Ring5controller.text = Ring5.toString();
     Ring6controller.text = Ring6.toString();
     Ring7controller.text = Ring7.toString();
     Ring8controller.text = Ring8.toString();
     Ring9controller.text = Ring9.toString();
     Ring10controller.text =Ring10.toString();
     Ring11controller.text =Ring11.toString();
     Ring12controller.text =Ring12.toString();
     Ring13controller.text =Ring13.toString();
      Ring14controller.text =Ring14.toString();
     Ring15controller.text =Ring15.toString();
     Ring16controller.text =Ring16.toString();
     Ring17controller.text =Ring17.toString();
     Ring18controller.text =Ring18.toString();
     Ring19controller.text =Ring19.toString();
     Ring20controller.text =Ring20.toString();
     Ring21controller.text =Ring21.toString();
Ring22controller.text =Ring22.toString();
Ring23controller.text =Ring23.toString();
    Color1controller.text = color1.toString();
    Color2controller.text = color2.toString();
    Color3controller.text = color3.toString();
    Color4controller.text = color4.toString();
    Color5controller.text = color5.toString();
    Color6controller.text = color6.toString();
    Color7controller.text = color7.toString();
    Color8controller.text = color8.toString();
    Color9controller.text = color9.toString();
    Color10controller.text =color10.toString();
      Variation1controller.text = variationQuantity1.toString();
    Variation2controller.text = variationQuantity2.toString();
    Variation3controller.text = variationQuantity3.toString();
    Variation4controller.text = variationQuantity4.toString();
    Variation5controller.text = variationQuantity5.toString();
    Variation6controller.text = variationQuantity6.toString();
    Variation7controller.text = variationQuantity7.toString();
    Variation8controller.text = variationQuantity8.toString();
    Variation9controller.text = variationQuantity9.toString();
    Variation10controller.text =variationQuantity10.toString();

    setState(() {
      isLoading = false;
    });
  }


  AddSize(){
    if(gender=='Men') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            return
              Container(
                height: MediaQuery.of(context).size.height * 0.75,

                child: DefaultTabController(
                    length:7,
                    child: Scaffold(
                      resizeToAvoidBottomInset:true,
                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                             Text("Color",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
Text("Variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(
                        height: MediaQuery.of(context).size.height * 0.75,

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [

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


                                ],
                              ),
                               ListView(


                                children: [


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

                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
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
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
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
                                          controller: Ring3controller,
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
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
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
                                          controller: Ring5controller,
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
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
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
                                          controller: Ring7controller,
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
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
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
                                          controller: Ring9controller,
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
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
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
                                          controller: Ring11controller,
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
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
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
                                          controller: Ring13controller,
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
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
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
                                          controller: Ring15controller,
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
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
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
                                          controller: Ring17controller,
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
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
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
                                          controller: Ring19controller,
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
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
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
                                          controller: Ring21controller,
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
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
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
                                          controller: Ring23controller,
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
                                    title: Text('$colorText1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText10',
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
                                    title: Text('$variation1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$variation10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation10',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),


                            ]),
                      ),
                    )
                ),
              );
          },
        );
    }
    else if(gender=='Women') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            return
              Container(
                height: MediaQuery.of(context).size.height * 0.75,

                child: DefaultTabController(
                    length:7,
                    child: Scaffold(
                      resizeToAvoidBottomInset:true,
                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                            Text("Color",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(
                        height: MediaQuery.of(context).size.height * 0.75,

                        child: TabBarView(
                            children:<Widget> [
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


                                ],
                              ),
                              ListView(


                                children: [


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
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
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
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
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
                                          controller: Ring3controller,
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
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
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
                                          controller: Ring5controller,
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
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
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
                                          controller: Ring7controller,
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
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
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
                                          controller: Ring9controller,
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
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
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
                                          controller: Ring11controller,
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
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
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
                                          controller: Ring13controller,
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
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
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
                                          controller: Ring15controller,
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
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
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
                                          controller: Ring17controller,
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
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
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
                                          controller: Ring19controller,
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
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
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
                                          controller: Ring21controller,
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
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
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
                                          controller: Ring23controller,
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
                                    title: Text('$colorText1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText10',
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
                                    title: Text('$variation1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation10',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),


                            ]),
                      ),
                    )
                ),
              );

          },
        );
    }
    else  if(gender=='Baby-Boys'||gender=='Baby-Girls') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            return
              Container(
                height: MediaQuery.of(context).size.height * 0.75,

                child: DefaultTabController(
                    length:7,
                    child: Scaffold(
                      resizeToAvoidBottomInset:true,
                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                            Text("Color",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(
                        height: MediaQuery.of(context).size.height * 0.75,

                        child: TabBarView(
                            children:<Widget> [
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


                                ],
                              ),
                              ListView(


                                children: [


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
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
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
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
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
                                          controller: Ring3controller,
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
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
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
                                          controller: Ring5controller,
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
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
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
                                          controller: Ring7controller,
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
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
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
                                          controller: Ring9controller,
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
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
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
                                          controller: Ring11controller,
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
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
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
                                          controller: Ring13controller,
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
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
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
                                          controller: Ring15controller,
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
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
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
                                          controller: Ring17controller,
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
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
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
                                          controller: Ring19controller,
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
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
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
                                          controller: Ring21controller,
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
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
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
                                          controller: Ring23controller,
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
                                    title: Text('$colorText1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText10',
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
                                    title: Text('$variation1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation10',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),


                            ]),
                      ),
                    )
                ),
              );


          },
        );
    }

    else if(gender=='Kids-Boys'||gender=='Kids-Girls') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            return
              Container(
                height: MediaQuery.of(context).size.height * 0.75,

                child: DefaultTabController(
                    length:7,
                    child: Scaffold(
                      resizeToAvoidBottomInset:true,
                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                            Text("Color",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(
                        height: MediaQuery.of(context).size.height * 0.75,

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [

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


                                ],
                              ),
                              ListView(


                                children: [


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
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
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
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
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
                                          controller: Ring3controller,
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
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
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
                                          controller: Ring5controller,
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
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
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
                                          controller: Ring7controller,
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
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
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
                                          controller: Ring9controller,
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
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
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
                                          controller: Ring11controller,
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
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
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
                                          controller: Ring13controller,
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
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
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
                                          controller: Ring15controller,
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
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
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
                                          controller: Ring17controller,
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
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
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
                                          controller: Ring19controller,
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
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
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
                                          controller: Ring21controller,
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
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
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
                                          controller: Ring23controller,
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
                                    title: Text('$colorText1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText10',
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
                                    title: Text('$variation1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation10',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),


                            ]),
                      ),
                    )
                ),
              );


          },
        );
    }

    else if(gender=='Teen-Boys'||gender=='Teen-Girls') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            return
              Container(
                height: MediaQuery.of(context).size.height * 0.75,

                child: DefaultTabController(
                    length:7,
                    child: Scaffold(
                      resizeToAvoidBottomInset:true,
                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                            Text("Color",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(
                        height: MediaQuery.of(context).size.height * 0.75,

                        child: TabBarView(
                            children:<Widget> [
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


                                ],
                              ),
                              ListView(


                                children: [


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
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
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
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
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
                                          controller: Ring3controller,
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
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
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
                                          controller: Ring5controller,
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
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
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
                                          controller: Ring7controller,
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
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
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
                                          controller: Ring9controller,
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
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
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
                                          controller: Ring11controller,
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
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
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
                                          controller: Ring13controller,
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
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
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
                                          controller: Ring15controller,
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
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
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
                                          controller: Ring17controller,
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
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
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
                                          controller: Ring19controller,
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
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
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
                                          controller: Ring21controller,
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
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
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
                                          controller: Ring23controller,
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
                                    title: Text('$colorText1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ExpansionTile(
                                    title: Text('$colorText10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Color10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$colorText10',
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
                                    title: Text('$variation1'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation1',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation2'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation2',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation3'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation3',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation4',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation5',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation6',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation7',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation8',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation9',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('$variation10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Variation10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: '$variation10',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),


                            ]),
                      ),
                    )
                ),
              );


          },
        );
    }


  }


  createProdInFirestore(
      {
        var freesizeQuantity,
        var xxxsQuantity,
        var xxsQuantity,
        var xsQuantity,
        var sQuantity,
        var mQuantity,
        var lQuantity,
        var xlQuantity,
        var xxlQuantity,
        var xxxlQuantity,
        var fourxlQuantity,
        var fivexlQuantity,
        var sixxlQuantity,
        var sevenxlQuantity,
        var eightxlQuantity,
        var Shoe1,
        var Shoe2,
        var Shoe3,
        var Shoe4,
        var Shoe5,
        var Shoe6,
        var Shoe7,
        var Shoe8,
        var Shoe9,
        var Shoe10,
        var Shoe11,
        var Shoe12,
        var Shoe13,
        var Shoe14,
        var Shoe15,
        var Shoe16,
        var Shoe17,
        var Shoe18,
        var Shoe19,
        var Shoe20,
        var Shoe21,
           var Ring1,
        var Ring2,
        var Ring3,
        var Ring4,
        var Ring5,
        var Ring6,
        var Ring7,
        var Ring8,
        var Ring9,
        var Ring10,
        var Ring11,
        var Ring12,
        var Ring13,
        var Ring14,
        var Ring15,
        var Ring16,
        var Ring17,
        var Ring18,
        var Ring19,
        var Ring20,
        var Ring21,
        var Ring22,
        var Ring23,
        var Color1,
        var Color2,
        var Color3,
        var Color4,
        var Color5,
        var Color6,
        var Color7,
        var Color8,
        var Color9,
        var Color10,
            var Variation1,
        var Variation2,
        var Variation3,
        var Variation4,
        var Variation5,
        var Variation6,
        var Variation7,
        var Variation8,
        var Variation9,
        var Variation10,

        var mtoQuantity,


      }) {
    productsRef
        .doc(widget.currentUser.id)
        .collection("userProducts")
        .doc(prodId)
        .update({

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
      "fourxlQuantity": fourxlQuantity,
      "fivexlQuantity": fivexlQuantity,
      "sixxlQuantity": sixxlQuantity,
      "sevenxlQuantity": sevenxlQuantity,
      "eightxlQuantity": eightxlQuantity,
      "Ring1":Ring1,
      "Ring2":Ring2,
      "Ring3":Ring3,
      "Ring4":Ring4,
      "Ring5":Ring5,
      "Ring6":Ring6,
      "Ring7":Ring7,
      "Ring8":Ring8,
      "Ring9":Ring9,
      "Ring10":Ring10,
      "Ring11":Ring11,
      "Ring12":Ring12,
      "Ring13":Ring13,
      "Ring14":Ring14,
      "Ring15":Ring15,
      "Ring16":Ring16,
      "Ring17":Ring17,
      "Ring18":Ring18,
      "Ring19":Ring19,
      "Ring20":Ring20,
      "Ring21":Ring21,
      "Ring1":Ring1,
      "Ring2":Ring2,
      "Ring3":Ring3,
      "Ring4":Ring4,
      "Ring5":Ring5,
      "Ring6":Ring6,
      "Ring7":Ring7,
      "Ring8":Ring8,
      "Ring9":Ring9,
      "Ring10":Ring10,
      "Ring11":Ring11,
      "Ring12":Ring12,
      "Ring13":Ring13,
      "Ring14":Ring14,
      "Ring15":Ring15,
      "Ring16":Ring16,
      "Ring17":Ring17,
      "Ring18":Ring18,
      "Ring19":Ring19,
      "Ring20":Ring20,
      "Ring22":Ring22,
      "Ring23":Ring23,
      "color1":Color1,
      "color2":Color2,
      "color3":Color3,
      "color4":Color4,
      "color5":Color5,
      "color6":Color6,
      "color7":Color7,
      "color8":Color8,
      "color9":Color9,
      "color10":Color10,
        "variationQuantity1":Variation1,
      "variationQuantity2":Variation2,
      "variationQuantity3":Variation3,
      "variationQuantity4":Variation4,
      "variationQuantity5":Variation5,
      "variationQuantity6":Variation6,
      "variationQuantity7":Variation7,
      "variationQuantity8":Variation8,
      "variationQuantity9":Variation9,
      "variationQuantity10":Variation10,

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
          new TextButton(

            onPressed: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new TextButton(

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
      Ring1:   int.tryParse(Ring1controller.text) ?? 0,
      Ring2:   int.tryParse(Ring2controller.text) ?? 0,
      Ring3:   int.tryParse(Ring3controller.text) ?? 0,
      Ring4:   int.tryParse(Ring4controller.text) ?? 0,
      Ring5:   int.tryParse(Ring5controller.text) ?? 0,
      Ring6:   int.tryParse(Ring6controller.text) ?? 0,
      Ring7:   int.tryParse(Ring7controller.text) ?? 0,
      Ring8:   int.tryParse(Ring8controller.text) ?? 0,
      Ring9:   int.tryParse(Ring9controller.text) ?? 0,
      Ring10:   int.tryParse(Ring10controller.text) ?? 0,
      Ring11:   int.tryParse(Ring11controller.text) ?? 0,
      Ring12:   int.tryParse(Ring12controller.text) ?? 0,
      Ring13:   int.tryParse(Ring13controller.text) ?? 0,
      Ring14:   int.tryParse(Ring14controller.text) ?? 0,
      Ring15:  int.tryParse(Ring15controller.text) ?? 0,
      Ring16:  int.tryParse(Ring16controller.text) ?? 0,
      Ring17:  int.tryParse(Ring17controller.text) ?? 0,
      Ring18:  int.tryParse(Ring18controller.text) ?? 0,
      Ring19:  int.tryParse(Ring19controller.text) ?? 0,
      Ring20:  int.tryParse(Ring20controller.text) ?? 0,
      Ring21:  int.tryParse(Ring21controller.text) ?? 0,
      Ring22:  int.tryParse(Ring22controller.text) ?? 0,
      Ring23:  int.tryParse(Ring23controller.text) ?? 0,
      Color1:   int.tryParse(Color1controller.text) ?? 0,
      Color2:   int.tryParse(Color2controller.text) ?? 0,
      Color3:   int.tryParse(Color3controller.text) ?? 0,
      Color4:   int.tryParse(Color4controller.text) ?? 0,
      Color5:   int.tryParse(Color5controller.text) ?? 0,
      Color6:   int.tryParse(Color6controller.text) ?? 0,
      Color7:   int.tryParse(Color7controller.text) ?? 0,
      Color8:   int.tryParse(Color8controller.text) ?? 0,
      Color9:   int.tryParse(Color9controller.text) ?? 0,
      Color10:   int.tryParse(Color10controller.text) ?? 0,

      Variation1:   int.tryParse(Variation1controller.text) ?? 0,
      Variation2:   int.tryParse(Variation2controller.text) ?? 0,
      Variation3:   int.tryParse(Variation3controller.text) ?? 0,
      Variation4:   int.tryParse(Variation4controller.text) ?? 0,
      Variation5:   int.tryParse(Variation5controller.text) ?? 0,
      Variation6:   int.tryParse(Variation6controller.text) ?? 0,
      Variation7:   int.tryParse(Variation7controller.text) ?? 0,
      Variation8:   int.tryParse(Variation8controller.text) ?? 0,
      Variation9:   int.tryParse(Variation9controller.text) ?? 0,
      Variation10:   int.tryParse(Variation10controller.text) ?? 0,




    );

  }
  postindia(){
    return FutureBuilder(
      future: usersRef.doc(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Users user = Users.fromDocument(snapshot.data);
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
                                    child: cachedNetworkImage(shopmediaUrl.first)))),
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
      onWillPop: (){ return
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit without uploading?'),
            actions: <Widget>[
              new TextButton(

                onPressed: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new TextButton(

                onPressed: () async {
                  Get.back();
Get.back();

                },
                child: Text("YES"),
              ),
            ],
          ),
        );
      },
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
              height: MediaQuery.of(context).size.height,
         color:Cont,
              child: Column(
                children: <Widget>[
                  isUploading ? linearProgress() : Text(""),
                  ClipRRect(
                      borderRadius: BorderRadius.only
                        (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.55,

                          width:     MediaQuery.of(context).size.width,
                          child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedImage(shopmediaUrl.first)))),

                  SizedBox(height:10.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      FloatingActionButton.extended(
                        backgroundColor: Colors.black,
                        onPressed: ()=>AddSize(),
                        label: Text('Update Inventory',style:TextStyle(color: Colors.white) ,),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: Colors.black,
                        icon:Icon(Icons.delete,color:Colors.red,),
                         label:Text("Delete",style:TextStyle(color: Colors.white) ,),

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

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation : 0.1,
                      primary:  Colors.black, ),
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
        .doc(ownerId)
        .collection('userProducts')
        .doc(prodId)
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
        .doc(ownerId)
        .collection("feedItems")
        .where('prodId', isEqualTo: prodId)
        .get();
    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await productcommentsRef
        .doc(prodId)
        .collection('comments')
        .get();
    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

//      FirebaseFirestore.instance.collectionGroup("userCart").doc(prodId).delete();

  }



  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return            buildPostHeader();

  }
}

