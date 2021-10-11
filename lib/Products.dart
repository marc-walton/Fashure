import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
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
import 'package:fashow/SellerDash/Editshop.dart';
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
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';

class Prod extends StatefulWidget {
  final String prodId;
  final String ownerId;
  final String username;
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
final String custom1img;
final String custom2img;
final String custom3img;
final String custom4img;
final String custom5img;
final String custom6img;
final String custom7img;
final String custom8img;
final String custom9img;
final String custom10img;
final String custom11img;
final String custom12img;
final String custom13img;
final String custom14img;
final String custom15img;
final String custom16img;
final String custom17img;
final String custom18img;
final String custom19img;
final String custom20img;
final String custom21img;
final String custom22img;
final String custom23img;
final String custom24img;
final String custom25img;
final String custom26img;
final String custom27img;
final String custom28img;
final String custom29img;
final String custom30img;
final String custom31img;
final String custom32img;
final String custom33img;
final String custom34img;
final String custom35img;
final String custom36img;
final String custom37img;
final String custom38img;
final String custom39img;
final String custom40img;
final String custom41img;
final String custom42img;
final String custom43img;
final String custom44img;
final String custom45img;
final String custom46img;
final String custom47img;
final String custom48img;
final String custom49img;
final String custom50img;
final String customTitle1;
final String customTitle2;
final String customTitle3;
final String customTitle4;
final String customTitle5;

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
  final  customQuantity1;
  final  customQuantity2;
  final  customQuantity3;
  final  customQuantity4;
  final  customQuantity5;
  final  customQuantity6;
  final  customQuantity7;
  final  customQuantity8;
  final  customQuantity9;
  final  customQuantity10;
  final  customQuantity11;
  final  customQuantity12;
  final  customQuantity13;
  final  customQuantity14;
  final  customQuantity15;
  final  customQuantity16;
  final  customQuantity17;
  final  customQuantity18;
  final  customQuantity19;
  final  customQuantity20;
  final  customQuantity21;
  final  customQuantity22;
  final  customQuantity23;
  final  customQuantity24;
  final  customQuantity25;
  final  customQuantity26;
  final  customQuantity27;
  final  customQuantity28;
  final  customQuantity29;
  final  customQuantity30;
  final  customQuantity31;
  final  customQuantity32;
  final  customQuantity33;
  final  customQuantity34;
  final  customQuantity35;
  final  customQuantity36;
  final  customQuantity37;
  final  customQuantity38;
  final  customQuantity39;
  final  customQuantity40;
  final  customQuantity41;
  final  customQuantity42;
  final  customQuantity43;
  final  customQuantity44;
  final  customQuantity45;
  final  customQuantity46;
  final  customQuantity47;
  final  customQuantity48;
  final  customQuantity49;
  final  customQuantity50;

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
    this.customQuantity1,
    this.customQuantity2,
    this.customQuantity3,
    this.customQuantity4,
    this.customQuantity5,
    this.customQuantity6,
    this.customQuantity7,
    this.customQuantity8,
    this.customQuantity9,
    this.customQuantity10,
    this.customQuantity11,
    this.customQuantity12,
    this.customQuantity13,
    this.customQuantity14,
    this.customQuantity15,
    this.customQuantity16,
    this.customQuantity17,
    this.customQuantity18,
    this.customQuantity19,
    this.customQuantity20,
    this.customQuantity21,
    this.customQuantity22,
    this.customQuantity23,
    this.customQuantity24,
    this.customQuantity25,
    this.customQuantity26,
    this.customQuantity27,
    this.customQuantity28,
    this.customQuantity29,
    this.customQuantity30,
    this.customQuantity31,
    this.customQuantity32,
    this.customQuantity33,
    this.customQuantity34,
    this.customQuantity35,
    this.customQuantity36,
    this.customQuantity37,
    this.customQuantity38,
    this.customQuantity39,
    this.customQuantity40,
    this.customQuantity41,
    this.customQuantity42,
    this.customQuantity43,
    this.customQuantity44,
    this.customQuantity45,
    this.customQuantity46,
    this.customQuantity47,
    this.customQuantity48,
    this.customQuantity49,
    this.customQuantity50,

    this.custom1img,
    this.custom2img,
    this.custom3img,
    this.custom4img,
    this.custom5img,
    this.custom6img,
    this.custom7img,
    this.custom8img,
    this.custom9img,
    this.custom10img,
 this.custom11img,
    this.custom12img,
    this.custom13img,
    this.custom14img,
    this.custom15img,
    this.custom16img,
    this.custom17img,
    this.custom18img,
    this.custom19img,
    this.custom20img,
 this.custom21img,
    this.custom22img,
    this.custom23img,
    this.custom24img,
    this.custom25img,
    this.custom26img,
    this.custom27img,
    this.custom28img,
    this.custom29img,
    this.custom30img,
 this.custom31img,
    this.custom32img,
    this.custom33img,
    this.custom34img,
    this.custom35img,
    this.custom36img,
    this.custom37img,
    this.custom38img,
    this.custom39img,
    this.custom40img,
 this.custom41img,
    this.custom42img,
    this.custom43img,
    this.custom44img,
    this.custom45img,
    this.custom46img,
    this.custom47img,
    this.custom48img,
    this.custom49img,
    this.custom50img,
this.customTitle1,
this.customTitle2,
this.customTitle3,
this.customTitle4,
this.customTitle5,

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
      username: doc.data()['displayName'],
shipment: doc.data()['shipment'],
worldship: doc.data()['worldship'],
freeworldship: doc.data()['freeworldship'],
freeship: doc.data()['freeship'],
      country: doc.data()['country'],

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
      fourxl: doc.data()['4xlQuantity'],
      fivexl: doc.data()['5xlQuantity'],
      sixxl: doc.data()['6xlQuantity'],
      sevenxl: doc.data()['7xlQuantity'],
      eightxl: doc.data()['8xlQuantity'],
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

      custom1img: doc.data()['custom1img'],
 custom2img: doc.data()['custom2img'],
 custom3img: doc.data()['custom3img'],
 custom4img: doc.data()['custom4img'],
 custom5img: doc.data()['custom5img'],
 custom6img: doc.data()['custom6img'],
 custom7img: doc.data()['custom7img'],
 custom8img: doc.data()['custom8img'],
 custom9img: doc.data()['custom9img'],
 custom10img: doc.data()['custom10img'],

      custom11img:doc.data()['custom11img'],
      custom12img:doc.data()['custom12img'],
      custom13img:doc.data()['custom13img'],
      custom14img:doc.data()['custom14img'],
      custom15img:doc.data()['custom15img'],
      custom16img:doc.data()['custom16img'],
      custom17img:doc.data()['custom17img'],
      custom18img:doc.data()['custom18img'],
      custom19img:doc.data()['custom19img'],
      custom20img:doc.data()['custom20img'],
      custom21img:doc.data()['custom21img'],
      custom22img:doc.data()['custom22img'],
      custom23img:doc.data()['custom23img'],
      custom24img:doc.data()['custom24img'],
      custom25img:doc.data()['custom25img'],
      custom26img:doc.data()['custom26img'],
      custom27img:doc.data()['custom27img'],
      custom28img:doc.data()['custom28img'],
      custom29img:doc.data()['custom29img'],
      custom30img:doc.data()['custom30img'],
      custom31img:doc.data()['custom31img'],
      custom32img:doc.data()['custom32img'],
      custom33img:doc.data()['custom33img'],
      custom34img:doc.data()['custom34img'],
      custom35img:doc.data()['custom35img'],
      custom36img:doc.data()['custom36img'],
      custom37img:doc.data()['custom37img'],
      custom38img:doc.data()['custom38img'],
      custom39img:doc.data()['custom39img'],
      custom40img:doc.data()['custom40img'],
      custom41img:doc.data()['custom41img'],
      custom42img:doc.data()['custom42img'],
      custom43img:doc.data()['custom43img'],
      custom44img:doc.data()['custom44img'],
      custom45img:doc.data()['custom45img'],
      custom46img:doc.data()['custom46img'],
      custom47img:doc.data()['custom47img'],
      custom48img:doc.data()['custom48img'],
      custom49img:doc.data()['custom49img'],
      custom50img:doc.data()['custom50img'],
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
      customQuantity1: doc.data()['customQuantity1'],
 customQuantity2: doc.data()['customQuantity2'],
 customQuantity3: doc.data()['customQuantity3'],
 customQuantity4: doc.data()['customQuantity4'],
 customQuantity5: doc.data()['customQuantity5'],
 customQuantity6: doc.data()['customQuantity6'],
 customQuantity7: doc.data()['customQuantity7'],
 customQuantity8: doc.data()['customQuantity8'],
 customQuantity9: doc.data()['customQuantity9'],
 customQuantity10: doc.data()['customQuantity10'],
      customQuantity11:doc.data()['customQuantity11'],
      customQuantity12:doc.data()['customQuantity12'],
      customQuantity13:doc.data()['customQuantity13'],
      customQuantity14:doc.data()['customQuantity14'],
      customQuantity15:doc.data()['customQuantity15'],
      customQuantity16:doc.data()['customQuantity16'],
      customQuantity17:doc.data()['customQuantity17'],
      customQuantity18:doc.data()['customQuantity18'],
      customQuantity19:doc.data()['customQuantity19'],
      customQuantity20:doc.data()['customQuantity20'],
      customQuantity21:doc.data()['customQuantity21'],
      customQuantity22:doc.data()['customQuantity22'],
      customQuantity23:doc.data()['customQuantity23'],
      customQuantity24:doc.data()['customQuantity24'],
      customQuantity25:doc.data()['customQuantity25'],
      customQuantity26:doc.data()['customQuantity26'],
      customQuantity27:doc.data()['customQuantity27'],
      customQuantity28:doc.data()['customQuantity28'],
      customQuantity29:doc.data()['customQuantity29'],
      customQuantity30:doc.data()['customQuantity30'],
      customQuantity31:doc.data()['customQuantity31'],
      customQuantity32:doc.data()['customQuantity32'],
      customQuantity33:doc.data()['customQuantity33'],
      customQuantity34:doc.data()['customQuantity34'],
      customQuantity35:doc.data()['customQuantity35'],
      customQuantity36:doc.data()['customQuantity36'],
      customQuantity37:doc.data()['customQuantity37'],
      customQuantity38:doc.data()['customQuantity38'],
      customQuantity39:doc.data()['customQuantity39'],
      customQuantity40:doc.data()['customQuantity40'],
      customQuantity41:doc.data()['customQuantity41'],
      customQuantity42:doc.data()['customQuantity42'],
      customQuantity43:doc.data()['customQuantity43'],
      customQuantity44:doc.data()['customQuantity44'],
      customQuantity45:doc.data()['customQuantity45'],
      customQuantity46:doc.data()['customQuantity46'],
      customQuantity47:doc.data()['customQuantity47'],
      customQuantity48:doc.data()['customQuantity48'],
      customQuantity49:doc.data()['customQuantity49'],
      customQuantity50:doc.data()['customQuantity50'],

      customTitle1:doc.data()['customTitle1'],
      customTitle2:doc.data()['customTitle2'],
      customTitle3:doc.data()['customTitle3'],
      customTitle4:doc.data()['customTitle4'],
      customTitle5:doc.data()['customTitle5'],

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
    custom1img:this.custom1img,
   custom2img:this.custom2img,
    custom3img:this.custom3img,
    custom4img:this.custom4img,
    custom5img:this.custom5img,
    custom6img:this.custom6img,
    custom7img:this.custom7img,
    custom8img:this.custom8img,
    custom9img:this.custom9img,
    custom10img:this.custom10img,
    custom11img:this.custom11img,
   custom12img:this.custom12img,
    custom13img:this.custom13img,
    custom14img:this.custom14img,
    custom15img:this.custom15img,
    custom16img:this.custom16img,
    custom17img:this.custom17img,
    custom18img:this.custom18img,
    custom19img:this.custom19img,
    custom20img:this.custom20img,
     custom21img:this.custom21img,
   custom22img:this.custom22img,
    custom23img:this.custom23img,
    custom24img:this.custom24img,
    custom25img:this.custom25img,
    custom26img:this.custom26img,
    custom27img:this.custom27img,
    custom28img:this.custom28img,
    custom29img:this.custom29img,
    custom30img:this.custom30img,
     custom31img:this.custom31img,
   custom32img:this.custom32img,
    custom33img:this.custom33img,
    custom34img:this.custom34img,
    custom35img:this.custom35img,
    custom36img:this.custom36img,
    custom37img:this.custom37img,
    custom38img:this.custom38img,
    custom39img:this.custom39img,
    custom40img:this.custom40img,
     custom41img:this.custom41img,
   custom42img:this.custom42img,
    custom43img:this.custom43img,
    custom44img:this.custom44img,
    custom45img:this.custom45img,
    custom46img:this.custom46img,
    custom47img:this.custom47img,
    custom48img:this.custom48img,
    custom49img:this.custom49img,
    custom50img:this.custom50img,
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
      customQuantity1:this.customQuantity1,
   customQuantity2:this.customQuantity2,
    customQuantity3:this.customQuantity3,
    customQuantity4:this.customQuantity4,
    customQuantity5:this.customQuantity5,
    customQuantity6:this.customQuantity6,
    customQuantity7:this.customQuantity7,
    customQuantity8:this.customQuantity8,
    customQuantity9:this.customQuantity9,
    customQuantity10:this.customQuantity10,
    customQuantity11:this.customQuantity11,
   customQuantity12:this.customQuantity12,
    customQuantity13:this.customQuantity13,
    customQuantity14:this.customQuantity14,
    customQuantity15:this.customQuantity15,
    customQuantity16:this.customQuantity16,
    customQuantity17:this.customQuantity17,
    customQuantity18:this.customQuantity18,
    customQuantity19:this.customQuantity19,
    customQuantity20:this.customQuantity20,
     customQuantity21:this.customQuantity21,
   customQuantity22:this.customQuantity22,
    customQuantity23:this.customQuantity23,
    customQuantity24:this.customQuantity24,
    customQuantity25:this.customQuantity25,
    customQuantity26:this.customQuantity26,
    customQuantity27:this.customQuantity27,
    customQuantity28:this.customQuantity28,
    customQuantity29:this.customQuantity29,
    customQuantity30:this.customQuantity30,
     customQuantity31:this.customQuantity31,
   customQuantity32:this.customQuantity32,
    customQuantity33:this.customQuantity33,
    customQuantity34:this.customQuantity34,
    customQuantity35:this.customQuantity35,
    customQuantity36:this.customQuantity36,
    customQuantity37:this.customQuantity37,
    customQuantity38:this.customQuantity38,
    customQuantity39:this.customQuantity39,
    customQuantity40:this.customQuantity40,
     customQuantity41:this.customQuantity41,
   customQuantity42:this.customQuantity42,
    customQuantity43:this.customQuantity43,
    customQuantity44:this.customQuantity44,
    customQuantity45:this.customQuantity45,
    customQuantity46:this.customQuantity46,
    customQuantity47:this.customQuantity47,
    customQuantity48:this.customQuantity48,
    customQuantity49:this.customQuantity49,
    customQuantity50:this.customQuantity50,

    customTitle1:this.customTitle1,
    customTitle2:this.customTitle2,
    customTitle3:this.customTitle3,
    customTitle4:this.customTitle4,
    customTitle5:this.customTitle5,

    likeCount: getLikeCount(this.likes),
  );
}

class _ProdState extends State<Prod> {
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  String usersize = "";
  String usercolor = "";
  String userCustom = "";
  String userVariation;
   String variationIndex;

  var userVariationPrice = "";

var  time = const Duration(  seconds: 2);
String currencysymbol;


  var currencyFormatter =      currentUser.currency == "USD"? NumberFormat('#,##0.00', ):
  currentUser.currency == "INR"?NumberFormat.currency(locale:"HI"):
  currentUser.currency == "EUR"? NumberFormat('#,##0.00'," ${currentUser.currencyISO}"):
  currentUser.currency == "GBP"?NumberFormat('#,##0.00'," ${currentUser.currencyISO}"): NumberFormat('#,##0.00', );


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

final bool worldship;
final bool freeworldship;
final bool freeship;

  final String custom1img;
  final String custom2img;
  final String custom3img;
  final String custom4img;
  final String custom5img;
  final String custom6img;
  final String custom7img;
  final String custom8img;
  final String custom9img;
  final String custom10img;
  final String custom11img;
  final String custom12img;
  final String custom13img;
  final String custom14img;
  final String custom15img;
  final String custom16img;
  final String custom17img;
  final String custom18img;
  final String custom19img;
  final String custom20img;
  final String custom21img;
  final String custom22img;
  final String custom23img;
  final String custom24img;
  final String custom25img;
  final String custom26img;
  final String custom27img;
  final String custom28img;
  final String custom29img;
  final String custom30img;
  final String custom31img;
  final String custom32img;
  final String custom33img;
  final String custom34img;
  final String custom35img;
  final String custom36img;
  final String custom37img;
  final String custom38img;
  final String custom39img;
  final String custom40img;
  final String custom41img;
  final String custom42img;
  final String custom43img;
  final String custom44img;
  final String custom45img;
  final String custom46img;
  final String custom47img;
  final String custom48img;
  final String custom49img;
  final String custom50img;
final String customTitle1;
final String customTitle2;
final String customTitle3;
final String customTitle4;
final String customTitle5;

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
  final  customQuantity1;
  final  customQuantity2;
  final  customQuantity3;
  final  customQuantity4;
  final  customQuantity5;
  final  customQuantity6;
  final  customQuantity7;
  final  customQuantity8;
  final  customQuantity9;
  final  customQuantity10;
  final  customQuantity11;
  final  customQuantity12;
  final  customQuantity13;
  final  customQuantity14;
  final  customQuantity15;
  final  customQuantity16;
  final  customQuantity17;
  final  customQuantity18;
  final  customQuantity19;
  final  customQuantity20;
  final  customQuantity21;
  final  customQuantity22;
  final  customQuantity23;
  final  customQuantity24;
  final  customQuantity25;
  final  customQuantity26;
  final  customQuantity27;
  final  customQuantity28;
  final  customQuantity29;
  final  customQuantity30;
  final  customQuantity31;
  final  customQuantity32;
  final  customQuantity33;
  final  customQuantity34;
  final  customQuantity35;
  final  customQuantity36;
  final  customQuantity37;
  final  customQuantity38;
  final  customQuantity39;
  final  customQuantity40;
  final  customQuantity41;
  final  customQuantity42;
  final  customQuantity43;
  final  customQuantity44;
  final  customQuantity45;
  final  customQuantity46;
  final  customQuantity47;
  final  customQuantity48;
  final  customQuantity49;
  final  customQuantity50;
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
    this.custom1img,
    this.custom2img,
    this.custom3img,
    this.custom4img,
    this.custom5img,
    this.custom6img,
    this.custom7img,
    this.custom8img,
    this.custom9img,
    this.custom10img,
    this.custom11img,
    this.custom12img,
    this.custom13img,
    this.custom14img,
    this.custom15img,
    this.custom16img,
    this.custom17img,
    this.custom18img,
    this.custom19img,
    this.custom20img,
    this.custom21img,
    this.custom22img,
    this.custom23img,
    this.custom24img,
    this.custom25img,
    this.custom26img,
    this.custom27img,
    this.custom28img,
    this.custom29img,
    this.custom30img,
    this.custom31img,
    this.custom32img,
    this.custom33img,
    this.custom34img,
    this.custom35img,
    this.custom36img,
    this.custom37img,
    this.custom38img,
    this.custom39img,
    this.custom40img,
    this.custom41img,
    this.custom42img,
    this.custom43img,
    this.custom44img,
    this.custom45img,
    this.custom46img,
    this.custom47img,
    this.custom48img,
    this.custom49img,
    this.custom50img,
    this.customQuantity1,
    this.customQuantity2,
    this.customQuantity3,
    this.customQuantity4,
    this.customQuantity5,
    this.customQuantity6,
    this.customQuantity7,
    this.customQuantity8,
    this.customQuantity9,
    this.customQuantity10,
    this.customQuantity11,
    this.customQuantity12,
    this.customQuantity13,
    this.customQuantity14,
    this.customQuantity15,
    this.customQuantity16,
    this.customQuantity17,
    this.customQuantity18,
    this.customQuantity19,
    this.customQuantity20,
    this.customQuantity21,
    this.customQuantity22,
    this.customQuantity23,
    this.customQuantity24,
    this.customQuantity25,
    this.customQuantity26,
    this.customQuantity27,
    this.customQuantity28,
    this.customQuantity29,
    this.customQuantity30,
    this.customQuantity31,
    this.customQuantity32,
    this.customQuantity33,
    this.customQuantity34,
    this.customQuantity35,
    this.customQuantity36,
    this.customQuantity37,
    this.customQuantity38,
    this.customQuantity39,
    this.customQuantity40,
    this.customQuantity41,
    this.customQuantity42,
    this.customQuantity43,
    this.customQuantity44,
    this.customQuantity45,
    this.customQuantity46,
    this.customQuantity47,
    this.customQuantity48,
    this.customQuantity49,
    this.customQuantity50,
    this.customTitle1,
    this.customTitle2,
    this.customTitle3,
    this.customTitle4,
    this.customTitle5,

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

    conversion();


  }
conversion()async {
  isUploading = true;
  var convertor;
   var convertor1;
   var convertor2;
   var convertor3;
   var convertor4;
   var convertor5;
   var convertor6;
   var convertor7;
   var convertor8;
   var convertor9;
   var convertor10;
   var convertor11;

  if (currentUser.currency == "INR"){
    convertor = inr.toStringAsFixed(2);
    inr = double.tryParse(convertor);
     convertor1 = custom11inr.toStringAsFixed(2);
    custom11inr = double.tryParse(convertor1);
  convertor2 = custom21inr.toStringAsFixed(2);
    custom21inr = double.tryParse(convertor2);
  convertor3 = custom31inr.toStringAsFixed(2);
    custom31inr = double.tryParse(convertor3);
  convertor4 = custom41inr.toStringAsFixed(2);
    custom41inr = double.tryParse(convertor4);
  convertor5 = custom51inr.toStringAsFixed(2);
    custom51inr = double.tryParse(convertor5);
  convertor6 = custom61inr.toStringAsFixed(2);
    custom61inr = double.tryParse(convertor6);
  convertor7 = custom71inr.toStringAsFixed(2);
    custom71inr = double.tryParse(convertor7);
  convertor8 = custom81inr.toStringAsFixed(2);
    custom81inr = double.tryParse(convertor8);
  convertor9 = custom91inr.toStringAsFixed(2);
    custom91inr = double.tryParse(convertor9);
  convertor10 = custom101inr.toStringAsFixed(2);
    custom101inr = double.tryParse(convertor10);
  convertor11 = currentUser.country == country?shipcostinr.toStringAsFixed(2):shipcostinterinr.toStringAsFixed(2);
    shipcostuser = double.tryParse(convertor11);

  }
  else if (currentUser.currency == "EUR"){
    convertor = eur.toStringAsFixed(2);
    eur = double.tryParse(convertor);
     convertor1 = custom11eur.toStringAsFixed(2);
    custom11eur = double.tryParse(convertor1);
  convertor2 = custom21eur.toStringAsFixed(2);
    custom21eur = double.tryParse(convertor2);
  convertor3 = custom31eur.toStringAsFixed(2);
    custom31eur = double.tryParse(convertor3);
  convertor4 = custom41eur.toStringAsFixed(2);
    custom41eur = double.tryParse(convertor4);
  convertor5 = custom51eur.toStringAsFixed(2);
    custom51eur = double.tryParse(convertor5);
  convertor6 = custom61eur.toStringAsFixed(2);
    custom61eur = double.tryParse(convertor6);
  convertor7 = custom71eur.toStringAsFixed(2);
    custom71eur = double.tryParse(convertor7);
  convertor8 = custom81eur.toStringAsFixed(2);
    custom81eur = double.tryParse(convertor8);
  convertor9 = custom91eur.toStringAsFixed(2);
    custom91eur = double.tryParse(convertor9);
  convertor10 = custom101eur.toStringAsFixed(2);
    custom101eur = double.tryParse(convertor10);
  convertor11 = currentUser.country == country?shipcosteur.toStringAsFixed(2):shipcostintereur.toStringAsFixed(2);
    shipcostuser = double.tryParse(convertor11);

  }
  else if (currentUser.currency == "GBP"){
    convertor = gbp.toStringAsFixed(2);
    gbp = double.tryParse(convertor);
     convertor1 = custom11gbp.toStringAsFixed(2);
    custom11gbp = double.tryParse(convertor1);
  convertor2 = custom21gbp.toStringAsFixed(2);
    custom21gbp = double.tryParse(convertor2);
  convertor3 = custom31gbp.toStringAsFixed(2);
    custom31gbp = double.tryParse(convertor3);
  convertor4 = custom41gbp.toStringAsFixed(2);
    custom41gbp = double.tryParse(convertor4);
  convertor5 = custom51gbp.toStringAsFixed(2);
    custom51gbp = double.tryParse(convertor5);
  convertor6 = custom61gbp.toStringAsFixed(2);
    custom61gbp = double.tryParse(convertor6);
  convertor7 = custom71gbp.toStringAsFixed(2);
    custom71gbp = double.tryParse(convertor7);
  convertor8 = custom81gbp.toStringAsFixed(2);
    custom81gbp = double.tryParse(convertor8);
  convertor9 = custom91gbp.toStringAsFixed(2);
    custom91gbp = double.tryParse(convertor9);
  convertor10 = custom101gbp.toStringAsFixed(2);
    custom101gbp = double.tryParse(convertor10);
  convertor11 = currentUser.country == country?shipcostgbp.toStringAsFixed(2):shipcostintergbp.toStringAsFixed(2);
    shipcostuser = double.tryParse(convertor11);

  }
  else{
    convertor = usd.toStringAsFixed(2);
    usd = double.tryParse(convertor);
    convertor1 = custom11usd.toStringAsFixed(2);
    custom11usd = double.tryParse(convertor1);
    convertor2 = custom21usd.toStringAsFixed(2);
    custom21usd = double.tryParse(convertor2);
    convertor3 = custom31usd.toStringAsFixed(2);
    custom31usd = double.tryParse(convertor3);
    convertor4 = custom41usd.toStringAsFixed(2);
    custom41usd = double.tryParse(convertor4);
    convertor5 = custom51usd.toStringAsFixed(2);
    custom51usd = double.tryParse(convertor5);
    convertor6 = custom61usd.toStringAsFixed(2);
    custom61usd = double.tryParse(convertor6);
    convertor7 = custom71usd.toStringAsFixed(2);
    custom71usd = double.tryParse(convertor7);
    convertor8 = custom81usd.toStringAsFixed(2);
    custom81usd = double.tryParse(convertor8);
    convertor9 = custom91usd.toStringAsFixed(2);
    custom91usd = double.tryParse(convertor9);
    convertor10 = custom101usd.toStringAsFixed(2);
    custom101usd = double.tryParse(convertor10);
    convertor11 = currentUser.country == country?shipcostusd.toStringAsFixed(2):shipcostinterusd.toStringAsFixed(2);
    shipcostuser = double.tryParse(convertor11);

  }
  isUploading = false;

}
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

  Proceedtobuy({
var ship,
var shipcostU,

    }){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>AddressBuy(
Size: usersize,
displaysize: size,
OwnerId: ownerId,prodId:prodId ,
        profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname,
      usd:usd,
      inr:inr,
freeship:freeship,
 freeworldship:freeworldship,

      shipcost: ship,
      shipcostuser: shipcostU,

      custompriceusd:custompriceusd,
      custompriceinr:custompriceinr,
customIndex:Custom,
      userCustom:userCustom,
      price:price,
          customprice:customprice,
country:country,
color:color,
colorText:usercolor,
mtoText:mtoController.text??"" ,

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
        freeSize: freesize,

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
                      backgroundColor: kblue,
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
List<String> selectedCustom = <String>[];

    if (gender == 'Men') {
return
  showMaterialModalBottomSheet(
      expand:true,

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
                  child: Container(
                      height: 450,

                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
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
                            Container(
                              height:205.0,

                              child:   Expanded(
                                  child:   ListView(
                                      scrollDirection:Axis.horizontal,
                                      shrinkWrap:true,
                                      children:[
                                        variationQuantity1==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                    height:120.0,
                                                    width:120.0,
                                                    child: CachedImage(variation1img)),
                                                currentUser.currency == "INR"? Row(
                                                  children: [
                                                    Text("₹ ${currencyFormatter.format(custom11inr)}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.0,
                                                        )),
                                                  ],
                                                ):
                                                currentUser.currency == "EUR"?Row(
                                                  children: [
                                                    Text("${currencyFormatter.format(custom11eur)}  €",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.0,
                                                        )),
                                                  ],
                                                ):
                                                currentUser.currency == "GBP"?Row(
                                                  children: [
                                                    Text("£ ${currencyFormatter.format(custom11gbp)}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.0,
                                                        )),
                                                  ],
                                                ):
                                                Row(
                                                  children: [
                                                    Text("\u0024 ${currencyFormatter.format(custom11usd)}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.0,
                                                        )),
                                                  ],
                                                ),

                                                ElevatedButton(

                                                  style: ElevatedButton.styleFrom(

                                                    primary: selectedCustom.contains("Variation 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                    onPrimary:selectedCustom.contains("Variation 1") ? Colors.white:  Colors.black, // foreground
                                                  ),
                                                  onPressed: () {
                                                    selectedCustom =  <String>[];
                                                    selectedCustom.add("Variation 1");
                                                    stateSetter(() { variationIndex = 'Variation 1';
                                                    userVariation = variation1;
                                                    userVariationPrice =  currentUser.currency == "EUR"? custom11eur:
                                                    currentUser.currency == "INR"? custom11inr:
                                                     currentUser.currency == "GBP"? custom11gbp:
                                                     custom11usd;
                                                 });
                                                  },          child: Text(variation1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        custom22==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom2img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom21usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 2") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 2");

                                                  stateSetter(() { Custom = 'Custom 2';
                                                  userCustom = custom2;
                                                  customprice = customprice2;
                                                  custompriceusd = custom21usd;
                                                  custompriceinr = custom21inr;});
                                                },          child: Text(custom2),
                                              ),
                                            ],
                                          ),
                                        ),

                                        custom32==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom3img)),

                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom31usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 3") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 3");

                                                  stateSetter(() { Custom = 'Custom 3';
                                                  userCustom = custom3;
                                                  customprice = customprice3;
                                                  custompriceusd = custom31usd;
                                                  custompriceinr = custom31inr;});
                                                },          child: Text(custom3),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom42==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom4img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom41usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 4") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 4");

                                                  stateSetter(() { Custom = 'Custom 4';
                                                  userCustom = custom4;
                                                  customprice = customprice4;
                                                  custompriceusd = custom41usd;
                                                  custompriceinr = custom41inr;});
                                                },          child: Text(custom4),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom52==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom5img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom51usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 5") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 5");

                                                  stateSetter(() { Custom = 'Custom 5';
                                                  userCustom = custom5;
                                                  customprice = customprice5;
                                                  custompriceusd = custom51usd;
                                                  custompriceinr = custom51inr;});
                                                },          child: Text(custom5),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom62==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom6img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom61usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 6") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 6");

                                                  stateSetter(() { Custom = 'Custom 6';
                                                  userCustom = custom6;
                                                  customprice = customprice6;
                                                  custompriceusd = custom61usd;
                                                  custompriceinr = custom61inr;});
                                                },          child: Text(custom6),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom72==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom7img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom71usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 7") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 7");

                                                  stateSetter(() { Custom = 'Custom 7';
                                                  userCustom = custom7;
                                                  customprice = customprice7;
                                                  custompriceusd = custom71usd;
                                                  custompriceinr = custom71inr;});
                                                },          child: Text(custom7),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom82==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom8img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom81usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 8") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 8");

                                                  stateSetter(() { Custom = 'Custom 8';
                                                  userCustom = custom8;
                                                  customprice = customprice8;
                                                  custompriceusd = custom81usd;
                                                  custompriceinr = custom81inr;});
                                                },          child: Text(custom8),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom92==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom9img)),
                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom91usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),
                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 9") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 9");

                                                  stateSetter(() { Custom = 'Custom 9';
                                                  userCustom = custom9;
                                                  customprice = customprice9;
                                                  custompriceusd = custom91usd;
                                                  custompriceinr = custom91inr;});
                                                },          child: Text(custom9),
                                              ),
                                            ],
                                          ),
                                        ),
                                        custom102==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  height:120.0,
                                                  width:120.0,
                                                  child: CachedImage(custom10img)),

                                              currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr',)):
                                              currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom101usd',)):
                                              currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                              FittedBox(child: Text(' + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),                                              ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCustom.contains("Custom 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCustom.contains("Custom 10") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCustom =  <String>[];
                                                  selectedCustom.add("Custom 10");

                                                  stateSetter(() { Custom = 'Custom 10';
                                                  userCustom = custom10;
                                                  customprice = customprice10;
                                                  custompriceusd = custom101usd;
                                                  custompriceinr = custom101inr;});
                                                },          child: Text(custom10),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ])
                              ),
                            ),

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

                        primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("MTO");
                        MTO();
                       // stateSetter(() {usersize = "Free Size";
                        //size = 'Free size';
                        //});
                      },          child: Text('MTO'),
                    ),
                  ),
                  freesize==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("Free Size");

                        stateSetter(() {usersize = "Free Size";
                        size = 'Free size';
                        });
                      },          child: Text('Free Size'),
                    ),
                  ),

                  xxxs==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("XXXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("XXXS") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("XXXS");

                        stateSetter(() {usersize = "XXXS";
                        size = 'XXXS';
                        });
                      },          child: Text('XXXS'),
                    ),
                  ),
                  xxs==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("XXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("XXS") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("XXS");

                        stateSetter(() {usersize = "XXS";
                        size = 'XXS';
                        });
                      },          child: Text('XXS'),
                    ),
                  ),
                  xs==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("XS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("XS") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("XS");

                        stateSetter(() {usersize = "XS";
                        size = 'XS';
                        });
                      },          child: Text('XS'),
                    ),
                  ),
                  s==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("S") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("S") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("S");

                        stateSetter(() {usersize = "S";
                        size = 'S';
                        });
                      },          child: Text('S'),
                    ),
                  ),
                  m==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("M") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("M");

                        stateSetter(() {usersize = "M";
                        size = 'M';
                        });
                      },          child: Text('M'),
                    ),
                  ),

                  l==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("L") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("L") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("L");

                        stateSetter(() {usersize = "L";
                        size = 'L';
                        });
                      },          child: Text('L'),
                    ),
                  ),
                  xl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("XL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("XL");

                        stateSetter(() {usersize = "XL";
                        size = 'XL';
                        });
                      },          child: Text('XL'),
                    ),
                  ),
                  xxl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("XXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("XXL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("XXL");

                        stateSetter(() {usersize = "XXL";
                        size = 'XXL';
                        });
                      },          child: Text('XXL'),
                    ),
                  ),
                  xxxl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("XXXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("XXXL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("XXXL");

                        stateSetter(() {usersize = "XXXL";
                        size = 'XXXL';
                        });
                      },          child: Text('XXXL'),
                    ),
                  ),
                  fourxl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("4XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("4XL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("4XL");

                        stateSetter(() {usersize = "4XL";
                        size = '4XL';
                        });
                      },          child: Text('4XL'),
                    ),
                  ),
                  fivexl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("5XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("5XL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("5XL");

                        stateSetter(() {usersize = "5XL";
                        size = '5XL';
                        });
                      },          child: Text('5XL'),
                    ),
                  ),
                  sixxl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("6XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("6XL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("6XL");

                        stateSetter(() {usersize = "6XL";
                        size = '6XL';
                        });
                      },          child: Text('6XL'),
                    ),
                  ),
                  sevenxl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("7XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("7XL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("7XL");

                        stateSetter(() {usersize = "7XL";
                        size = '7XL';
                        });
                      },          child: Text('7XL'),
                    ),
                  ),
                  eightxl==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("8XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("8XL") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("8XL");

                        stateSetter(() {usersize = "8XL";
                        size = '8XL';
                        });
                      },          child: Text('8XL'),
                    ),
                  ),
                  Ring1==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 4") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 4");

                        stateSetter(() {usersize = "R 4";
                        size = '(US) 4';
                        });
                      },          child: Text('(US) 4'),
                    ),
                  ),
                  Ring2==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 4.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 4.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 4.5");

                        stateSetter(() {usersize = "R 4.5";
                        size = '(US) 4.5';
                        });
                      },          child: Text('(US) 4.5'),
                    ),
                  ),

                  Ring3==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 5");

                        stateSetter(() {usersize = "R 5";
                        size = '(US) 5';
                        });
                      },          child: Text('(US) 5'),
                    ),
                  ),
                  Ring4==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 5.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 5.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 5.5");

                        stateSetter(() {usersize = "R 5.5";
                        size = '(US) 5.5';
                        });
                      },          child: Text('(US) 5.5'),
                    ),
                  ),
                  Ring5==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 6") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 6");

                        stateSetter(() {usersize = "R 6";
                        size = '(US) 6';
                        });
                      },          child: Text('(US) 6'),
                    ),
                  ),
                  Ring6==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 6.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 6.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 6.5");

                        stateSetter(() {usersize = "R 6.5";
                        size = '(US) 6.5';
                        });
                      },          child: Text('(US) 6.5'),
                    ),
                  ),
                  Ring7==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 7") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 7");

                        stateSetter(() {usersize = "R 7";
                        size = '(US) 7';
                        });
                      },          child: Text('(US) 7'),
                    ),
                  ),
                  Ring8==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 7.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 7.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 7.5");

                        stateSetter(() {usersize = "R 7.5";
                        size = '(US) 7.5';
                        });
                      },          child: Text('(US) 7.5'),
                    ),
                  ),
                  Ring9==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 8") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 8");

                        stateSetter(() {usersize = "R 8";
                        size = '(US) 8';
                        });
                      },          child: Text('(US) 8'),
                    ),
                  ),
                  Ring10==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 8.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 8.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 8.5");

                        stateSetter(() {usersize = "R 8.5";
                        size = '(US) 8.5';
                        });
                      },          child: Text('(US) 8.5'),
                    ),
                  ),
                  Ring11==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 9") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 9");

                        stateSetter(() {usersize = "R 9";
                        size = '(US) 9';
                        });
                      },          child: Text('(US) 9'),
                    ),
                  ),
                  Ring12==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 9.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 9.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 9.5");

                        stateSetter(() {usersize = "R 9.5";
                        size = '(US) 9.5';
                        });
                      },          child: Text('(US) 9.5'),
                    ),
                  ),
                  Ring13==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 10") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 10");

                        stateSetter(() {usersize = "R 10";
                        size = '(US) 10';
                        });
                      },          child: Text('(US) 10'),
                    ),
                  ),
                  Ring14==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 10.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 10.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 10.5");

                        stateSetter(() {usersize = "R 10.5";
                        size = '(US) 10.5';
                        });
                      },          child: Text('(US) 10.5'),
                    ),
                  ),
                  Ring15==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 11") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 11") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 11");

                        stateSetter(() {usersize = "R 11";
                        size = '(US) 11';
                        });
                      },          child: Text('(US) 11'),
                    ),
                  ),
                  Ring16==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 11.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 11.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 11.5");

                        stateSetter(() {usersize = "R 11.5";
                        size = '(US) 11.5';
                        });
                      },          child: Text('(US) 11.5'),
                    ),
                  ),
                  Ring17==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 12") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 12");

                        stateSetter(() {usersize = "R 12";
                        size = '(US) 12';
                        });
                      },          child: Text('(US) 12'),
                    ),
                  ),
                  Ring18==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 12.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 12.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 12.5");

                        stateSetter(() {usersize = "R 12.5";
                        size = '(US) 12.5';
                        });
                      },          child: Text('(US) 12.5'),
                    ),
                  ),
                  Ring19==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 13") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 13");

                        stateSetter(() {usersize = "R 13";
                        size = '(US) 13';
                        });
                      },          child: Text('(US) 13'),
                    ),
                  ),
                  Ring20==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 13.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 13.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 13.5");

                        stateSetter(() {
                          size = '(US) 13.5';
                          usersize = "R 13.5";});
                      },          child: Text('(US) 13.5'),
                    ),
                  ),
                  Ring21==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 14") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 14");

                        stateSetter(() {usersize = "R 14";
                        size = '(US) 14';
                        });
                      },          child: Text('(US) 14'),
                    ),
                  ),
                  Ring22==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 14.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 14.5") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 14.5");

                        stateSetter(() {usersize = "R 14.5";
                        size = '(US) 14.5';
                        });
                      },          child: Text('(US) 14.5'),
                    ),
                  ),
                  Ring23==0?Container():   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: selectedCategory.contains("R 15") ? Colors.black: Colors.white.withOpacity(0.1), // background
                        onPrimary:selectedCategory.contains("R 15") ? Colors.white:  Colors.black, // foreground
                      ),
                      onPressed: () {
                        selectedCategory =  <String>[];
                        selectedCategory.add("R 15");

                        stateSetter(() {usersize = "R 15";
                        size = '(US) 15';

                        });
                      },          child: Text('(US) 15'),
                    ),
                  ),
Shoe1==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 3 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 3 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 3 ½");

                  stateSetter(() {usersize = "(US) 3 ½";
                  size = '(US) 3 ½';
                  });
              },          child: Text('(US) 3 ½'),
            ),
),
 Shoe2==0?Container():  Padding(
     padding: const EdgeInsets.all(8.0),
     child:   ElevatedButton(

            style: ElevatedButton.styleFrom(

              primary: selectedCategory.contains("(US) 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
              onPrimary:selectedCategory.contains("(US) 4") ? Colors.white:  Colors.black, // foreground
            ),
            onPressed: () {
              selectedCategory =  <String>[];
              selectedCategory.add("(US) 4");

              stateSetter(() {usersize = "(US) 4";
              size = '(US) 4';
              });
            },          child: Text('(US) 4'),
          )),
Shoe3==0?Container():   Padding(
    padding: const EdgeInsets.all(8.0),
    child:  ElevatedButton(

            style: ElevatedButton.styleFrom(

              primary: selectedCategory.contains("(US) 4 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
              onPrimary:selectedCategory.contains("(US) 4 ½") ? Colors.white:  Colors.black, // foreground
            ),
            onPressed: () {
              selectedCategory =  <String>[];
              selectedCategory.add("(US) 4 ½");

              stateSetter(() {usersize = "(US) 4 ½";
              size = '(US) 4 ½';
              });
            },          child: Text('(US) 4 ½'),
          )),
Shoe4==0?Container():  Padding(
    padding: const EdgeInsets.all(8.0),
    child:   ElevatedButton(

            style: ElevatedButton.styleFrom(

              primary: selectedCategory.contains("(US) 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
              onPrimary:selectedCategory.contains("(US) 5") ? Colors.white:  Colors.black, // foreground
            ),
            onPressed: () {
              selectedCategory =  <String>[];
              selectedCategory.add("(US) 5");

              stateSetter(() {usersize = "(US) 5";
              size = '(US) 5';
              });
            },          child: Text('(US) 5'),
          )),
Shoe5==0?Container():   Padding(
    padding: const EdgeInsets.all(8.0),
    child:  ElevatedButton(

            style: ElevatedButton.styleFrom(

              primary: selectedCategory.contains("(US) 5 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
              onPrimary:selectedCategory.contains("(US) 5 ½") ? Colors.white:  Colors.black, // foreground
            ),
            onPressed: () {
              selectedCategory =  <String>[];
              selectedCategory.add("(US) 5 ½");

              stateSetter(() {usersize = "(US) 5 ½";
              size = '(US) 5 ½';
              });
            },          child: Text('(US) 5 ½'),
          )),
Shoe6==0?Container():  Padding(
    padding: const EdgeInsets.all(8.0),
    child:   ElevatedButton(

            style: ElevatedButton.styleFrom(

              primary: selectedCategory.contains("(US) 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
              onPrimary:selectedCategory.contains("(US) 6") ? Colors.white:  Colors.black, // foreground
            ),
            onPressed: () {
              selectedCategory =  <String>[];
              selectedCategory.add("(US) 6");

              stateSetter(() {usersize = "(US) 6";
              size = '(US) 6';
              });
            },          child: Text('(US) 6'),
          )),
Shoe7==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 6 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 6 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 6 ½");

                  stateSetter(() {usersize = "(US) 6 ½";
                  size = '(US) 6 ½';
                  });
              },          child: Text('(US) 6 ½'),
            ),
),
Shoe8==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 7") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 7");

                  stateSetter(() {usersize = "(US) 7";
                  size = '(US) 7';
                  });
              },          child: Text('(US) 7'),
            ),
),
Shoe9==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 7 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 7 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 7 ½");

                  stateSetter(() {usersize = "(US) 7 ½";
                  size = '(US) 7 ½';
                  });
              },          child: Text('(US) 7 ½'),
            ),
),
Shoe10==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 8") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 8");

                  stateSetter(() {usersize = "(US) 8";
                  size = '(US) 8';
                  });
              },          child: Text('(US) 8'),
            ),
),
Shoe11==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 8 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 8 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 8 ½");

                  stateSetter(() {usersize = "(US) 8 ½";
                  size = '(US) 8 ½';
                  });
              },          child: Text('(US) 8 ½'),
            ),
),
Shoe12==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 9") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 9");

                  stateSetter(() {usersize = "(US) 9";
                  size = '(US) 9';
                  });
              },          child: Text('(US) 9'),
            ),
),
Shoe13==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 9 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 9 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 9 ½");

                  stateSetter(() {usersize = "(US) 9 ½";

                  size = '(US) 9 ½';
                  });
              },          child: Text('(US) 9 ½'),
            ),
),
Shoe14==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 10") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 10");

                  stateSetter(() {usersize = "(US) 10";
                  size = '(US) 10';
                  });
              },          child: Text('(US) 10'),
            ),
),
Shoe15==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 10 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 10 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 10 ½");

                  stateSetter(() {usersize = "(US) 10 ½";
                  size = '(US) 10 ½';
                  });
              },          child: Text('(US) 10 ½'),
            ),
),
Shoe16==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(



              style: ElevatedButton.styleFrom(



                  primary: selectedCategory.contains("(US) 11") ? Colors.black: Colors.white.withOpacity(0.1), // background

                  onPrimary:selectedCategory.contains("(US) 11") ? Colors.white:  Colors.black, // foreground

              ),

              onPressed: () {

                  selectedCategory =  <String>[];

                  selectedCategory.add("(US) 11");



                  stateSetter(() {usersize = "(US) 11";
                  size = '(US) 11';
                  });

              },          child: Text('(US) 11'),

            ),
),
Shoe17==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 11 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 11 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 11 ½");

                  stateSetter(() {usersize = "(US) 11 ½";
                  size = '(US) 11 ½';
                  });
              },          child: Text('(US) 11 ½'),
            ),
),
Shoe18==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 12") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 12");

                  stateSetter(() {usersize = "(US) 12";
                  size = '(US) 12';
                  });
              },          child: Text('(US) 12'),
            ),
),
Shoe19==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 12 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 12 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 12 ½");

                  stateSetter(() {usersize = "(US) 12 ½";
                  size = '(US) 12 ½';
                  });
              },          child: Text('(US) 12 ½'),
            ),
),
Shoe20==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 13") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 13");

                  stateSetter(() {usersize = "(US) 13";
                  size = '(US) 13';
                  });
              },          child: Text('(US) 13'),
            ),
),
Shoe21==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                  primary: selectedCategory.contains("(US) 13 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                  onPrimary:selectedCategory.contains("(US) 13 ½") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                  selectedCategory =  <String>[];
                  selectedCategory.add("(US) 13 ½");

                  stateSetter(() {usersize = "(US) 13 ½";
                  size = '(US) 13 ½';
                  });
              },          child: Text('(US) 13 ½'),
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

                                              primary: selectedColor.contains("col 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 1") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 1");

                                              stateSetter(() { color = 'col 1';
                                              usercolor = colorText1;});
                                            },          child: Text(colorText1),
                                          ),
                                        ),
                                        color2==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 2") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 2");

                                              stateSetter(() { color = 'col 2';
                                              usercolor = colorText2;});
                                            },          child: Text(colorText2),
                                          ),
                                        ),
                                        color3==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 3") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 3");

                                              stateSetter(() { color = 'col 3';
                                              usercolor = colorText3;});
                                            },          child: Text(colorText3),
                                          ),
                                        ),
                                        color4==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 4") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 4");

                                              stateSetter(() { color = 'col 4';
                                              usercolor = colorText4;});
                                            },          child: Text(colorText4),
                                          ),
                                        ),
                                        color5==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 5") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 5");

                                              stateSetter(() { color = 'col 5';
                                              usercolor = colorText5;});
                                            },          child: Text(colorText5),
                                          ),
                                        ),
                                        color6==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 6") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 6");

                                              stateSetter(() { color = 'col 6';
                                              usercolor = colorText6;});
                                            },          child: Text(colorText6),
                                          ),
                                        ),
                                        color7==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 7") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 7");

                                              stateSetter(() { color = 'col 7';
                                              usercolor = colorText7;});
                                            },          child: Text(colorText7),
                                          ),
                                        ),
                                        color8==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 8") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 8");

                                              stateSetter(() { color = 'col 8';
                                              usercolor = colorText8;});
                                            },          child: Text(colorText8),
                                          ),
                                        ),
                                        color9==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 9") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 9");

                                              stateSetter(() { color = 'col 9';
                                              usercolor = colorText9;});
                                            },          child: Text(colorText9),
                                          ),
                                        ),
                                        color10==0?Container():   Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            style: ElevatedButton.styleFrom(

                                              primary: selectedColor.contains("col 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                              onPrimary:selectedColor.contains("col 10") ? Colors.white:  Colors.black, // foreground
                                            ),
                                            onPressed: () {
                                              selectedColor =  <String>[];
                                              selectedColor.add("col 10");

                                              stateSetter(() { color = 'col 10';
                                              usercolor = colorText10;});
                                            },          child: Text(colorText10),
                                          ),
                                        ),

                                      ])
                              ),
                            ),
                            SizedBox(height:8.0),

                            usersize == "" || color == ""|| Custom == ""?Container():
                  FloatingActionButton.extended(
                  backgroundColor: kPrimaryColor,
                  onPressed: () {
                    if (currentUser.country == country) {
                      isUploading?    null
                          :  Proceedtobuy(
                          ship: shipcostusd, shipcostU: shipcostinr);
                    } else {
                      isUploading?null:  Proceedtobuy(ship: shipcostinterusd,
                          shipcostU: shipcostuser);
                    }
                  },
                  label:

                  Text(
                    'Buy Now', style: TextStyle(color: Colors.white),),
                ),


                          ])

                  ),
                );
            });
            }
        );
    }
    else if (gender == 'Women') {
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            return
              StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter stateSetter){

                    return
                      Container(
                          height: 450,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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
                                Container(
                                  height:205.0,

                                  child:   Expanded(
                                      child:   ListView(
                                          scrollDirection:Axis.horizontal,
                                          shrinkWrap:true,
                                          children:[
                                            custom12==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom1img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom11inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom11usd',)):
                                                  currentUser.country == country?FittedBox(child: Text('+ ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 1") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 1");

                                                      stateSetter(() { Custom = 'Custom 1';
                                                      userCustom = custom1;
                                                      customprice = customprice1;
                                                      custompriceusd = custom11usd;
                                                      custompriceinr = custom11inr;});
                                                    },          child: Text(custom1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom22==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom2img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom21usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 2") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 2");

                                                      stateSetter(() { Custom = 'Custom 2';
                                                      userCustom = custom2;
                                                      customprice = customprice2;
                                                      custompriceusd = custom21usd;
                                                      custompriceinr = custom21inr;});
                                                    },          child: Text(custom2),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            custom32==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom3img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom31usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 3") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 3");

                                                      stateSetter(() { Custom = 'Custom 3';
                                                      userCustom = custom3;
                                                      customprice = customprice3;
                                                      custompriceusd = custom31usd;
                                                      custompriceinr = custom31inr;});
                                                    },          child: Text(custom3),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom42==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom4img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom41usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 4") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 4");

                                                      stateSetter(() { Custom = 'Custom 4';
                                                      userCustom = custom4;
                                                      customprice = customprice4;
                                                      custompriceusd = custom41usd;
                                                      custompriceinr = custom41inr;});
                                                    },          child: Text(custom4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom52==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom5img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom51usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 5") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 5");

                                                      stateSetter(() { Custom = 'Custom 5';
                                                      userCustom = custom5;
                                                      customprice = customprice5;
                                                      custompriceusd = custom51usd;
                                                      custompriceinr = custom51inr;});
                                                    },          child: Text(custom5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom62==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom6img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom61usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 6") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 6");

                                                      stateSetter(() { Custom = 'Custom 6';
                                                      userCustom = custom6;
                                                      customprice = customprice6;
                                                      custompriceusd = custom61usd;
                                                      custompriceinr = custom61inr;});
                                                    },          child: Text(custom6),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom72==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom7img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom71usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 7") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 7");

                                                      stateSetter(() { Custom = 'Custom 7';
                                                      userCustom = custom7;
                                                      customprice = customprice7;
                                                      custompriceusd = custom71usd;
                                                      custompriceinr = custom71inr;});
                                                    },          child: Text(custom7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom82==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom8img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom81usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 8") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 8");

                                                      stateSetter(() { Custom = 'Custom 8';
                                                      userCustom = custom8;
                                                      customprice = customprice8;
                                                      custompriceusd = custom81usd;
                                                      custompriceinr = custom81inr;});
                                                    },          child: Text(custom8),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom92==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom9img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom91usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 9") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 9");

                                                      stateSetter(() { Custom = 'Custom 9';
                                                      userCustom = custom9;
                                                      customprice = customprice9;
                                                      custompriceusd = custom91usd;
                                                      custompriceinr = custom91inr;});
                                                    },          child: Text(custom9),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom102==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom10img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom101usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),                                              ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 10") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 10");

                                                      stateSetter(() { Custom = 'Custom 10';
                                                      userCustom = custom10;
                                                      customprice = customprice10;
                                                      custompriceusd = custom101usd;
                                                      custompriceinr = custom101inr;});
                                                    },          child: Text(custom10),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ])
                                  ),
                                ),

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

                                                primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("MTO");
                                                MTO();
                                                // stateSetter(() {usersize = "Free Size";
                                                //size = 'Free size';
                                                //});
                                              },          child: Text('MTO'),
                                            ),
                                          ),

                                          freesize==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("Free Size");

                                                stateSetter(() {usersize = "Free Size";
                                                size = 'Free size';
                                                });
                                              },          child: Text('Free Size'),
                                            ),
                                          ),
                                          xxxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("XXXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("XXXS") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("XXXS");

                                                stateSetter(() {usersize = "XXXS";
                                                size = 'XXXS';
                                                });
                                              },          child: Text('XXXS'),
                                            ),
                                          ),
                                          xxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("XXS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("XXS") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("XXS");

                                                stateSetter(() {usersize = "XXS";
                                                size = 'XXS';
                                                });
                                              },          child: Text('XXS'),
                                            ),
                                          ),
                                          xs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("XS") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("XS") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("XS");

                                                stateSetter(() {usersize = "XS";
                                                size = 'XS';
                                                });
                                              },          child: Text('XS'),
                                            ),
                                          ),
                                          s==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S");

                                                stateSetter(() {usersize = "S";
                                                size = 'S';
                                                });
                                              },          child: Text('S'),
                                            ),
                                          ),
                                          m==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("M");

                                                stateSetter(() {usersize = "M";
                                                size = 'M';
                                                });
                                              },          child: Text('M'),
                                            ),
                                          ),

                                          l==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("L") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("L") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("L");

                                                stateSetter(() {usersize = "L";
                                                size = 'L';
                                                });
                                              },          child: Text('L'),
                                            ),
                                          ),
                                          xl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("XL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("XL");

                                                stateSetter(() {usersize = "XL";
                                                size = 'XL';
                                                });
                                              },          child: Text('XL'),
                                            ),
                                          ),
                                          xxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("XXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("XXL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("XXL");

                                                stateSetter(() {usersize = "XXL";
                                                size = 'XXL';
                                                });
                                              },          child: Text('XXL'),
                                            ),
                                          ),
                                          xxxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("XXXL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("XXXL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("XXXL");

                                                stateSetter(() {usersize = "XXXL";
                                                size = 'XXXL';
                                                });
                                              },          child: Text('XXXL'),
                                            ),
                                          ),
                                          fourxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("4XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("4XL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("4XL");

                                                stateSetter(() {usersize = "4XL";
                                                size = '4XL';
                                                });
                                              },          child: Text('4XL'),
                                            ),
                                          ),
                                          fivexl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("5XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("5XL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("5XL");

                                                stateSetter(() {usersize = "5XL";
                                                size = '5XL';
                                                });
                                              },          child: Text('5XL'),
                                            ),
                                          ),
                                          sixxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("6XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("6XL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("6XL");

                                                stateSetter(() {usersize = "6XL";
                                                size = '6XL';
                                                });
                                              },          child: Text('6XL'),
                                            ),
                                          ),
                                          sevenxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("7XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("7XL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("7XL");

                                                stateSetter(() {usersize = "7XL";
                                                size = '7XL';
                                                });
                                              },          child: Text('7XL'),
                                            ),
                                          ),
                                          eightxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("8XL") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("8XL") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("8XL");

                                                stateSetter(() {usersize = "8XL";
                                                size = '8XL';
                                                });
                                              },          child: Text('8XL'),
                                            ),
                                          ),
                                          Ring1==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 4") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 4");

                                                stateSetter(() {usersize = "R 4";
                                                size = '(US) 4';
                                                });
                                              },          child: Text('(US) 4'),
                                            ),
                                          ),
                                          Ring2==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 4.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 4.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 4.5");

                                                stateSetter(() {usersize = "R 4.5";
                                                size = '(US) 4.5';
                                                });
                                              },          child: Text('(US) 4.5'),
                                            ),
                                          ),

                                          Ring3==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 5");

                                                stateSetter(() {usersize = "R 5";
                                                size = '(US) 5';
                                                });
                                              },          child: Text('(US) 5'),
                                            ),
                                          ),
                                          Ring4==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 5.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 5.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 5.5");

                                                stateSetter(() {usersize = "R 5.5";
                                                size = '(US) 5.5';
                                                });
                                              },          child: Text('(US) 5.5'),
                                            ),
                                          ),
                                          Ring5==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 6") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 6");

                                                stateSetter(() {usersize = "R 6";
                                                size = '(US) 6';
                                                });
                                              },          child: Text('(US) 6'),
                                            ),
                                          ),
                                          Ring6==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 6.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 6.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 6.5");

                                                stateSetter(() {usersize = "R 6.5";
                                                size = '(US) 6.5';
                                                });
                                              },          child: Text('(US) 6.5'),
                                            ),
                                          ),
                                          Ring7==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 7") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 7");

                                                stateSetter(() {usersize = "R 7";
                                                size = '(US) 7';
                                                });
                                              },          child: Text('(US) 7'),
                                            ),
                                          ),
                                          Ring8==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 7.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 7.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 7.5");

                                                stateSetter(() {usersize = "R 7.5";
                                                size = '(US) 7.5';
                                                });
                                              },          child: Text('(US) 7.5'),
                                            ),
                                          ),
                                          Ring9==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 8");

                                                stateSetter(() {usersize = "R 8";
                                                size = '(US) 8';
                                                });
                                              },          child: Text('(US) 8'),
                                            ),
                                          ),
                                          Ring10==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 8.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 8.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 8.5");

                                                stateSetter(() {usersize = "R 8.5";
                                                size = '(US) 8.5';
                                                });
                                              },          child: Text('(US) 8.5'),
                                            ),
                                          ),
                                          Ring11==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 9");

                                                stateSetter(() {usersize = "R 9";
                                                size = '(US) 9';
                                                });
                                              },          child: Text('(US) 9'),
                                            ),
                                          ),
                                          Ring12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 9.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 9.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 9.5");

                                                stateSetter(() {usersize = "R 9.5";
                                                size = '(US) 9.5';
                                                });
                                              },          child: Text('(US) 9.5'),
                                            ),
                                          ),
                                          Ring13==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 10");

                                                stateSetter(() {usersize = "R 10";
                                                size = '(US) 10';
                                                });
                                              },          child: Text('(US) 10'),
                                            ),
                                          ),
                                          Ring14==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 10.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 10.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 10.5");

                                                stateSetter(() {usersize = "R 10.5";
                                                size = '(US) 10.5';
                                                });
                                              },          child: Text('(US) 10.5'),
                                            ),
                                          ),
                                          Ring15==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 11") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 11") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 11");

                                                stateSetter(() {usersize = "R 11";
                                                size = '(US) 11';
                                                });
                                              },          child: Text('(US) 11'),
                                            ),
                                          ),
                                          Ring16==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 11.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 11.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 11.5");

                                                stateSetter(() {usersize = "R 11.5";
                                                size = '(US) 11.5';
                                                });
                                              },          child: Text('(US) 11.5'),
                                            ),
                                          ),
                                          Ring17==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 12") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 12");

                                                stateSetter(() {usersize = "R 12";
                                                size = '(US) 12';
                                                });
                                              },          child: Text('(US) 12'),
                                            ),
                                          ),
                                          Ring18==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 12.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 12.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 12.5");

                                                stateSetter(() {usersize = "R 12.5";
                                                size = '(US) 12.5';
                                                });
                                              },          child: Text('(US) 12.5'),
                                            ),
                                          ),
                                          Ring19==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 13") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 13");

                                                stateSetter(() {usersize = "R 13";
                                                size = '(US) 13';
                                                });
                                              },          child: Text('(US) 13'),
                                            ),
                                          ),
                                          Ring20==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 13.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 13.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 13.5");

                                                stateSetter(() {
                                                  size = '(US) 13.5';
                                                  usersize = "R 13.5";});
                                              },          child: Text('(US) 13.5'),
                                            ),
                                          ),
                                          Ring21==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 14") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 14");

                                                stateSetter(() {usersize = "R 14";
                                                size = '(US) 14';
                                                });
                                              },          child: Text('(US) 14'),
                                            ),
                                          ),
                                          Ring22==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 14.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 14.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 14.5");

                                                stateSetter(() {usersize = "R 14.5";
                                                size = '(US) 14.5';
                                                });
                                              },          child: Text('(US) 14.5'),
                                            ),
                                          ),
                                          Ring23==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 15") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 15") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 15");

                                                stateSetter(() {usersize = "R 15";
                                                size = '(US) 15';

                                                });
                                              },          child: Text('(US) 15'),
                                            ),
                                          ),
                                          Shoe1==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("5");

                                                stateSetter(() {usersize = "5";
                                                size = '5 (US)';
                                                });
                                              },          child: Text('5 (US)'),
                                            ),
                                          ),
                                          Shoe2==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("5 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("5 ½") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("5 ½");

                                                  stateSetter(() {usersize = "5 ½";
                                                  size = '5 ½ (US)';
                                                  });
                                                },          child: Text('5 ½ (US)'),
                                              )),
                                          Shoe3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("6") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("6");

                                                  stateSetter(() {usersize = "6";
                                                  size = '6 (US)';
                                                  });
                                                },          child: Text('6 (US)'),
                                              )),
                                          Shoe4==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("6 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("6 ½") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("6 ½");

                                                  stateSetter(() {usersize = "6 ½";
                                                  size = '6 ½ (US)';
                                                  });
                                                },          child: Text('6 ½ (US)'),
                                              )),
                                          Shoe5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("7") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("7");

                                                  stateSetter(() {usersize = "7";
                                                  size = '7 (US)';
                                                  });
                                                },          child: Text('7 (US)'),
                                              )),
                                          Shoe6==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("7 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("7 ½") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("7 ½");

                                                  stateSetter(() {usersize = "7 ½";
                                                  size = '7 ½ (US)';
                                                  });
                                                },          child: Text('7 ½ (US)'),
                                              )),
                                          Shoe7==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("8");

                                                stateSetter(() {usersize = "8";
                                                size = '8 (US)';
                                                });
                                              },          child: Text('8 (US)'),
                                            ),
                                          ),
                                          Shoe8==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("8 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("8 ½") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("8 ½");

                                                stateSetter(() {usersize = "8 ½";
                                                size = '8 ½ (US)';
                                                });
                                              },          child: Text('8 ½ (US)'),
                                            ),
                                          ),
                                          Shoe9==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("9");

                                                stateSetter(() {usersize = "9";});
                                              },          child: Text('9 (US)'),
                                            ),
                                          ),
                                          Shoe10==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("9 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("9 ½") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("9 ½");

                                                stateSetter(() {usersize = "9 ½";
                                                size = '9 ½ (US)';
                                                });
                                              },          child: Text('9 ½ (US)'),
                                            ),
                                          ),
                                          Shoe11==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("10");

                                                stateSetter(() {usersize = "10";
                                                size = '10 (US)';
                                                });
                                              },          child: Text('10 (US)'),
                                            ),
                                          ),
                                          Shoe12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("10 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("10 ½") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("10 ½");

                                                stateSetter(() {usersize = "10 ½";
                                                size = '10 ½ (US)';
                                                });
                                              },          child: Text('10 ½ (US)'),
                                            ),
                                          ),
                                          Shoe13==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("12") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("12");

                                                stateSetter(() {usersize = "12";
                                                size = '12 (US)';
                                                });
                                              },          child: Text('12 (US)'),
                                            ),
                                          ),
                                          Shoe14==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("13") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("13");

                                                stateSetter(() {usersize = "13";
                                                size = '13 (US)';
                                                });
                                              },          child: Text('13 (US)'),
                                            ),
                                          ),
                                          Shoe15==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("14") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("14");

                                                stateSetter(() {usersize = "14";
                                                size = '14 (US)';
                                                });
                                              },          child: Text('14 (US)'),
                                            ),
                                          ),
                                          Shoe16==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(



                                              style: ElevatedButton.styleFrom(



                                                primary: selectedCategory.contains("15 ½") ? Colors.black: Colors.white.withOpacity(0.1), // background

                                                onPrimary:selectedCategory.contains("15 ½") ? Colors.white:  Colors.black, // foreground

                                              ),

                                              onPressed: () {

                                                selectedCategory =  <String>[];

                                                selectedCategory.add("15 ½");



                                                stateSetter(() {usersize = "15 ½";
                                                size = '15 ½ (US)';

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

                                                  primary: selectedColor.contains("col 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 1") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 1");

                                                  stateSetter(() { color = 'col 1';
                                                  usercolor = colorText1;});
                                                },          child: Text(colorText1),
                                              ),
                                            ),
                                            color2==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 2") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 2");

                                                  stateSetter(() { color = 'col 2';
                                                  usercolor = colorText2;});
                                                },          child: Text(colorText2),
                                              ),
                                            ),
                                            color3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 3") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 3");

                                                  stateSetter(() { color = 'col 3';
                                                  usercolor = colorText3;});
                                                },          child: Text(colorText3),
                                              ),
                                            ),
                                            color4==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 4") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 4");

                                                  stateSetter(() { color = 'col 4';
                                                  usercolor = colorText4;});
                                                },          child: Text(colorText4),
                                              ),
                                            ),
                                            color5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 5") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 5");

                                                  stateSetter(() { color = 'col 5';
                                                  usercolor = colorText5;});
                                                },          child: Text(colorText5),
                                              ),
                                            ),
                                            color6==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 6") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 6");

                                                  stateSetter(() { color = 'col 6';
                                                  usercolor = colorText6;});
                                                },          child: Text(colorText6),
                                              ),
                                            ),
                                            color7==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 7") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 7");

                                                  stateSetter(() { color = 'col 7';
                                                  usercolor = colorText7;});
                                                },          child: Text(colorText7),
                                              ),
                                            ),
                                            color8==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 8") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 8");

                                                  stateSetter(() { color = 'col 8';
                                                  usercolor = colorText8;});
                                                },          child: Text(colorText8),
                                              ),
                                            ),
                                            color9==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 9") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 9");

                                                  stateSetter(() { color = 'col 9';
                                                  usercolor = colorText9;});
                                                },          child: Text(colorText9),
                                              ),
                                            ),
                                            color10==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 10") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 10");

                                                  stateSetter(() { color = 'col 10';
                                                  usercolor = colorText10;});
                                                },          child: Text(colorText10),
                                              ),
                                            ),

                                          ])
                                  ),
                                ),


                                usersize == "" || color == ""|| Custom == ""?Container():
                                FloatingActionButton.extended(
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                    if (currentUser.country == country) {
                    isUploading?    null
                        :  Proceedtobuy(
                    ship: shipcostusd, shipcostU: shipcostinr);
                    } else {
                    isUploading?null:  Proceedtobuy(ship: shipcostinterusd,
                    shipcostU: shipcostuser);
                    }
                    },
                    label:

                    Text(
                    'Buy Now', style: TextStyle(color: Colors.white),),
                    ),

                              ])

                      );
                  });
          }
      );
    }
    else if (gender == 'Baby-Boys'||gender == 'Baby-Girls') {
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            return
              StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter stateSetter){

                    return
                      Container(
                          height: 450,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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
                                Container(
                                  height:205.0,

                                  child:   Expanded(
                                      child:   ListView(
                                          scrollDirection:Axis.horizontal,
                                          shrinkWrap:true,
                                          children:[
                                            custom12==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom1img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom11inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom11usd',)):
                                                  currentUser.country == country?FittedBox(child: Text('+ ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 1") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 1");

                                                      stateSetter(() { Custom = 'Custom 1';
                                                      userCustom = custom1;
                                                      customprice = customprice1;
                                                      custompriceusd = custom11usd;
                                                      custompriceinr = custom11inr;});
                                                    },          child: Text(custom1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom22==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom2img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom21usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 2") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 2");

                                                      stateSetter(() { Custom = 'Custom 2';
                                                      userCustom = custom2;
                                                      customprice = customprice2;
                                                      custompriceusd = custom21usd;
                                                      custompriceinr = custom21inr;});
                                                    },          child: Text(custom2),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            custom32==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom3img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom31usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 3") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 3");

                                                      stateSetter(() { Custom = 'Custom 3';
                                                      userCustom = custom3;
                                                      customprice = customprice3;
                                                      custompriceusd = custom31usd;
                                                      custompriceinr = custom31inr;});
                                                    },          child: Text(custom3),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom42==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom4img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom41usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 4") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 4");

                                                      stateSetter(() { Custom = 'Custom 4';
                                                      userCustom = custom4;
                                                      customprice = customprice4;
                                                      custompriceusd = custom41usd;
                                                      custompriceinr = custom41inr;});
                                                    },          child: Text(custom4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom52==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom5img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom51usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 5") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 5");

                                                      stateSetter(() { Custom = 'Custom 5';
                                                      userCustom = custom5;
                                                      customprice = customprice5;
                                                      custompriceusd = custom51usd;
                                                      custompriceinr = custom51inr;});
                                                    },          child: Text(custom5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom62==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom6img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom61usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 6") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 6");

                                                      stateSetter(() { Custom = 'Custom 6';
                                                      userCustom = custom6;
                                                      customprice = customprice6;
                                                      custompriceusd = custom61usd;
                                                      custompriceinr = custom61inr;});
                                                    },          child: Text(custom6),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom72==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom7img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom71usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 7") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 7");

                                                      stateSetter(() { Custom = 'Custom 7';
                                                      userCustom = custom7;
                                                      customprice = customprice7;
                                                      custompriceusd = custom71usd;
                                                      custompriceinr = custom71inr;});
                                                    },          child: Text(custom7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom82==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom8img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom81usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 8") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 8");

                                                      stateSetter(() { Custom = 'Custom 8';
                                                      userCustom = custom8;
                                                      customprice = customprice8;
                                                      custompriceusd = custom81usd;
                                                      custompriceinr = custom81inr;});
                                                    },          child: Text(custom8),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom92==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom9img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom91usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 9") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 9");

                                                      stateSetter(() { Custom = 'Custom 9';
                                                      userCustom = custom9;
                                                      customprice = customprice9;
                                                      custompriceusd = custom91usd;
                                                      custompriceinr = custom91inr;});
                                                    },          child: Text(custom9),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom102==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom10img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom101usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),                                              ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 10") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 10");

                                                      stateSetter(() { Custom = 'Custom 10';
                                                      userCustom = custom10;
                                                      customprice = customprice10;
                                                      custompriceusd = custom101usd;
                                                      custompriceinr = custom101inr;});
                                                    },          child: Text(custom10),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ])
                                  ),
                                ),

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

                                                primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("MTO");
                                                MTO();
                                                // stateSetter(() {usersize = "Free Size";
                                                //size = 'Free size';
                                                //});
                                              },          child: Text('MTO'),
                                            ),
                                          ),

                                          freesize==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("Free Size");

                                                stateSetter(() {usersize = "Free Size";
                                                size = 'Free size';
                                                });
                                              },          child: Text('Free Size'),
                                            ),
                                          ),
                                          xxxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("0-3 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("0-3 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("0-3 M");

                                                stateSetter(() {usersize = "0-3 M";
                                                size = '0-3 M';

                                                });
                                              },          child: Text('0-3 M'),
                                            ),
                                          ),
                                          xxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("3-6 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("3-6 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("3-6 M");

                                                stateSetter(() {usersize = "3-6 M";
                                                size = '3-6 M';
                                                });
                                              },          child: Text('3-6 M'),
                                            ),
                                          ),
                                          xs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("6-9 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("6-9 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("6-9 M");

                                                stateSetter(() {usersize = "6-9 M";
                                                size = '6-9 M';
                                                });
                                              },          child: Text('6-9 M'),
                                            ),
                                          ),
                                          s==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("9-12 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("9-12 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("9-12 M");

                                                stateSetter(() {usersize = "9-12 M";
                                                size = '9-12 M';
                                                });
                                              },          child: Text('9-12 M'),
                                            ),
                                          ),
                                          m==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("12-18 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("12-18 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("12-18 M");

                                                stateSetter(() {usersize = "12-18 M";
                                                size = '12-18 M';
                                                });
                                              },          child: Text('12-18 M'),
                                            ),
                                          ),

                                          l==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("18-24 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("18-24 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("18-24 M");

                                                stateSetter(() {usersize = "18-24 M";
                                                size = '18-24 M';
                                                });
                                              },          child: Text('18-24 M'),
                                            ),
                                          ),

                                          Shoe1==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 0-3 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 0-3 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 0-3 M");

                                                stateSetter(() {usersize = "S 0-3 M";
                                                size = '0-3 M';
                                                });
                                              },          child: Text('S 0-3 M'),
                                            ),
                                          ),
                                          Shoe2==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 3-6 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 3-6 M") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 3-6 M");

                                                  stateSetter(() {usersize = "S 3-6 M";
                                                  size = '3-6 M';
                                                  });
                                                },          child: Text('S 3-6 M'),
                                              )),
                                          Shoe3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("6 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("6 M") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("6 M");

                                                  stateSetter(() {usersize = "6 M";
                                                  size = '6 M';
                                                  });
                                                },          child: Text('6 M'),
                                              )),
                                          Shoe4==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("9 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("9 M") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("9 M");

                                                  stateSetter(() {usersize = "9 M";
                                                  size = '9 M';
                                                  });
                                                },          child: Text('9 M'),
                                              )),
                                          Shoe5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 9-12 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 9-12 M") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 9-12 M");

                                                  stateSetter(() {usersize = "S 9-12 M";
                                                  size = '9-12 M';
                                                  });
                                                },          child: Text('S 9-12 M'),
                                              )),
                                          Shoe6==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 12-18 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 12-18 M") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 12-18 M");

                                                  stateSetter(() {usersize = "S 12-18 M";
                                                  size = '12-18 M';
                                                  });
                                                },          child: Text('S 12-18 M'),
                                              )),
                                          Shoe7==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 18-24 M") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 18-24 M") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 18-24 M");

                                                stateSetter(() {usersize = "S 18-24 M";
                                                size = '18-24 M';
                                                });
                                              },          child: Text('S 18-24 M'),
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

                                                  primary: selectedColor.contains("col 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 1") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 1");

                                                  stateSetter(() { color = 'col 1';
                                                  usercolor = colorText1;});
                                                },          child: Text(colorText1),
                                              ),
                                            ),
                                            color2==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 2") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 2");

                                                  stateSetter(() { color = 'col 2';
                                                  usercolor = colorText2;});
                                                },          child: Text(colorText2),
                                              ),
                                            ),
                                            color3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 3") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 3");

                                                  stateSetter(() { color = 'col 3';
                                                  usercolor = colorText3;});
                                                },          child: Text(colorText3),
                                              ),
                                            ),
                                            color4==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 4") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 4");

                                                  stateSetter(() { color = 'col 4';
                                                  usercolor = colorText4;});
                                                },          child: Text(colorText4),
                                              ),
                                            ),
                                            color5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 5") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 5");

                                                  stateSetter(() { color = 'col 5';
                                                  usercolor = colorText5;});
                                                },          child: Text(colorText5),
                                              ),
                                            ),
                                            color6==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 6") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 6");

                                                  stateSetter(() { color = 'col 6';
                                                  usercolor = colorText6;});
                                                },          child: Text(colorText6),
                                              ),
                                            ),
                                            color7==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 7") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 7");

                                                  stateSetter(() { color = 'col 7';
                                                  usercolor = colorText7;});
                                                },          child: Text(colorText7),
                                              ),
                                            ),
                                            color8==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 8") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 8");

                                                  stateSetter(() { color = 'col 8';
                                                  usercolor = colorText8;});
                                                },          child: Text(colorText8),
                                              ),
                                            ),
                                            color9==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 9") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 9");

                                                  stateSetter(() { color = 'col 9';
                                                  usercolor = colorText9;});
                                                },          child: Text(colorText9),
                                              ),
                                            ),
                                            color10==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 10") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 10");

                                                  stateSetter(() { color = 'col 10';
                                                  usercolor = colorText10;});
                                                },          child: Text(colorText10),
                                              ),
                                            ),

                                          ])
                                  ),
                                ),


                                usersize == "" || color == ""|| Custom == ""?Container():
                                FloatingActionButton.extended(
                                  backgroundColor: kPrimaryColor,
                                  onPressed: () {
                                    if (currentUser.country == country) {
                                      isUploading?    null
                                          :  Proceedtobuy(
                                          ship: shipcostusd, shipcostU: shipcostinr);
                                    } else {
                                      isUploading?null:  Proceedtobuy(ship: shipcostinterusd,
                                          shipcostU: shipcostuser);
                                    }
                                  },
                                  label:

                                  Text(
                                    'Buy Now', style: TextStyle(color: Colors.white),),
                                ),

                              ])

                      );
                  });
          }
      );
    }
    else if (gender == 'Kids-Boys'||gender == 'Kids-Girls') {
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            return
              StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter stateSetter){

                    return
                      Container(
                          height: 450,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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
                                Container(
                                  height:205.0,

                                  child:   Expanded(
                                      child:   ListView(
                                          scrollDirection:Axis.horizontal,
                                          shrinkWrap:true,
                                          children:[
                                            custom12==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom1img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom11inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom11usd',)):
                                                  currentUser.country == country?FittedBox(child: Text('+ ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 1") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 1");

                                                      stateSetter(() { Custom = 'Custom 1';
                                                      userCustom = custom1;
                                                      customprice = customprice1;
                                                      custompriceusd = custom11usd;
                                                      custompriceinr = custom11inr;});
                                                    },          child: Text(custom1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom22==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom2img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom21usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 2") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 2");

                                                      stateSetter(() { Custom = 'Custom 2';
                                                      userCustom = custom2;
                                                      customprice = customprice2;
                                                      custompriceusd = custom21usd;
                                                      custompriceinr = custom21inr;});
                                                    },          child: Text(custom2),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            custom32==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom3img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom31usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 3") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 3");

                                                      stateSetter(() { Custom = 'Custom 3';
                                                      userCustom = custom3;
                                                      customprice = customprice3;
                                                      custompriceusd = custom31usd;
                                                      custompriceinr = custom31inr;});
                                                    },          child: Text(custom3),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom42==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom4img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom41usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 4") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 4");

                                                      stateSetter(() { Custom = 'Custom 4';
                                                      userCustom = custom4;
                                                      customprice = customprice4;
                                                      custompriceusd = custom41usd;
                                                      custompriceinr = custom41inr;});
                                                    },          child: Text(custom4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom52==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom5img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom51usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 5") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 5");

                                                      stateSetter(() { Custom = 'Custom 5';
                                                      userCustom = custom5;
                                                      customprice = customprice5;
                                                      custompriceusd = custom51usd;
                                                      custompriceinr = custom51inr;});
                                                    },          child: Text(custom5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom62==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom6img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom61usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 6") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 6");

                                                      stateSetter(() { Custom = 'Custom 6';
                                                      userCustom = custom6;
                                                      customprice = customprice6;
                                                      custompriceusd = custom61usd;
                                                      custompriceinr = custom61inr;});
                                                    },          child: Text(custom6),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom72==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom7img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom71usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 7") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 7");

                                                      stateSetter(() { Custom = 'Custom 7';
                                                      userCustom = custom7;
                                                      customprice = customprice7;
                                                      custompriceusd = custom71usd;
                                                      custompriceinr = custom71inr;});
                                                    },          child: Text(custom7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom82==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom8img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom81usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 8") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 8");

                                                      stateSetter(() { Custom = 'Custom 8';
                                                      userCustom = custom8;
                                                      customprice = customprice8;
                                                      custompriceusd = custom81usd;
                                                      custompriceinr = custom81inr;});
                                                    },          child: Text(custom8),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom92==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom9img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom91usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 9") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 9");

                                                      stateSetter(() { Custom = 'Custom 9';
                                                      userCustom = custom9;
                                                      customprice = customprice9;
                                                      custompriceusd = custom91usd;
                                                      custompriceinr = custom91inr;});
                                                    },          child: Text(custom9),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom102==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom10img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom101usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),                                              ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 10") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 10");

                                                      stateSetter(() { Custom = 'Custom 10';
                                                      userCustom = custom10;
                                                      customprice = customprice10;
                                                      custompriceusd = custom101usd;
                                                      custompriceinr = custom101inr;});
                                                    },          child: Text(custom10),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ])
                                  ),
                                ),

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

                                                primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("MTO");
                                                MTO();
                                                // stateSetter(() {usersize = "Free Size";
                                                //size = 'Free size';
                                                //});
                                              },          child: Text('MTO'),
                                            ),
                                          ),

                                          freesize==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("Free Size");

                                                stateSetter(() {usersize = "Free Size";
                                                size = 'Free size';
                                                });
                                              },          child: Text('Free Size'),
                                            ),
                                          ),
                                          xxxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("2 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("2 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("2 Y");

                                                stateSetter(() {usersize = "2 Y";
                                                size = '2 Y';
                                                });
                                              },          child: Text('2 Y'),
                                            ),
                                          ),
                                          xxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("3-4 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("3-4 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("3-4 Y");

                                                stateSetter(() {usersize = "3-4 Y";
                                                size = '3-4 Y';
                                                });
                                              },          child: Text('3-4 Y'),
                                            ),
                                          ),
                                          xs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("4-5 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("4-5 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("4-5 Y");

                                                stateSetter(() {usersize = "4-5 Y";
                                                size = '4-5 Y';
                                                });
                                              },          child: Text('4-5 Y'),
                                            ),
                                          ),
                                          s==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("5-6 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("5-6 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("5-6 Y");

                                                stateSetter(() {usersize = "5-6 Y";
                                                size = '5-6 Y';
                                                });
                                              },          child: Text('5-6 Y'),
                                            ),
                                          ),
                                          m==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("6-7 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("6-7 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("6-7 Y");

                                                stateSetter(() {usersize = "6-7 Y";
                                                size = '6-7 Y';
                                                });
                                              },          child: Text('6-7 Y'),
                                            ),
                                          ),

                                          l==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("7-8 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("7-8 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("7-8 Y");

                                                stateSetter(() {usersize = "7-8 Y";
                                                size = '7-8 Y';
                                                });
                                              },          child: Text('7-8 Y'),
                                            ),
                                          ),
                                          xl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("8-9 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("8-9 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("8-9 Y");

                                                stateSetter(() {usersize = "8-9 Y";
                                                size = '8-9 Y';
                                                });
                                              },          child: Text('8-9 Y'),
                                            ),
                                          ),
                                          xxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("9-10 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("9-10 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("9-10 Y");

                                                stateSetter(() {usersize = "9-10 Y";
                                                size = '9-10 Y';
                                                });
                                              },          child: Text('9-10 Y'),
                                            ),
                                          ),
                                          xxxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("10-11 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("10-11 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("10-11 Y");

                                                stateSetter(() {usersize = "10-11 Y";
                                                size = '10-11 Y';
                                                });
                                              },          child: Text('10-11 Y'),
                                            ),
                                          ),
                                          fourxl==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("11-12 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("11-12 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("11-12 Y");

                                                stateSetter(() {usersize = "11-12 Y";
                                                size = '11-12 Y';
                                                });
                                              },          child: Text('11-12 Y'),
                                            ),
                                          ),

                                          Shoe1==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 2 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 2 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 2 Y");

                                                stateSetter(() {usersize = "S 2 Y";
                                                size = '2 Y';
                                                });
                                              },          child: Text('S 2 Y'),
                                            ),
                                          ),
                                          Shoe2==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 2 ½ Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 2 ½ Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 2 ½ Y");

                                                  stateSetter(() {usersize = "S 2 ½ Y";
                                                  size = '2 ½ Y';
                                                  });
                                                },          child: Text('S 2 ½ Y'),
                                              )),
                                          Shoe3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 3 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 3 Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 3 Y");

                                                  stateSetter(() {usersize = "S 3 Y";
                                                  size = '3 Y';
                                                  });
                                                },          child: Text('S 3 Y'),
                                              )),
                                          Shoe4==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 3 ½ Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 3 ½ Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 3 ½ Y");

                                                  stateSetter(() {usersize = "S 3 ½ Y";
                                                  size = '3 ½ Y';
                                                  });
                                                },          child: Text('S 3 ½ Y'),
                                              )),
                                          Shoe5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 4 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 4 Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 4 Y");

                                                  stateSetter(() {usersize = "S 4 Y";
                                                  size = '4 Y';
                                                  });
                                                },          child: Text('S 4 Y'),
                                              )),

                                          Shoe6==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 5 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 5 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 5 Y");

                                                stateSetter(() {usersize = "S 5 Y";
                                                size = '5 Y';
                                                });
                                              },          child: Text('S 5 Y'),
                                            ),
                                          ),
                                          Shoe7==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 6 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 6 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 6 Y");

                                                stateSetter(() {usersize = "S 6 Y";
                                                size = '6 Y';
                                                });
                                              },          child: Text('S 6 Y'),
                                            ),
                                          ),
                                          Shoe8==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 7 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 7 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 7 Y");

                                                stateSetter(() {usersize = "S 7 Y";
                                                size = '7 Y';
                                                });
                                              },          child: Text('S 7 Y'),
                                            ),
                                          ),
                                          Shoe9==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 8 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 8 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 8 Y");

                                                stateSetter(() {usersize = "S 8 Y";
                                                size = '8 Y';
                                                });
                                              },          child: Text('S 8 Y'),
                                            ),
                                          ),

                                          Shoe10==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 9 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 9 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 9 Y");

                                                stateSetter(() {usersize = "S 9 Y";
                                                size = '9 Y';
                                                });
                                              },          child: Text('S 9 Y'),
                                            ),
                                          ),
                                          Shoe11==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 10 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 10 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 10 Y");

                                                stateSetter(() {usersize = "S 10 Y";
                                                size = '10 Y';
                                                });
                                              },          child: Text('S 10 Y'),
                                            ),
                                          ),
                                          Shoe12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 11 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 11 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 11 Y");

                                                stateSetter(() {usersize = "S 11 Y";
                                                size = '11 Y';
                                                });
                                              },          child: Text('S 11 Y'),
                                            ),
                                          ),
                                          Shoe13==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 12 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 12 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 12 Y");

                                                stateSetter(() {usersize = "S 12 Y";
                                                size = '12 Y';
                                                });
                                              },          child: Text('S 12 Y'),
                                            ),
                                          ),
                                          Shoe14==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(



                                              style: ElevatedButton.styleFrom(



                                                primary: selectedCategory.contains("S 13 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background

                                                onPrimary:selectedCategory.contains("S 13 Y") ? Colors.white:  Colors.black, // foreground

                                              ),

                                              onPressed: () {

                                                selectedCategory =  <String>[];

                                                selectedCategory.add("S 13 Y");



                                                stateSetter(() {usersize = "S 13 Y";
                                                size = '13 Y';
                                                });

                                              },          child: Text('S 13 Y'),

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

                                                  primary: selectedColor.contains("col 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 1") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 1");

                                                  stateSetter(() { color = 'col 1';
                                                  usercolor = colorText1;});
                                                },          child: Text(colorText1),
                                              ),
                                            ),
                                            color2==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 2") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 2");

                                                  stateSetter(() { color = 'col 2';
                                                  usercolor = colorText2;});
                                                },          child: Text(colorText2),
                                              ),
                                            ),
                                            color3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 3") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 3");

                                                  stateSetter(() { color = 'col 3';
                                                  usercolor = colorText3;});
                                                },          child: Text(colorText3),
                                              ),
                                            ),
                                            color4==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 4") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 4");

                                                  stateSetter(() { color = 'col 4';
                                                  usercolor = colorText4;});
                                                },          child: Text(colorText4),
                                              ),
                                            ),
                                            color5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 5") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 5");

                                                  stateSetter(() { color = 'col 5';
                                                  usercolor = colorText5;});
                                                },          child: Text(colorText5),
                                              ),
                                            ),
                                            color6==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 6") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 6");

                                                  stateSetter(() { color = 'col 6';
                                                  usercolor = colorText6;});
                                                },          child: Text(colorText6),
                                              ),
                                            ),
                                            color7==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 7") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 7");

                                                  stateSetter(() { color = 'col 7';
                                                  usercolor = colorText7;});
                                                },          child: Text(colorText7),
                                              ),
                                            ),
                                            color8==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 8") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 8");

                                                  stateSetter(() { color = 'col 8';
                                                  usercolor = colorText8;});
                                                },          child: Text(colorText8),
                                              ),
                                            ),
                                            color9==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 9") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 9");

                                                  stateSetter(() { color = 'col 9';
                                                  usercolor = colorText9;});
                                                },          child: Text(colorText9),
                                              ),
                                            ),
                                            color10==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 10") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 10");

                                                  stateSetter(() { color = 'col 10';
                                                  usercolor = colorText10;});
                                                },          child: Text(colorText10),
                                              ),
                                            ),

                                          ])
                                  ),
                                ),


                                usersize == "" || color == ""|| Custom == ""?Container():
                                FloatingActionButton.extended(
                                  backgroundColor: kPrimaryColor,
                                  onPressed: () {
                                    if (currentUser.country == country) {
                                      isUploading?    null
                                          :  Proceedtobuy(
                                          ship: shipcostusd, shipcostU: shipcostinr);
                                    } else {
                                      isUploading?null:  Proceedtobuy(ship: shipcostinterusd,
                                          shipcostU: shipcostuser);
                                    }
                                  },
                                  label:

                                  Text(
                                    'Buy Now', style: TextStyle(color: Colors.white),),
                                ),
                              ])

                      );
                  });
          }
      );
    }
    else if (gender == 'Teen-Boys'||gender == 'Teen-Girls') {

      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            return
              StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter stateSetter){

                    return
                      Container(
                          height: 450,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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
                                Container(
                                  height:205.0,

                                  child:   Expanded(
                                      child:   ListView(
                                          scrollDirection:Axis.horizontal,
                                          shrinkWrap:true,
                                          children:[
                                            custom12==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom1img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom11inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom11usd',)):
                                                  currentUser.country == country?FittedBox(child: Text('+ ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 1") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 1");

                                                      stateSetter(() { Custom = 'Custom 1';
                                                      userCustom = custom1;
                                                      customprice = customprice1;
                                                      custompriceusd = custom11usd;
                                                      custompriceinr = custom11inr;});
                                                    },          child: Text(custom1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom22==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom2img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom21usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 2") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 2");

                                                      stateSetter(() { Custom = 'Custom 2';
                                                      userCustom = custom2;
                                                      customprice = customprice2;
                                                      custompriceusd = custom21usd;
                                                      custompriceinr = custom21inr;});
                                                    },          child: Text(custom2),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            custom32==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom3img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom31usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 3") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 3");

                                                      stateSetter(() { Custom = 'Custom 3';
                                                      userCustom = custom3;
                                                      customprice = customprice3;
                                                      custompriceusd = custom31usd;
                                                      custompriceinr = custom31inr;});
                                                    },          child: Text(custom3),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom42==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom4img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom41usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 4") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 4");

                                                      stateSetter(() { Custom = 'Custom 4';
                                                      userCustom = custom4;
                                                      customprice = customprice4;
                                                      custompriceusd = custom41usd;
                                                      custompriceinr = custom41inr;});
                                                    },          child: Text(custom4),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom52==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom5img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom51usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 5") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 5");

                                                      stateSetter(() { Custom = 'Custom 5';
                                                      userCustom = custom5;
                                                      customprice = customprice5;
                                                      custompriceusd = custom51usd;
                                                      custompriceinr = custom51inr;});
                                                    },          child: Text(custom5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom62==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom6img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom61usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 6") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 6");

                                                      stateSetter(() { Custom = 'Custom 6';
                                                      userCustom = custom6;
                                                      customprice = customprice6;
                                                      custompriceusd = custom61usd;
                                                      custompriceinr = custom61inr;});
                                                    },          child: Text(custom6),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom72==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom7img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom71usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 7") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 7");

                                                      stateSetter(() { Custom = 'Custom 7';
                                                      userCustom = custom7;
                                                      customprice = customprice7;
                                                      custompriceusd = custom71usd;
                                                      custompriceinr = custom71inr;});
                                                    },          child: Text(custom7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom82==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom8img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom81usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 8") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 8");

                                                      stateSetter(() { Custom = 'Custom 8';
                                                      userCustom = custom8;
                                                      customprice = customprice8;
                                                      custompriceusd = custom81usd;
                                                      custompriceinr = custom81inr;});
                                                    },          child: Text(custom8),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom92==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom9img)),
                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom91usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),
                                                  ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 9") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 9");

                                                      stateSetter(() { Custom = 'Custom 9';
                                                      userCustom = custom9;
                                                      customprice = customprice9;
                                                      custompriceusd = custom91usd;
                                                      custompriceinr = custom91inr;});
                                                    },          child: Text(custom9),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            custom102==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height:120.0,
                                                      width:120.0,
                                                      child: CachedImage(custom10img)),

                                                  currentUser.country == "India"?  FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr',)):
                                                  currentUser.country == "United States"?  FittedBox(child: Text(' + \u0024 $custom101usd',)):
                                                  currentUser.country == country?FittedBox(child: Text(' + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                                  FittedBox(child: Text(' + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),                                              ElevatedButton(

                                                    style: ElevatedButton.styleFrom(

                                                      primary: selectedCustom.contains("Custom 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                      onPrimary:selectedCustom.contains("Custom 10") ? Colors.white:  Colors.black, // foreground
                                                    ),
                                                    onPressed: () {
                                                      selectedCustom =  <String>[];
                                                      selectedCustom.add("Custom 10");

                                                      stateSetter(() { Custom = 'Custom 10';
                                                      userCustom = custom10;
                                                      customprice = customprice10;
                                                      custompriceusd = custom101usd;
                                                      custompriceinr = custom101inr;});
                                                    },          child: Text(custom10),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ])
                                  ),
                                ),

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

                                                primary: selectedCategory.contains("MTO") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("MTO") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("MTO");
                                                MTO();
                                                // stateSetter(() {usersize = "Free Size";
                                                //size = 'Free size';
                                                //});
                                              },          child: Text('MTO'),
                                            ),
                                          ),

                                          freesize==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("Free Size") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("Free Size") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("Free Size");

                                                stateSetter(() {usersize = "Free Size";
                                                size = 'Free size';
                                                });
                                              },          child: Text('Free Size'),
                                            ),
                                          ),
                                          xxxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("13 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("13 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("13 Y");

                                                stateSetter(() {usersize = "13 Y";
                                                size = '13 Y';
                                                });
                                              },          child: Text('13 Y'),
                                            ),
                                          ),
                                          xxs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("14 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("14 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("14 Y");

                                                stateSetter(() {usersize = "14 Y";
                                                size = '14 Y';
                                                });
                                              },          child: Text('14 Y'),
                                            ),
                                          ),
                                          xs==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("15 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("15 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("15 Y");

                                                stateSetter(() {usersize = "15 Y";
                                                size = '15 Y';
                                                });
                                              },          child: Text('15 Y'),
                                            ),
                                          ),
                                          s==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("16 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("16 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("16 Y");

                                                stateSetter(() {usersize = "16 Y";
                                                size = '16 Y';
                                                });
                                              },          child: Text('16 Y'),
                                            ),
                                          ),
                                          Shoe1==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("S 13 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("S 13 Y") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("S 13 Y");

                                                stateSetter(() {usersize = "S 13 Y";
                                                size = '13 Y';
                                                });
                                              },          child: Text('S 13 Y'),
                                            ),
                                          ),
                                          Shoe2==0?Container():  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:   ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 14 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 14 Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 14 Y");

                                                  stateSetter(() {usersize = "S 14 Y";
                                                  size = '14 Y';
                                                  });
                                                },          child: Text('S 14 Y'),
                                              )),
                                          Shoe3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("15 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("15 Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("15 Y");

                                                  stateSetter(() {usersize = "15 Y";
                                                  size = '15 Y';
                                                  });
                                                },          child: Text('15 Y'),
                                              )),
                                          Shoe4==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedCategory.contains("S 16 Y") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedCategory.contains("S 16 Y") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedCategory =  <String>[];
                                                  selectedCategory.add("S 16 Y");

                                                  stateSetter(() {usersize = "S 16 Y";
                                                  size = '16 Y';
                                                  });
                                                },          child: Text('S 16 Y'),
                                              )),

                                          Ring1==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 4") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 4");

                                                stateSetter(() {usersize = "R 4";
                                                size = '(US) 4';
                                                });
                                              },          child: Text('(US) 4'),
                                            ),
                                          ),
                                          Ring2==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 4.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 4.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 4.5");

                                                stateSetter(() {usersize = "R 4.5";
                                                size = '(US) 4.5';
                                                });
                                              },          child: Text('(US) 4.5'),
                                            ),
                                          ),

                                          Ring3==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 5");

                                                stateSetter(() {usersize = "R 5";
                                                size = '(US) 5';
                                                });
                                              },          child: Text('(US) 5'),
                                            ),
                                          ),
                                          Ring4==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 5.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 5.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 5.5");

                                                stateSetter(() {usersize = "R 5.5";
                                                size = '(US) 5.5';
                                                });
                                              },          child: Text('(US) 5.5'),
                                            ),
                                          ),
                                          Ring5==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 6") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 6");

                                                stateSetter(() {usersize = "R 6";
                                                size = '(US) 6';
                                                });
                                              },          child: Text('(US) 6'),
                                            ),
                                          ),
                                          Ring6==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 6.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 6.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 6.5");

                                                stateSetter(() {usersize = "R 6.5";
                                                size = '(US) 6.5';
                                                });
                                              },          child: Text('(US) 6.5'),
                                            ),
                                          ),
                                          Ring7==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 7") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 7");

                                                stateSetter(() {usersize = "R 7";
                                                size = '(US) 7';
                                                });
                                              },          child: Text('(US) 7'),
                                            ),
                                          ),
                                          Ring8==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 7.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 7.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 7.5");

                                                stateSetter(() {usersize = "R 7.5";
                                                size = '(US) 7.5';
                                                });
                                              },          child: Text('(US) 7.5'),
                                            ),
                                          ),
                                          Ring9==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 8");

                                                stateSetter(() {usersize = "R 8";
                                                size = '(US) 8';
                                                });
                                              },          child: Text('(US) 8'),
                                            ),
                                          ),
                                          Ring10==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 8.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 8.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 8.5");

                                                stateSetter(() {usersize = "R 8.5";
                                                size = '(US) 8.5';
                                                });
                                              },          child: Text('(US) 8.5'),
                                            ),
                                          ),
                                          Ring11==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 9");

                                                stateSetter(() {usersize = "R 9";
                                                size = '(US) 9';
                                                });
                                              },          child: Text('(US) 9'),
                                            ),
                                          ),
                                          Ring12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 9.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 9.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 9.5");

                                                stateSetter(() {usersize = "R 9.5";
                                                size = '(US) 9.5';
                                                });
                                              },          child: Text('(US) 9.5'),
                                            ),
                                          ),
                                          Ring13==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 10");

                                                stateSetter(() {usersize = "R 10";
                                                size = '(US) 10';
                                                });
                                              },          child: Text('(US) 10'),
                                            ),
                                          ),
                                          Ring14==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 10.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 10.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 10.5");

                                                stateSetter(() {usersize = "R 10.5";
                                                size = '(US) 10.5';
                                                });
                                              },          child: Text('(US) 10.5'),
                                            ),
                                          ),
                                          Ring15==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 11") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 11") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 11");

                                                stateSetter(() {usersize = "R 11";
                                                size = '(US) 11';
                                                });
                                              },          child: Text('(US) 11'),
                                            ),
                                          ),
                                          Ring16==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 11.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 11.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 11.5");

                                                stateSetter(() {usersize = "R 11.5";
                                                size = '(US) 11.5';
                                                });
                                              },          child: Text('(US) 11.5'),
                                            ),
                                          ),
                                          Ring17==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 12") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 12") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 12");

                                                stateSetter(() {usersize = "R 12";
                                                size = '(US) 12';
                                                });
                                              },          child: Text('(US) 12'),
                                            ),
                                          ),
                                          Ring18==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 12.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 12.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 12.5");

                                                stateSetter(() {usersize = "R 12.5";
                                                size = '(US) 12.5';
                                                });
                                              },          child: Text('(US) 12.5'),
                                            ),
                                          ),
                                          Ring19==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 13") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 13") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 13");

                                                stateSetter(() {usersize = "R 13";
                                                size = '(US) 13';
                                                });
                                              },          child: Text('(US) 13'),
                                            ),
                                          ),
                                          Ring20==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 13.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 13.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 13.5");

                                                stateSetter(() {
                                                  size = '(US) 13.5';
                                                usersize = "R 13.5";});
                                              },          child: Text('(US) 13.5'),
                                            ),
                                          ),
                                          Ring21==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 14") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 14") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 14");

                                                stateSetter(() {usersize = "R 14";
                                                size = '(US) 14';
                                                });
                                              },          child: Text('(US) 14'),
                                            ),
                                          ),
                                          Ring22==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 14.5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 14.5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 14.5");

                                                stateSetter(() {usersize = "R 14.5";
                                                size = '(US) 14.5';
                                                });
                                              },          child: Text('(US) 14.5'),
                                            ),
                                          ),
                                          Ring23==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("R 15") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("R 15") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("R 15");

                                                stateSetter(() {usersize = "R 15";
                                                size = '(US) 15';

                                                });
                                              },          child: Text('(US) 15'),
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

                                                  primary: selectedColor.contains("col 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 1") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 1");

                                                  stateSetter(() { color = 'col 1';
                                                  usercolor = colorText1;});
                                                },          child: Text(colorText1),
                                              ),
                                            ),
                                            color2==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 2") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 2");

                                                  stateSetter(() { color = 'col 2';
                                                  usercolor = colorText2;});
                                                },          child: Text(colorText2),
                                              ),
                                            ),
                                            color3==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 3") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 3");

                                                  stateSetter(() { color = 'col 3';
                                                  usercolor = colorText3;});
                                                },          child: Text(colorText3),
                                              ),
                                            ),
                                            color4==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 4") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 4");

                                                  stateSetter(() { color = 'col 4';
                                                  usercolor = colorText4;});
                                                },          child: Text(colorText4),
                                              ),
                                            ),
                                            color5==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 5") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 5");

                                                  stateSetter(() { color = 'col 5';
                                                  usercolor = colorText5;});
                                                },          child: Text(colorText5),
                                              ),
                                            ),
                                            color6==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 6") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 6");

                                                  stateSetter(() { color = 'col 6';
                                                  usercolor = colorText6;});
                                                },          child: Text(colorText6),
                                              ),
                                            ),
                                            color7==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 7") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 7");

                                                  stateSetter(() { color = 'col 7';
                                                  usercolor = colorText7;});
                                                },          child: Text(colorText7),
                                              ),
                                            ),
                                            color8==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 8") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 8");

                                                  stateSetter(() { color = 'col 8';
                                                  usercolor = colorText8;});
                                                },          child: Text(colorText8),
                                              ),
                                            ),
                                            color9==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 9") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 9");

                                                  stateSetter(() { color = 'col 9';
                                                  usercolor = colorText9;});
                                                },          child: Text(colorText9),
                                              ),
                                            ),
                                            color10==0?Container():   Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(

                                                style: ElevatedButton.styleFrom(

                                                  primary: selectedColor.contains("col 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                  onPrimary:selectedColor.contains("col 10") ? Colors.white:  Colors.black, // foreground
                                                ),
                                                onPressed: () {
                                                  selectedColor =  <String>[];
                                                  selectedColor.add("col 10");

                                                  stateSetter(() { color = 'col 10';
                                                  usercolor = colorText10;});
                                                },          child: Text(colorText10),
                                              ),
                                            ),

                                          ])
                                  ),
                                ),


                                usersize == "" || color == ""|| Custom == ""?Container():
                                FloatingActionButton.extended(
                                  backgroundColor: kPrimaryColor,
                                  onPressed: () {
                                    if (currentUser.country == country) {
                                      isUploading?    null
                                          :  Proceedtobuy(
                                          ship: shipcostusd, shipcostU: shipcostinr);
                                    } else {
                                      isUploading?null:  Proceedtobuy(ship: shipcostinterusd,
                                          shipcostU: shipcostuser);
                                    }
                                  },
                                  label:

                                  Text(
                                    'Buy Now', style: TextStyle(color: Colors.white),),
                                ),
                              ])

                      );
                  });
          }
      );
    }


  }
  Widget sizeGuide(){

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

  reviews() {
    return
    showModalBottomSheet(
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (BuildContext context) {

          return  PaginateFirestore(
isLive: true,
              emptyDisplay: Center(child: Text("Nothing reviews",style: TextStyle(
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

  return Container(
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
                        onPressed:() { Navigator.pop(context);},
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

                                      return

                                        GestureDetector(
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ProductScreen(
                                                  prodId: prodId,
                                                  userId: ownerId,
                                                ),
                                              ),
                                            ),
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
                                                    currentUser.currency == "USD"?Text("\u0024 ${currencyFormatter.format(usd)}",):
                                                    currentUser.currency == "INR"?Text("₹ ${currencyFormatter.format(inr)}",):
                                                    currentUser.currency == "EUR"?Text("€ ${currencyFormatter.format(eur)}",):
                                                    currentUser.currency == "GBP"?Text("£ ${currencyFormatter.format(gbp)}",):Text("\u0024 ${currencyFormatter.format(usd)}",),


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
            onTap: () => showProfile(context, profileId: ownerId),
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
                          Text("₹ ${currencyFormatter.format(inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${currencyFormatter.format(eur)}  €",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("£ ${currencyFormatter.format(gbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("\u0024 ${currencyFormatter.format(usd)}",
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
                          Text("₹ ${currencyFormatter.format(shipcostinr)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${currencyFormatter.format(shipcosteur)}  €",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("£ ${currencyFormatter.format(shipcostgbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("\u0024 ${currencyFormatter.format(shipcostusd)}",
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
                          Text("₹ ${currencyFormatter.format(inr)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${currencyFormatter.format(eur)}  €",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("£ ${currencyFormatter.format(gbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("\u0024 ${currencyFormatter.format(usd)}",
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
                          Text("₹ ${currencyFormatter.format(shipcostinterinr)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "EUR"?Row(
                        children: [
                          Text("${currencyFormatter.format(shipcostintereur)}  €",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):
                      currentUser.currency == "GBP"?Row(
                        children: [
                          Text("£ ${currencyFormatter.format(shipcostintergbp)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                        ],
                      ):Row(
                        children: [
                          Text("\u0024 ${currencyFormatter.format(shipcostinterusd)}",
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
                      Text("$details", maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
                        color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                      ),),SizedBox(height: 8,),
                      Text("Color:",style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                      Text('$color',style: TextStyle(
                        color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                      ),),
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


