import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/model/addressbuynow.dart';
import 'package:fashow/model/tags.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/user.dart';

import 'package:fashow/progress.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';

class Prod extends StatefulWidget {
  final String prodId;
  final String ownerId;
  final String username;
   final String sizeChart;

  final bool sizechartBool;
  
   var eur;
   var usd;
   var inr;
  final String cny;
  var gbp;
  final String variation1;
  final String variation2;
  final String variation3;
  final String variation4;
  final String variation5;
  final String variation6;
  final String variation7;
  final String variation8;
  final String variation9;
  final String variation10;
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
  final String variation1img;
  final String variation2img;
  final String variation3img;
  final String variation4img;
  final String variation5img;
  final String variation6img;
  final String variation7img;
  final String variation8img;
  final String variation9img;
  final String variation10img;
final String gender;
final String country;
//   final String customName1;
//   final String customName2;
//   final String customName3;
//   final String customName4;
//   final String customName5;
//   final String customName6;
//   final String customName7;
//   final String customName8;
//   final String customName9;
//   final String customName10;
//   final String customName11;
//   final String customName12;
//   final String customName13;
//   final String customName14;
//   final String customName15;
//   final String customName16;
//   final String customName17;
//   final String customName18;
//   final String customName19;
//   final String customName20;
//   final String customName21;
//   final String customName22;
//   final String customName23;
//   final String customName24;
//   final String customName25;
//   final String customName26;
//   final String customName27;
//   final String customName28;
//   final String customName29;
//   final String customName30;
//   final String customName31;
//   final String customName32;
//   final String customName33;
//   final String customName34;
//   final String customName35;
//   final String customName36;
//   final String customName37;
//   final String customName38;
//   final String customName39;
//   final String customName40;
//   final String customName41;
//   final String customName42;
//   final String customName43;
//   final String customName44;
//   final String customName45;
//   final String customName46;
//   final String customName47;
//   final String customName48;
//   final String customName49;
//   final String customName50;
//
//   final String custom1img;
// final String custom2img;
// final String custom3img;
// final String custom4img;
// final String custom5img;
// final String custom6img;
// final String custom7img;
// final String custom8img;
// final String custom9img;
// final String custom10img;
// final String custom11img;
// final String custom12img;
// final String custom13img;
// final String custom14img;
// final String custom15img;
// final String custom16img;
// final String custom17img;
// final String custom18img;
// final String custom19img;
// final String custom20img;
// final String custom21img;
// final String custom22img;
// final String custom23img;
// final String custom24img;
// final String custom25img;
// final String custom26img;
// final String custom27img;
// final String custom28img;
// final String custom29img;
// final String custom30img;
// final String custom31img;
// final String custom32img;
// final String custom33img;
// final String custom34img;
// final String custom35img;
// final String custom36img;
// final String custom37img;
// final String custom38img;
// final String custom39img;
// final String custom40img;
// final String custom41img;
// final String custom42img;
// final String custom43img;
// final String custom44img;
// final String custom45img;
// final String custom46img;
// final String custom47img;
// final String custom48img;
// final String custom49img;
// final String custom50img;
// final String customTitle1;
// final String customTitle2;
// final String customTitle3;
// final String customTitle4;
// final String customTitle5;

final String shipment;
final bool worldship;
final bool freeworldship;
final bool freeship;

  final String productname;
  final String details;
  final String composition;
  final String washandcare;
  final String sizeandfit;
  final List shopmediaUrl;
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
  final int Ring1;
  final int Ring2;
final int Ring3;
 final int Ring4;
 final int Ring5;
 final int Ring6;
 final int Ring7;
  final int  Ring8;
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

  final  custom11eur;
  final  custom11usd;
  final  custom11inr;
  final  custom11gbp;
  final  custom21eur;
  final  custom21usd;
  final  custom21inr;
  final  custom21gbp;
    final  custom31eur;
  final  custom31usd;
  final  custom31inr;
  final  custom31gbp;
    final  custom41eur;
  final  custom41usd;
  final  custom41inr;
  final  custom41gbp;
      final  custom51eur;
  final  custom51usd;
  final  custom51inr;
  final  custom51gbp;
      final  custom61eur;
  final  custom61usd;
  final  custom61inr;
  final  custom61gbp;
       final  custom71eur;
  final  custom71usd;
  final  custom71inr;
  final  custom71gbp;
       final  custom81eur;
  final  custom81usd;
  final  custom81inr;
  final  custom81gbp;
        final  custom91eur;
  final  custom91usd;
  final  custom91inr;
  final  custom91gbp;
        final  custom101eur;
  final  custom101usd;
  final  custom101inr;
  final  custom101gbp;
  final  shipcostusd;
  final  shipcostinterusd;
   final  shipcostinr;
  final  shipcostinterinr;
 final  shipcosteur;
  final  shipcostintereur;
   final  shipcostgbp;
  final  shipcostintergbp;

   final int processfrom;
    final int processto;
    final int shipfrom;
    final int shipto;
    final int shipinterfrom;
    final int shipinterto;
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
 final String currency;
  // final  customQuantity1;
  // final  customQuantity2;
  // final  customQuantity3;
  // final  customQuantity4;
  // final  customQuantity5;
  // final  customQuantity6;
  // final  customQuantity7;
  // final  customQuantity8;
  // final  customQuantity9;
  // final  customQuantity10;
  // final  customQuantity11;
  // final  customQuantity12;
  // final  customQuantity13;
  // final  customQuantity14;
  // final  customQuantity15;
  // final  customQuantity16;
  // final  customQuantity17;
  // final  customQuantity18;
  // final  customQuantity19;
  // final  customQuantity20;
  // final  customQuantity21;
  // final  customQuantity22;
  // final  customQuantity23;
  // final  customQuantity24;
  // final  customQuantity25;
  // final  customQuantity26;
  // final  customQuantity27;
  // final  customQuantity28;
  // final  customQuantity29;
  // final  customQuantity30;
  // final  customQuantity31;
  // final  customQuantity32;
  // final  customQuantity33;
  // final  customQuantity34;
  // final  customQuantity35;
  // final  customQuantity36;
  // final  customQuantity37;
  // final  customQuantity38;
  // final  customQuantity39;
  // final  customQuantity40;
  // final  customQuantity41;
  // final  customQuantity42;
  // final  customQuantity43;
  // final  customQuantity44;
  // final  customQuantity45;
  // final  customQuantity46;
  // final  customQuantity47;
  // final  customQuantity48;
  // final  customQuantity49;
  // final  customQuantity50;

  final int mto;
  final Users currentUser;
  final dynamic likes;

  Prod({
    this.prodId,
    this.ownerId,
    this.username,
    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
    this.shipment,
this.worldship,
this.freeworldship,
this.freeship,
this.shipcostinterusd,
this.shipcostusd,
this.shipcostinterinr,
this.shipcostinr,
 this.shipcostintereur,
this.shipcosteur,
this.shipcostintergbp,
this.shipcostgbp,
this.sizechartBool,
this.sizeChart,

this.country,
    this.variation1,
    this.variation2,
    this.variation3,
    this.variation4,
    this.variation5,
    this.variation6,
    this.variation7,
    this.variation8,
    this.variation9,
    this.variation10,
    this.variationQuantity1,
    this.variationQuantity2,
    this.variationQuantity3,
    this.variationQuantity4,
    this.variationQuantity5,
    this.variationQuantity6,
    this.variationQuantity7,
    this.variationQuantity8,
    this.variationQuantity9,
    this.variationQuantity10,
    this.variation1img,
    this.variation2img,
    this.variation3img,
    this.variation4img,
    this.variation5img,
    this.variation6img,
    this.variation7img,
    this.variation8img,
    this.variation9img,
    this.variation10img,
//     this.customQuantity1,
//     this.customQuantity2,
//     this.customQuantity3,
//     this.customQuantity4,
//     this.customQuantity5,
//     this.customQuantity6,
//     this.customQuantity7,
//     this.customQuantity8,
//     this.customQuantity9,
//     this.customQuantity10,
//     this.customQuantity11,
//     this.customQuantity12,
//     this.customQuantity13,
//     this.customQuantity14,
//     this.customQuantity15,
//     this.customQuantity16,
//     this.customQuantity17,
//     this.customQuantity18,
//     this.customQuantity19,
//     this.customQuantity20,
//     this.customQuantity21,
//     this.customQuantity22,
//     this.customQuantity23,
//     this.customQuantity24,
//     this.customQuantity25,
//     this.customQuantity26,
//     this.customQuantity27,
//     this.customQuantity28,
//     this.customQuantity29,
//     this.customQuantity30,
//     this.customQuantity31,
//     this.customQuantity32,
//     this.customQuantity33,
//     this.customQuantity34,
//     this.customQuantity35,
//     this.customQuantity36,
//     this.customQuantity37,
//     this.customQuantity38,
//     this.customQuantity39,
//     this.customQuantity40,
//     this.customQuantity41,
//     this.customQuantity42,
//     this.customQuantity43,
//     this.customQuantity44,
//     this.customQuantity45,
//     this.customQuantity46,
//     this.customQuantity47,
//     this.customQuantity48,
//     this.customQuantity49,
//     this.customQuantity50,
// this.customName1,
//     this.customName2,
//     this.customName3,
//     this.customName4,
//     this.customName5,
//     this.customName6,
//     this.customName7,
//     this.customName8,
//     this.customName9,
//     this.customName10,
//     this.customName11,
//     this.customName12,
//     this.customName13,
//     this.customName14,
//     this.customName15,
//     this.customName16,
//     this.customName17,
//     this.customName18,
//     this.customName19,
//     this.customName20,
//     this.customName21,
//     this.customName22,
//     this.customName23,
//     this.customName24,
//     this.customName25,
//     this.customName26,
//     this.customName27,
//     this.customName28,
//     this.customName29,
//     this.customName30,
//     this.customName31,
//     this.customName32,
//     this.customName33,
//     this.customName34,
//     this.customName35,
//     this.customName36,
//     this.customName37,
//     this.customName38,
//     this.customName39,
//     this.customName40,
//     this.customName41,
//     this.customName42,
//     this.customName43,
//     this.customName44,
//     this.customName45,
//     this.customName46,
//     this.customName47,
//     this.customName48,
//     this.customName49,
//     this.customName50,

//     this.custom1img,
//     this.custom2img,
//     this.custom3img,
//     this.custom4img,
//     this.custom5img,
//     this.custom6img,
//     this.custom7img,
//     this.custom8img,
//     this.custom9img,
//     this.custom10img,
//  this.custom11img,
//     this.custom12img,
//     this.custom13img,
//     this.custom14img,
//     this.custom15img,
//     this.custom16img,
//     this.custom17img,
//     this.custom18img,
//     this.custom19img,
//     this.custom20img,
//  this.custom21img,
//     this.custom22img,
//     this.custom23img,
//     this.custom24img,
//     this.custom25img,
//     this.custom26img,
//     this.custom27img,
//     this.custom28img,
//     this.custom29img,
//     this.custom30img,
//  this.custom31img,
//     this.custom32img,
//     this.custom33img,
//     this.custom34img,
//     this.custom35img,
//     this.custom36img,
//     this.custom37img,
//     this.custom38img,
//     this.custom39img,
//     this.custom40img,
//  this.custom41img,
//     this.custom42img,
//     this.custom43img,
//     this.custom44img,
//     this.custom45img,
//     this.custom46img,
//     this.custom47img,
//     this.custom48img,
//     this.custom49img,
//     this.custom50img,
// this.customTitle1,
// this.customTitle2,
// this.customTitle3,
// this.customTitle4,
// this.customTitle5,

    this.gender,
    this.details,
    this.productname,
    this.composition,
    this.washandcare,
     this.sizeandfit,
    this.shopmediaUrl,
    this.likes,
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
       this.Ring1,
    this.Ring2,
    this.Ring3,
    this.Ring4,
    this.Ring5,
    this.Ring6,
    this.Ring7,
    this.Ring8,
    this.Ring9,
    this.Ring10,
    this.Ring11,
    this.Ring12,
    this.Ring13,
    this.Ring14,
    this.Ring15,
    this.Ring16,
    this.Ring17,
    this.Ring18,
    this.Ring19,
    this.Ring20,
    this. Ring21,
    this. Ring22,
    this. Ring23,

    this.custom11eur,
    this.custom11usd,
    this.custom11inr,
    this.custom11gbp,
    this.custom21eur,
    this.custom21usd,
    this.custom21inr,
    this.custom21gbp,
    this.custom31eur,
    this.custom31usd,
    this.custom31inr,
    this.custom31gbp,
    this.custom41eur,
    this.custom41usd,
    this.custom41inr,
    this.custom41gbp,
    this.custom51eur,
    this.custom51usd,
    this.custom51inr,
    this.custom51gbp,
    this.custom61eur,
    this.custom61usd,
    this.custom61inr,
    this.custom61gbp,
    this.custom71eur,
    this.custom71usd,
    this.custom71inr,
    this.custom71gbp,
    this.custom81eur,
    this.custom81usd,
    this.custom81inr,
    this.custom81gbp,
    this.custom91eur,
    this.custom91usd,
    this.custom91inr,
    this.custom91gbp,
    this.custom101eur,
    this.custom101usd,
    this.custom101inr,
    this.custom101gbp,
this.processfrom,
this.processto,
this.shipfrom,
this.shipto,
this.shipinterfrom,
this.shipinterto,

    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.color5,
    this.color6,
    this.color7,
    this.color8,
    this.color9,
    this.color10,
 this.colorText1,
    this.colorText2,
    this.colorText3,
    this.colorText4,
    this.colorText5,
    this.colorText6,
    this.colorText7,
    this.colorText8,
    this.colorText9,
    this.colorText10,

    this.photoUrl,
     this.currency,

    this.currentUser,
  });

  factory Prod.fromDocument(DocumentSnapshot doc) {
//    Map data = doc.data ;

    return Prod(
      prodId: doc.data()['prodId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
shipment: doc.data()['shipment'],
worldship: doc.data()['worldship'],
freeworldship: doc.data()['freeworldship'],
freeship: doc.data()['freeship'],
      country: doc.data()['country'],
      sizechartBool: doc.data()['sizechartBool'],
      sizeChart: doc.data()['sizeChart'],

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

      custom11eur: doc.data()['custom11eur'],
      custom11usd: doc.data()['custom11usd'],
      custom11inr: doc.data()['custom11inr'],
      custom11gbp:  doc.data()['custom11gbp'],
      custom21eur: doc.data()['custom21eur'],
      custom21usd: doc.data()['custom21usd'],
      custom21inr: doc.data()['custom21inr'],
      custom21gbp:  doc.data()['custom21gbp'],
      custom31eur: doc.data()['custom31eur'],
      custom31usd: doc.data()['custom31usd'],
      custom31inr: doc.data()['custom31inr'],
      custom31gbp:  doc.data()['custom31gbp'],
      custom41eur: doc.data()['custom41eur'],
      custom41usd: doc.data()['custom41usd'],
      custom41inr: doc.data()['custom41inr'],
      custom41gbp:  doc.data()['custom41gbp'],
      custom51eur: doc.data()['custom51eur'],
      custom51usd: doc.data()['custom51usd'],
      custom51inr: doc.data()['custom51inr'],
      custom51gbp:  doc.data()['custom51gbp'],
      custom61eur: doc.data()['custom61eur'],
      custom61usd: doc.data()['custom61usd'],
      custom61inr: doc.data()['custom61inr'],
      custom61gbp:  doc.data()['custom61gbp'],
      custom71eur: doc.data()['custom71eur'],
      custom71usd: doc.data()['custom71usd'],
      custom71inr: doc.data()['custom71inr'],
      custom71gbp:  doc.data()['custom71gbp'],
      custom81eur: doc.data()['custom81eur'],
      custom81usd: doc.data()['custom81usd'],
      custom81inr: doc.data()['custom81inr'],
      custom81gbp:  doc.data()['custom81gbp'],
      custom91eur: doc.data()['custom91eur'],
      custom91usd: doc.data()['custom91usd'],
      custom91inr: doc.data()['custom91inr'],
      custom91gbp:  doc.data()['custom91gbp'],
      custom101eur: doc.data()['custom101eur'],
      custom101usd: doc.data()['custom101usd'],
      custom101inr: doc.data()['custom101inr'],
      custom101gbp:  doc.data()['custom101gbp'],
        processfrom:  doc.data()['processfrom'],
        processto:  doc.data()['processto'],
        shipfrom:  doc.data()['shipfrom'],
        shipto:  doc.data()['shipto'],
        shipinterfrom:  doc.data()['shipinterfrom'],
        shipinterto:  doc.data()['shipinterto'],

      shipcostinterinr:  doc.data()['shipcostinterninr'],

      shipcostinr:  doc.data()['shipcostinr'],

      shipcostinterusd:  doc.data()['shipcostinternusd'],

      shipcostusd:  doc.data()['shipcostusd'],
   shipcostintereur:  doc.data()['shipcostinterneur'],

      shipcosteur:  doc.data()['shipcosteur'],

      shipcostintergbp:  doc.data()['shipcostinterngbp'],

      shipcostgbp:  doc.data()['shipcostgbp'],


        productname: doc.data()['productname'],
      details: doc.data()['details'],
      shopmediaUrl: doc.data()['shopmediaUrl'],
   composition:doc.data()['composition'],
   washandcare:doc.data()['washandcare'],
    sizeandfit:doc.data()['sizeandfit'],
      likes: doc.data()['likes'],
        photoUrl:doc.data()['photoUrl'],
        freesize:doc.data()['freesizeQuantity'],
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
      currency: doc.data()['currency'],
      variation1img: doc.data()['variation1img'],
      variation2img: doc.data()['variation2img'],
      variation3img: doc.data()['variation3img'],
      variation4img: doc.data()['variation4img'],
      variation5img: doc.data()['variation5img'],
      variation6img: doc.data()['variation6img'],
      variation7img: doc.data()['variation7img'],
      variation8img: doc.data()['variation8img'],
      variation9img: doc.data()['variation9img'],
      variation10img: doc.data()['variation10img'],

 //      custom1img: doc.data()['custom1img'],
 // custom2img: doc.data()['custom2img'],
 // custom3img: doc.data()['custom3img'],
 // custom4img: doc.data()['custom4img'],
 // custom5img: doc.data()['custom5img'],
 // custom6img: doc.data()['custom6img'],
 // custom7img: doc.data()['custom7img'],
 // custom8img: doc.data()['custom8img'],
 // custom9img: doc.data()['custom9img'],
 // custom10img: doc.data()['custom10img'],
 //
 //      custom11img:doc.data()['custom11img'],
 //      custom12img:doc.data()['custom12img'],
 //      custom13img:doc.data()['custom13img'],
 //      custom14img:doc.data()['custom14img'],
 //      custom15img:doc.data()['custom15img'],
 //      custom16img:doc.data()['custom16img'],
 //      custom17img:doc.data()['custom17img'],
 //      custom18img:doc.data()['custom18img'],
 //      custom19img:doc.data()['custom19img'],
 //      custom20img:doc.data()['custom20img'],
 //      custom21img:doc.data()['custom21img'],
 //      custom22img:doc.data()['custom22img'],
 //      custom23img:doc.data()['custom23img'],
 //      custom24img:doc.data()['custom24img'],
 //      custom25img:doc.data()['custom25img'],
 //      custom26img:doc.data()['custom26img'],
 //      custom27img:doc.data()['custom27img'],
 //      custom28img:doc.data()['custom28img'],
 //      custom29img:doc.data()['custom29img'],
 //      custom30img:doc.data()['custom30img'],
 //      custom31img:doc.data()['custom31img'],
 //      custom32img:doc.data()['custom32img'],
 //      custom33img:doc.data()['custom33img'],
 //      custom34img:doc.data()['custom34img'],
 //      custom35img:doc.data()['custom35img'],
 //      custom36img:doc.data()['custom36img'],
 //      custom37img:doc.data()['custom37img'],
 //      custom38img:doc.data()['custom38img'],
 //      custom39img:doc.data()['custom39img'],
 //      custom40img:doc.data()['custom40img'],
 //      custom41img:doc.data()['custom41img'],
 //      custom42img:doc.data()['custom42img'],
 //      custom43img:doc.data()['custom43img'],
 //      custom44img:doc.data()['custom44img'],
 //      custom45img:doc.data()['custom45img'],
 //      custom46img:doc.data()['custom46img'],
 //      custom47img:doc.data()['custom47img'],
 //      custom48img:doc.data()['custom48img'],
 //      custom49img:doc.data()['custom49img'],
 //      custom50img:doc.data()['custom50img'],
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
 //      customQuantity1: doc.data()['customQuantity1'],
 // customQuantity2: doc.data()['customQuantity2'],
 // customQuantity3: doc.data()['customQuantity3'],
 // customQuantity4: doc.data()['customQuantity4'],
 // customQuantity5: doc.data()['customQuantity5'],
 // customQuantity6: doc.data()['customQuantity6'],
 // customQuantity7: doc.data()['customQuantity7'],
 // customQuantity8: doc.data()['customQuantity8'],
 // customQuantity9: doc.data()['customQuantity9'],
 // customQuantity10: doc.data()['customQuantity10'],
 //      customQuantity11:doc.data()['customQuantity11'],
 //      customQuantity12:doc.data()['customQuantity12'],
 //      customQuantity13:doc.data()['customQuantity13'],
 //      customQuantity14:doc.data()['customQuantity14'],
 //      customQuantity15:doc.data()['customQuantity15'],
 //      customQuantity16:doc.data()['customQuantity16'],
 //      customQuantity17:doc.data()['customQuantity17'],
 //      customQuantity18:doc.data()['customQuantity18'],
 //      customQuantity19:doc.data()['customQuantity19'],
 //      customQuantity20:doc.data()['customQuantity20'],
 //      customQuantity21:doc.data()['customQuantity21'],
 //      customQuantity22:doc.data()['customQuantity22'],
 //      customQuantity23:doc.data()['customQuantity23'],
 //      customQuantity24:doc.data()['customQuantity24'],
 //      customQuantity25:doc.data()['customQuantity25'],
 //      customQuantity26:doc.data()['customQuantity26'],
 //      customQuantity27:doc.data()['customQuantity27'],
 //      customQuantity28:doc.data()['customQuantity28'],
 //      customQuantity29:doc.data()['customQuantity29'],
 //      customQuantity30:doc.data()['customQuantity30'],
 //      customQuantity31:doc.data()['customQuantity31'],
 //      customQuantity32:doc.data()['customQuantity32'],
 //      customQuantity33:doc.data()['customQuantity33'],
 //      customQuantity34:doc.data()['customQuantity34'],
 //      customQuantity35:doc.data()['customQuantity35'],
 //      customQuantity36:doc.data()['customQuantity36'],
 //      customQuantity37:doc.data()['customQuantity37'],
 //      customQuantity38:doc.data()['customQuantity38'],
 //      customQuantity39:doc.data()['customQuantity39'],
 //      customQuantity40:doc.data()['customQuantity40'],
 //      customQuantity41:doc.data()['customQuantity41'],
 //      customQuantity42:doc.data()['customQuantity42'],
 //      customQuantity43:doc.data()['customQuantity43'],
 //      customQuantity44:doc.data()['customQuantity44'],
 //      customQuantity45:doc.data()['customQuantity45'],
 //      customQuantity46:doc.data()['customQuantity46'],
 //      customQuantity47:doc.data()['customQuantity47'],
 //      customQuantity48:doc.data()['customQuantity48'],
 //      customQuantity49:doc.data()['customQuantity49'],
 //      customQuantity50:doc.data()['customQuantity50'],
 // customName1: doc.data()['customName1'],
 // customName2: doc.data()['customName2'],
 // customName3: doc.data()['customName3'],
 // customName4: doc.data()['customName4'],
 // customName5: doc.data()['customName5'],
 // customName6: doc.data()['customName6'],
 // customName7: doc.data()['customName7'],
 // customName8: doc.data()['customName8'],
 // customName9: doc.data()['customName9'],
 // customName10: doc.data()['customName10'],
 //      customName11:doc.data()['customName11'],
 //      customName12:doc.data()['customName12'],
 //      customName13:doc.data()['customName13'],
 //      customName14:doc.data()['customName14'],
 //      customName15:doc.data()['customName15'],
 //      customName16:doc.data()['customName16'],
 //      customName17:doc.data()['customName17'],
 //      customName18:doc.data()['customName18'],
 //      customName19:doc.data()['customName19'],
 //      customName20:doc.data()['customName20'],
 //      customName21:doc.data()['customName21'],
 //      customName22:doc.data()['customName22'],
 //      customName23:doc.data()['customName23'],
 //      customName24:doc.data()['customName24'],
 //      customName25:doc.data()['customName25'],
 //      customName26:doc.data()['customName26'],
 //      customName27:doc.data()['customName27'],
 //      customName28:doc.data()['customName28'],
 //      customName29:doc.data()['customName29'],
 //      customName30:doc.data()['customName30'],
 //      customName31:doc.data()['customName31'],
 //      customName32:doc.data()['customName32'],
 //      customName33:doc.data()['customName33'],
 //      customName34:doc.data()['customName34'],
 //      customName35:doc.data()['customName35'],
 //      customName36:doc.data()['customName36'],
 //      customName37:doc.data()['customName37'],
 //      customName38:doc.data()['customName38'],
 //      customName39:doc.data()['customName39'],
 //      customName40:doc.data()['customName40'],
 //      customName41:doc.data()['customName41'],
 //      customName42:doc.data()['customName42'],
 //      customName43:doc.data()['customName43'],
 //      customName44:doc.data()['customName44'],
 //      customName45:doc.data()['customName45'],
 //      customName46:doc.data()['customName46'],
 //      customName47:doc.data()['customName47'],
 //      customName48:doc.data()['customName48'],
 //      customName49:doc.data()['customName49'],
 //      customName50:doc.data()['customName50'],
 //
 //      customTitle1:doc.data()['customTitle1'],
 //      customTitle2:doc.data()['customTitle2'],
 //      customTitle3:doc.data()['customTitle3'],
 //      customTitle4:doc.data()['customTitle4'],
 //      customTitle5:doc.data()['customTitle5'],

    );
  }

     int getLikeCount(likes) {
    //if no likes return 0
    if (likes == null) {
      return 0;
    }
    int count = 0;
    // if the key is explicitly set to true, add a like
    likes.values.forEach((val) {
      if (val == true) {
        count += 1;
      }
    });
    return count;
  }

  @override
  _ProdState createState() => _ProdState(
    prodId: this.prodId,
    ownerId: this.ownerId,
    username: this.username,
    eur:this.eur,
    sizechartBool:this.sizechartBool,
    
    usd:this.usd,
    inr:this.inr,
    cny: this.cny,
    gbp: this.gbp,
    mto:this.mto,
    shipment:this.shipment,
    worldship:this.worldship,
 freeworldship:this.freeworldship,
    freeship:this.freeship,
    shipcostinterusd:this.shipcostinterusd,
    shipcostusd:this.shipcostusd,
    shipcostinterinr:this.shipcostinterinr,
    shipcostinr:this.shipcostinr,
 shipcostintereur:this.shipcostintereur,
    shipcosteur:this.shipcosteur,
    shipcostintergbp:this.shipcostintergbp,
    shipcostgbp:this.shipcostgbp,
    sizeChart:this.sizeChart,

country:this.country,
currency:this.currency,

    gender:this.gender,
    details:this.details,
    productname: this.productname,
   composition: this.composition,
    washandcare: this.washandcare,
    sizeandfit: this.sizeandfit,
    shopmediaUrl: this.shopmediaUrl,
    likes: this.likes,
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

    custom11eur:this.custom11eur,
    custom11usd:this.custom11usd,
    custom11inr:this.custom11inr,
    custom11gbp: this.custom11gbp,
    custom21eur:this.custom21eur,
    custom21usd:this.custom21usd,
    custom21inr:this.custom21inr,
    custom21gbp: this.custom21gbp,
       custom31eur:this.custom31eur,
    custom31usd:this.custom31usd,
    custom31inr:this.custom31inr,
    custom31gbp: this.custom31gbp,
       custom41eur:this.custom41eur,
    custom41usd:this.custom41usd,
    custom41inr:this.custom41inr,
    custom41gbp: this.custom41gbp,
       custom51eur:this.custom51eur,
    custom51usd:this.custom51usd,
    custom51inr:this.custom51inr,
    custom51gbp: this.custom51gbp,
         custom61eur:this.custom61eur,
    custom61usd:this.custom61usd,
    custom61inr:this.custom61inr,
    custom61gbp: this.custom61gbp,
           custom71eur:this.custom71eur,
    custom71usd:this.custom71usd,
    custom71inr:this.custom71inr,
    custom71gbp: this.custom71gbp,
           custom81eur:this.custom81eur,
    custom81usd:this.custom81usd,
    custom81inr:this.custom81inr,
    custom81gbp: this.custom81gbp,
          custom91eur:this.custom91eur,
    custom91usd:this.custom91usd,
    custom91inr:this.custom91inr,
    custom91gbp: this.custom91gbp,
          custom101eur:this.custom101eur,
    custom101usd:this.custom101usd,
    custom101inr:this.custom101inr,
    custom101gbp: this.custom101gbp,
      processfrom: this.processfrom,
      processto: this.processto,
      shipfrom: this.shipfrom,
      shipinterfrom: this.shipinterfrom,
      shipinterto: this.shipinterto,
      shipto: this.shipto,
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
    variation1img:this.variation1img,
    variation2img:this.variation2img,
    variation3img:this.variation3img,
    variation4img:this.variation4img,
    variation5img:this.variation5img,
    variation6img:this.variation6img,
    variation7img:this.variation7img,
    variation8img:this.variation8img,
    variation9img:this.variation9img,
    variation10img:this.variation10img,
   //  custom1img:this.custom1img,
   // custom2img:this.custom2img,
   //  custom3img:this.custom3img,
   //  custom4img:this.custom4img,
   //  custom5img:this.custom5img,
   //  custom6img:this.custom6img,
   //  custom7img:this.custom7img,
   //  custom8img:this.custom8img,
   //  custom9img:this.custom9img,
   //  custom10img:this.custom10img,
   //  custom11img:this.custom11img,
   // custom12img:this.custom12img,
   //  custom13img:this.custom13img,
   //  custom14img:this.custom14img,
   //  custom15img:this.custom15img,
   //  custom16img:this.custom16img,
   //  custom17img:this.custom17img,
   //  custom18img:this.custom18img,
   //  custom19img:this.custom19img,
   //  custom20img:this.custom20img,
   //   custom21img:this.custom21img,
   // custom22img:this.custom22img,
   //  custom23img:this.custom23img,
   //  custom24img:this.custom24img,
   //  custom25img:this.custom25img,
   //  custom26img:this.custom26img,
   //  custom27img:this.custom27img,
   //  custom28img:this.custom28img,
   //  custom29img:this.custom29img,
   //  custom30img:this.custom30img,
   //   custom31img:this.custom31img,
   // custom32img:this.custom32img,
   //  custom33img:this.custom33img,
   //  custom34img:this.custom34img,
   //  custom35img:this.custom35img,
   //  custom36img:this.custom36img,
   //  custom37img:this.custom37img,
   //  custom38img:this.custom38img,
   //  custom39img:this.custom39img,
   //  custom40img:this.custom40img,
   //   custom41img:this.custom41img,
   // custom42img:this.custom42img,
   //  custom43img:this.custom43img,
   //  custom44img:this.custom44img,
   //  custom45img:this.custom45img,
   //  custom46img:this.custom46img,
   //  custom47img:this.custom47img,
   //  custom48img:this.custom48img,
   //  custom49img:this.custom49img,
   //  custom50img:this.custom50img,
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
 //      customQuantity1:this.customQuantity1,
 //   customQuantity2:this.customQuantity2,
 //    customQuantity3:this.customQuantity3,
 //    customQuantity4:this.customQuantity4,
 //    customQuantity5:this.customQuantity5,
 //    customQuantity6:this.customQuantity6,
 //    customQuantity7:this.customQuantity7,
 //    customQuantity8:this.customQuantity8,
 //    customQuantity9:this.customQuantity9,
 //    customQuantity10:this.customQuantity10,
 //    customQuantity11:this.customQuantity11,
 //   customQuantity12:this.customQuantity12,
 //    customQuantity13:this.customQuantity13,
 //    customQuantity14:this.customQuantity14,
 //    customQuantity15:this.customQuantity15,
 //    customQuantity16:this.customQuantity16,
 //    customQuantity17:this.customQuantity17,
 //    customQuantity18:this.customQuantity18,
 //    customQuantity19:this.customQuantity19,
 //    customQuantity20:this.customQuantity20,
 //     customQuantity21:this.customQuantity21,
 //   customQuantity22:this.customQuantity22,
 //    customQuantity23:this.customQuantity23,
 //    customQuantity24:this.customQuantity24,
 //    customQuantity25:this.customQuantity25,
 //    customQuantity26:this.customQuantity26,
 //    customQuantity27:this.customQuantity27,
 //    customQuantity28:this.customQuantity28,
 //    customQuantity29:this.customQuantity29,
 //    customQuantity30:this.customQuantity30,
 //     customQuantity31:this.customQuantity31,
 //   customQuantity32:this.customQuantity32,
 //    customQuantity33:this.customQuantity33,
 //    customQuantity34:this.customQuantity34,
 //    customQuantity35:this.customQuantity35,
 //    customQuantity36:this.customQuantity36,
 //    customQuantity37:this.customQuantity37,
 //    customQuantity38:this.customQuantity38,
 //    customQuantity39:this.customQuantity39,
 //    customQuantity40:this.customQuantity40,
 //     customQuantity41:this.customQuantity41,
 //   customQuantity42:this.customQuantity42,
 //    customQuantity43:this.customQuantity43,
 //    customQuantity44:this.customQuantity44,
 //    customQuantity45:this.customQuantity45,
 //    customQuantity46:this.customQuantity46,
 //    customQuantity47:this.customQuantity47,
 //    customQuantity48:this.customQuantity48,
 //    customQuantity49:this.customQuantity49,
 //    customQuantity50:this.customQuantity50,
 // customName1:this.customName1,
 //   customName2:this.customName2,
 //    customName3:this.customName3,
 //    customName4:this.customName4,
 //    customName5:this.customName5,
 //    customName6:this.customName6,
 //    customName7:this.customName7,
 //    customName8:this.customName8,
 //    customName9:this.customName9,
 //    customName10:this.customName10,
 //    customName11:this.customName11,
 //   customName12:this.customName12,
 //    customName13:this.customName13,
 //    customName14:this.customName14,
 //    customName15:this.customName15,
 //    customName16:this.customName16,
 //    customName17:this.customName17,
 //    customName18:this.customName18,
 //    customName19:this.customName19,
 //    customName20:this.customName20,
 //     customName21:this.customName21,
 //   customName22:this.customName22,
 //    customName23:this.customName23,
 //    customName24:this.customName24,
 //    customName25:this.customName25,
 //    customName26:this.customName26,
 //    customName27:this.customName27,
 //    customName28:this.customName28,
 //    customName29:this.customName29,
 //    customName30:this.customName30,
 //     customName31:this.customName31,
 //   customName32:this.customName32,
 //    customName33:this.customName33,
 //    customName34:this.customName34,
 //    customName35:this.customName35,
 //    customName36:this.customName36,
 //    customName37:this.customName37,
 //    customName38:this.customName38,
 //    customName39:this.customName39,
 //    customName40:this.customName40,
 //     customName41:this.customName41,
 //   customName42:this.customName42,
 //    customName43:this.customName43,
 //    customName44:this.customName44,
 //    customName45:this.customName45,
 //    customName46:this.customName46,
 //    customName47:this.customName47,
 //    customName48:this.customName48,
 //    customName49:this.customName49,
 //    customName50:this.customName50,
 //
 //    customTitle1:this.customTitle1,
 //    customTitle2:this.customTitle2,
 //    customTitle3:this.customTitle3,
 //    customTitle4:this.customTitle4,
 //    customTitle5:this.customTitle5,

    likeCount: getLikeCount(this.likes),
  );
}

class _ProdState extends State<Prod> {
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  String usersize = "";
  String usercolor = "";
  var userCustomQuantity;

  var userVariationQuantity;
  var userSizeQuantity;
  var userColorQuantity;
  String userCustom = "";
  String userVariation;
   String variationIndex;
 String userVariationImg ="";
 String userCustomImg="";

  var userVariationPrice ;

var  time = const Duration(  seconds: 2);
String currencysymbol;
  final String currentUserId = currentUser?.id;
  final String prodId;
  final String ownerId;
  final String username;
   var eur;
  var usd;
   var inr;
  final String cny;
  var gbp;
   final String gender;
 final String shipment;
  final String country;
  final String sizeChart;

final bool worldship;
final bool freeworldship;
final bool freeship;
final bool sizechartBool;

//
//   final String custom1img;
//   final String custom2img;
//   final String custom3img;
//   final String custom4img;
//   final String custom5img;
//   final String custom6img;
//   final String custom7img;
//   final String custom8img;
//   final String custom9img;
//   final String custom10img;
//   final String custom11img;
//   final String custom12img;
//   final String custom13img;
//   final String custom14img;
//   final String custom15img;
//   final String custom16img;
//   final String custom17img;
//   final String custom18img;
//   final String custom19img;
//   final String custom20img;
//   final String custom21img;
//   final String custom22img;
//   final String custom23img;
//   final String custom24img;
//   final String custom25img;
//   final String custom26img;
//   final String custom27img;
//   final String custom28img;
//   final String custom29img;
//   final String custom30img;
//   final String custom31img;
//   final String custom32img;
//   final String custom33img;
//   final String custom34img;
//   final String custom35img;
//   final String custom36img;
//   final String custom37img;
//   final String custom38img;
//   final String custom39img;
//   final String custom40img;
//   final String custom41img;
//   final String custom42img;
//   final String custom43img;
//   final String custom44img;
//   final String custom45img;
//   final String custom46img;
//   final String custom47img;
//   final String custom48img;
//   final String custom49img;
//   final String custom50img;
// final String customTitle1;
// final String customTitle2;
// final String customTitle3;
// final String customTitle4;
// final String customTitle5;

  final String productname;
  final String details;
   String color = "";
    String Custom = "";

  final String composition;
  final String washandcare;
  final String sizeandfit;
  final List shopmediaUrl;
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
   final int Ring1;
  final int Ring2;
  final int Ring3;
  final int Ring4;
  final int Ring5;
  final int Ring6;
  final int Ring7;
  final int  Ring8;
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

  var  custom11eur;
   var custom11usd;
  var  custom11inr;
  var  custom11gbp;
  var  custom21eur;
   var custom21usd;
  var  custom21inr;
  var  custom21gbp;
  var  custom31eur;
  var custom31usd;
  var  custom31inr;
  var  custom31gbp;
  var  custom41eur;
   var custom41usd;
  var  custom41inr;
  var  custom41gbp;
  var  custom51eur;
  var custom51usd;
  var  custom51inr;
  var  custom51gbp;
  var  custom61eur;
  var   custom61usd;
  var  custom61inr;
  var  custom61gbp;
  var  custom71eur;
  var custom71usd;
  var  custom71inr;
  var  custom71gbp;
  var  custom81eur;
  var custom81usd;
  var  custom81inr;
  var  custom81gbp;
  var  custom91eur;
    var custom91usd;
  var  custom91inr;
  var  custom91gbp;
  var  custom101eur;
    var custom101usd;
  var  custom101inr;
  var  custom101gbp;
  var  shipcostusd;
  var  shipcostinterusd;
  var  shipcostinterinr;
  var  shipcostinr;
   var  shipcosteur;
  var  shipcostintereur;
  var  shipcostintergbp;
  var  shipcostgbp;

 final String currency;

  final int processfrom;
  final int processto;
  final int shipfrom;
  final int shipto;
  final int shipinterfrom;
  final int shipinterto;
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
  // final  customQuantity1;
  // final  customQuantity2;
  // final  customQuantity3;
  // final  customQuantity4;
  // final  customQuantity5;
  // final  customQuantity6;
  // final  customQuantity7;
  // final  customQuantity8;
  // final  customQuantity9;
  // final  customQuantity10;
  // final  customQuantity11;
  // final  customQuantity12;
  // final  customQuantity13;
  // final  customQuantity14;
  // final  customQuantity15;
  // final  customQuantity16;
  // final  customQuantity17;
  // final  customQuantity18;
  // final  customQuantity19;
  // final  customQuantity20;
  // final  customQuantity21;
  // final  customQuantity22;
  // final  customQuantity23;
  // final  customQuantity24;
  // final  customQuantity25;
  // final  customQuantity26;
  // final  customQuantity27;
  // final  customQuantity28;
  // final  customQuantity29;
  // final  customQuantity30;
  // final  customQuantity31;
  // final  customQuantity32;
  // final  customQuantity33;
  // final  customQuantity34;
  // final  customQuantity35;
  // final  customQuantity36;
  // final  customQuantity37;
  // final  customQuantity38;
  // final  customQuantity39;
  // final  customQuantity40;
  // final  customQuantity41;
  // final  customQuantity42;
  // final  customQuantity43;
  // final  customQuantity44;
  // final  customQuantity45;
  // final  customQuantity46;
  // final  customQuantity47;
  // final  customQuantity48;
  // final  customQuantity49;
  // final  customQuantity50;
  //  final String customName1;
  // final String customName2;
  // final String customName3;
  // final String customName4;
  // final String customName5;
  // final String customName6;
  // final String customName7;
  // final String customName8;
  // final String customName9;
  // final String customName10;
  // final String customName11;
  // final String customName12;
  // final String customName13;
  // final String customName14;
  // final String customName15;
  // final String customName16;
  // final String customName17;
  // final String customName18;
  // final String customName19;
  // final String customName20;
  // final String customName21;
  // final String customName22;
  // final String customName23;
  // final String customName24;
  // final String customName25;
  // final String customName26;
  // final String customName27;
  // final String customName28;
  // final String customName29;
  // final String customName30;
  // final String customName31;
  // final String customName32;
  // final String customName33;
  // final String customName34;
  // final String customName35;
  // final String customName36;
  // final String customName37;
  // final String customName38;
  // final String customName39;
  // final String customName40;
  // final String customName41;
  // final String customName42;
  // final String customName43;
  // final String customName44;
  // final String customName45;
  // final String customName46;
  // final String customName47;
  // final String customName48;
  // final String customName49;
  // final String customName50;

  final String variation1;
  final String variation2;
  final String variation3;
  final String variation4;
  final String variation5;
  final String variation6;
  final String variation7;
  final String variation8;
  final String variation9;
  final String variation10;
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
  final String variation1img;
  final String variation2img;
  final String variation3img;
  final String variation4img;
  final String variation5img;
  final String variation6img;
  final String variation7img;
  final String variation8img;
  final String variation9img;
  final String variation10img;
var shipcostuser;
String size;
bool custom;
  List<String> selectedCustom1 = <String>[];
  List<String> selectedVariation = <String>[];

  final int mto;
  int likeCount;
  Map likes;
  bool isLiked;
  bool isfav;
  bool showHeart = false;
  bool details1 = true;
int views;
bool isUploading = false;
var e;
bool loader = false;
  TextEditingController mtoController = TextEditingController();
  List <Widget>listOfImages = <Widget>[];
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  _ProdState({
    this.prodId,
    this.ownerId,
    this.username,
    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
     this.shipment,
this.worldship,
this.freeworldship,
this.freeship,
this.shipcostinterusd,
this.shipcostusd,
this.shipcostinterinr,
this.shipcostinr,
 this.shipcostintereur,
this.shipcosteur,
this.shipcostintergbp,
this.shipcostgbp,
this.sizechartBool,
this.sizeChart,

this.country,
this.currency,
    this.variation1,
    this.variation2,
    this.variation3,
    this.variation4,
    this.variation5,
    this.variation6,
    this.variation7,
    this.variation8,
    this.variation9,
    this.variation10,
    this.variationQuantity1,
    this.variationQuantity2,
    this.variationQuantity3,
    this.variationQuantity4,
    this.variationQuantity5,
    this.variationQuantity6,
    this.variationQuantity7,
    this.variationQuantity8,
    this.variationQuantity9,
    this.variationQuantity10,
    this.variation1img,
    this.variation2img,
    this.variation3img,
    this.variation4img,
    this.variation5img,
    this.variation6img,
    this.variation7img,
    this.variation8img,
    this.variation9img,
    this.variation10img,
    // this.custom1img,
    // this.custom2img,
    // this.custom3img,
    // this.custom4img,
    // this.custom5img,
    // this.custom6img,
    // this.custom7img,
    // this.custom8img,
    // this.custom9img,
    // this.custom10img,
    // this.custom11img,
    // this.custom12img,
    // this.custom13img,
    // this.custom14img,
    // this.custom15img,
    // this.custom16img,
    // this.custom17img,
    // this.custom18img,
    // this.custom19img,
    // this.custom20img,
    // this.custom21img,
    // this.custom22img,
    // this.custom23img,
    // this.custom24img,
    // this.custom25img,
    // this.custom26img,
    // this.custom27img,
    // this.custom28img,
    // this.custom29img,
    // this.custom30img,
    // this.custom31img,
    // this.custom32img,
    // this.custom33img,
    // this.custom34img,
    // this.custom35img,
    // this.custom36img,
    // this.custom37img,
    // this.custom38img,
    // this.custom39img,
    // this.custom40img,
    // this.custom41img,
    // this.custom42img,
    // this.custom43img,
    // this.custom44img,
    // this.custom45img,
    // this.custom46img,
    // this.custom47img,
    // this.custom48img,
    // this.custom49img,
    // this.custom50img,
    // this.customQuantity1,
    // this.customQuantity2,
    // this.customQuantity3,
    // this.customQuantity4,
    // this.customQuantity5,
    // this.customQuantity6,
    // this.customQuantity7,
    // this.customQuantity8,
    // this.customQuantity9,
    // this.customQuantity10,
    // this.customQuantity11,
    // this.customQuantity12,
    // this.customQuantity13,
    // this.customQuantity14,
    // this.customQuantity15,
    // this.customQuantity16,
    // this.customQuantity17,
    // this.customQuantity18,
    // this.customQuantity19,
    // this.customQuantity20,
    // this.customQuantity21,
    // this.customQuantity22,
    // this.customQuantity23,
    // this.customQuantity24,
    // this.customQuantity25,
    // this.customQuantity26,
    // this.customQuantity27,
    // this.customQuantity28,
    // this.customQuantity29,
    // this.customQuantity30,
    // this.customQuantity31,
    // this.customQuantity32,
    // this.customQuantity33,
    // this.customQuantity34,
    // this.customQuantity35,
    // this.customQuantity36,
    // this.customQuantity37,
    // this.customQuantity38,
    // this.customQuantity39,
    // this.customQuantity40,
    // this.customQuantity41,
    // this.customQuantity42,
    // this.customQuantity43,
    // this.customQuantity44,
    // this.customQuantity45,
    // this.customQuantity46,
    // this.customQuantity47,
    // this.customQuantity48,
    // this.customQuantity49,
    // this.customQuantity50,
    // this.customName1,
    // this.customName2,
    // this.customName3,
    // this.customName4,
    // this.customName5,
    // this.customName6,
    // this.customName7,
    // this.customName8,
    // this.customName9,
    // this.customName10,
    // this.customName11,
    // this.customName12,
    // this.customName13,
    // this.customName14,
    // this.customName15,
    // this.customName16,
    // this.customName17,
    // this.customName18,
    // this.customName19,
    // this.customName20,
    // this.customName21,
    // this.customName22,
    // this.customName23,
    // this.customName24,
    // this.customName25,
    // this.customName26,
    // this.customName27,
    // this.customName28,
    // this.customName29,
    // this.customName30,
    // this.customName31,
    // this.customName32,
    // this.customName33,
    // this.customName34,
    // this.customName35,
    // this.customName36,
    // this.customName37,
    // this.customName38,
    // this.customName39,
    // this.customName40,
    // this.customName41,
    // this.customName42,
    // this.customName43,
    // this.customName44,
    // this.customName45,
    // this.customName46,
    // this.customName47,
    // this.customName48,
    // this.customName49,
    // this.customName50,
    // this.customTitle1,
    // this.customTitle2,
    // this.customTitle3,
    // this.customTitle4,
    // this.customTitle5,

    this.gender,
    this.details,
    this.productname,
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
     this.Ring1,
    this.Ring2,
    this.Ring3,
    this.Ring4,
    this.Ring5,
    this.Ring6,
    this.Ring7,
    this.Ring8,
    this.Ring9,
    this.Ring10,
    this.Ring11,
    this.Ring12,
    this.Ring13,
    this.Ring14,
    this.Ring15,
    this.Ring16,
    this.Ring17,
    this.Ring18,
    this.Ring19,
    this.Ring20,
    this. Ring21,
     this. Ring22,
     this. Ring23,

    this.custom11eur,
    this.custom11usd,
    this.custom11inr,
    this.custom11gbp,
    this.custom21eur,
    this.custom21usd,
    this.custom21inr,
    this.custom21gbp,
    this.custom31eur,
    this.custom31usd,
    this.custom31inr,
    this.custom31gbp,
    this.custom41eur,
    this.custom41usd,
    this.custom41inr,
    this.custom41gbp,
    this.custom51eur,
    this.custom51usd,
    this.custom51inr,
    this.custom51gbp,
    this.custom61eur,
    this.custom61usd,
    this.custom61inr,
    this.custom61gbp,
    this.custom71eur,
    this.custom71usd,
    this.custom71inr,
    this.custom71gbp,
    this.custom81eur,
    this.custom81usd,
    this.custom81inr,
    this.custom81gbp,
    this.custom91eur,
    this.custom91usd,
    this.custom91inr,
    this.custom91gbp,
    this.custom101eur,
    this.custom101usd,
    this.custom101inr,
    this.custom101gbp,
    this.processfrom,
    this.processto,
    this.shipfrom,
    this.shipto,
    this.shipinterfrom,
    this.shipinterto,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.color5,
    this.color6,
    this.color7,
    this.color8,
    this.color9,
    this.color10,
    this.colorText1,
    this.colorText2,
    this.colorText3,
    this.colorText4,
    this.colorText5,
    this.colorText6,
    this.colorText7,
    this.colorText8,
    this.colorText9,
    this.colorText10,

    this.composition,
    this.washandcare,
    this.sizeandfit,
    this.shopmediaUrl,
    this.likes,
    this.likeCount,
    this.photoUrl,
  });
  pics({String userid,String prodid}){
    return
      FutureBuilder<QuerySnapshot> (
          future:     productsRef
              .doc(userid)
              .collection('userProducts')

              .where('prodId' ,isEqualTo: '$prodid')
          // .where('ownerId' ,isEqualTo: '$ownerId')
              .get(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new Container( height:490,child:ListView.builder(

                  physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection:Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                    listOfImages = [];
                    for (int i = 0;
                    i <
                        snapshot.data.docs[index].data()['shopmediaUrl']
                            .length;
                    i++) {
                      listOfImages.add(GestureDetector(
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            // useRootNavigator:true,

                            barrierDismissible: true,
                            // false = user must tap button, true = tap outside dialog
                            builder: (BuildContext dialogContext) {
                              return
                                Dialog(

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),
                                  child: Container(
                                    height: 400,
                                    child:PhotoView(imageProvider: CachedNetworkImageProvider
                                      (snapshot
                                        .data.docs[index].data()['shopmediaUrl'][i])),),
                                );
                            },
                          );
                        },
                        child: Container(
                          height:490,
                          child: CachedImage(snapshot
                              .data.docs[index].data()['shopmediaUrl'][i]),
                        ),
                      ));
                    }
                    return Column(
                      children: <Widget>[
                        Container(
                            height:490,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child:
                            CarouselSlider(

                                items: listOfImages,
                                options: CarouselOptions(
                                  height:500,
                                  pauseAutoPlayOnManualNavigate: true,
                                  pauseAutoPlayOnTouch: true,
                                  aspectRatio: 16/9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                )
                            )
                        ),

                      ],
                    );
                  }
              ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          });

  }


  void initState() {

    super.initState();
    Views();
   currentUser.currency =="INR" ?
   shipcostuser = currentUser.country == country?shipcostinr:shipcostinterinr:
   currentUser.currency =="EUR" ?
   shipcostuser = currentUser.country == country?shipcosteur:shipcostintereur:
   currentUser.currency =="GBP" ?
   shipcostuser = currentUser.country == country?shipcostgbp:shipcostintergbp:
 shipcostuser = currentUser.country == country?shipcostusd:shipcostinterusd;



  }
// conversion()async {
//   isUploading = true;
//   var convertor;
//    var convertor1;
//    var convertor2;
//    var convertor3;
//    var convertor4;
//    var convertor5;
//    var convertor6;
//    var convertor7;
//    var convertor8;
//    var convertor9;
//    var convertor10;
//    var convertor11;
//
//   if (currentUser.currency == "INR"){
//     convertor = inr.toStringAsFixed(2);
//     inr = double.tryParse(convertor);
//      convertor1 = custom11inr.toStringAsFixed(2);
//     custom11inr = double.tryParse(convertor1);
//   convertor2 = custom21inr.toStringAsFixed(2);
//     custom21inr = double.tryParse(convertor2);
//   convertor3 = custom31inr.toStringAsFixed(2);
//     custom31inr = double.tryParse(convertor3);
//   convertor4 = custom41inr.toStringAsFixed(2);
//     custom41inr = double.tryParse(convertor4);
//   convertor5 = custom51inr.toStringAsFixed(2);
//     custom51inr = double.tryParse(convertor5);
//   convertor6 = custom61inr.toStringAsFixed(2);
//     custom61inr = double.tryParse(convertor6);
//   convertor7 = custom71inr.toStringAsFixed(2);
//     custom71inr = double.tryParse(convertor7);
//   convertor8 = custom81inr.toStringAsFixed(2);
//     custom81inr = double.tryParse(convertor8);
//   convertor9 = custom91inr.toStringAsFixed(2);
//     custom91inr = double.tryParse(convertor9);
//   convertor10 = custom101inr.toStringAsFixed(2);
//     custom101inr = double.tryParse(convertor10);
//   convertor11 = currentUser.country == country?shipcostinr.toStringAsFixed(2):shipcostinterinr.toStringAsFixed(2);
//     shipcostuser = double.tryParse(convertor11);
//
//   }
//   else if (currentUser.currency == "EUR"){
//     convertor = eur.toStringAsFixed(2);
//     eur = double.tryParse(convertor);
//      convertor1 = custom11eur.toStringAsFixed(2);
//     custom11eur = double.tryParse(convertor1);
//   convertor2 = custom21eur.toStringAsFixed(2);
//     custom21eur = double.tryParse(convertor2);
//   convertor3 = custom31eur.toStringAsFixed(2);
//     custom31eur = double.tryParse(convertor3);
//   convertor4 = custom41eur.toStringAsFixed(2);
//     custom41eur = double.tryParse(convertor4);
//   convertor5 = custom51eur.toStringAsFixed(2);
//     custom51eur = double.tryParse(convertor5);
//   convertor6 = custom61eur.toStringAsFixed(2);
//     custom61eur = double.tryParse(convertor6);
//   convertor7 = custom71eur.toStringAsFixed(2);
//     custom71eur = double.tryParse(convertor7);
//   convertor8 = custom81eur.toStringAsFixed(2);
//     custom81eur = double.tryParse(convertor8);
//   convertor9 = custom91eur.toStringAsFixed(2);
//     custom91eur = double.tryParse(convertor9);
//   convertor10 = custom101eur.toStringAsFixed(2);
//     custom101eur = double.tryParse(convertor10);
//   convertor11 = currentUser.country == country?shipcosteur.toStringAsFixed(2):shipcostintereur.toStringAsFixed(2);
//     shipcostuser = double.tryParse(convertor11);
//
//   }
//   else if (currentUser.currency == "GBP"){
//     convertor = gbp.toStringAsFixed(2);
//     gbp = double.tryParse(convertor);
//      convertor1 = custom11gbp.toStringAsFixed(2);
//     custom11gbp = double.tryParse(convertor1);
//   convertor2 = custom21gbp.toStringAsFixed(2);
//     custom21gbp = double.tryParse(convertor2);
//   convertor3 = custom31gbp.toStringAsFixed(2);
//     custom31gbp = double.tryParse(convertor3);
//   convertor4 = custom41gbp.toStringAsFixed(2);
//     custom41gbp = double.tryParse(convertor4);
//   convertor5 = custom51gbp.toStringAsFixed(2);
//     custom51gbp = double.tryParse(convertor5);
//   convertor6 = custom61gbp.toStringAsFixed(2);
//     custom61gbp = double.tryParse(convertor6);
//   convertor7 = custom71gbp.toStringAsFixed(2);
//     custom71gbp = double.tryParse(convertor7);
//   convertor8 = custom81gbp.toStringAsFixed(2);
//     custom81gbp = double.tryParse(convertor8);
//   convertor9 = custom91gbp.toStringAsFixed(2);
//     custom91gbp = double.tryParse(convertor9);
//   convertor10 = custom101gbp.toStringAsFixed(2);
//     custom101gbp = double.tryParse(convertor10);
//   convertor11 = currentUser.country == country?shipcostgbp.toStringAsFixed(2):shipcostintergbp.toStringAsFixed(2);
//     shipcostuser = double.tryParse(convertor11);
//
//   }
//   else{
//     convertor = usd.toStringAsFixed(2);
//     usd = double.tryParse(convertor);
//     convertor1 = custom11usd.toStringAsFixed(2);
//     custom11usd = double.tryParse(convertor1);
//     convertor2 = custom21usd.toStringAsFixed(2);
//     custom21usd = double.tryParse(convertor2);
//     convertor3 = custom31usd.toStringAsFixed(2);
//     custom31usd = double.tryParse(convertor3);
//     convertor4 = custom41usd.toStringAsFixed(2);
//     custom41usd = double.tryParse(convertor4);
//     convertor5 = custom51usd.toStringAsFixed(2);
//     custom51usd = double.tryParse(convertor5);
//     convertor6 = custom61usd.toStringAsFixed(2);
//     custom61usd = double.tryParse(convertor6);
//     convertor7 = custom71usd.toStringAsFixed(2);
//     custom71usd = double.tryParse(convertor7);
//     convertor8 = custom81usd.toStringAsFixed(2);
//     custom81usd = double.tryParse(convertor8);
//     convertor9 = custom91usd.toStringAsFixed(2);
//     custom91usd = double.tryParse(convertor9);
//     convertor10 = custom101usd.toStringAsFixed(2);
//     custom101usd = double.tryParse(convertor10);
//     convertor11 = currentUser.country == country?shipcostusd.toStringAsFixed(2):shipcostinterusd.toStringAsFixed(2);
//     shipcostuser = double.tryParse(convertor11);
//
//   }
//   isUploading = false;
//
// }
  Views()async{
    bool isPostOwner = currentUserId == ownerId;

    DocumentSnapshot doc = await usersRef.doc(ownerId).get();
   Users vUser = Users.fromDocument(doc);
    setState(() {
     views = vUser.visits;

      });


    isPostOwner? null: views++;

    FirebaseFirestore.instance.collection('users')
        .doc(ownerId)
        .update({'visits': views,
    });
  }


  report(){
    Fluttertoast.showToast(
        msg: "Your report has been submitted", timeInSecForIos: 4);
    FirebaseFirestore.instance.collection('reports')
        .doc(ownerId)
        .collection("userReports")
        .doc(prodId)
        .set({
      "type": "shop",
      "userId": ownerId,
      "postId": prodId,
      "timestamp": timestamp,
    });
  }
   Proceedtobuy(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>AddressBuy(
     userVariationQuantity:userVariationQuantity,
     userSizeQuantity: userSizeQuantity,
     userColorQuantity:userColorQuantity,
      userVariationImg: userVariationImg ?? "" ,
Size: usersize,
displaysize: size,
OwnerId: ownerId,prodId:prodId ,
        profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname,
usd:usd,
inr:inr,
gbp:gbp,
eur:eur,
freeship:freeship,
 freeworldship:freeworldship,

      shipcostuser: shipcostuser,
//
//       custompriceusd:custompriceusd,
//       custompriceinr:custompriceinr,
price:  currentUser.currency == "EUR"? eur:
currentUser.currency == "INR"? inr:
currentUser.currency == "GBP"? gbp:
usd,
// custompricegbp:custompriceinr,

customIndex:variationIndex,
      userCustom:userVariation,
     customprice:userVariationPrice,
country:country,
color:color,
colorText:usercolor,
mtoText:mtoController.text??"" ,


    )));



  }
MTO(){
  showDialog<void>(
    context: context,
    // useRootNavigator:true,

    barrierDismissible: true,
    // false = user must tap button, true = tap outside dialog
    builder: (BuildContext dialogContext) {
      return
        Dialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
          child:
          Container(
            height:400,

            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      style: TextStyle(color: kText),
                      controller: mtoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Made-to-order',
                        labelStyle: TextStyle(color: kText),
                        hintText: 'Comment',
                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  //Customised
                  Container(
                    // alignment:Alignment.centerLeft,
                    child:   FloatingActionButton.extended(
                      backgroundColor: Colors.black,
                      onPressed: () {

                      setState(() {
                        size = "Made-to-order";
                        usersize = 'MTO ';
                      });
                      Get.back();},
                      label: Text('Done',style:TextStyle(color:  Colors.white) ,),
                    ),
                  ),
                ],) ,
              ),
            ),
          ),

        );
    },
  );
}
   Buynow(parentContext) {
     List<String> selectedCategory = <String>[];
     List<String> selectedColor = <String>[];
List<String> selectedCustom2 = <String>[];
List<String> selectedCustom3 = <String>[];
List<String> selectedCustom4 = <String>[];
List<String> selectedCustom5 = <String>[];

     return
       showMaterialModalBottomSheet(

           context: parentContext,
           builder: (BuildContext context) {
             return
               StatefulBuilder(
                   builder: (BuildContext ctx, StateSetter stateSetter){

                     return
                       ClipRRect(
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(25),
                             topRight: Radius.circular(25)
                         ),
                         child: SingleChildScrollView(
                             child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,

                                 children: [
                                   SizedBox(height:20.0),

                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.end,

                                       children: [
                                         GFButton(
                                           color: Colors.black,
                                           shape:  GFButtonShape.pills,
                                           textColor: Colors.black,
                                           type : GFButtonType.outline,
                                           onPressed: ()=>sizeGuide(),
                                           text:"Size Guide",


                                         ),



                                       ],
                                     ),
                                   ),
                                   gender == 'Men'?  Container(
                                     height:60.0,

                                     child:   Expanded(
                                       child:   ListView(
                                           scrollDirection:Axis.horizontal,
                                           shrinkWrap:true,
                                           children:[

                                             mto==0?Container():  Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
                                                         elevation : 0.1,

                                                   primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("MTO");
                                                   stateSetter(() {usersize = "MTO";
                                                   size = 'MTO';

                                                   userSizeQuantity = mto;
                                                   });
                                                   MTO();

                                                 },          child: Text('MTO'),
                                               ),
                                             ),
                                             freesize==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("Free Size");

                                                   stateSetter(() {usersize = "Free Size";
                                                   userSizeQuantity = freesize;
                                                   size = 'Free Size';

                                                   });
                                                 },          child: Text('Free Size'),
                                               ),
                                             ),

                                             xxxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXXS") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXXS");

                                                   stateSetter(() {usersize = "XXXS";
                                                   userSizeQuantity = xxxs;
                                                   size = 'XXXS';

                                                   });
                                                 },          child: Text('XXXS'),
                                               ),
                                             ),
                                             xxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXS") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXS");

                                                   stateSetter(() {usersize = "XXS";
                                                   userSizeQuantity = xxs;
                                                   size = 'XXS';

                                                   });
                                                 },          child: Text('XXS'),
                                               ),
                                             ),
                                             xs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XS") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XS");

                                                   stateSetter(() {usersize = "XS";
                                                   userSizeQuantity = xs;
                                                   size = 'XS';

                                                   });
                                                 },          child: Text('XS'),
                                               ),
                                             ),
                                             s==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S");

                                                   stateSetter(() {usersize = "S";
                                                   userSizeQuantity = s;
                                                   size = 'S';

                                                   });
                                                 },          child: Text('S'),
                                               ),
                                             ),
                                             m==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("M");

                                                   stateSetter(() {usersize = "M";
                                                   userSizeQuantity = m;
                                                   size = 'M';

                                                   });
                                                 },          child: Text('M'),
                                               ),
                                             ),

                                             l==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("L") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("L") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("L");

                                                   stateSetter(() {usersize = "L";
                                                   userSizeQuantity = l;
                                                   size = 'L';

                                                   });
                                                 },          child: Text('L'),
                                               ),
                                             ),
                                             xl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XL");

                                                   stateSetter(() {usersize = "XL";
                                                   userSizeQuantity = xl;
                                                   size = 'XL';

                                                   });
                                                 },          child: Text('XL'),
                                               ),
                                             ),
                                             xxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXL");

                                                   stateSetter(() {usersize = "XXL";
                                                   userSizeQuantity = xxl;
                                                   size = 'XXL';

                                                   });
                                                 },          child: Text('XXL'),
                                               ),
                                             ),
                                             xxxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXXL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXXL");

                                                   stateSetter(() {usersize = "XXXL";
                                                   userSizeQuantity = xxxl;
                                                   size = 'XXXL';

                                                   });
                                                 },          child: Text('XXXL'),
                                               ),
                                             ),
                                             fourxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("4XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("4XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("4XL");

                                                   stateSetter(() {usersize = "4XL";
                                                   userSizeQuantity = fourxl;
                                                   size = '4XL';

                                                   });
                                                 },          child: Text('4XL'),
                                               ),
                                             ),
                                             fivexl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("5XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("5XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("5XL");

                                                   stateSetter(() {usersize = "5XL";
                                                   userSizeQuantity = fivexl;
                                                   size = '5XL';

                                                   });
                                                 },          child: Text('5XL'),
                                               ),
                                             ),
                                             sixxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("6XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("6XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("6XL");

                                                   stateSetter(() {usersize = "6XL";
                                                   userSizeQuantity = sixxl;
                                                   size = '6XL';

                                                   });
                                                 },          child: Text('6XL'),
                                               ),
                                             ),
                                             sevenxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("7XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("7XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("7XL");

                                                   stateSetter(() {usersize = "7XL";
                                                   userSizeQuantity = sevenxl;
                                                   size = '7XL';

                                                   });
                                                 },          child: Text('7XL'),
                                               ),
                                             ),
                                             eightxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("8XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("8XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("8XL");

                                                   stateSetter(() {usersize = "8XL";
                                                   userSizeQuantity = eightxl;
                                                   size = '8XL';

                                                   });
                                                 },          child: Text('8XL'),
                                               ),
                                             ),
                                             Ring1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 4") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 4");

                                                   stateSetter(() {usersize = "R 4";
                                                   size = '(US) 4';
                                                   userSizeQuantity = Ring1;

                                                   });
                                                 },          child: Text('(US) 4'),
                                               ),
                                             ),
                                             Ring2==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 4.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 4.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 4.5");

                                                   stateSetter(() {usersize = "R 4.5";
                                                   size = '(US) 4.5';
                                                   userSizeQuantity = Ring2;

                                                   });
                                                 },          child: Text('(US) 4.5'),
                                               ),
                                             ),

                                             Ring3==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 5");

                                                   stateSetter(() {usersize = "R 5";
                                                   size = '(US) 5';
                                                   userSizeQuantity = Ring3;

                                                   });
                                                 },          child: Text('(US) 5'),
                                               ),
                                             ),
                                             Ring4==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 5.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 5.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 5.5");

                                                   stateSetter(() {usersize = "R 5.5";
                                                   size = '(US) 5.5';
                                                   userSizeQuantity = Ring4;

                                                   });
                                                 },          child: Text('(US) 5.5'),
                                               ),
                                             ),
                                             Ring5==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 6") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 6");

                                                   stateSetter(() {usersize = "R 6";
                                                   size = '(US) 6';
                                                   userSizeQuantity = Ring5;

                                                   });
                                                 },          child: Text('(US) 6'),
                                               ),
                                             ),
                                             Ring6==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 6.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 6.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 6.5");

                                                   stateSetter(() {usersize = "R 6.5";
                                                   size = '(US) 6.5';
                                                   userSizeQuantity = Ring6;
                                                   });
                                                 },          child: Text('(US) 6.5'),
                                               ),
                                             ),
                                             Ring7==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 7") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 7");

                                                   stateSetter(() {usersize = "R 7";
                                                   size = '(US) 7 ';
                                                   userSizeQuantity = Ring7;
                                                   });
                                                 },          child: Text('(US) 7'),
                                               ),
                                             ),
                                             Ring8==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 7.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 7.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 7.5");

                                                   stateSetter(() {usersize = "R 7.5";
                                                   size = '(US) 7.5 ';
                                                   userSizeQuantity = Ring8;
                                                   });
                                                 },          child: Text('(US) 7.5'),
                                               ),
                                             ),
                                             Ring9==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 8") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 8");

                                                   stateSetter(() {usersize = "R 8";
                                                   size = '(US) 8 ';
                                                   userSizeQuantity = Ring9;
                                                   });
                                                 },          child: Text('(US) 8'),
                                               ),
                                             ),
                                             Ring10==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 8.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 8.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 8.5");

                                                   stateSetter(() {usersize = "R 8.5";
                                                   size = '(US) 8.5 ';
                                                   userSizeQuantity = Ring10;
                                                   });
                                                 },          child: Text('(US) 8.5'),
                                               ),
                                             ),
                                             Ring11==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 9") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 9");

                                                   stateSetter(() {usersize = "R 9";
                                                   size = '(US) 9 ';
                                                   userSizeQuantity = Ring11;
                                                   });
                                                 },          child: Text('(US) 9'),
                                               ),
                                             ),
                                             Ring12==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 9.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 9.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 9.5");

                                                   stateSetter(() {usersize = "R 9.5";
                                                   size = '(US) 9.5 ';
                                                   userSizeQuantity = Ring12;
                                                   });
                                                 },          child: Text('(US) 9.5'),
                                               ),
                                             ),
                                             Ring13==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 10") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 10");

                                                   stateSetter(() {usersize = "R 10";
                                                   size = '(US) 10 ';
                                                   userSizeQuantity = Ring13;
                                                   });
                                                 },          child: Text('(US) 10'),
                                               ),
                                             ),
                                             Ring14==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 10.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 10.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 10.5");

                                                   stateSetter(() {usersize = "R 10.5";
                                                   size = '(US) 10.5 ';
                                                   userSizeQuantity = Ring14;
                                                   });
                                                 },          child: Text('(US) 10.5'),
                                               ),
                                             ),
                                             Ring15==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 11") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 11") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 11");

                                                   stateSetter(() {usersize = "R 11";
                                                   size = '(US) 11 ';
                                                   userSizeQuantity = Ring15;
                                                   });
                                                 },          child: Text('(US) 11'),
                                               ),
                                             ),
                                             Ring16==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 11.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 11.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 11.5");

                                                   stateSetter(() {usersize = "R 11.5";
                                                   size = '(US) 11.5 ';
                                                   userSizeQuantity = Ring16;
                                                   });
                                                 },          child: Text('(US) 11.5'),
                                               ),
                                             ),
                                             Ring17==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 12") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 12");

                                                   stateSetter(() {usersize = "R 12";
                                                   size = '(US) 12 ';
                                                   userSizeQuantity = Ring17;
                                                   });
                                                 },          child: Text('(US) 12'),
                                               ),
                                             ),
                                             Ring18==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 12.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 12.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 12.5");

                                                   stateSetter(() {usersize = "R 12.5";
                                                   size = '(US) 12.5 ';
                                                   userSizeQuantity = Ring18;
                                                   });
                                                 },          child: Text('(US) 12.5'),
                                               ),
                                             ),
                                             Ring19==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 13") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 13");

                                                   stateSetter(() {usersize = "R 13";
                                                   size = '(US) 13 ';
                                                   userSizeQuantity = Ring19;
                                                   });
                                                 },          child: Text('(US) 13'),
                                               ),
                                             ),
                                             Ring20==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 13.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 13.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 13.5");

                                                   stateSetter(() {
                                                     size = '(US) 13.5 ';
                                                     userSizeQuantity = Ring20;
                                                     usersize = "R 13.5";});
                                                 },          child: Text('(US) 13.5'),
                                               ),
                                             ),
                                             Ring21==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 14") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 14");

                                                   stateSetter(() {usersize = "R 14";
                                                   size = '(US) 14 ';
                                                   userSizeQuantity = Ring21;
                                                   });
                                                 },          child: Text('(US) 14'),
                                               ),
                                             ),
                                             Ring22==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 14.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 14.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 14.5");

                                                   stateSetter(() {usersize = "R 14.5";
                                                   size = '(US) 14.5 ';
                                                   userSizeQuantity = Ring22;
                                                   });
                                                 },          child: Text('(US) 14.5'),
                                               ),
                                             ),
                                             Ring23==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 15") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 15") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 15");

                                                   stateSetter(() {usersize = "R 15";
                                                   size = '(US) 15 ';
                                                   userSizeQuantity = Ring23;

                                                   });
                                                 },          child: Text('(US) 15'),
                                               ),
                                             ),
                                             Shoe1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 3 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 3 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 3 ½");

                                                   stateSetter(() {usersize = "(US) 3 ½";
                                                   size = '(US) 3 ½ ';
                                                   userSizeQuantity = Shoe1;
                                                   });
                                                 },          child: Text('(US) 3 ½'),
                                               ),
                                             ),
                                             Shoe2==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("(US) 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("(US) 4") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("(US) 4");

                                                     stateSetter(() {usersize = "(US) 4";
                                                     size = '(US) 4 ';
                                                     userSizeQuantity = Shoe2;
                                                     });
                                                   },          child: Text('(US) 4'),
                                                 )),
                                             Shoe3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("(US) 4 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("(US) 4 ½") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("(US) 4 ½");

                                                     stateSetter(() {usersize = "(US) 4 ½";
                                                     size = '(US) 4 ½ ';
                                                     userSizeQuantity = Shoe3;
                                                     });
                                                   },          child: Text('(US) 4 ½'),
                                                 )),
                                             Shoe4==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("(US) 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("(US) 5") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("(US) 5");

                                                     stateSetter(() {usersize = "(US) 5";
                                                     size = '(US) 5 ';
                                                     userSizeQuantity = Shoe4;
                                                     });
                                                   },          child: Text('(US) 5'),
                                                 )),
                                             Shoe5==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("(US) 5 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("(US) 5 ½") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("(US) 5 ½");

                                                     stateSetter(() {usersize = "(US) 5 ½";
                                                     size = '(US) 5 ½ ';
                                                     userSizeQuantity = Shoe5;
                                                     });
                                                   },          child: Text('(US) 5 ½'),
                                                 )),
                                             Shoe6==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("(US) 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("(US) 6") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("(US) 6");

                                                     stateSetter(() {usersize = "(US) 6";
                                                     size = '(US) 6 ';
                                                     userSizeQuantity = Shoe6;
                                                     });
                                                   },          child: Text('(US) 6'),
                                                 )),
                                             Shoe7==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 6 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 6 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 6 ½");

                                                   stateSetter(() {usersize = "(US) 6 ½";
                                                   size = '(US) 6 ½ ';
                                                   userSizeQuantity = Shoe7;
                                                   });
                                                 },          child: Text('(US) 6 ½'),
                                               ),
                                             ),
                                             Shoe8==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 7") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 7");

                                                   stateSetter(() {usersize = "(US) 7";
                                                   size = '(US) 7 ';
                                                   userSizeQuantity = Shoe8;
                                                   });
                                                 },          child: Text('(US) 7'),
                                               ),
                                             ),
                                             Shoe9==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 7 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 7 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 7 ½");

                                                   stateSetter(() {usersize = "(US) 7 ½";
                                                   size = '(US) 7 ½ ';
                                                   userSizeQuantity = Shoe9;
                                                   });
                                                 },          child: Text('(US) 7 ½'),
                                               ),
                                             ),
                                             Shoe10==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 8") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 8");

                                                   stateSetter(() {usersize = "(US) 8";
                                                   size = '(US) 8 ';
                                                   userSizeQuantity = Shoe10;
                                                   });
                                                 },          child: Text('(US) 8'),
                                               ),
                                             ),
                                             Shoe11==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 8 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 8 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 8 ½");

                                                   stateSetter(() {usersize = "(US) 8 ½";
                                                   size = '(US) 8 ½ ';
                                                   userSizeQuantity = Shoe11;
                                                   });
                                                 },          child: Text('(US) 8 ½'),
                                               ),
                                             ),
                                             Shoe12==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 9") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 9");

                                                   stateSetter(() {usersize = "(US) 9";
                                                   size = '(US) 9 ';
                                                   userSizeQuantity = Shoe12;
                                                   });
                                                 },          child: Text('(US) 9'),
                                               ),
                                             ),
                                             Shoe13==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 9 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 9 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 9 ½");

                                                   stateSetter(() {usersize = "(US) 9 ½";

                                                   size = '(US) 9 ½ ';
                                                   userSizeQuantity = Shoe13;
                                                   });
                                                 },          child: Text('(US) 9 ½'),
                                               ),
                                             ),
                                             Shoe14==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 10") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 10");

                                                   stateSetter(() {usersize = "(US) 10";
                                                   size = '(US) 10 ';
                                                   userSizeQuantity = Shoe14;
                                                   });
                                                 },          child: Text('(US) 10'),
                                               ),
                                             ),
                                             Shoe15==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 10 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 10 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 10 ½");

                                                   stateSetter(() {usersize = "(US) 10 ½";
                                                   size = '(US) 10 ½ ';
                                                   userSizeQuantity = Shoe15;
                                                   });
                                                 },          child: Text('(US) 10 ½'),
                                               ),
                                             ),
                                             Shoe16==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(



                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,



                                                   primary: selectedCategory.contains("(US) 11") ? Colors.black: Colors.white.withOpacity(0.1), // background

                                                   onPrimary:selectedCategory.contains("(US) 11") ? Colors.white:  Colors.black, // foreground

                                                 ),

                                                 onPressed: () {

                                                   selectedCategory =  <String>[];

                                                   selectedCategory.add("(US) 11");



                                                   stateSetter(() {usersize = "(US) 11";
                                                   size = '(US) 11 ';
                                                   userSizeQuantity = Shoe16;
                                                   });

                                                 },          child: Text('(US) 11'),

                                               ),
                                             ),
                                             Shoe17==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 11 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 11 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 11 ½");

                                                   stateSetter(() {usersize = "(US) 11 ½";
                                                   size = '(US) 11 ½ ';
                                                   userSizeQuantity = Shoe17;
                                                   });
                                                 },          child: Text('(US) 11 ½'),
                                               ),
                                             ),
                                             Shoe18==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 12") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 12");

                                                   stateSetter(() {usersize = "(US) 12";
                                                   size = '(US) 12 ';
                                                   userSizeQuantity = Shoe18;
                                                   });
                                                 },          child: Text('(US) 12'),
                                               ),
                                             ),
                                             Shoe19==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 12 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 12 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 12 ½");

                                                   stateSetter(() {usersize = "(US) 12 ½";
                                                   size = '(US) 12 ½ ';
                                                   userSizeQuantity = Shoe19;
                                                   });
                                                 },          child: Text('(US) 12 ½'),
                                               ),
                                             ),
                                             Shoe20==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 13") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 13");

                                                   stateSetter(() {usersize = "(US) 13";
                                                   size = '(US) 13 ';
                                                   userSizeQuantity = Shoe20;
                                                   });
                                                 },          child: Text('(US) 13'),
                                               ),
                                             ),
                                             Shoe21==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("(US) 13 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("(US) 13 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("(US) 13 ½");

                                                   stateSetter(() {usersize = "(US) 13 ½";
                                                   size = '(US) 13 ½ ';
                                                   userSizeQuantity = Shoe21;
                                                   });
                                                 },          child: Text('(US) 13 ½'),
                                               ),
                                             ),



                                           ]
                                       ),
                                     ),
                                   ):gender == 'Baby-Boys'||gender == 'Baby-Girls'?
                                   Container(
                                     height:60.0,

                                     child:   Expanded(
                                       child:   ListView(
                                           scrollDirection:Axis.horizontal,
                                           shrinkWrap:true,
                                           children:[
                                             mto==0?Container():  Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("MTO");
                                                   stateSetter(() {usersize = "MTO";
                                                   size = 'MTO';

                                                   userSizeQuantity = mto;
                                                   });
                                                   MTO();

                                                 },          child: Text('MTO'),
                                               ),
                                             ),
                                             freesize==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("Free Size");

                                                   stateSetter(() {usersize = "Free Size";
                                                   userSizeQuantity = freesize;
                                                   size = 'Free Size';

                                                   });
                                                 },          child: Text('Free Size'),
                                               ),
                                             ),

                                             xxxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("0-3 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("0-3 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("0-3 M");

                                                   stateSetter(() {usersize = "0-3 M";
                                                   size = '0-3 M';
                                                   userSizeQuantity = xxxs;

                                                   });
                                                 },          child: Text('0-3 M'),
                                               ),
                                             ),
                                             xxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("3-6 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("3-6 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("3-6 M");

                                                   stateSetter(() {usersize = "3-6 M";
                                                   size = '3-6 M';
                                                   userSizeQuantity = xxs;
                                                   });
                                                 },          child: Text('3-6 M'),
                                               ),
                                             ),
                                             xs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("6-9 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("6-9 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("6-9 M");

                                                   stateSetter(() {usersize = "6-9 M";
                                                   size = '6-9 M';
                                                   userSizeQuantity = xs;
                                                   });
                                                 },          child: Text('6-9 M'),
                                               ),
                                             ),
                                             s==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("9-12 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("9-12 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("9-12 M");

                                                   stateSetter(() {usersize = "9-12 M";
                                                   size = '9-12 M';
                                                   userSizeQuantity = s;
                                                   });
                                                 },          child: Text('9-12 M'),
                                               ),
                                             ),
                                             m==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("12-18 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("12-18 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("12-18 M");

                                                   stateSetter(() {usersize = "12-18 M";
                                                   size = '12-18 M';
                                                   userSizeQuantity = m;
                                                   });
                                                 },          child: Text('12-18 M'),
                                               ),
                                             ),

                                             l==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("18-24 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("18-24 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("18-24 M");

                                                   stateSetter(() {usersize = "18-24 M";
                                                   size = '18-24 M';
                                                   userSizeQuantity = l;
                                                   });
                                                 },          child: Text('18-24 M'),
                                               ),
                                             ),

                                             Shoe1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 0-3 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 0-3 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 0-3 M");

                                                   stateSetter(() {usersize = "S 0-3 M";
                                                   size = '0-3 M';
                                                   userSizeQuantity = Shoe1;
                                                   });
                                                 },          child: Text('S 0-3 M'),
                                               ),
                                             ),
                                             Shoe2==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 3-6 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 3-6 M") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 3-6 M");

                                                     stateSetter(() {usersize = "S 3-6 M";
                                                     size = '3-6 M';
                                                     userSizeQuantity = Shoe2;
                                                     });
                                                   },          child: Text('S 3-6 M'),
                                                 )),
                                             Shoe3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("6 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("6 M") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("6 M");

                                                     stateSetter(() {usersize = "6 M";
                                                     size = '6 M';
                                                     userSizeQuantity = Shoe3;
                                                     });
                                                   },          child: Text('6 M'),
                                                 )),
                                             Shoe4==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("9 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("9 M") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("9 M");

                                                     stateSetter(() {usersize = "9 M";
                                                     size = '9 M';
                                                     userSizeQuantity = Shoe4;
                                                     });
                                                   },          child: Text('9 M'),
                                                 )),
                                             Shoe5==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 9-12 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 9-12 M") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 9-12 M");

                                                     stateSetter(() {usersize = "S 9-12 M";
                                                     size = '9-12 M';
                                                     userSizeQuantity = Shoe5;
                                                     });
                                                   },          child: Text('S 9-12 M'),
                                                 )),
                                             Shoe6==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 12-18 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 12-18 M") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 12-18 M");

                                                     stateSetter(() {usersize = "S 12-18 M";
                                                     size = '12-18 M';
                                                     userSizeQuantity = Shoe6;
                                                     });
                                                   },          child: Text('S 12-18 M'),
                                                 )),
                                             Shoe7==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 18-24 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 18-24 M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 18-24 M");

                                                   stateSetter(() {usersize = "S 18-24 M";
                                                   size = '18-24 M';
                                                   userSizeQuantity = Shoe7;
                                                   });
                                                 },          child: Text('S 18-24 M'),
                                               ),
                                             ),


                                           ]
                                       ),
                                     ),
                                   ):
                                   gender == 'Kids-Boys'||gender == 'Kids-Girls'?
                                   Container(
                                     height:60.0,

                                     child:   Expanded(
                                       child:   ListView(
                                           scrollDirection:Axis.horizontal,
                                           shrinkWrap:true,
                                           children:[
                                             mto==0?Container():  Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("MTO");
                                                   stateSetter(() {usersize = "MTO";
                                                   size = 'MTO';

                                                   userSizeQuantity = mto;
                                                   });
                                                   MTO();

                                                 },          child: Text('MTO'),
                                               ),
                                             ),
                                             freesize==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("Free Size");

                                                   stateSetter(() {usersize = "Free Size";
                                                   userSizeQuantity = freesize;
                                                   size = 'Free Size';

                                                   });
                                                 },          child: Text('Free Size'),
                                               ),
                                             ),

                                             xxxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("2 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("2 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("2 Y");

                                                   stateSetter(() {usersize = "2 Y";
                                                   size = '2 Y';
                                                   userSizeQuantity = xxxs;
                                                   });
                                                 },          child: Text('2 Y'),
                                               ),
                                             ),
                                             xxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("3-4 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("3-4 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("3-4 Y");

                                                   stateSetter(() {usersize = "3-4 Y";
                                                   size = '3-4 Y';
                                                   userSizeQuantity = xxs;
                                                   });
                                                 },          child: Text('3-4 Y'),
                                               ),
                                             ),
                                             xs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("4-5 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("4-5 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("4-5 Y");

                                                   stateSetter(() {usersize = "4-5 Y";
                                                   size = '4-5 Y';
                                                   userSizeQuantity = xs;
                                                   });
                                                 },          child: Text('4-5 Y'),
                                               ),
                                             ),
                                             s==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("5-6 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("5-6 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("5-6 Y");

                                                   stateSetter(() {usersize = "5-6 Y";
                                                   size = '5-6 Y';
                                                   userSizeQuantity = s;
                                                   });
                                                 },          child: Text('5-6 Y'),
                                               ),
                                             ),
                                             m==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("6-7 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("6-7 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("6-7 Y");

                                                   stateSetter(() {usersize = "6-7 Y";
                                                   size = '6-7 Y';
                                                   userSizeQuantity = m;
                                                   });
                                                 },          child: Text('6-7 Y'),
                                               ),
                                             ),

                                             l==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("7-8 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("7-8 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("7-8 Y");

                                                   stateSetter(() {usersize = "7-8 Y";
                                                   size = '7-8 Y';
                                                   userSizeQuantity = l;
                                                   });
                                                 },          child: Text('7-8 Y'),
                                               ),
                                             ),
                                             xl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("8-9 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("8-9 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("8-9 Y");

                                                   stateSetter(() {usersize = "8-9 Y";
                                                   size = '8-9 Y';
                                                   userSizeQuantity = xl;
                                                   });
                                                 },          child: Text('8-9 Y'),
                                               ),
                                             ),
                                             xxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("9-10 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("9-10 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("9-10 Y");

                                                   stateSetter(() {usersize = "9-10 Y";
                                                   size = '9-10 Y';
                                                   userSizeQuantity = xxl;
                                                   });
                                                 },          child: Text('9-10 Y'),
                                               ),
                                             ),
                                             xxxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("10-11 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("10-11 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("10-11 Y");

                                                   stateSetter(() {usersize = "10-11 Y";
                                                   size = '10-11 Y';
                                                   userSizeQuantity = xxxl;
                                                   });
                                                 },          child: Text('10-11 Y'),
                                               ),
                                             ),
                                             fourxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("11-12 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("11-12 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("11-12 Y");

                                                   stateSetter(() {usersize = "11-12 Y";
                                                   size = '11-12 Y';
                                                   userSizeQuantity = fourxl;
                                                   });
                                                 },          child: Text('11-12 Y'),
                                               ),
                                             ),

                                             Shoe1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 2 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 2 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 2 Y");

                                                   stateSetter(() {usersize = "S 2 Y";
                                                   size = '2 Y';
                                                   userSizeQuantity = Shoe1;
                                                   });
                                                 },          child: Text('S 2 Y'),
                                               ),
                                             ),
                                             Shoe2==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 2 ½ Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 2 ½ Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 2 ½ Y");

                                                     stateSetter(() {usersize = "S 2 ½ Y";
                                                     size = '2 ½ Y';
                                                     userSizeQuantity = Shoe2;
                                                     });
                                                   },          child: Text('S 2 ½ Y'),
                                                 )),
                                             Shoe3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 3 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 3 Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 3 Y");

                                                     stateSetter(() {usersize = "S 3 Y";
                                                     size = '3 Y';
                                                     userSizeQuantity = Shoe3;
                                                     });
                                                   },          child: Text('S 3 Y'),
                                                 )),
                                             Shoe4==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 3 ½ Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 3 ½ Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 3 ½ Y");

                                                     stateSetter(() {usersize = "S 3 ½ Y";
                                                     size = '3 ½ Y';
                                                     userSizeQuantity = Shoe4;
                                                     });
                                                   },          child: Text('S 3 ½ Y'),
                                                 )),
                                             Shoe5==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 4 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 4 Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 4 Y");

                                                     stateSetter(() {usersize = "S 4 Y";
                                                     size = '4 Y';
                                                     userSizeQuantity = Shoe5;
                                                     });
                                                   },          child: Text('S 4 Y'),
                                                 )),

                                             Shoe6==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 5 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 5 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 5 Y");

                                                   stateSetter(() {usersize = "S 5 Y";
                                                   size = '5 Y';
                                                   userSizeQuantity = Shoe6;
                                                   });
                                                 },          child: Text('S 5 Y'),
                                               ),
                                             ),
                                             Shoe7==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 6 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 6 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 6 Y");

                                                   stateSetter(() {usersize = "S 6 Y";
                                                   size = '6 Y';
                                                   userSizeQuantity = Shoe7;
                                                   });
                                                 },          child: Text('S 6 Y'),
                                               ),
                                             ),
                                             Shoe8==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 7 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 7 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 7 Y");

                                                   stateSetter(() {usersize = "S 7 Y";
                                                   size = '7 Y';
                                                   userSizeQuantity = Shoe8;
                                                   });
                                                 },          child: Text('S 7 Y'),
                                               ),
                                             ),
                                             Shoe9==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 8 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 8 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 8 Y");

                                                   stateSetter(() {usersize = "S 8 Y";
                                                   size = '8 Y';
                                                   userSizeQuantity = Shoe9;
                                                   });
                                                 },          child: Text('S 8 Y'),
                                               ),
                                             ),

                                             Shoe10==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 9 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 9 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 9 Y");

                                                   stateSetter(() {usersize = "S 9 Y";
                                                   size = '9 Y';
                                                   userSizeQuantity = Shoe10;
                                                   });
                                                 },          child: Text('S 9 Y'),
                                               ),
                                             ),
                                             Shoe11==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 10 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 10 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 10 Y");

                                                   stateSetter(() {usersize = "S 10 Y";
                                                   size = '10 Y';
                                                   userSizeQuantity = Shoe11;
                                                   });
                                                 },          child: Text('S 10 Y'),
                                               ),
                                             ),
                                             Shoe12==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 11 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 11 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 11 Y");

                                                   stateSetter(() {usersize = "S 11 Y";
                                                   size = '11 Y';
                                                   userSizeQuantity = Shoe12;
                                                   });
                                                 },          child: Text('S 11 Y'),
                                               ),
                                             ),
                                             Shoe13==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 12 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 12 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 12 Y");

                                                   stateSetter(() {usersize = "S 12 Y";
                                                   size = '12 Y';
                                                   userSizeQuantity = Shoe13;
                                                   });
                                                 },          child: Text('S 12 Y'),
                                               ),
                                             ),
                                             Shoe14==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(



                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,



                                                   primary: selectedCategory.contains("S 13 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background

                                                   onPrimary:selectedCategory.contains("S 13 Y") ? Colors.white:  Colors.black, // foreground

                                                 ),

                                                 onPressed: () {

                                                   selectedCategory =  <String>[];

                                                   selectedCategory.add("S 13 Y");



                                                   stateSetter(() {usersize = "S 13 Y";
                                                   size = '13 Y';
                                                   userSizeQuantity = Shoe14;
                                                   });

                                                 },          child: Text('S 13 Y'),

                                               ),
                                             ),



                                           ]
                                       ),
                                     ),
                                   ):
                                   gender == 'Teen-Boys'||gender == 'Teen-Girls'?
                                   Container(
                                     height:60.0,

                                     child:   Expanded(
                                       child:   ListView(
                                           scrollDirection:Axis.horizontal,
                                           shrinkWrap:true,
                                           children:[
                                             mto==0?Container():  Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("MTO");
                                                   stateSetter(() {usersize = "MTO";
                                                   size = 'MTO';

                                                   userSizeQuantity = mto;
                                                   });
                                                   MTO();

                                                 },          child: Text('MTO'),
                                               ),
                                             ),
                                             freesize==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("Free Size");

                                                   stateSetter(() {usersize = "Free Size";
                                                   userSizeQuantity = freesize;
                                                   size = 'Free Size';

                                                   });
                                                 },          child: Text('Free Size'),
                                               ),
                                             ),

                                             xxxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("13 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("13 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("13 Y");

                                                   stateSetter(() {usersize = "13 Y";
                                                   size = '13 Y';
                                                   userSizeQuantity = xxxs;
                                                   });
                                                 },          child: Text('13 Y'),
                                               ),
                                             ),
                                             xxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("14 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("14 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("14 Y");

                                                   stateSetter(() {usersize = "14 Y";
                                                   size = '14 Y';
                                                   userSizeQuantity = xxs;
                                                   });
                                                 },          child: Text('14 Y'),
                                               ),
                                             ),
                                             xs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("15 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("15 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("15 Y");

                                                   stateSetter(() {usersize = "15 Y";
                                                   size = '15 Y';
                                                   userSizeQuantity = xs;
                                                   });
                                                 },          child: Text('15 Y'),
                                               ),
                                             ),
                                             s==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("16 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("16 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("16 Y");

                                                   stateSetter(() {usersize = "16 Y";
                                                   size = '16 Y';
                                                   userSizeQuantity = s;
                                                   });
                                                 },          child: Text('16 Y'),
                                               ),
                                             ),
                                             Shoe1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S 13 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S 13 Y") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S 13 Y");

                                                   stateSetter(() {usersize = "S 13 Y";
                                                   size = '13 Y';
                                                   userSizeQuantity = Shoe1;
                                                   });
                                                 },          child: Text('S 13 Y'),
                                               ),
                                             ),
                                             Shoe2==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 14 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 14 Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 14 Y");

                                                     stateSetter(() {usersize = "S 14 Y";
                                                     size = '14 Y';
                                                     userSizeQuantity = Shoe2;
                                                     });
                                                   },          child: Text('S 14 Y'),
                                                 )),
                                             Shoe3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("15 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("15 Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("15 Y");

                                                     stateSetter(() {usersize = "15 Y";
                                                     size = '15 Y';
                                                     userSizeQuantity = Shoe3;
                                                     });
                                                   },          child: Text('15 Y'),
                                                 )),
                                             Shoe4==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("S 16 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("S 16 Y") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("S 16 Y");

                                                     stateSetter(() {usersize = "S 16 Y";
                                                     size = '16 Y';
                                                     userSizeQuantity = Shoe4;
                                                     });
                                                   },          child: Text('S 16 Y'),
                                                 )),



                                           ]
                                       ),
                                     ),
                                   ):
                                   Container(
                                     height:60.0,

                                     child:   Expanded(
                                       child:   ListView(
                                           scrollDirection:Axis.horizontal,
                                           shrinkWrap:true,
                                           children:[

                                             mto==0?Container():  Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("MTO");
                                                   stateSetter(() {usersize = "MTO";
                                                   size = 'MTO';

                                                   userSizeQuantity = mto;
                                                   });
                                                   MTO();

                                                 },          child: Text('MTO'),
                                               ),
                                             ),
                                             freesize==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("Free Size");

                                                   stateSetter(() {usersize = "Free Size";
                                                   userSizeQuantity = freesize;
                                                   size = 'Free Size';

                                                   });
                                                 },          child: Text('Free Size'),
                                               ),
                                             ),

                                             xxxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXXS") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXXS");

                                                   stateSetter(() {usersize = "XXXS";
                                                   userSizeQuantity = xxxs;
                                                   size = 'XXXS';

                                                   });
                                                 },          child: Text('XXXS'),
                                               ),
                                             ),
                                             xxs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXS") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXS");

                                                   stateSetter(() {usersize = "XXS";
                                                   userSizeQuantity = xxs;
                                                   size = 'XXS';

                                                   });
                                                 },          child: Text('XXS'),
                                               ),
                                             ),
                                             xs==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XS") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XS");

                                                   stateSetter(() {usersize = "XS";
                                                   userSizeQuantity = xs;
                                                   size = 'XS';

                                                   });
                                                 },          child: Text('XS'),
                                               ),
                                             ),
                                             s==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("S") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("S") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("S");

                                                   stateSetter(() {usersize = "S";
                                                   userSizeQuantity = s;
                                                   size = 'S';

                                                   });
                                                 },          child: Text('S'),
                                               ),
                                             ),
                                             m==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("M") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("M");

                                                   stateSetter(() {usersize = "M";
                                                   userSizeQuantity = m;
                                                   size = 'M';

                                                   });
                                                 },          child: Text('M'),
                                               ),
                                             ),

                                             l==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("L") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("L") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("L");

                                                   stateSetter(() {usersize = "L";
                                                   userSizeQuantity = l;
                                                   size = 'L';

                                                   });
                                                 },          child: Text('L'),
                                               ),
                                             ),
                                             xl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XL");

                                                   stateSetter(() {usersize = "XL";
                                                   userSizeQuantity = xl;
                                                   size = 'XL';

                                                   });
                                                 },          child: Text('XL'),
                                               ),
                                             ),
                                             xxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXL");

                                                   stateSetter(() {usersize = "XXL";
                                                   userSizeQuantity = xxl;
                                                   size = 'XXL';

                                                   });
                                                 },          child: Text('XXL'),
                                               ),
                                             ),
                                             xxxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("XXXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("XXXL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("XXXL");

                                                   stateSetter(() {usersize = "XXXL";
                                                   userSizeQuantity = xxxl;
                                                   size = 'XXXL';

                                                   });
                                                 },          child: Text('XXXL'),
                                               ),
                                             ),
                                             fourxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("4XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("4XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("4XL");

                                                   stateSetter(() {usersize = "4XL";
                                                   userSizeQuantity = fourxl;
                                                   size = '4XL';

                                                   });
                                                 },          child: Text('4XL'),
                                               ),
                                             ),
                                             fivexl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("5XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("5XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("5XL");

                                                   stateSetter(() {usersize = "5XL";
                                                   userSizeQuantity = fivexl;
                                                   size = '5XL';

                                                   });
                                                 },          child: Text('5XL'),
                                               ),
                                             ),
                                             sixxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("6XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("6XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("6XL");

                                                   stateSetter(() {usersize = "6XL";
                                                   userSizeQuantity = sixxl;
                                                   size = '6XL';

                                                   });
                                                 },          child: Text('6XL'),
                                               ),
                                             ),
                                             sevenxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("7XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("7XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("7XL");

                                                   stateSetter(() {usersize = "7XL";
                                                   userSizeQuantity = sevenxl;
                                                   size = '7XL';

                                                   });
                                                 },          child: Text('7XL'),
                                               ),
                                             ),
                                             eightxl==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("8XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("8XL") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("8XL");

                                                   stateSetter(() {usersize = "8XL";
                                                   userSizeQuantity = eightxl;
                                                   size = '8XL';

                                                   });
                                                 },          child: Text('8XL'),
                                               ),
                                             ),
                                             Ring1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 4") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 4");

                                                   stateSetter(() {usersize = "R 4";
                                                   size = '(US) 4';
                                                   userSizeQuantity = Ring1;

                                                   });
                                                 },          child: Text('(US) 4'),
                                               ),
                                             ),
                                             Ring2==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 4.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 4.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 4.5");

                                                   stateSetter(() {usersize = "R 4.5";
                                                   size = '(US) 4.5';
                                                   userSizeQuantity = Ring2;

                                                   });
                                                 },          child: Text('(US) 4.5'),
                                               ),
                                             ),

                                             Ring3==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 5");

                                                   stateSetter(() {usersize = "R 5";
                                                   size = '(US) 5';
                                                   userSizeQuantity = Ring3;

                                                   });
                                                 },          child: Text('(US) 5'),
                                               ),
                                             ),
                                             Ring4==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 5.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 5.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 5.5");

                                                   stateSetter(() {usersize = "R 5.5";
                                                   size = '(US) 5.5';
                                                   userSizeQuantity = Ring4;

                                                   });
                                                 },          child: Text('(US) 5.5'),
                                               ),
                                             ),
                                             Ring5==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 6") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 6");

                                                   stateSetter(() {usersize = "R 6";
                                                   size = '(US) 6';
                                                   userSizeQuantity = Ring5;

                                                   });
                                                 },          child: Text('(US) 6'),
                                               ),
                                             ),
                                             Ring6==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 6.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 6.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 6.5");

                                                   stateSetter(() {usersize = "R 6.5";
                                                   size = '(US) 6.5';
                                                   userSizeQuantity = Ring6;
                                                   });
                                                 },          child: Text('(US) 6.5'),
                                               ),
                                             ),
                                             Ring7==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 7") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 7");

                                                   stateSetter(() {usersize = "R 7";
                                                   size = '(US) 7 ';
                                                   userSizeQuantity = Ring7;
                                                   });
                                                 },          child: Text('(US) 7'),
                                               ),
                                             ),
                                             Ring8==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 7.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 7.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 7.5");

                                                   stateSetter(() {usersize = "R 7.5";
                                                   size = '(US) 7.5 ';
                                                   userSizeQuantity = Ring8;
                                                   });
                                                 },          child: Text('(US) 7.5'),
                                               ),
                                             ),
                                             Ring9==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 8") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 8");

                                                   stateSetter(() {usersize = "R 8";
                                                   size = '(US) 8 ';
                                                   userSizeQuantity = Ring9;
                                                   });
                                                 },          child: Text('(US) 8'),
                                               ),
                                             ),
                                             Ring10==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 8.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 8.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 8.5");

                                                   stateSetter(() {usersize = "R 8.5";
                                                   size = '(US) 8.5 ';
                                                   userSizeQuantity = Ring10;
                                                   });
                                                 },          child: Text('(US) 8.5'),
                                               ),
                                             ),
                                             Ring11==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 9") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 9");

                                                   stateSetter(() {usersize = "R 9";
                                                   size = '(US) 9 ';
                                                   userSizeQuantity = Ring11;
                                                   });
                                                 },          child: Text('(US) 9'),
                                               ),
                                             ),
                                             Ring12==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 9.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 9.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 9.5");

                                                   stateSetter(() {usersize = "R 9.5";
                                                   size = '(US) 9.5 ';
                                                   userSizeQuantity = Ring12;
                                                   });
                                                 },          child: Text('(US) 9.5'),
                                               ),
                                             ),
                                             Ring13==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 10") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 10");

                                                   stateSetter(() {usersize = "R 10";
                                                   size = '(US) 10 ';
                                                   userSizeQuantity = Ring13;
                                                   });
                                                 },          child: Text('(US) 10'),
                                               ),
                                             ),
                                             Ring14==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 10.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 10.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 10.5");

                                                   stateSetter(() {usersize = "R 10.5";
                                                   size = '(US) 10.5 ';
                                                   userSizeQuantity = Ring14;
                                                   });
                                                 },          child: Text('(US) 10.5'),
                                               ),
                                             ),
                                             Ring15==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 11") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 11") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 11");

                                                   stateSetter(() {usersize = "R 11";
                                                   size = '(US) 11 ';
                                                   userSizeQuantity = Ring15;
                                                   });
                                                 },          child: Text('(US) 11'),
                                               ),
                                             ),
                                             Ring16==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 11.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 11.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 11.5");

                                                   stateSetter(() {usersize = "R 11.5";
                                                   size = '(US) 11.5 ';
                                                   userSizeQuantity = Ring16;
                                                   });
                                                 },          child: Text('(US) 11.5'),
                                               ),
                                             ),
                                             Ring17==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 12") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 12");

                                                   stateSetter(() {usersize = "R 12";
                                                   size = '(US) 12 ';
                                                   userSizeQuantity = Ring17;
                                                   });
                                                 },          child: Text('(US) 12'),
                                               ),
                                             ),
                                             Ring18==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 12.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 12.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 12.5");

                                                   stateSetter(() {usersize = "R 12.5";
                                                   size = '(US) 12.5 ';
                                                   userSizeQuantity = Ring18;
                                                   });
                                                 },          child: Text('(US) 12.5'),
                                               ),
                                             ),
                                             Ring19==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 13") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 13");

                                                   stateSetter(() {usersize = "R 13";
                                                   size = '(US) 13 ';
                                                   userSizeQuantity = Ring19;
                                                   });
                                                 },          child: Text('(US) 13'),
                                               ),
                                             ),
                                             Ring20==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 13.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 13.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 13.5");

                                                   stateSetter(() {
                                                     size = '(US) 13.5 ';
                                                     userSizeQuantity = Ring20;
                                                     usersize = "R 13.5";});
                                                 },          child: Text('(US) 13.5'),
                                               ),
                                             ),
                                             Ring21==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 14") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 14");

                                                   stateSetter(() {usersize = "R 14";
                                                   size = '(US) 14 ';
                                                   userSizeQuantity = Ring21;
                                                   });
                                                 },          child: Text('(US) 14'),
                                               ),
                                             ),
                                             Ring22==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 14.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 14.5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 14.5");

                                                   stateSetter(() {usersize = "R 14.5";
                                                   size = '(US) 14.5 ';
                                                   userSizeQuantity = Ring22;
                                                   });
                                                 },          child: Text('(US) 14.5'),
                                               ),
                                             ),
                                             Ring23==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("R 15") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("R 15") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("R 15");

                                                   stateSetter(() {usersize = "R 15";
                                                   size = '(US) 15 ';
                                                   userSizeQuantity = Ring23;

                                                   });
                                                 },          child: Text('(US) 15'),
                                               ),
                                             ),
                                             Shoe1==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("5") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("5");

                                                   stateSetter(() {usersize = "5";
                                                   size = '5 (US)';
                                                   userSizeQuantity = Shoe1;
                                                   });
                                                 },          child: Text('5 (US)'),
                                               ),
                                             ),
                                             Shoe2==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("5 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("5 ½") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("5 ½");

                                                     stateSetter(() {usersize = "5 ½";
                                                     size = '5 ½ (US)';
                                                     userSizeQuantity = Shoe2;
                                                     });
                                                   },          child: Text('5 ½ (US)'),
                                                 )),
                                             Shoe3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("6") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("6");

                                                     stateSetter(() {usersize = "6";
                                                     size = '6 (US)';
                                                     userSizeQuantity = Shoe3;
                                                     });
                                                   },          child: Text('6 (US)'),
                                                 )),
                                             Shoe4==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("6 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("6 ½") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("6 ½");

                                                     stateSetter(() {usersize = "6 ½";
                                                     size = '6 ½ (US)';
                                                     userSizeQuantity = Shoe4;
                                                     });
                                                   },          child: Text('6 ½ (US)'),
                                                 )),
                                             Shoe5==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:  ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("7") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("7");

                                                     stateSetter(() {usersize = "7";
                                                     size = '7 (US)';
                                                     userSizeQuantity = Shoe5;
                                                     });
                                                   },          child: Text('7 (US)'),
                                                 )),
                                             Shoe6==0?Container():  Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child:   ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedCategory.contains("7 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedCategory.contains("7 ½") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedCategory =  <String>[];
                                                     selectedCategory.add("7 ½");

                                                     stateSetter(() {usersize = "7 ½";
                                                     size = '7 ½ (US)';
                                                     userSizeQuantity = Shoe6;
                                                     });
                                                   },          child: Text('7 ½ (US)'),
                                                 )),
                                             Shoe7==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("8") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("8");

                                                   stateSetter(() {usersize = "8";
                                                   size = '8 (US)';
                                                   userSizeQuantity = Shoe7;
                                                   });
                                                 },          child: Text('8 (US)'),
                                               ),
                                             ),
                                             Shoe8==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("8 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("8 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("8 ½");

                                                   stateSetter(() {usersize = "8 ½";
                                                   size = '8 ½ (US)';
                                                   userSizeQuantity = Shoe8;
                                                   });
                                                 },          child: Text('8 ½ (US)'),
                                               ),
                                             ),
                                             Shoe9==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("9") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("9");

                                                   stateSetter(() {usersize = "9";
                                                   size = '9 (US)';
                                                   userSizeQuantity = Shoe9;

                                                   });
                                                 },          child: Text('9 (US)'),
                                               ),
                                             ),
                                             Shoe10==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("9 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("9 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("9 ½");

                                                   stateSetter(() {usersize = "9 ½";
                                                   size = '9 ½ (US)';
                                                   userSizeQuantity = Shoe10;
                                                   });
                                                 },          child: Text('9 ½ (US)'),
                                               ),
                                             ),
                                             Shoe11==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("10") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("10");

                                                   stateSetter(() {usersize = "10";
                                                   size = '10 (US)';
                                                   userSizeQuantity = Shoe11;
                                                   });
                                                 },          child: Text('10 (US)'),
                                               ),
                                             ),
                                             Shoe12==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("10 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("10 ½") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("10 ½");

                                                   stateSetter(() {usersize = "10 ½";
                                                   size = '10 ½ (US)';
                                                   userSizeQuantity = Shoe12;
                                                   });
                                                 },          child: Text('10 ½ (US)'),
                                               ),
                                             ),
                                             Shoe13==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("12") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("12");

                                                   stateSetter(() {usersize = "12";
                                                   size = '12 (US)';
                                                   userSizeQuantity = Shoe13;
                                                   });
                                                 },          child: Text('12 (US)'),
                                               ),
                                             ),
                                             Shoe14==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("13") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("13");

                                                   stateSetter(() {usersize = "13";
                                                   size = '13 (US)';
                                                   userSizeQuantity = Shoe14;
                                                   });
                                                 },          child: Text('13 (US)'),
                                               ),
                                             ),
                                             Shoe15==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(

                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                   primary: selectedCategory.contains("14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                   onPrimary:selectedCategory.contains("14") ? Colors.white:  Colors.black, // foreground
                                                 ),
                                                 onPressed: () {
                                                   selectedCategory =  <String>[];
                                                   selectedCategory.add("14");

                                                   stateSetter(() {usersize = "14";
                                                   size = '14 (US)';
                                                   userSizeQuantity = Shoe15;
                                                   });
                                                 },          child: Text('14 (US)'),
                                               ),
                                             ),
                                             Shoe16==0?Container():   Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   ElevatedButton(



                                                 style: ElevatedButton.styleFrom(
elevation : 0.1,



                                                   primary: selectedCategory.contains("15 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background

                                                   onPrimary:selectedCategory.contains("15 ½") ? Colors.white:  Colors.black, // foreground

                                                 ),

                                                 onPressed: () {

                                                   selectedCategory =  <String>[];

                                                   selectedCategory.add("15 ½");



                                                   stateSetter(() {usersize = "15 ½";
                                                   size = '15 ½ (US)';
                                                   userSizeQuantity = Shoe16;

                                                   });

                                                 },          child: Text('15 ½ (US)'),

                                               ),
                                             ),

                                           ]
                                       ),
                                     ),
                                   ),


                                   Container(
                                     height:60.0,

                                     child:   Expanded(



                                         child:   ListView(
                                             scrollDirection:Axis.horizontal,
                                             shrinkWrap:true,
                                             children:[
                                               color1==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 1") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 1");

                                                     stateSetter(() { color = 'col 1 ';
                                                     userColorQuantity = color1;
                                                     usercolor = colorText1;});
                                                   },          child: Text(colorText1),
                                                 ),
                                               ),
                                               color2==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 2") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 2");

                                                     stateSetter(() { color = 'col 2 ';
                                                     userColorQuantity = color2;
                                                     usercolor = colorText2;});
                                                   },          child: Text(colorText2),
                                                 ),
                                               ),
                                               color3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 3") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 3");

                                                     stateSetter(() { color = 'col 3 ';
                                                     userColorQuantity = color3;
                                                     usercolor = colorText3;});
                                                   },          child: Text(colorText3),
                                                 ),
                                               ),
                                               color4==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 4") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 4");

                                                     stateSetter(() { color = 'col 4 ';
                                                     userColorQuantity = color4;
                                                     usercolor = colorText4;});
                                                   },          child: Text(colorText4),
                                                 ),
                                               ),
                                               color5==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 5") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 5");

                                                     stateSetter(() { color = 'col 5 ';
                                                     userColorQuantity = color5;
                                                     usercolor = colorText5;});
                                                   },          child: Text(colorText5),
                                                 ),
                                               ),
                                               color6==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 6") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 6");

                                                     stateSetter(() { color = 'col 6 ';
                                                     userColorQuantity = color6;
                                                     usercolor = colorText6;});
                                                   },          child: Text(colorText6),
                                                 ),
                                               ),
                                               color7==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 7") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 7");

                                                     stateSetter(() { color = 'col 7 ';
                                                     userColorQuantity = color7;
                                                     usercolor = colorText7;});
                                                   },          child: Text(colorText7),
                                                 ),
                                               ),
                                               color8==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 8") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 8");

                                                     stateSetter(() { color = 'col 8 ';
                                                     userColorQuantity = color8;
                                                     usercolor = colorText8;});
                                                   },          child: Text(colorText8),
                                                 ),
                                               ),
                                               color9==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 9") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 9");

                                                     stateSetter(() { color = 'col 9 ';
                                                     userColorQuantity = color9;
                                                     usercolor = colorText9;});
                                                   },          child: Text(colorText9),
                                                 ),
                                               ),
                                               color10==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: ElevatedButton(

                                                   style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                     primary: selectedColor.contains("col 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                     onPrimary:selectedColor.contains("col 10") ? Colors.white:  Colors.black, // foreground
                                                   ),
                                                   onPressed: () {
                                                     selectedColor =  <String>[];
                                                     selectedColor.add("col 10");

                                                     stateSetter(() { color = 'col 10 ';
                                                     userColorQuantity = color10;
                                                     usercolor = colorText10;});
                                                   },          child: Text(colorText10),
                                                 ),
                                               ),

                                             ])
                                     ),
                                   ),
                                   variationQuantity1==0&&
                                       variationQuantity2==0&&
                                       variationQuantity3==0&&
                                       variationQuantity4==0&&
                                       variationQuantity5==0&&
                                       variationQuantity6==0&&
                                       variationQuantity7==0&&
                                       variationQuantity8==0&&
                                       variationQuantity9==0&&
                                       variationQuantity10==0?Container():
                                   Container(
                                     height:250.0,

                                     child:   Expanded(
                                         child:   ListView(
                                             scrollDirection:Axis.horizontal,
                                             shrinkWrap:true,
                                             children:[
                                               variationQuantity1==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation1img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom11inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom11eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom11gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom11usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation1),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
elevation : 0.1,
                                                                      
                                                         primary: selectedCustom1.contains("Variation 1") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 1") ? Colors.white: Colors.black,

                                                       ),
                                                       onPressed: () {
                                                         stateSetter(() {
                                                           selectedCustom1 =  <String>[];
                                                           selectedCustom1.add("Variation 1");
                                                           variationIndex = 'Variation 1';
                                                           userVariation = variation1;
                                                           userVariationPrice =  currentUser.currency == "EUR"? custom11eur:
                                                           currentUser.currency == "INR"? custom11inr:
                                                           currentUser.currency == "GBP"? custom11gbp:
                                                           custom11usd;

                                                           userVariationImg = variation1img;
                                                           userVariationQuantity = variationQuantity1;
                                                         });
                                                       },        child: Text(variation1),
                                                     ),

                                                   ],
                                                 ),
                                               ),

                                               variationQuantity2==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation2img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom21inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom21eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom21gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom21usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation2),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(
                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 2") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 2") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 2");
                                                         stateSetter(() { variationIndex = 'Variation 2';
                                                         userVariation = variation2;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom21eur:
                                                         currentUser.currency == "INR"? custom21inr:
                                                         currentUser.currency == "GBP"? custom21gbp:
                                                         custom21usd;

                                                         userVariationImg = variation2img;
                                                         userVariationQuantity = variationQuantity2;
                                                         });
                                                       },        child: Text(variation2),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity3==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation3img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom31inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom31eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom31gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom31usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation3),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 3") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 3") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 3");
                                                         stateSetter(() { variationIndex = 'Variation 3';
                                                         userVariation = variation3;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom31eur:
                                                         currentUser.currency == "INR"? custom31inr:
                                                         currentUser.currency == "GBP"? custom31gbp:
                                                         custom31usd;

                                                         userVariationImg = variation3img;
                                                         userVariationQuantity = variationQuantity3;
                                                         });
                                                       },        child: Text(variation3),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity4==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation4img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom41inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom41eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom41gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom41usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation4),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 4") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 4") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 4");
                                                         stateSetter(() { variationIndex = 'Variation 4';
                                                         userVariation = variation4;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom41eur:
                                                         currentUser.currency == "INR"? custom41inr:
                                                         currentUser.currency == "GBP"? custom41gbp:
                                                         custom41usd;

                                                         userVariationImg = variation4img;
                                                         userVariationQuantity = variationQuantity4;
                                                         });
                                                       },        child: Text(variation4),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity5==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation5img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom51inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom51eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom51gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom51usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation5),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 5") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 5") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 5");
                                                         stateSetter(() { variationIndex = 'Variation 5';
                                                         userVariation = variation5;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom51eur:
                                                         currentUser.currency == "INR"? custom51inr:
                                                         currentUser.currency == "GBP"? custom51gbp:
                                                         custom51usd;

                                                         userVariationImg = variation5img;
                                                         userVariationQuantity = variationQuantity5;
                                                         });
                                                       },        child: Text(variation5),
                                                     ),

                                                   ],
                                                 ),

                                               ),
                                               variationQuantity6==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation6img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom61inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom61eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom61gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom61usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation6),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 6") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 6") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 6");
                                                         stateSetter(() { variationIndex = 'Variation 6';
                                                         userVariation = variation6;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom61eur:
                                                         currentUser.currency == "INR"? custom61inr:
                                                         currentUser.currency == "GBP"? custom61gbp:
                                                         custom61usd;
                                                         userVariationImg = variation6img;

                                                         userVariationQuantity = variationQuantity6;
                                                         });
                                                       },        child: Text(variation6),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity7==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation7img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom71inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom71eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom71gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom71usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation7),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 7") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 7") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 7");
                                                         stateSetter(() { variationIndex = 'Variation 7';
                                                         userVariation = variation7;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom71eur:
                                                         currentUser.currency == "INR"? custom71inr:
                                                         currentUser.currency == "GBP"? custom71gbp:
                                                         custom71usd;
                                                         userVariationImg = variation7img;

                                                         userVariationQuantity = variationQuantity7;
                                                         });
                                                       },        child: Text(variation7),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity8==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation8img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom81inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom81eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom81gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom81usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation8),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 8") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 8") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 8");
                                                         stateSetter(() { variationIndex = 'Variation 8';
                                                         userVariation = variation8;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom81eur:
                                                         currentUser.currency == "INR"? custom81inr:
                                                         currentUser.currency == "GBP"? custom81gbp:
                                                         custom81usd;
                                                         userVariationImg = variation8img;

                                                         userVariationQuantity = variationQuantity8;
                                                         });
                                                       },        child: Text(variation8),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity9==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(

                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation9img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom91inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom91eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom91gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom91usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation9),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 9") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 9") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 9");
                                                         stateSetter(() { variationIndex = 'Variation 9';
                                                         userVariation = variation9;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom91eur:
                                                         currentUser.currency == "INR"? custom91inr:
                                                         currentUser.currency == "GBP"? custom91gbp:
                                                         custom91usd;
                                                         userVariationImg = variation9img;

                                                         userVariationQuantity = variationQuantity9;
                                                         });
                                                       },        child: Text(variation9),
                                                     ),

                                                   ],
                                                 ),
                                               ),
                                               variationQuantity10==0?Container():   Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Card(
                                                       child: Column(
                                                         children: [
                                                           Container(
                                                               height:120.0,
                                                               width:120.0,
                                                               child: CachedImage(variation10img)),
                                                           currentUser.currency == "INR"? Row(
                                                             children: [
                                                               Text("${cf.format(custom101inr, CurrencyFormatter.inr)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "EUR"?Row(
                                                             children: [
                                                               Text("${cf.format(custom101eur, CurrencyFormatter.eur)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           currentUser.currency == "GBP"?Row(
                                                             children: [
                                                               Text("${cf.format(custom101gbp, CurrencyFormatter.gbp)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ):
                                                           Row(
                                                             children: [
                                                               Text("${cf.format(custom101usd, CurrencyFormatter.usd)}",
                                                                   style: TextStyle(
                                                                     color: Colors.black,
                                                                     fontWeight: FontWeight.bold,

                                                                   )),
                                                             ],
                                                           ),

                                                           Text(variation10),
                                                         ],
                                                       ),
                                                     ),
                                                     ElevatedButton(

                                                       style: ElevatedButton.styleFrom(
elevation : 0.1,

                                                         primary: selectedCustom1.contains("Variation 10") ? Colors.black: Colors.white.withOpacity(0.1),
                                                         onPrimary: selectedCustom1.contains("Variation 10") ? Colors.white: Colors.black,
                                                       ),
                                                       onPressed: () {
                                                         selectedCustom1 =  <String>[];
                                                         selectedCustom1.add("Variation 10");
                                                         stateSetter(() { variationIndex = 'Variation 10';
                                                         userVariation = variation10;
                                                         userVariationPrice =  currentUser.currency == "EUR"? custom101eur:
                                                         currentUser.currency == "INR"? custom101inr:
                                                         currentUser.currency == "GBP"? custom101gbp:
                                                         custom101usd;
                                                         userVariationQuantity = variationQuantity10;
                                                         });
                                                       },        child: Text(variation10),
                                                     ),

                                                   ],
                                                 ),
                                               ),

                                             ])
                                     ),
                                   ),
                                   // customQuantity1==0||
                                   //     customQuantity2==0||
                                   //     customQuantity3==0||
                                   //     customQuantity4==0||
                                   //     customQuantity5==0||
                                   //     customQuantity6==0||
                                   //     customQuantity7==0||
                                   //     customQuantity8==0||
                                   //     customQuantity9==0||
                                   //     customQuantity10==0
                                   //     ?Container():     Column(children:[
                                   //   Padding(
                                   //     padding: const EdgeInsets.all(8.0),
                                   //     child: Row(
                                   //
                                   //       children: [
                                   //         Text(customTitle1),
                                   //
                                   //
                                   //
                                   //
                                   //       ],
                                   //     ),
                                   //   ),
                                   //   Container(
                                   //     height:205.0,
                                   //
                                   //     child:   Expanded(
                                   //         child:   ListView(
                                   //             scrollDirection:Axis.horizontal,
                                   //             shrinkWrap:true,
                                   //             children:[
                                   //
                                   //               customQuantity1==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 1");
                                   //                     stateSetter(() { Custom = 'custom 1';
                                   //                     userCustom = customName1;
                                   //                     userCustomQuantity = customQuantity1;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 1")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom1img)),
                                   //
                                   //                         Text(customName1),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //
                                   //               customQuantity2==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 2");
                                   //                     stateSetter(() { Custom = 'custom 2';
                                   //                     userCustom = customName2;
                                   //                     userCustomQuantity = customQuantity2;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 2")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom2img)),
                                   //
                                   //                         Text(customName2),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity3==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 3");
                                   //                     stateSetter(() { Custom = 'custom 3';
                                   //                     userCustom = customName3;
                                   //                     userCustomQuantity = customQuantity3;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 3")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom3img)),
                                   //
                                   //                         Text(customName3),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity4==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 4");
                                   //                     stateSetter(() { Custom = 'custom 4';
                                   //                     userCustom = customName4;
                                   //                     userCustomQuantity = customQuantity4;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 4")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom4img)),
                                   //
                                   //                         Text(customName4),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity5==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 5");
                                   //                     stateSetter(() { Custom = 'custom 5';
                                   //                     userCustom = customName5;
                                   //                     userCustomQuantity = customQuantity5;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 5")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom5img)),
                                   //
                                   //                         Text(customName5),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity6==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 6");
                                   //                     stateSetter(() { Custom = 'custom 6';
                                   //                     userCustom = customName6;
                                   //                     userCustomQuantity = customQuantity6;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 6")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom6img)),
                                   //
                                   //                         Text(customName6),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity7==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 7");
                                   //                     stateSetter(() { Custom = 'custom 7';
                                   //                     userCustom = customName7;
                                   //                     userCustomQuantity = customQuantity7;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 7")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom7img)),
                                   //
                                   //                         Text(customName7),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity8==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 8");
                                   //                     stateSetter(() { Custom = 'custom 8';
                                   //                     userCustom = customName8;
                                   //                     userCustomQuantity = customQuantity8;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 8")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom8img)),
                                   //
                                   //                         Text(customName8),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity9==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 9");
                                   //                     stateSetter(() { Custom = 'custom 9';
                                   //                     userCustom = customName9;
                                   //                     userCustomQuantity = customQuantity9;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 9")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom9img)),
                                   //
                                   //                         Text(customName9),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity10==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom1 =  <String>[];
                                   //                     selectedCustom1.add("custom 10");
                                   //                     stateSetter(() { Custom = 'custom 10';
                                   //                     userCustom = customName10;
                                   //                     userCustomQuantity = customQuantity10;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom1.contains("custom 10")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom10img)),
                                   //
                                   //                         Text(customName10),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //
                                   //             ])
                                   //     ),
                                   //   ),
                                   // ]),
                                   //
                                   // customQuantity11==0||
                                   //     customQuantity12==0||
                                   //     customQuantity13==0||
                                   //     customQuantity14==0||
                                   //     customQuantity15==0||
                                   //     customQuantity16==0||
                                   //     customQuantity17==0||
                                   //     customQuantity18==0||
                                   //     customQuantity19==0||
                                   //     customQuantity20==0
                                   //     ?Container():   Column(children:[ Padding(
                                   //   padding: const EdgeInsets.all(8.0),
                                   //   child: Row(
                                   //
                                   //     children: [
                                   //       Text(customTitle2),
                                   //
                                   //
                                   //
                                   //
                                   //     ],
                                   //   ),
                                   // ),
                                   //   Container(
                                   //     height:205.0,
                                   //
                                   //     child:   Expanded(
                                   //         child:   ListView(
                                   //             scrollDirection:Axis.horizontal,
                                   //             shrinkWrap:true,
                                   //             children:[
                                   //               customQuantity11==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 11");
                                   //                     stateSetter(() { Custom = 'custom 11';
                                   //                     userCustom = customName11;
                                   //                     userCustomQuantity = customQuantity11;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 11")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom11img)),
                                   //
                                   //                         Text(customName11),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity12==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 12");
                                   //                     stateSetter(() { Custom = 'custom 12';
                                   //                     userCustom = customName12;
                                   //                     userCustomQuantity = customQuantity12;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 12")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom12img)),
                                   //
                                   //                         Text(customName12),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity13==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 13");
                                   //                     stateSetter(() { Custom = 'custom 13';
                                   //                     userCustom = customName13;
                                   //                     userCustomQuantity = customQuantity13;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 13")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom13img)),
                                   //
                                   //                         Text(customName13),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity14==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 14");
                                   //                     stateSetter(() { Custom = 'custom 14';
                                   //                     userCustom = customName14;
                                   //                     userCustomQuantity = customQuantity14;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 14")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom14img)),
                                   //
                                   //                         Text(customName14),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity15==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 15");
                                   //                     stateSetter(() { Custom = 'custom 15';
                                   //                     userCustom = customName15;
                                   //                     userCustomQuantity = customQuantity15;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 15")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom15img)),
                                   //
                                   //                         Text(customName15),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity16==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 16");
                                   //                     stateSetter(() { Custom = 'custom 16';
                                   //                     userCustom = customName16;
                                   //                     userCustomQuantity = customQuantity16;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 16")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom16img)),
                                   //
                                   //                         Text(customName16),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity17==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 17");
                                   //                     stateSetter(() { Custom = 'custom 17';
                                   //                     userCustom = customName17;
                                   //                     userCustomQuantity = customQuantity17;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 17")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom17img)),
                                   //
                                   //                         Text(customName17),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity18==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 18");
                                   //                     stateSetter(() { Custom = 'custom 18';
                                   //                     userCustom = customName18;
                                   //                     userCustomQuantity = customQuantity18;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 18")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom18img)),
                                   //
                                   //                         Text(customName18),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity19==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 19");
                                   //                     stateSetter(() { Custom = 'custom 19';
                                   //                     userCustom = customName19;
                                   //                     userCustomQuantity = customQuantity19;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 19")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom19img)),
                                   //
                                   //                         Text(customName19),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity20==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom2 =  <String>[];
                                   //                     selectedCustom2.add("custom 20");
                                   //                     stateSetter(() { Custom = 'custom 20';
                                   //                     userCustom = customName20;
                                   //                     userCustomQuantity = customQuantity20;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom2.contains("custom 20")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom20img)),
                                   //
                                   //                         Text(customName20),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //
                                   //
                                   //
                                   //             ])
                                   //     ),
                                   //   ),]),
                                   //
                                   //
                                   // customQuantity21==0||
                                   //     customQuantity22==0||
                                   //     customQuantity23==0||
                                   //     customQuantity24==0||
                                   //     customQuantity25==0||
                                   //     customQuantity26==0||
                                   //     customQuantity27==0||
                                   //     customQuantity28==0||
                                   //     customQuantity29==0||
                                   //     customQuantity30==0
                                   //     ?Container():  Column(children:[ Padding(
                                   //   padding: const EdgeInsets.all(8.0),
                                   //   child: Row(
                                   //
                                   //     children: [
                                   //       Text(customTitle3),
                                   //
                                   //
                                   //
                                   //
                                   //     ],
                                   //   ),
                                   // ),
                                   //   Container(
                                   //     height:205.0,
                                   //
                                   //     child:   Expanded(
                                   //         child:   ListView(
                                   //             scrollDirection:Axis.horizontal,
                                   //             shrinkWrap:true,
                                   //             children:[
                                   //
                                   //               customQuantity21==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 21");
                                   //                     stateSetter(() { Custom = 'custom 21';
                                   //                     userCustom = customName21;
                                   //                     userCustomQuantity = customQuantity21;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 21")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom21img)),
                                   //
                                   //                         Text(customName21),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity22==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 22");
                                   //                     stateSetter(() { Custom = 'custom 22';
                                   //                     userCustom = customName22;
                                   //                     userCustomQuantity = customQuantity22;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 22")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom22img)),
                                   //
                                   //                         Text(customName22),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity23==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 23");
                                   //                     stateSetter(() { Custom = 'custom 23';
                                   //                     userCustom = customName23;
                                   //                     userCustomQuantity = customQuantity23;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 23")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom23img)),
                                   //
                                   //                         Text(customName23),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity24==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 24");
                                   //                     stateSetter(() { Custom = 'custom 24';
                                   //                     userCustom = customName24;
                                   //                     userCustomQuantity = customQuantity24;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 24")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom24img)),
                                   //
                                   //                         Text(customName24),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity25==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 25");
                                   //                     stateSetter(() { Custom = 'custom 25';
                                   //                     userCustom = customName25;
                                   //                     userCustomQuantity = customQuantity25;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 25")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom25img)),
                                   //
                                   //                         Text(customName25),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity26==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 26");
                                   //                     stateSetter(() { Custom = 'custom 26';
                                   //                     userCustom = customName26;
                                   //                     userCustomQuantity = customQuantity26;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 26")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom26img)),
                                   //
                                   //                         Text(customName26),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity27==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 27");
                                   //                     stateSetter(() { Custom = 'custom 27';
                                   //                     userCustom = customName27;
                                   //                     userCustomQuantity = customQuantity27;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 27")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom27img)),
                                   //
                                   //                         Text(customName27),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity28==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 28");
                                   //                     stateSetter(() { Custom = 'custom 28';
                                   //                     userCustom = customName28;
                                   //                     userCustomQuantity = customQuantity28;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 28")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom28img)),
                                   //
                                   //                         Text(customName28),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity29==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 29");
                                   //                     stateSetter(() { Custom = 'custom 29';
                                   //                     userCustom = customName29;
                                   //                     userCustomQuantity = customQuantity29;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 29")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom29img)),
                                   //
                                   //                         Text(customName29),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity30==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom3 =  <String>[];
                                   //                     selectedCustom3.add("custom 30");
                                   //                     stateSetter(() { Custom = 'custom 30';
                                   //                     userCustom = customName30;
                                   //                     userCustomQuantity = customQuantity30;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom3.contains("custom 30")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom30img)),
                                   //
                                   //                         Text(customName30),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //
                                   //
                                   //             ])
                                   //     ),
                                   //   ),]),
                                   //
                                   //
                                   // customQuantity31==0||
                                   //     customQuantity32==0||
                                   //     customQuantity33==0||
                                   //     customQuantity34==0||
                                   //     customQuantity35==0||
                                   //     customQuantity36==0||
                                   //     customQuantity37==0||
                                   //     customQuantity38==0||
                                   //     customQuantity39==0||
                                   //     customQuantity40==0
                                   //     ?Container():  Column(children:[ Padding(
                                   //   padding: const EdgeInsets.all(8.0),
                                   //   child: Row(
                                   //
                                   //     children: [
                                   //       Text(customTitle4),
                                   //
                                   //
                                   //
                                   //
                                   //     ],
                                   //   ),
                                   // ),
                                   //   Container(
                                   //     height:205.0,
                                   //
                                   //     child:   Expanded(
                                   //         child:   ListView(
                                   //             scrollDirection:Axis.horizontal,
                                   //             shrinkWrap:true,
                                   //             children:[
                                   //
                                   //               customQuantity31==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 31");
                                   //                     stateSetter(() { Custom = 'custom 31';
                                   //                     userCustom = customName31;
                                   //                     userCustomQuantity = customQuantity31;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 31")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom31img)),
                                   //
                                   //                         Text(customName31),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity32==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 32");
                                   //                     stateSetter(() { Custom = 'custom 32';
                                   //                     userCustom = customName32;
                                   //                     userCustomQuantity = customQuantity32;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 32")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom32img)),
                                   //
                                   //                         Text(customName32),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity33==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 33");
                                   //                     stateSetter(() { Custom = 'custom 33';
                                   //                     userCustom = customName33;
                                   //                     userCustomQuantity = customQuantity33;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 33")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom33img)),
                                   //
                                   //                         Text(customName33),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity34==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 34");
                                   //                     stateSetter(() { Custom = 'custom 34';
                                   //                     userCustom = customName34;
                                   //                     userCustomQuantity = customQuantity34;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 34")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom34img)),
                                   //
                                   //                         Text(customName34),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity35==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 35");
                                   //                     stateSetter(() { Custom = 'custom 35';
                                   //                     userCustom = customName35;
                                   //                     userCustomQuantity = customQuantity35;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 35")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom35img)),
                                   //
                                   //                         Text(customName35),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity36==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 36");
                                   //                     stateSetter(() { Custom = 'custom 36';
                                   //                     userCustom = customName36;
                                   //                     userCustomQuantity = customQuantity36;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 36")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom36img)),
                                   //
                                   //                         Text(customName36),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity37==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 37");
                                   //                     stateSetter(() { Custom = 'custom 37';
                                   //                     userCustom = customName37;
                                   //                     userCustomQuantity = customQuantity37;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 37")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom37img)),
                                   //
                                   //                         Text(customName37),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity38==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 38");
                                   //                     stateSetter(() { Custom = 'custom 38';
                                   //                     userCustom = customName38;
                                   //                     userCustomQuantity = customQuantity38;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 38")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom38img)),
                                   //
                                   //                         Text(customName38),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity39==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 39");
                                   //                     stateSetter(() { Custom = 'custom 39';
                                   //                     userCustom = customName39;
                                   //                     userCustomQuantity = customQuantity39;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 39")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom39img)),
                                   //
                                   //                         Text(customName39),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity40==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom4 =  <String>[];
                                   //                     selectedCustom4.add("custom 40");
                                   //                     stateSetter(() { Custom = 'custom 40';
                                   //                     userCustom = customName40;
                                   //                     userCustomQuantity = customQuantity40;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom4.contains("custom 40")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom40img)),
                                   //
                                   //                         Text(customName40),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //
                                   //
                                   //             ])
                                   //     ),
                                   //   ),]),
                                   //
                                   //
                                   // customQuantity41==0||
                                   //     customQuantity42==0||
                                   //     customQuantity43==0||
                                   //     customQuantity44==0||
                                   //     customQuantity45==0||
                                   //     customQuantity46==0||
                                   //     customQuantity47==0||
                                   //     customQuantity48==0||
                                   //     customQuantity49==0||
                                   //     customQuantity50==0
                                   //     ?Container(): Column(children:[
                                   //   Padding(
                                   //     padding: const EdgeInsets.all(8.0),
                                   //     child: Row(
                                   //
                                   //       children: [
                                   //         Text(customTitle5),
                                   //
                                   //
                                   //
                                   //
                                   //       ],
                                   //     ),
                                   //   ),
                                   //   Container(
                                   //     height:205.0,
                                   //
                                   //     child:   Expanded(
                                   //         child:   ListView(
                                   //             scrollDirection:Axis.horizontal,
                                   //             shrinkWrap:true,
                                   //             children:[
                                   //
                                   //               customQuantity41==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 41");
                                   //                     stateSetter(() { Custom = 'custom 41';
                                   //                     userCustom = customName41;
                                   //                     userCustomQuantity = customQuantity41;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 41")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom41img)),
                                   //
                                   //                         Text(customName41),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity42==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 42");
                                   //                     stateSetter(() { Custom = 'custom 42';
                                   //                     userCustom = customName42;
                                   //                     userCustomQuantity = customQuantity42;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 42")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom42img)),
                                   //
                                   //                         Text(customName42),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity43==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 43");
                                   //                     stateSetter(() { Custom = 'custom 43';
                                   //                     userCustom = customName43;
                                   //                     userCustomQuantity = customQuantity43;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 43")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom43img)),
                                   //
                                   //                         Text(customName43),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity44==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 44");
                                   //                     stateSetter(() { Custom = 'custom 44';
                                   //                     userCustom = customName44;
                                   //                     userCustomQuantity = customQuantity44;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 44")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom44img)),
                                   //
                                   //                         Text(customName44),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity45==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 45");
                                   //                     stateSetter(() { Custom = 'custom 45';
                                   //                     userCustom = customName45;
                                   //                     userCustomQuantity = customQuantity45;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 45")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom45img)),
                                   //
                                   //                         Text(customName45),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity46==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 46");
                                   //                     stateSetter(() { Custom = 'custom 46';
                                   //                     userCustom = customName46;
                                   //                     userCustomQuantity = customQuantity46;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 46")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom46img)),
                                   //
                                   //                         Text(customName46),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity47==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 47");
                                   //                     stateSetter(() { Custom = 'custom 47';
                                   //                     userCustom = customName47;
                                   //                     userCustomQuantity = customQuantity47;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 47")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom47img)),
                                   //
                                   //                         Text(customName47),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity48==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 48");
                                   //                     stateSetter(() { Custom = 'custom 48';
                                   //                     userCustom = customName48;
                                   //                     userCustomQuantity = customQuantity48;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 48")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom48img)),
                                   //
                                   //                         Text(customName48),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity49==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 49");
                                   //                     stateSetter(() { Custom = 'custom 49';
                                   //                     userCustom = customName49;
                                   //                     userCustomQuantity = customQuantity49;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 49")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom49img)),
                                   //
                                   //                         Text(customName49),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //               customQuantity50==0?Container():   Padding(
                                   //                 padding: const EdgeInsets.all(8.0),
                                   //                 child: GestureDetector(
                                   //                   onTap: () {
                                   //                     selectedCustom5 =  <String>[];
                                   //                     selectedCustom5.add("custom 50");
                                   //                     stateSetter(() { Custom = 'custom 50';
                                   //                     userCustom = customName50;
                                   //                     userCustomQuantity = customQuantity50;
                                   //                     });
                                   //                   },
                                   //                   child: Card(
                                   //                     shape: selectedCustom5.contains("custom 50")
                                   //                         ? new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.black, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0))
                                   //                         : new RoundedRectangleBorder(
                                   //                         side: new BorderSide(color: Colors.white, width: 2.0),
                                   //                         borderRadius: BorderRadius.circular(4.0)),
                                   //                     child: Column(
                                   //                       children: [
                                   //                         Container(
                                   //                             height:120.0,
                                   //                             width:120.0,
                                   //                             child: CachedImage(custom50img)),
                                   //
                                   //                         Text(customName50),
                                   //
                                   //                       ],
                                   //                     ),
                                   //                   ),
                                   //                 ),
                                   //               ),
                                   //
                                   //
                                   //             ])
                                   //     ),
                                   //   ),]),

                                   SizedBox(height:8.0),

                                   usersize == "" ?Container():
                                   FloatingActionButton.extended(
                                     backgroundColor: kPrimaryColor,
                                     onPressed: () {

                                       isUploading?    null
                                           :  Proceedtobuy();

                                     },
                                     label:

                                     Text(
                                       'Buy Now', style: TextStyle(color: Colors.white),),
                                   ),
                                   SizedBox(height:8.0),


                                 ])

                         ),
                       );
                   });
           }
       );


  }
  Widget sizeGuide(){
    sizechartBool? userSizeGuide():standardSizeGuide();
  }
  Widget standardSizeGuide(){

    if(gender=='Men'){
      showDialog<void>(
        context: context,
        // useRootNavigator:true,

        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return
            Dialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              child:
              Center(
                child: Container(
                  child: ContainedTabBarView(
                    tabs: [
                      ...[1, 2]
                          .map(
                            (e) => Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ],
                    tabBarProperties: TabBarProperties(
                      width: 64,
                      height: 32,
                      position: TabBarPosition.bottom,
                      indicator: ContainerTabIndicator(
                        width: 16.0,
                        height: 16.0,
                        radius: BorderRadius.circular(4.0),
                        color: Colors.blue,
                      ),
                    ),
                    views: [
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/MenClothingsize.jpg')),),
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/RING.jpg')),)  ,

                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ),

            );
        },
      );
    }
    else if(gender=='Women'){
      showDialog<void>(
        context: context,
        // useRootNavigator:true,

        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return
            Dialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              child:
              Center(
                child: Container(
                  child: ContainedTabBarView(
                    tabs: [
                      ...[1, 2]
                          .map(
                            (e) => Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ],
                    tabBarProperties: TabBarProperties(
                      width: 64,
                      height: 32,
                      position: TabBarPosition.bottom,
                      indicator: ContainerTabIndicator(
                        width: 16.0,
                        height: 16.0,
                        radius: BorderRadius.circular(4.0),
                        color: Colors.blue,
                      ),
                    ),
                    views: [
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/WomanClothingsize.jpg'),
                        ),),
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/RING.jpg')),)  ,

                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ),


            );
        },
      );
    }
    else  if(gender=='Baby-Boys'||gender=='Baby-Girls') {
      showDialog<void>(
        context: context,
        // useRootNavigator:true,

        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return
            Dialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              child:
              Center(
                child: Container(
                  child: ContainedTabBarView(
                    tabs: [
                      ...[1, 2]
                          .map(
                            (e) => Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ],
                    tabBarProperties: TabBarProperties(
                      width: 64,
                      height: 32,
                      position: TabBarPosition.bottom,
                      indicator: ContainerTabIndicator(
                        width: 16.0,
                        height: 16.0,
                        radius: BorderRadius.circular(4.0),
                        color: Colors.blue,
                      ),
                    ),
                    views: [
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/babysizecloth.jpg')),),
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/RING.jpg')),)  ,

                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ),

            );
        },
      );
    }
    else if(gender=='Kids-Boys'||gender=='Kids-Girls') {
      showDialog<void>(
        context: context,
        // useRootNavigator:true,

        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return
            Dialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              child:
              Center(
                child: Container(
                  child: ContainedTabBarView(
                    tabs: [
                      ...[1, 2]
                          .map(
                            (e) => Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ],
                    tabBarProperties: TabBarProperties(
                      width: 64,
                      height: 32,
                      position: TabBarPosition.bottom,
                      indicator: ContainerTabIndicator(
                        width: 16.0,
                        height: 16.0,
                        radius: BorderRadius.circular(4.0),
                        color: Colors.blue,
                      ),
                    ),
                    views: [
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/kisclothsize.jpg')),)  ,
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/RING.jpg')),)  ,

                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ),



            );
        },
      );
    }
    else if(gender=='Teen-Boys'||gender=='Teen-Girls') {
      showDialog<void>(
        context: context,
        // useRootNavigator:true,

        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return
            Dialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              child:
              Center(
                child: Container(
                  child: ContainedTabBarView(
                    tabs: [
                      ...[1, 2]
                          .map(
                            (e) => Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ],
                    tabBarProperties: TabBarProperties(
                      width: 64,
                      height: 32,
                      position: TabBarPosition.bottom,
                      indicator: ContainerTabIndicator(
                        width: 16.0,
                        height: 16.0,
                        radius: BorderRadius.circular(4.0),
                        color: Colors.blue,
                      ),
                    ),
                    views: [
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/teenclothing.jpg')),),
                      Container(
                        child:PhotoView(imageProvider: AssetImage
                          ('assets/img/RING.jpg')),)  ,

                    ],
                    onChange: (index) => print(index),
                  ),
                ),
              ),

            );
        },
      );
    }

  }
  Widget userSizeGuide(){
      showDialog<void>(
        context: context,
        // useRootNavigator:true,

        barrierDismissible: true,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return
            Dialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),),
              child:
              Center(
                child:        Container(
                  child:PhotoView(imageProvider: CachedNetworkImageProvider
                    (sizeChart)),),
              ),

            );
        },
      );
  }

  reviews() {
    return
    showModalBottomSheet(
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (BuildContext context) {

          return  PaginateFirestore(
isLive: true,
              emptyDisplay: Center(child: Text("No reviews",style: TextStyle(
                fontWeight: FontWeight.bold,
              ),)),
              itemBuilderType:
              PaginateBuilderType.listView,
              itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
                String ownerId = documentSnapshot.data()['userId'];
                var rating =   documentSnapshot.data()['rating'];
                String review  = documentSnapshot.data()['review'];

                return
                  FutureBuilder(
                    future: usersRef.doc(ownerId).get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return circularProgress();
                      }
                       Users user = Users.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => showProfile(context, profileId: user.id),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                                  backgroundColor: Colors.grey,
                                ),
                                title: Text(
                                  user.displayName,
                                  style: TextStyle(
                                    color: kText,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                    ),
                            ),
                            SmoothStarRating(
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              rating: rating,
                              size: 35,
                              starCount: 5,

                            ),
                            SizedBox(height: 8.0,),
                            Row(
                              children: [
                                Text(review,style: TextStyle(color: kText),),
                              ],
                            ),
                            Divider(color: kGrey,),
                          ],

                        ),
                      );

                    },
                  );
              },
              query: FirebaseFirestore.instance.collection('Reviews').doc(prodId)
                  .collection('prodReviews').orderBy('timestamp',descending: true)


          );

        });
  }

posteurope(){
  bool isPostOwner = currentUserId == ownerId;

  return  Container(
    margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),

    child: Expanded(
      child: Column(
        children:  [
          GestureDetector(
            onTap:(){},
            onDoubleTap: () {
              handleLikePost();
              Fluttertoast.showToast(
                  msg: "Added to Favorites! " , timeInSecForIos: 4);

            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only
                      (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                    child: Container(
                      //  height: MediaQuery.of(context).size.height * 0.65,

                        width:     MediaQuery.of(context).size.width,
                        child: pics(userid:ownerId,prodid:prodId))),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child:   ListTile(
                      leading:FloatingActionButton(
                        mini: true,
                        backgroundColor:Colors.white.withOpacity(0.5),
                        child:Icon(Icons.arrow_back_ios,color: Colors.white,),
                        onPressed:() {

                          Navigator.pop(context);},
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: shopmediaUrl.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _ccontroller.animateToPage(entry.key),
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Row(
            children: [
              FutureBuilder(
                  future:FirebaseFirestore.instance.collection("products").doc(ownerId).collection("userProducts").doc(prodId)
                      .collection("tags").get(),
                  builder: (context, snapshot) {

                    if (!snapshot.hasData || snapshot.data.docs.isEmpty){
                      return
                        Container();
                    }
                    else{
                      return

                        GestureDetector(
                          onTap: () =>   showModalBottomSheet(
                              context: context,
                              elevation: 0,
                              builder: (context) {
                                return PaginateFirestore(
                                    emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                    ),)),
                                    itemBuilderType:
                                    PaginateBuilderType.listView,
                                    itemBuilder: (index, context, documentSnapshot)    {
                                      String ownerId = documentSnapshot.data()['ownerId'];
                                      String prodId = documentSnapshot.data()['prodId'];
                                      String image = documentSnapshot.data()['image'];
                                      String name = documentSnapshot.data()['name'];
                                      var usd = documentSnapshot.data()['usd'];
var inr = documentSnapshot.data()['inr'];
var gbp = documentSnapshot.data()['gbp'];
var eur = documentSnapshot.data()['eur'];
String taggerId = documentSnapshot.data()['taggerId'];
String taggerImg = documentSnapshot.data()['taggerImg'];
String taggerName = documentSnapshot.data()['taggerName'];
String taggerCurrency = documentSnapshot.data()['taggerCurrency'];
                                      return

                                        GestureDetector(
                                            onTap: () {
                                              setState((){
                                                 TaggerId = taggerId;
                                                  TaggerImg = taggerImg ;
                                                 TaggerName = taggerName;
                                               TaggerCurrency =  taggerCurrency;
                                               TaggerOwnerId = ownerId;
                                               TaggerProdId = prodId;
                                              });

                                              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ProductScreen(
                                                  prodId: prodId,
                                                  userId: ownerId,
                                                ),
                                              ),
                                            );},
                                            child:Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(children:[
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    child: CachedImage(image)),
                                                Row(
                                                  children: [
                                                    Text(name,
                                                        style: TextStyle(color: kText,
                                                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                                                            fontWeight: FontWeight.bold))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    currentUser.currency == "INR"?Text("${cf.format(inr, CurrencyFormatter.inr)}",):
                                                    currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",):
                                                    currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",):
                                                    Text("${cf.format(usd, CurrencyFormatter.usd)}",),


                                                  ],
                                                ),
                                              ]),
                                            ));


                                    },
                                    query: FirebaseFirestore.instance.collection("products").doc(ownerId).collection("userProducts").doc(prodId)
                                        .collection("tags")
                                        .orderBy('timestamp',descending: true)

                                );
                              }),

                          child:

                              GFButton(
                                color: Colors.black,
                                shape:  GFButtonShape.pills,
                                textColor: Colors.black,
                                type : GFButtonType.outline,
                                onPressed: null,
                                text:"View other Products",
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  // color: Colors.white,
                                  size: 20.0,
                                ),

                              ),

                        );
                    }

                  }

              ),

            ],
          ),
          GestureDetector(
            onTap: () =>
              showProfile(context, profileId: ownerId),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(photoUrl),
                backgroundColor: Colors.grey,
              ),
              title: Text(
                username,
                style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: IconButton(icon: Icon(Icons.more_horiz,color: Colors.white,),
                  onPressed: () {
                    !isPostOwner?showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: kSecondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                            child: GestureDetector(
                              onTap: (){report();
                              Navigator.pop(context);},
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


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                          // ignore: unnecessary_statements
                        }):handleDeletePost(context);
                  }),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
              IconButton(
                onPressed: (){
                  handleLikePost();
                  Fluttertoast.showToast(
                      msg: "Added to Favorites! " , timeInSecForIos: 4);
                },
                icon: Icon(
                  isfav ?   Icons.favorite:Icons.favorite_border ,
                  color:  Colors.black,
                ),
              ),
              // Container(
              //   child: Text(
              //     "$likeCount ",
              //     style: TextStyle(
              //       color:kText,
              //       fontSize: 15.0,
              //       //                      fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
             FutureBuilder<Uri>(
                    future: _dynamicLinkService.createDynamicLink( postId:prodId,ownerId: ownerId,),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        Uri uri = snapshot.data;
                        return IconButton(
                          color: Colors.black,
                          onPressed: () => Share.share(uri.toString()),
                          icon: Icon(Icons.send),
                        );
                      } else {
                        return Container();
                      }

                    }
                ),
              Spacer(),
              InkWell(
                onTap:() => reviews(),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border_rounded,
                      color:  Colors.black,
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color:  Colors.black,
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color:  Colors.black,
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color:  Colors.black,
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color:  Colors.black,
                    ),


                  ],
                ),
              ),

            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(
                    "$productname ",
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  subtitle:    currentUser.country == "$country" ?  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      currentUser.currency == "INR"? Row(
                        children: [
                          Text("${cf.format(inr, CurrencyFormatter.inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${cf.format(eur, CurrencyFormatter.eur)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("${cf.format(usd, CurrencyFormatter.usd)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ),
                      freeship?Container(
                          color:Colors.grey.withOpacity(0.2),
                          child:   Text(
                            "FREE SHIPPING",
                            style: TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          )
                      ) :
                      currentUser.currency == "INR"? Row(
                        children: [
                          Text(" ${cf.format(shipcostinr, CurrencyFormatter.inr)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${cf.format(shipcostusd, CurrencyFormatter.usd)}  €",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text(" ${cf.format(shipcostgbp, CurrencyFormatter.gbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("${cf.format(shipcostusd, CurrencyFormatter.usd)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ),

                    ],
                  ):   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      currentUser.currency == "INR"? Row(
                        children: [
                          Text("${cf.format(inr, CurrencyFormatter.inr)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${cf.format(eur, CurrencyFormatter.eur)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("${cf.format(usd, CurrencyFormatter.usd)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ),
                      freeworldship?Container(
                          color:Colors.grey.withOpacity(0.2),
                          child:   Text(
                            "FREE SHIPPING",
                            style: TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          )
                      ) :
                      currentUser.currency == "INR"? Row(
                        children: [
                          Text("${cf.format(shipcostinterinr, CurrencyFormatter.inr)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${cf.format(shipcostintereur, CurrencyFormatter.eur)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("${cf.format(shipcostintergbp, CurrencyFormatter.gbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("${cf.format(shipcostinterusd, CurrencyFormatter.usd)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ),

                    ],
                  ) ,
                  trailing: FloatingActionButton(
                    heroTag:null,
backgroundColor: Colors.black,
                    onPressed: (){
                      isUploading?null:
                      Buynow(context);},
                    child:   isUploading?CircularProgressIndicator(): Icon(Icons.add_shopping_cart,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  ),
                ),
              ),

            ],
          ),
          worldship == false?Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading:  Icon(Icons.cancel, color: Colors.red),
                  title: Text(
                    "This product doesn't ship worldwide,check shipping & returns info below ",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),

            ],
          ):Text(''),
          ListTile(title: Text('Processing time'),
              subtitle:Text("$processfrom - $processto")
          ),
          ListTileTheme(
            tileColor:trans,
            child: ExpansionTile(
              backgroundColor:trans,
              title:  Text(
                " Description",
                style: TextStyle(
                  color: kText.withOpacity(0.5),
                  fontWeight: FontWeight.bold,fontSize: 20,
                ),),
              trailing:Icon(Icons.expand_more,color: kText,),

              maintainState: true,
              children: [

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ExpandableText("$details",),
                      SizedBox(height: 8,),
                      SizedBox(height: 8,),
                      Text('Composition:',style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                      Text('$composition', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
                        color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                      ),),SizedBox(height: 8,),
                      Text('Wash and Care:',style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                      Text('$washandcare', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
                        color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTileTheme(
            tileColor:trans,
            child: ExpansionTile(
              backgroundColor:trans,
              title:  Text(
                " Size and Fit:",
                style: TextStyle(
                  color: kText.withOpacity(0.5),
                  fontWeight: FontWeight.bold,fontSize: 20,
                ),),
              leading: FaIcon(FontAwesomeIcons.rulerCombined,color: kText,),
              trailing:Icon(Icons.expand_more,color: kText,),

              maintainState: true,
              children: [

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Text('Size and Fit:',style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                      Text('$sizeandfit', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
                        color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTileTheme(
            tileColor:trans,
            child: ExpansionTile(
              backgroundColor:trans,
              leading: Icon(Icons.local_shipping,color: kText,),
              title:  Text(
                " Shipping  and Returns:",
                style: TextStyle(
                  color: kText.withOpacity(0.5),
                  fontWeight: FontWeight.bold,fontSize: 20,
                ),),
              trailing:Icon(Icons.expand_more,color: kText,),
              maintainState: true,
              children: [

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Text('Shipping  and Returns:',style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                      ListTile(title: Text('Processing time'),
                          subtitle:Text("$processfrom - $processto")
                      ),ListTile(title: Text('Shipping duration to ${country}'),
                          subtitle:Text("$shipfrom - $shipto")
                      ),ListTile(title: Text('International shipping duration'),
                          subtitle:Text("$shipinterfrom - $shipinterto")
                      ),
                      Text('$shipment', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
                        color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),                ],
            ),
          ),
        ],
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
   // storageRef.child("prod_$prodId.jpg").delete();
    for ( var imageFile in shopmediaUrl) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}
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
    QuerySnapshot commentsSnapshot = await FirebaseFirestore.instance.collection('Reviews').doc(prodId)
        .collection('prodReviews')
        .get();
    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

//      FirebaseFirestore.instance.collectionGroup("userCart").doc(prodId).delete();

  }

  handleLikePost() {

    bool _isFav = likes[currentUserId] == true;
    if(!_isFav) {
      productsRef
          .doc(ownerId)
          .collection('userProducts')
          .doc(prodId)
          .update({'likes.$currentUserId': true});
      addLikeToActivityFeed();
      favRef.doc(currentUser.id).collection("userFav")
          .doc(prodId)
          .set({
        "username": username,
        "prodId": prodId,
        "timestamp": timestamp,
        "avatarUrl": photoUrl,
//      "userId":userId,
        "ownerId": ownerId,
        "eur":eur,
        "usd":usd,
        "inr":inr,
        "cny":cny,
        "gbp":gbp,
        "productname": productname,
        "shopmediaUrl": shopmediaUrl.first,
      });
      setState(() {

        isfav = true;
        likes[currentUserId] = true;
      });
    } else if (_isFav) {
      productsRef
          .doc(ownerId)
          .collection('userProducts')
          .doc(prodId)
          .update({'likes.$currentUserId': false});
      removeLikeFromActivityFeed();

      var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
      docReference.delete();
      setState(() {

        isfav = false;
        likes[currentUserId] = false;
      });
    }

  }

  addLikeToActivityFeed() {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(prodId)
          .set({
        "type": "fav",
        "username": currentUser.displayName,
        "userId": ownerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": prodId,
        "mediaUrl": shopmediaUrl.first,
        "timestamp": timestamp,
      });
    }
  }

  removeLikeFromActivityFeed() {
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(prodId)
            .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    isfav = (likes[currentUserId] == true);
    return    Column(

      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        posteurope(),

      ],

    );
  }
}


