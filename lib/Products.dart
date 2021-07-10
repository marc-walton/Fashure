import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:fashow/model/addressbuynow.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
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

List <Widget>listOfImages = <Widget>[];

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
            return new ListView.builder(
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
                      child: CachedNetworkImage(imageUrl:snapshot
                          .data.docs[index].data()['shopmediaUrl'][i]),
                    ));
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10.0),

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          CarouselSlider(

                                items: listOfImages,
                              options: CarouselOptions(

                                pauseAutoPlayOnManualNavigate: true,
                                pauseAutoPlayOnTouch: true,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
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
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );

        });

}

class Prod extends StatefulWidget {
  final String prodId;
  final String ownerId;
  final String username;
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
final String gender;
final String country;

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
  final String custom1;
  final String custom2;
  final String custom3;
  final String custom4;
  final String custom5;
  final String custom6;
  final String custom7;
  final String  custom8;
  final String custom9;
  final String custom10;
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
  final String custom11eur;
  final String custom11usd;
  final String custom11inr;
  final String custom11gbp;
  final String custom21eur;
  final String custom21usd;
  final String custom21inr;
  final String custom21gbp;
    final String custom31eur;
  final String custom31usd;
  final String custom31inr;
  final String custom31gbp;
    final String custom41eur;
  final String custom41usd;
  final String custom41inr;
  final String custom41gbp;
      final String custom51eur;
  final String custom51usd;
  final String custom51inr;
  final String custom51gbp;
      final String custom61eur;
  final String custom61usd;
  final String custom61inr;
  final String custom61gbp;
       final String custom71eur;
  final String custom71usd;
  final String custom71inr;
  final String custom71gbp;
       final String custom81eur;
  final String custom81usd;
  final String custom81inr;
  final String custom81gbp;
        final String custom91eur;
  final String custom91usd;
  final String custom91inr;
  final String custom91gbp;
        final String custom101eur;
  final String custom101usd;
  final String custom101inr;
  final String custom101gbp;
  final String shipcostusd;
  final String shipcostinterusd;
   final String shipcostinr;
  final String shipcostinterinr;

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
this.country,

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
    this.custom1,
    this.custom2,
    this.custom3,
    this.custom4,
    this.custom5,
    this.custom6,
    this.custom7,
    this.custom8,
    this.custom9,
    this.custom10,
    this.custom12,
    this.custom22,
    this.custom32,
    this.custom42,
    this.custom52,
    this.custom62,
    this.custom72,
    this.custom82,
    this.custom92,
    this.custom102,
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
      custom1: doc.data()['custom1'],
      custom2: doc.data()['custom2'],
      custom3: doc.data()['custom3'],
      custom4: doc.data()['custom4'],
      custom5: doc.data()['custom5'],
      custom6: doc.data()['custom6'],
      custom7: doc.data()['custom7'],
      custom8: doc.data()['custom8'],
      custom9: doc.data()['custom9'],
      custom10: doc.data()['custom10'],
      custom12: doc.data()['custom12'],
      custom22: doc.data()['custom22'],
      custom32: doc.data()['custom32'],
      custom42: doc.data()['custom42'],
      custom52: doc.data()['custom52'],
      custom62: doc.data()['custom62'],
      custom72: doc.data()['custom72'],
      custom82: doc.data()['custom82'],
      custom92: doc.data()['custom92'],
      custom102: doc.data()['custom102'],
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
    custom1:this.custom1,
    custom2:this.custom2,
    custom3:this.custom3,
    custom4:this.custom4,
    custom5:this.custom5,
    custom6:this.custom6,
    custom7:this.custom7,
    custom8:this.custom8,
    custom9:this.custom9,
    custom10:this.custom10,
    custom12:this.custom12,
    custom22:this.custom22,
    custom32:this.custom32,
    custom42:this.custom42,
    custom52:this.custom52,
    custom62:this.custom62,
    custom72:this.custom72,
    custom82:this.custom82,
    custom92:this.custom92,
    custom102:this.custom102,
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

    likeCount: getLikeCount(this.likes),
  );
}

class _ProdState extends State<Prod> {
  String usersize = "";
  String usercolor = "";
String currencysymbol;
  final String currentUserId = currentUser?.id;
  final String prodId;
  final String ownerId;
  final String username;
  final String eur;
  String usd;
  final String inr;
  final String cny;
  final String gbp;
   final String gender;
 final String shipment;
  final String country;

final bool worldship;
final bool freeworldship;
final bool freeship;
String price;
String custompriceinr = "";
String custompriceusd = "";

String customprice = "";
String customprice1;
String customprice2;
String customprice3;
String customprice4;
String customprice5;
String customprice6;
String customprice7;
String customprice8;
String customprice9;
String customprice10;

  final String productname;
  final String details;
   String color = "";
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
  final String custom1;
  final String custom2;
  final String custom3;
  final String custom4;
  final String custom5;
  final String custom6;
  final String custom7;
  final String  custom8;
  final String custom9;
   final String custom10;
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
  final String custom11eur;
  String custom11usd;
  final String custom11inr;
  final String custom11gbp;
  final String custom21eur;
  String custom21usd;
  final String custom21inr;
  final String custom21gbp;
  final String custom31eur;
  String custom31usd;
  final String custom31inr;
  final String custom31gbp;
  final String custom41eur;
  String custom41usd;
  final String custom41inr;
  final String custom41gbp;
  final String custom51eur;
  String custom51usd;
  final String custom51inr;
  final String custom51gbp;
  final String custom61eur;
  String custom61usd;
  final String custom61inr;
  final String custom61gbp;
  final String custom71eur;
   String custom71usd;
  final String custom71inr;
  final String custom71gbp;
  final String custom81eur;
   String custom81usd;
  final String custom81inr;
  final String custom81gbp;
  final String custom91eur;
   String custom91usd;
  final String custom91inr;
  final String custom91gbp;
  final String custom101eur;
   String custom101usd;
  final String custom101inr;
  final String custom101gbp;
  final String shipcostusd;
  final String shipcostinterusd;
  final String shipcostinterinr;
  final String shipcostinr;
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
String shipcostuser;
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
  TextEditingController mtoController = TextEditingController();

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
this.country,
this.currency,

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
    this.custom1,
    this.custom2,
    this.custom3,
    this.custom4,
    this.custom5,
    this.custom6,
    this.custom7,
    this.custom8,
    this.custom9,
    this.custom10,
    this.custom12,
    this.custom22,
    this.custom32,
    this.custom42,
    this.custom52,
    this.custom62,
    this.custom72,
    this.custom82,
    this.custom92,
    this.custom102,
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


  void initState() {

    super.initState();
    Views();
    conversion();

  }
conversion()async{
  var resultUSD = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: usd);
    var resultUSD11 = await Currency.getConversion(
        from: 'USD', to: '${currentUser.currencyISO}', amount: shipcostinterusd );
var s;
var u;
setState(() {


  e = resultUSD.rate;
  price =e.toStringAsFixed(2);

  s = resultUSD11.rate;
  shipcostuser =s.toStringAsFixed(2);
  u = double.tryParse(usd);
  u = u.toStringAsFixed(2);
  usd = u.toString();
});
    var resultUSD1 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom11usd  );
  var resultUSD2 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom21usd  );
  var resultUSD3 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom31usd  );
  var resultUSD4 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom41usd  );
  var resultUSD5 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom51usd  );
  var resultUSD6 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom61usd  );
  var resultUSD7 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom71usd  );
  var resultUSD8 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom81usd  );
  var resultUSD9 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom91usd  );
  var resultUSD10 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: custom101usd  );

  var c1;
 var c2;
 var c3;
 var c4;
 var c5;
 var c6;
 var c7;
 var c8;
 var c9;
 var c10;
var custom1usd;
var custom2usd;
var custom3usd;
var custom4usd;
var custom5usd;
var custom6usd;
var custom7usd;
var custom8usd;
var custom9usd;
var custom10usd;

  setState(() {

    custom1usd = double.tryParse(custom11usd);
    custom1usd = custom1usd.toStringAsFixed(2);
     custom11usd = custom1usd.toString();
       custom2usd = double.tryParse(custom21usd);
    custom2usd = custom2usd.toStringAsFixed(2);
     custom21usd = custom2usd.toString();
       custom3usd = double.tryParse(custom31usd);
    custom3usd = custom3usd.toStringAsFixed(2);
     custom31usd = custom3usd.toString();
       custom4usd = double.tryParse(custom41usd);
    custom4usd = custom4usd.toStringAsFixed(2);
     custom41usd = custom4usd.toString();
       custom5usd = double.tryParse(custom51usd);
    custom5usd = custom5usd.toStringAsFixed(2);
     custom51usd = custom5usd.toString();
       custom6usd = double.tryParse(custom61usd);
    custom6usd = custom6usd.toStringAsFixed(2);
     custom61usd = custom6usd.toString();
       custom7usd = double.tryParse(custom71usd);
    custom7usd = custom7usd.toStringAsFixed(2);
     custom71usd = custom7usd.toString();
       custom8usd = double.tryParse(custom81usd);
    custom8usd = custom8usd.toStringAsFixed(2);
     custom81usd = custom8usd.toString();
       custom9usd = double.tryParse(custom91usd);
    custom9usd = custom9usd.toStringAsFixed(2);
     custom91usd = custom9usd.toString();
       custom10usd = double.tryParse(custom101usd);
    custom10usd = custom10usd.toStringAsFixed(2);
     custom101usd = custom10usd.toString();


    c1 = resultUSD1.rate;
    customprice1 =c1.toStringAsFixed(2);
    print(resultUSD1.rate);
    print(customprice1);

   c2 = resultUSD2.rate;
    customprice2 =c2.toStringAsFixed(2);
   c3 = resultUSD3.rate;
    customprice3 =c3.toStringAsFixed(2);
   c4 = resultUSD4.rate;
    customprice4 = c4.toStringAsFixed(2);
   c5 = resultUSD5.rate;
    customprice5 =c5.toStringAsFixed(2);
   c6 = resultUSD6.rate;
    customprice6 =c6.toStringAsFixed(2);
   c7 = resultUSD7.rate;
    customprice7 =c7.toStringAsFixed(2);
   c8 = resultUSD8.rate;
    customprice8 =c8.toStringAsFixed(2);
   c9 = resultUSD9.rate;
    customprice9 =c9.toStringAsFixed(2);
   c10 = resultUSD10.rate;
    customprice10 =c10.toStringAsFixed(2);

    isUploading = false;
  });
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
String ship,
String shipcostU,

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

      price:price,
          customprice:customprice,
country:country,
color:color,
colorText:usercolor,
mtoText:mtoController.text ,

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

    if (gender == 'Men') {
return
        showModalBottomSheet(
            context: parentContext,
            builder: (BuildContext context) {
              return
               StatefulBuilder(
                   builder: (BuildContext ctx, StateSetter stateSetter){

                 return
                Container(
                    height: 200,

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
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

 custom12==0?Container():   Padding(
   padding: const EdgeInsets.all(8.0),
   child: ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 1") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 1");

                stateSetter(() { usersize = 'C 1';
                custom = true;
                size = custom1;
                customprice = customprice1;
                custompriceusd = custom11usd;
                custompriceinr = custom11inr;});
              },          child:
   currentUser.country == "India"?  FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr',)):
   currentUser.country == "United States"?  FittedBox(child: Text('$custom1 + \u0024 $custom11usd',)):
   currentUser.country == country?FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

   FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),

   ),
 ),
custom22==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 2") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 2");

                stateSetter(() { usersize = 'C 2';
                custom = true;
                size = custom2;
                customprice = customprice2;
                custompriceusd = custom21usd;
                custompriceinr = custom21inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom2 + \u0024 $custom21usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

  FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),

   ),
),
custom32==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 3") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 3");

                stateSetter(() { usersize = 'C 3';
                custom = true;
                size = custom3;
                customprice = customprice3;
                custompriceusd = custom31usd;
                custompriceinr = custom31inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom3 + \u0024 $custom31usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

  FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),

   ),
),
custom42==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 4") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 4");

                stateSetter(() { usersize = 'C 4';
                custom = true;
                size = custom4;
                customprice = customprice4;
                custompriceusd = custom41usd;
                custompriceinr = custom41inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom4 + \u0024 $custom41usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

  FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),

   ),
),
custom52==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 5") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 5");

                stateSetter(() { usersize = 'C 5';
                custom = true;
                size = custom5;
                customprice = customprice5;
                custompriceusd = custom51usd;
                custompriceinr = custom51inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom5 + \u0024 $custom51usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

  FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

   ),
),
custom62==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 6") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 6");

                stateSetter(() { usersize = 'C 6';
                custom = true;
                size = custom6;
                customprice = customprice6;
                custompriceusd = custom61usd;
                custompriceinr = custom61inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom6 + \u0024 $custom61usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

  FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),

   ),
),
custom72==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 7") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 7");

                stateSetter(() { usersize = 'C 7';
                custom = true;
                size = custom7;
                customprice = customprice7;
                custompriceusd = custom71usd;
                custompriceinr = custom71inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom7 + \u0024 $custom71usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

  FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),

   ),
),
custom82==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 8") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 8");

                stateSetter(() { usersize = 'C 8';
                custom = true;
                size = custom8;
                customprice = customprice8;
                custompriceusd = custom81usd;
                custompriceinr = custom81inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom8 + \u0024 $custom81usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

  FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),

   ),
),
custom92==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 9") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 9");

                stateSetter(() { usersize = 'C 9';
                custom = true;
                size = custom9;
                customprice = customprice9;
                custompriceusd = custom91usd;
                custompriceinr = custom91inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom9 + \u0024 $custom91usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

  FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),

   ),
),
custom102==0?Container():   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary: selectedCategory.contains("C 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                onPrimary:selectedCategory.contains("C 10") ? Colors.white:  Colors.black, // foreground
              ),
              onPressed: () {
                selectedCategory =  <String>[];
                selectedCategory.add("C 10");

                stateSetter(() { usersize = 'C 10';
                custom = true;
                size = custom10;
                customprice = customprice10;
                custompriceusd = custom101usd;
                custompriceinr = custom101inr;});
              },          child:

  currentUser.country == "India"?  FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr',)):
  currentUser.country == "United States"?  FittedBox(child: Text('$custom10 + \u0024 $custom101usd',)):
  currentUser.country == country?FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

  FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),

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


                    usersize == "" || color == ""?Container():  Container(
                        // alignment:Alignment.centerLeft,
                        child: FloatingActionButton.extended(
                          backgroundColor: kblue,
                          onPressed: () {
                             if (currentUser.country == country) {
                              Proceedtobuy(
                                  ship: shipcostusd, shipcostU: shipcostinr);
                            } else {
                              Proceedtobuy(ship: shipcostinterusd,
                                  shipcostU: shipcostuser);
                            }
                          },
                          label: Text(
                            'Proceed', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ])

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
                          height: 200,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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


                                          custom12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 1") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 1");

                                                stateSetter(() { usersize = 'C 1';
                                                custom = true;
                                                size = custom1;
                                                customprice = customprice1;
                                                custompriceusd = custom11usd;
                                                custompriceinr = custom11inr;});
                                              },          child:
                                            currentUser.country == "India"?  FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom1 + \u0024 $custom11usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                            FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),

                                            ),
                                          ),
                                          custom22==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 2") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 2");

                                                stateSetter(() { usersize = 'C 2';
                                                custom = true;
                                                size = custom2;
                                                customprice = customprice2;
                                                custompriceusd = custom21usd;
                                                custompriceinr = custom21inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom2 + \u0024 $custom21usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                            FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),

                                            ),
                                          ),
                                          custom32==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 3") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 3");

                                                stateSetter(() { usersize = 'C 3';
                                                custom = true;
                                                size = custom3;
                                                customprice = customprice3;
                                                custompriceusd = custom31usd;
                                                custompriceinr = custom31inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom3 + \u0024 $custom31usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                            FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),

                                            ),
                                          ),
                                          custom42==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 4") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 4");

                                                stateSetter(() { usersize = 'C 4';
                                                custom = true;
                                                size = custom4;
                                                customprice = customprice4;
                                                custompriceusd = custom41usd;
                                                custompriceinr = custom41inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom4 + \u0024 $custom41usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                            FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),

                                            ),
                                          ),
                                          custom52==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 5");

                                                stateSetter(() { usersize = 'C 5';
                                                custom = true;
                                                size = custom5;
                                                customprice = customprice5;
                                                custompriceusd = custom51usd;
                                                custompriceinr = custom51inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom5 + \u0024 $custom51usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                            FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                            ),
                                          ),
                                          custom62==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 6") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 6");

                                                stateSetter(() { usersize = 'C 6';
                                                custom = true;
                                                size = custom6;
                                                customprice = customprice6;
                                                custompriceusd = custom61usd;
                                                custompriceinr = custom61inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom6 + \u0024 $custom61usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                            FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),

                                            ),
                                          ),
                                          custom72==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 7") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 7");

                                                stateSetter(() { usersize = 'C 7';
                                                custom = true;
                                                size = custom7;
                                                customprice = customprice7;
                                                custompriceusd = custom71usd;
                                                custompriceinr = custom71inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom7 + \u0024 $custom71usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                            FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),

                                            ),
                                          ),
                                          custom82==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 8");

                                                stateSetter(() { usersize = 'C 8';
                                                custom = true;
                                                size = custom8;
                                                customprice = customprice8;
                                                custompriceusd = custom81usd;
                                                custompriceinr = custom81inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom8 + \u0024 $custom81usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                            FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),

                                            ),
                                          ),
                                          custom92==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 9");

                                                stateSetter(() { usersize = 'C 9';
                                                custom = true;
                                                size = custom9;
                                                customprice = customprice9;
                                                custompriceusd = custom91usd;
                                                custompriceinr = custom91inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom9 + \u0024 $custom91usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                            FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),

                                            ),
                                          ),
                                          custom102==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 10");

                                                stateSetter(() { usersize = 'C 10';
                                                custom = true;
                                                size = custom10;
                                                customprice = customprice10;
                                                custompriceusd = custom101usd;
                                                custompriceinr = custom101inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom10 + \u0024 $custom101usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                            FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),

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


                                usersize == "" || color == ""?Container():  Container(
                                  // alignment:Alignment.centerLeft,
                                  child: FloatingActionButton.extended(
                                    backgroundColor: kblue,
                                    onPressed: () {
                                      if (currentUser.country == country) {
                                        Proceedtobuy(
                                            ship: shipcostusd, shipcostU: shipcostinr);
                                      } else {
                                        Proceedtobuy(ship: shipcostinterusd,
                                            shipcostU: shipcostuser);
                                      }
                                    },
                                    label: Text(
                                      'Proceed', style: TextStyle(color: Colors.white),),
                                  ),
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
                          height: 200,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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


                                          custom12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 1") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 1");

                                                stateSetter(() { usersize = 'C 1';
                                                custom = true;
                                                size = custom1;
                                                customprice = customprice1;
                                                custompriceusd = custom11usd;
                                                custompriceinr = custom11inr;});
                                              },          child:
                                            currentUser.country == "India"?  FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom1 + \u0024 $custom11usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                            FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),

                                            ),
                                          ),
                                          custom22==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 2") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 2");

                                                stateSetter(() { usersize = 'C 2';
                                                custom = true;
                                                size = custom2;
                                                customprice = customprice2;
                                                custompriceusd = custom21usd;
                                                custompriceinr = custom21inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom2 + \u0024 $custom21usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                            FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),

                                            ),
                                          ),
                                          custom32==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 3") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 3");

                                                stateSetter(() { usersize = 'C 3';
                                                custom = true;
                                                size = custom3;
                                                customprice = customprice3;
                                                custompriceusd = custom31usd;
                                                custompriceinr = custom31inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom3 + \u0024 $custom31usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                            FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),

                                            ),
                                          ),
                                          custom42==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 4") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 4");

                                                stateSetter(() { usersize = 'C 4';
                                                custom = true;
                                                size = custom4;
                                                customprice = customprice4;
                                                custompriceusd = custom41usd;
                                                custompriceinr = custom41inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom4 + \u0024 $custom41usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                            FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),

                                            ),
                                          ),
                                          custom52==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 5");

                                                stateSetter(() { usersize = 'C 5';
                                                custom = true;
                                                size = custom5;
                                                customprice = customprice5;
                                                custompriceusd = custom51usd;
                                                custompriceinr = custom51inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom5 + \u0024 $custom51usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                            FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                            ),
                                          ),
                                          custom62==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 6") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 6");

                                                stateSetter(() { usersize = 'C 6';
                                                custom = true;
                                                size = custom6;
                                                customprice = customprice6;
                                                custompriceusd = custom61usd;
                                                custompriceinr = custom61inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom6 + \u0024 $custom61usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                            FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),

                                            ),
                                          ),
                                          custom72==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 7") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 7");

                                                stateSetter(() { usersize = 'C 7';
                                                custom = true;
                                                size = custom7;
                                                customprice = customprice7;
                                                custompriceusd = custom71usd;
                                                custompriceinr = custom71inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom7 + \u0024 $custom71usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                            FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),

                                            ),
                                          ),
                                          custom82==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 8");

                                                stateSetter(() { usersize = 'C 8';
                                                custom = true;
                                                size = custom8;
                                                customprice = customprice8;
                                                custompriceusd = custom81usd;
                                                custompriceinr = custom81inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom8 + \u0024 $custom81usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                            FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),

                                            ),
                                          ),
                                          custom92==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 9");

                                                stateSetter(() { usersize = 'C 9';
                                                custom = true;
                                                size = custom9;
                                                customprice = customprice9;
                                                custompriceusd = custom91usd;
                                                custompriceinr = custom91inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom9 + \u0024 $custom91usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                            FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),

                                            ),
                                          ),
                                          custom102==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 10");

                                                stateSetter(() { usersize = 'C 10';
                                                custom = true;
                                                size = custom10;
                                                customprice = customprice10;
                                                custompriceusd = custom101usd;
                                                custompriceinr = custom101inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom10 + \u0024 $custom101usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                            FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),

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


                                usersize == "" || color == ""?Container():  Container(
                                  // alignment:Alignment.centerLeft,
                                  child: FloatingActionButton.extended(
                                    backgroundColor: kblue,
                                    onPressed: () {
                                      if (currentUser.country == country) {
                                        Proceedtobuy(
                                            ship: shipcostusd, shipcostU: shipcostinr);
                                      } else {
                                        Proceedtobuy(ship: shipcostinterusd,
                                            shipcostU: shipcostuser);
                                      }
                                    },
                                    label: Text(
                                      'Proceed', style: TextStyle(color: Colors.white),),
                                  ),
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
                          height: 200,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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


                                          custom12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 1") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 1");

                                                stateSetter(() { usersize = 'C 1';
                                                custom = true;
                                                size = custom1;
                                                customprice = customprice1;
                                                custompriceusd = custom11usd;
                                                custompriceinr = custom11inr;});
                                              },          child:
                                            currentUser.country == "India"?  FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom1 + \u0024 $custom11usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                            FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),

                                            ),
                                          ),
                                          custom22==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 2") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 2");

                                                stateSetter(() { usersize = 'C 2';
                                                custom = true;
                                                size = custom2;
                                                customprice = customprice2;
                                                custompriceusd = custom21usd;
                                                custompriceinr = custom21inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom2 + \u0024 $custom21usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                            FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),

                                            ),
                                          ),
                                          custom32==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 3") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 3");

                                                stateSetter(() { usersize = 'C 3';
                                                custom = true;
                                                size = custom3;
                                                customprice = customprice3;
                                                custompriceusd = custom31usd;
                                                custompriceinr = custom31inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom3 + \u0024 $custom31usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                            FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),

                                            ),
                                          ),
                                          custom42==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 4") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 4");

                                                stateSetter(() { usersize = 'C 4';
                                                custom = true;
                                                size = custom4;
                                                customprice = customprice4;
                                                custompriceusd = custom41usd;
                                                custompriceinr = custom41inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom4 + \u0024 $custom41usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                            FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),

                                            ),
                                          ),
                                          custom52==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 5");

                                                stateSetter(() { usersize = 'C 5';
                                                custom = true;
                                                size = custom5;
                                                customprice = customprice5;
                                                custompriceusd = custom51usd;
                                                custompriceinr = custom51inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom5 + \u0024 $custom51usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                            FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                            ),
                                          ),
                                          custom62==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 6") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 6");

                                                stateSetter(() { usersize = 'C 6';
                                                custom = true;
                                                size = custom6;
                                                customprice = customprice6;
                                                custompriceusd = custom61usd;
                                                custompriceinr = custom61inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom6 + \u0024 $custom61usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                            FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),

                                            ),
                                          ),
                                          custom72==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 7") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 7");

                                                stateSetter(() { usersize = 'C 7';
                                                custom = true;
                                                size = custom7;
                                                customprice = customprice7;
                                                custompriceusd = custom71usd;
                                                custompriceinr = custom71inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom7 + \u0024 $custom71usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                            FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),

                                            ),
                                          ),
                                          custom82==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 8");

                                                stateSetter(() { usersize = 'C 8';
                                                custom = true;
                                                size = custom8;
                                                customprice = customprice8;
                                                custompriceusd = custom81usd;
                                                custompriceinr = custom81inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom8 + \u0024 $custom81usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                            FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),

                                            ),
                                          ),
                                          custom92==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 9");

                                                stateSetter(() { usersize = 'C 9';
                                                custom = true;
                                                size = custom9;
                                                customprice = customprice9;
                                                custompriceusd = custom91usd;
                                                custompriceinr = custom91inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom9 + \u0024 $custom91usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                            FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),

                                            ),
                                          ),
                                          custom102==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 10");

                                                stateSetter(() { usersize = 'C 10';
                                                custom = true;
                                                size = custom10;
                                                customprice = customprice10;
                                                custompriceusd = custom101usd;
                                                custompriceinr = custom101inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom10 + \u0024 $custom101usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                            FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),

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


                                usersize == "" || color == ""?Container():  Container(
                                  // alignment:Alignment.centerLeft,
                                  child: FloatingActionButton.extended(
                                    backgroundColor: kblue,
                                    onPressed: () {
                                      if (currentUser.country == country) {
                                        Proceedtobuy(
                                            ship: shipcostusd, shipcostU: shipcostinr);
                                      } else {
                                        Proceedtobuy(ship: shipcostinterusd,
                                            shipcostU: shipcostuser);
                                      }
                                    },
                                    label: Text(
                                      'Proceed', style: TextStyle(color: Colors.white),),
                                  ),
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
                          height: 200,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
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
                                          custom12==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 1") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 1") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 1");

                                                stateSetter(() { usersize = 'C 1';
                                                custom = true;
                                                size = custom1;
                                                customprice = customprice1;
                                                custompriceusd = custom11usd;
                                                custompriceinr = custom11inr;});
                                              },          child:
                                            currentUser.country == "India"?  FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom1 + \u0024 $custom11usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $custom11inr(\u0024 $custom11usd)',)):

                                            FittedBox(child: Text('$custom1 + ${currentUser.currencysym} $customprice1(\u0024 $custom11usd)',)),

                                            ),
                                          ),
                                          custom22==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 2") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 2") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 2");

                                                stateSetter(() { usersize = 'C 2';
                                                custom = true;
                                                size = custom2;
                                                customprice = customprice2;
                                                custompriceusd = custom21usd;
                                                custompriceinr = custom21inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom2 + \u0024 $custom21usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $custom21inr(\u0024 $custom21usd)',)):

                                            FittedBox(child: Text('$custom2 + ${currentUser.currencysym} $customprice2(\u0024 $custom21usd)',)),

                                            ),
                                          ),
                                          custom32==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 3") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 3") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 3");

                                                stateSetter(() { usersize = 'C 3';
                                                custom = true;
                                                size = custom3;
                                                customprice = customprice3;
                                                custompriceusd = custom31usd;
                                                custompriceinr = custom31inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom3 + \u0024 $custom31usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $custom31inr(\u0024 $custom31usd)',)):

                                            FittedBox(child: Text('$custom3 + ${currentUser.currencysym} $customprice3(\u0024 $custom31usd)',)),

                                            ),
                                          ),
                                          custom42==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 4") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 4") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 4");

                                                stateSetter(() { usersize = 'C 4';
                                                custom = true;
                                                size = custom4;
                                                customprice = customprice4;
                                                custompriceusd = custom41usd;
                                                custompriceinr = custom41inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom4 + \u0024 $custom41usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $custom41inr(\u0024 $custom41usd)',)):

                                            FittedBox(child: Text('$custom4 + ${currentUser.currencysym} $customprice4(\u0024 $custom41usd)',)),

                                            ),
                                          ),
                                          custom52==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 5") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 5") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 5");

                                                stateSetter(() { usersize = 'C 5';
                                                custom = true;
                                                size = custom5;
                                                customprice = customprice5;
                                                custompriceusd = custom51usd;
                                                custompriceinr = custom51inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom5 + \u0024 $custom51usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $custom51inr(\u0024 $custom51usd)',)):

                                            FittedBox(child: Text('$custom5 + ${currentUser.currencysym} $customprice5(\u0024 $custom51usd)',)),

                                            ),
                                          ),
                                          custom62==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 6") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 6") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 6");

                                                stateSetter(() { usersize = 'C 6';
                                                custom = true;
                                                size = custom6;
                                                customprice = customprice6;
                                                custompriceusd = custom61usd;
                                                custompriceinr = custom61inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom6 + \u0024 $custom61usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $custom61inr(\u0024 $custom61usd)',)):

                                            FittedBox(child: Text('$custom6 + ${currentUser.currencysym} $customprice6(\u0024 $custom61usd)',)),

                                            ),
                                          ),
                                          custom72==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 7") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 7") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 7");

                                                stateSetter(() { usersize = 'C 7';
                                                custom = true;
                                                size = custom7;
                                                customprice = customprice7;
                                                custompriceusd = custom71usd;
                                                custompriceinr = custom71inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom7 + \u0024 $custom71usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $custom71inr(\u0024 $custom71usd)',)):

                                            FittedBox(child: Text('$custom7 + ${currentUser.currencysym} $customprice7(\u0024 $custom71usd)',)),

                                            ),
                                          ),
                                          custom82==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 8") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 8") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 8");

                                                stateSetter(() { usersize = 'C 8';
                                                custom = true;
                                                size = custom8;
                                                customprice = customprice8;
                                                custompriceusd = custom81usd;
                                                custompriceinr = custom81inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom8 + \u0024 $custom81usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $custom81inr(\u0024 $custom81usd)',)):

                                            FittedBox(child: Text('$custom8 + ${currentUser.currencysym} $customprice8(\u0024 $custom81usd)',)),

                                            ),
                                          ),
                                          custom92==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 9") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 9") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 9");

                                                stateSetter(() { usersize = 'C 9';
                                                custom = true;
                                                size = custom9;
                                                customprice = customprice9;
                                                custompriceusd = custom91usd;
                                                custompriceinr = custom91inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom9 + \u0024 $custom91usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $custom91inr(\u0024 $custom91usd)',)):

                                            FittedBox(child: Text('$custom9 + ${currentUser.currencysym} $customprice9(\u0024 $custom91usd)',)),

                                            ),
                                          ),
                                          custom102==0?Container():   Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   ElevatedButton(

                                              style: ElevatedButton.styleFrom(

                                                primary: selectedCategory.contains("C 10") ? Colors.black: Colors.white.withOpacity(0.1), // background
                                                onPrimary:selectedCategory.contains("C 10") ? Colors.white:  Colors.black, // foreground
                                              ),
                                              onPressed: () {
                                                selectedCategory =  <String>[];
                                                selectedCategory.add("C 10");

                                                stateSetter(() { usersize = 'C 10';
                                                custom = true;
                                                size = custom10;
                                                customprice = customprice10;
                                                custompriceusd = custom101usd;
                                                custompriceinr = custom101inr;});
                                              },          child:

                                            currentUser.country == "India"?  FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr',)):
                                            currentUser.country == "United States"?  FittedBox(child: Text('$custom10 + \u0024 $custom101usd',)):
                                            currentUser.country == country?FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $custom101inr(\u0024 $custom101usd)',)):

                                            FittedBox(child: Text('$custom10 + ${currentUser.currencysym} $customprice10(\u0024 $custom101usd)',)),

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


                                usersize == "" || color == ""?Container():  Container(
                                  // alignment:Alignment.centerLeft,
                                  child: FloatingActionButton.extended(
                                    backgroundColor: kblue,
                                    onPressed: () {
                                      if (currentUser.country == country) {
                                        Proceedtobuy(
                                            ship: shipcostusd, shipcostU: shipcostinr);
                                      } else {
                                        Proceedtobuy(ship: shipcostinterusd,
                                            shipcostU: shipcostuser);
                                      }
                                    },
                                    label: Text(
                                      'Proceed', style: TextStyle(color: Colors.white),),
                                  ),
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

  handleLikePost() {
    bool _isFav = true;
    if(_isFav) {
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

        isfav = false;
//        likes[currentUserId] = false;
      });
    } else if (!_isFav) {
      var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
      docReference.delete();

    }
      else{
      var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
      docReference.delete();

    }
    handleLikePost();
  }
  reviews() {
    return
    showModalBottomSheet(
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (BuildContext context) {

          return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
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
              GestureDetector(
                onTap:(){},
                onDoubleTap: () {
                  addToFav();
                  final snackBar = SnackBar(
                    content: Text('Added to Favorites!'),
                    action: SnackBarAction(
                      // label: 'Undo',
                      // onPressed: () {
                      //   // Some code to undo the change.
                      // },
                    ),
                  );


                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only
                          (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                        child: Container(
                           // height: MediaQuery.of(context).size.height * 0.65,

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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                            backgroundColor: Colors.grey,
                          ),
                          title: GestureDetector(
                            onTap: () => showProfile(context, profileId: user.id),
                            child: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
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
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: (){
      addToFav();
      final snackBar = SnackBar(
      content: Text('Added to Favorites!'),
      action: SnackBarAction(
      // label: 'Undo',
      // onPressed: () {
      //   // Some code to undo the change.
      // },
      ),
      );


      Scaffold.of(context).showSnackBar(snackBar);
      },
                    child: Icon(
                      isfav ?   Icons.favorite:Icons.favorite_border ,
                      size: 28.0,
                      color:  Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: kText,
                        fontSize: 15.0,
                        //                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () => reviews(),
                    child:  Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 6.0,),
                        Icon(
                          Icons.star,
                          size: 28.0,
                          color:  Colors.white,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: kText,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color:  Colors.white) ,),
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
                        subtitle: Text(
                          "₹  $inr ",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        trailing: !isPostOwner? FloatingActionButton(
                          heroTag:null,
                          onPressed: () => Buynow(context),
                          child: Icon(Icons.add_shopping_cart,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                        ): RaisedButton(
                          color: kblue,
                          child: Text('Edit Inventory',style: TextStyle(color: Colors.white),),
                          onPressed: ()=> Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditShop(
                                prodId: prodId,
                                userId: ownerId,
                              ),
                            ),
                          ),
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
    },
  );
}
posteurope(){

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
              GestureDetector(
                onTap:(){},
                onDoubleTap: () {
                  addToFav();
                  final snackBar = SnackBar(
                    content: Text('Added to Favorites!'),
                    action: SnackBarAction(
                      // label: 'Undo',
                      // onPressed: () {
                      //   // Some code to undo the change.
                      // },
                    ),
                  );


                  Scaffold.of(context).showSnackBar(snackBar);
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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                            backgroundColor: Colors.grey,
                          ),
                          title: GestureDetector(
                            onTap: () => showProfile(context, profileId: user.id),
                            child: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
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
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: (){
                      addToFav();
                      final snackBar = SnackBar(
                        content: Text('Added to Favorites!'),
                        action: SnackBarAction(

                        ),
                      );


                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      isfav ?   Icons.favorite:Icons.favorite_border ,
                      size: 28.0,
                      color:  Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color:kText,
                        fontSize: 15.0,
                        //                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () => reviews(),
                    child:  Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 6.0,),
                        Icon(
                          Icons.star,
                          size: 28.0,
                          color:  Colors.white,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: kText,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color:  Colors.white) ,),
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
                      Row(
                        children: [
                          Text("${currentUser.currencysym} $inr",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                          Text(
                            "(\u0024 $usd)",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("${currentUser.currency} ",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              )
                          ),
                        ],
                      ),
                     freeship?Container(
                       color:Colors.white.withOpacity(0.1),
                      child:   Text(
                           "FREE SHIPPING",
                           style: TextStyle(
                             color: Colors.green,
                             fontWeight: FontWeight.bold,
                             fontSize: 14.0,
                           ),
                         )
                     ) :Text(
                        "+ ${currentUser.currencysym} $shipcostinr",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ):   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(children:[Text(
                        "${currentUser.currencysym} $price",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                        Text(
                        "(\u0024 $usd)",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      )]),
                  Row(
                    children: [
                      Text("${currentUser.currency} ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        )
                      ),
                    ],
                  ),
                      freeworldship?Container(
                          color:Colors.white.withOpacity(0.1),
                          child:   Text(
                            "FREE SHIPPING",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          )
                      ) :Text(
                        "+ ${currentUser.currencysym} $shipcostuser(\u0024 $shipcostinterusd)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ) ,
                     trailing: FloatingActionButton(
                        heroTag:null,

                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
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
    },
  );
}
postuk(){
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
              GestureDetector(
                onTap:(){},
                onDoubleTap: () {
                  addToFav();
                  final snackBar = SnackBar(
                    content: Text('Added to Favorites!'),
                    action: SnackBarAction(
                      // label: 'Undo',
                      // onPressed: () {
                      //   // Some code to undo the change.
                      // },
                    ),
                  );


                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only
                          (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                        child: Container(
                    //        height: MediaQuery.of(context).size.height * 0.65,

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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                            backgroundColor: Colors.grey,
                          ),
                          title: GestureDetector(
                            onTap: () => showProfile(context, profileId: user.id),
                            child: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
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
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: (){
                      addToFav();
                      final snackBar = SnackBar(
                        content: Text('Added to Favorites!'),
                        action: SnackBarAction(
                          // label: 'Undo',
                          // onPressed: () {
                          //   // Some code to undo the change.
                          // },
                        ),
                      );


                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      isfav ?   Icons.favorite:Icons.favorite_border ,
                      size: 28.0,
                      color:  Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: kText,
                        fontSize: 15.0,
                        //                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () => reviews(),
                    child:  Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 6.0,),
                        Icon(
                          Icons.star,
                          size: 28.0,
                          color:  Colors.white,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: kText,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color:  Colors.white) ,),
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
                      subtitle: Text(
                        "£  $gbp ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      trailing: !isPostOwner? FloatingActionButton(
                        heroTag:null,

                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      ): RaisedButton(
                        color: kblue,
                        child: Text('Edit Inventory',style: TextStyle(color: Colors.white),),
                        onPressed: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditShop(
                              prodId: prodId,
                              userId: ownerId,
                            ),
                          ),
                        ),
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
    },
  );
}
postusa() {
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
              GestureDetector(
                onTap:(){},
                onDoubleTap: () {
                  addToFav();
                  final snackBar = SnackBar(
                    content: Text('Added to Favorites!'),
                    action: SnackBarAction(
                      // label: 'Undo',
                      // onPressed: () {
                      //   // Some code to undo the change.
                      // },
                    ),
                  );


                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only
                          (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                        child: Container(
                           // height: MediaQuery.of(context).size.height * 0.65,

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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                            backgroundColor: Colors.grey,
                          ),
                          title: GestureDetector(
                            onTap: () => showProfile(context, profileId: user.id),
                            child: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
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
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: (){
                      addToFav();
                      final snackBar = SnackBar(
                        content: Text('Added to Favorites!'),
                        action: SnackBarAction(
                          // label: 'Undo',
                          // onPressed: () {
                          //   // Some code to undo the change.
                          // },
                        ),
                      );


                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(
                      isfav ?   Icons.favorite:Icons.favorite_border ,
                      size: 28.0,
                      color:  Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: kText,
                        fontSize: 15.0,
                        //                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () => reviews(),
                    child:  Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 6.0,),
                        Icon(
                          Icons.star,
                          size: 28.0,
                          color:  Colors.white,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: kText,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color:  Colors.white) ,),
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
                      subtitle: Text(
                        "\u0024  $usd ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      trailing: !isPostOwner? FloatingActionButton(
                        heroTag:null,

                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      ): RaisedButton(
                        color: kblue,
                        child: Text('Edit Inventory',style: TextStyle(color: Colors.white),),
                        onPressed: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditShop(
                              prodId: prodId,
                              userId: ownerId,
                            ),
                          ),
                        ),
                      )
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
    },
  );
}
  buildPostHeader() {
    if(currentUser.country=='India'){
      return
        postindia();
    }
    else if (currentUser.country == 'Europe') {

        return posteurope();

    }
    else if (currentUser.country == 'UK')  {
      return postuk();
    }
    else if (currentUser.country == 'USA') {
      return postusa();
    }
    else{
      return postusa();
    }

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

  addToFav() {
    bool _isLiked = likes[currentUser.id] == true;

    if (_isLiked) {

      var docReference = favRef.doc(currentUser.id).collection("userFav").doc(prodId);
      docReference.delete();

      productsRef
          .doc(ownerId)
          .collection('userProducts')
          .doc(prodId)
          .update({'likes.${currentUser.id}': false});
      removeLikeFromActivityFeed();
       setState(() {
         likeCount -= 1;
         isfav = false;
         likes[currentUser.id] = false;
       });
    } else if (!_isLiked) {
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
      productsRef
          .doc(ownerId)
          .collection('userProducts')
          .doc(prodId)
          .update({'likes.${currentUser.id}': true});
      addLikeToActivityFeed();
       setState(() {
         likeCount += 1;
         isfav = true;
         likes[currentUser.id] = true;
 //        showHeart = true;
       });
      Timer(Duration(milliseconds: 500), () {
        setState(() {
          showHeart = false;
        });
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

