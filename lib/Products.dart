import 'package:fashow/model/addressbuynow.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
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
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

                            //  items: listOfImages.map((e) { return Builder(builder: (BuildContext context){ return Container();});}),
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
final String shipment;
final bool worldship;
final bool freeworldship;
final bool freeship;

  final String productname;
  final String details;
  final String color;
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
   final int processfrom;
    final int processto;
    final int shipfrom;
    final int shipto;
    final int shipinterfrom;
    final int shipinterto;

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

    this.gender,
    this.details,
    this.productname,
    this.color,
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


    this.photoUrl,
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


        productname: doc.data()['productname'],
      details: doc.data()['details'],
      shopmediaUrl: doc.data()['shopmediaUrl'],
      color:doc.data()['color'],
   composition:doc.data()['composition'],
   washandcare:doc.data()['washandcare'],
    sizeandfit:doc.data()['sizeandfit'],
      likes: doc.data()['likes'],
        photoUrl:doc.data()['photoUrl'],
        freesize:doc.data()['freesizeQuantity'],
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

    gender:this.gender,
    details:this.details,
    productname: this.productname,
    color: this.color,
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

    likeCount: getLikeCount(this.likes),
  );
}

class _ProdState extends State<Prod> {
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
 final String shipment;
final bool worldship;
final bool freeworldship;
final bool freeship;

  final String productname;
  final String details;
  final String color;
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
  final int processfrom;
  final int processto;
  final int shipfrom;
  final int shipto;
  final int shipinterfrom;
  final int shipinterto;
  final int mto;
  int likeCount;
  Map likes;
  bool isLiked;
  bool isfav;
  bool showHeart = false;
  bool details1 = true;
int views;

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

    this.composition,
    this.washandcare,
    this.sizeandfit,
    this.shopmediaUrl,
    this.likes,
    this.likeCount,
    this.photoUrl,
  });


  void initState() {
    // initialize controller
    // parse();

    super.initState();
    Views();
  }

  Views()async{
    DocumentSnapshot doc = await usersRef.doc(ownerId).get();
  Users vUser = Users.fromDocument(doc);
    setState(() {
      views = vUser.visits;

    });
   // FirebaseFirestore.instance.collection('users')
     //   .where("id",isEqualTo:"${widget.ownerId}")
       // .snapshots().listen((snapshot){snapshot.docs.forEach((doc){

   //   setState(() {
     //   client = doc.data()['client'];

   //   });});

  //  });
    views++;

    FirebaseFirestore.instance.collection('users')
        .doc(ownerId)
        .update({'visits': views,
    });
  }

FREE(){
    if(freesize == 0){
    return
      Container();
  }
    else{
  return
  GestureDetector(
  onTap: (){
  setState(()  {

  usersize = 'Free Size';


  });
  if (currentUser.country == 'India'){
  Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl.first,
  productname:productname);
  }
  else if (currentUser.country == 'UK'){
  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl.first,
  productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl.first,
  productname:productname);
  }
  else  if (currentUser.country == 'USA'){
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl.first,
  productname:productname);
  }
  else  {
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl.first,
  productname:productname);
  }

  },
  child: Container(
  decoration: BoxDecoration(
  color: kPrimaryColor,
  boxShadow: [
  BoxShadow(
  color: Colors.grey,
  blurRadius: 5.0,
  ),]
  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
  height: 40,
  width: 40,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
  FittedBox(child: Text('Free Size',style: TextStyle(color: Colors.white),)),
  ],
  ),
  ),
  );
  }
}
XXXS(){
  if(xxxs == 0){
    return
      Container();
  }
    else{
      return
        GestureDetector(
          onTap: (){
            setState(()  {

              usersize = 'XXXS';
            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }

          },
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]
                ,borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            height: 40,
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                FittedBox(child: Text('XXXS',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        );
    }


}
XXS(){
   if(xxs == 0){
     return
       Container();
   }
   else{
     return
     GestureDetector(
       onTap: (){
         setState(()  {

           usersize = 'XXS';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }


       },
       child: Container(
         decoration: BoxDecoration(
             color: kPrimaryColor,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey,
                 blurRadius: 5.0,
               ),]
             ,borderRadius: BorderRadius.all(Radius.circular(10.0))
         ),
         height: 40,
         width: 40,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
             FittedBox(child: Text('XXS',style: TextStyle(color: Colors.white),)),
           ],
         ),
       ),
     );
   }
}
XS(){
    if(xs == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'XS';
          });

          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('XS',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
}
S(){
   if(s == 0){
     return
       Container();
   }
   else{
     return
       GestureDetector(
       onTap: (){
         setState(()  {

           usersize = 'S';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }


       },
       child: Container(
         decoration: BoxDecoration(
             color: kPrimaryColor,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey,
                 blurRadius: 5.0,
               ),]
             ,borderRadius: BorderRadius.all(Radius.circular(10.0))
         ),
         height: 40,
         width: 40,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
             FittedBox(child: Text('S',style: TextStyle(color: Colors.white),)),
           ],
         ),
       ),
     );
   }
}
M(){
   if(m == 0){
     return
       Container();
   }
   else {
     return
     GestureDetector(
       onTap: (){
         setState(()  {

           usersize = 'M';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }


       },
       child: Container(
         decoration: BoxDecoration(
             color: kPrimaryColor,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey,
                 blurRadius: 5.0,
               ),]
             ,borderRadius: BorderRadius.all(Radius.circular(10.0))
         ),
         height: 40,
         width: 40,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
             FittedBox(child: Text('M',style: TextStyle(color: Colors.white),)),
           ],
         ),
       ),
     );
   }
}
L(){
    if(l == 0){
      return
        Container();
    }
   else{
     return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'L';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('L',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
}
XL(){
  if(xl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('XL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
XXL(){
  if(xxl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'XXL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('XXL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
XXXL(){
  if(xxxl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'XXXL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('XXXL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
FXL(){
  if(fourxl == 0){
    return
      Container();
  }
  else
  {
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '4XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('4XL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
FIVXL(){
  if(fivexl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '5XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('5XL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
SIXXL(){
  if(sixxl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '6XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('6XL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
SEVXL(){
  if(sevenxl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '7XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('7XL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
EIGXL(){
  if(eightxl == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '8XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('8XL',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
  }
}
MS1(){
   if(Shoe1 == 0){
     return
       Container();
   }
   else{
     return
  GestureDetector(
  onTap: (){
  setState(()  {

  usersize = '(US)3-1/2';
  });
  if (currentUser.country == 'India'){
    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else if (currentUser.country == 'UK'){
    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  if (currentUser.country == 'USA'){
    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  {
    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }

  },
  child: Container(
  decoration: BoxDecoration(
  color: kPrimaryColor,
  boxShadow: [
  BoxShadow(
  color: Colors.grey,
  blurRadius: 5.0,
  ),]
  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
  height: 40,
  width: 40,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  FittedBox(child: Text('(US)3-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

  ],
  ),
  ),
  );
  }

}
MS2(){
 if(Shoe2 == 0){
   return
     Container();
 }
else{
  return
   GestureDetector(
     onTap: (){
       setState(()  {

         usersize = '(US)4';
       });
       if (currentUser.country == 'India'){
         Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else if (currentUser.country == 'UK'){
         Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else  if (currentUser.country == 'Europe'){
         Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else  if (currentUser.country == 'USA'){
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else  {
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }


     },
     child: Container(
       decoration: BoxDecoration(
           color: kPrimaryColor,
           boxShadow: [
             BoxShadow(
               color: Colors.grey,
               blurRadius: 5.0,
             ),]
           ,borderRadius: BorderRadius.all(Radius.circular(10.0))
       ),
       height: 40,
       width: 40,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           FittedBox(child: Text('(US)4',style: TextStyle(color: Colors.white,fontSize: 8),)),


         ],
       ),
     ),
   );
 }
}
MS3(){
 if(Shoe3 == 0){
   return
     Container();
 }
 else{
   return
  GestureDetector(
  onTap: (){
  setState(()  {

  usersize = '(US)4-1/2';
  });
  if (currentUser.country == 'India'){
    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else if (currentUser.country == 'UK'){
    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  if (currentUser.country == 'USA'){
    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  {
    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }

  },
  child: Container(
  decoration: BoxDecoration(
  color: kPrimaryColor,
  boxShadow: [
  BoxShadow(
  color: Colors.grey,
  blurRadius: 5.0,
  ),]
  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
  height: 40,
  width: 40,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  FittedBox(child: Text('(US)4-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

  ],
  ),
  ),
  );
  }
}
MS4(){

   if(Shoe4 == 0){
     return
       Container();
   }
   else {

return
  GestureDetector(
       onTap: (){
         setState(()  {

           usersize = '(US)5';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl.first,
               productname:productname);
         }


       },
       child: Container(
         decoration: BoxDecoration(
             color: kPrimaryColor,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey,
                 blurRadius: 5.0,
               ),]
             ,borderRadius: BorderRadius.all(Radius.circular(10.0))
         ),
         height: 40,
         width: 40,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             FittedBox(child: Text('(US)5',style: TextStyle(color: Colors.white,fontSize: 8),)),

           ],
         ),
       ),
     );
   }
}
MS5(){

  if(Shoe5 == 0){
    return
      Container();
  }
  else{
    return
    GestureDetector(
      onTap: (){
        setState(()  {

          usersize = '(US)5-1/2';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }


      },
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),]
            ,borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        height: 40,
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(child: Text('(US)5-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),


          ],
        ),
      ),
    );
  }
}
MS6(){

  if(Shoe6 == 0){
    return
      Container();
  }
 else {
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)6';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width:40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)6',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS7(){

  if(Shoe7 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)6-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)6-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS8(){

  if(Shoe8 == 0){
    return
      Container();
  }
  else{
    return
    GestureDetector(
      onTap: (){
        setState(()  {

          usersize = '(US)7';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }

      },
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),]
            ,borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        height: 40,
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(child: Text('(US)7',style: TextStyle(color: Colors.white,fontSize: 8),)),

          ],
        ),
      ),
    );
  }
}
MS9(){

  if(Shoe9 == 0){
    return
      Container();
  }
 else {
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)7-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)7-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
  }
}
MS10(){

  if(Shoe10 == 0){
    return
      Container();
  }
  else{
    return
    GestureDetector(
      onTap: (){
        setState(()  {

          usersize = '(US)8';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }


      },
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),]
            ,borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        height: 40,
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(child: Text('(US)8',style: TextStyle(color: Colors.white,fontSize: 8),)),


          ],
        ),
      ),
    );
  }
}
MS11(){

  if(Shoe11 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)8-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)8-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS12(){

  if(Shoe12 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)9';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)9',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS13(){
  if(Shoe13 == 0){
    return
      Container();
  }
  else{
return
    GestureDetector(
      onTap: (){
        setState(()  {

          usersize = '(US)9-1/2';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl.first,
              productname:productname);
        }

      },
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),]
            ,borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        height: 40,
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(child: Text('(US)9-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

          ],
        ),
      ),
    );
  }
}
MS14(){
  if(Shoe14 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)10';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)10',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS15(){

  if(Shoe1 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)10-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)10-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS16(){
  if(Shoe16 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)11';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)11',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
  }
}
MS17(){
  if(Shoe17 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)11-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)11-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS18(){

  if(Shoe18 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)12';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)12',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
  }
}
MS19(){

  if(Shoe19 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)12-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)12-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),
            ],
          ),
        ),
      );
  }
}
MS20(){

  if(Shoe20 == 0){
    return
      Container();
  }
  else{
  return
  GestureDetector(
  onTap: (){
  setState(()  {

  usersize = '(US)13';
  });
  if (currentUser.country == 'India'){
    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else if (currentUser.country == 'UK'){
    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  if (currentUser.country == 'USA'){
    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }
  else  {
    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
        username: username,
        mediaUrl: shopmediaUrl.first,
        productname:productname);
  }


  },
  child: Container(
  decoration: BoxDecoration(
  color: kPrimaryColor,
  boxShadow: [
  BoxShadow(
  color: Colors.grey,
  blurRadius: 5.0,
  ),]
  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
  ),
  height: 40,
  width: 40,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  FittedBox(child: Text('(US)13',style: TextStyle(color: Colors.white,fontSize: 8),)),

  ],
  ),
  ),
  );
}
}
MS21(){

  if(Shoe21 == 0){
    return
      Container();
  }
  else{
    return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '(US)13-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)13-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),
            ],
          ),
        ),
      );
  }

}
  WS1(){

    if(Shoe1 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '5';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)5',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS2(){
    if(Shoe2 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '5-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)5-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS3(){
    if(Shoe3 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '6';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)6',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS4(){
    if(Shoe4 == 0){
      return
        Container();
    }
    else{return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '6-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)6-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS5(){
    if(Shoe5 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '7';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)7',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS6(){
    if(Shoe6 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '7-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)7-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS7(){

    if(Shoe7 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '8';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)8',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  WS8(){

    if(Shoe8 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '8-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)8-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS9(){

    if(Shoe9 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '9';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)9',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS10(){
    if(Shoe10 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '9-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }


        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)9-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS11(){
    if(Shoe11 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '10';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)10',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS12(){
    if(Shoe12 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '10-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)10-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS13(){
    if(Shoe13 == 0){
      return
        Container();
    }
else{
  return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '12';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)12',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  WS14(){

    if(Shoe14 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '13';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)13',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
   WS15(){

    if(Shoe15 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '14';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)14',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
   }
  WS16(){

    if(Shoe16 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '15-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('(US)15-1/2',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  B1(){
    if(xxxs == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '0-3 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('0-3 M',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  B2(){
    if(xxs == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '3-6 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('3-6 M',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  B3(){
 if(xs == 0){
   return
     Container();
 }
 else {
   return
   GestureDetector(
     onTap: (){
       setState(()  {

         usersize = '6-9 M';
       });
       if (currentUser.country == 'India'){
         Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else if (currentUser.country == 'UK'){
         Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else  if (currentUser.country == 'Europe'){
         Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else  if (currentUser.country == 'USA'){
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }
       else  {
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl.first,
             productname:productname);
       }

     },
     child: Container(
       decoration: BoxDecoration(
           color: kPrimaryColor,
           boxShadow: [
             BoxShadow(
               color: Colors.grey,
               blurRadius: 5.0,
             ),]
           ,borderRadius: BorderRadius.all(Radius.circular(10.0))
       ),
       height: 40,
       width: 40,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           FittedBox(child: Text('6-9 M',style: TextStyle(color: Colors.white),)),
         ],
       ),
     ),
   );
 }
  }
  B4(){

    if(s == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '9-12 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('9-12 M',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
 B5(){

    if(m == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '12-18 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('12-18 M',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
 }
  B6(){

    if(l == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '18-24 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('18-24 M',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  BS1(){

    if(Shoe1 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 0-3 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('0-3 M',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  BS2(){

    if(Shoe2 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 3-6 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('3-6 M',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  BS3(){

    if(Shoe3 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '6 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('6 M',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  BS4(){

    if(Shoe4 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '9 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('9-1/2 M',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  BS5(){

    if(Shoe5 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 9-12 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('9-12 M',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  BS6(){

    if(Shoe6 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 12-18 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('12-18 M',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  BS7(){

    if(Shoe7 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 18-24 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('18-24 M',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  K1(){

    if(xxxs == 0){
      return
        Container();
    }
    else
    {
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('2 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
 K2(){
    if(xxs == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '3-4 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('3-4 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
 }
  K3(){

    if(xs == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '4-5 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('4-5 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K4(){
    if(s == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '5-6 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('5-6 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K5(){
    if(m == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '6-7 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('6-7 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K6(){
    if(l == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '7-8 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('7-8 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K7(){
    if(xl == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '8-9 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('8-9 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K8(){
    if(xxl == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '9-10 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('9-10 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K9(){
    if(xxxl == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '10-11 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('10-11 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  K10(){
    if(fourxl == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '11-12 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('11-12 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  KS1(){
    if(Shoe1 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('2 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS2(){

    if(Shoe2 == 0){
      return
        Container();
    }
    else{
      return
        GestureDetector(
          onTap: (){
            setState(()  {

              usersize = '2-1/2 Y';
            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }

          },
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]
                ,borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            height: 40,
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: Text('2-1/2 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),


              ],
            ),
          ),
        );
    }
  }
  KS3(){

    if(Shoe3 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '3 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('3 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS4(){

    if(Shoe4 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '3-1/2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('3-1/2 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS5(){
    if(Shoe5 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '4 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('4 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS6(){

    if(Shoe6 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '5 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('5 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS7(){
    if(Shoe7 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '6 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('6 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  KS8(){
    if(Shoe8 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '7 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('7 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS9(){
    if(Shoe9 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '8 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('8 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS10(){
    if(Shoe10 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '8-1/2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('8-1/2 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS11(){

    if(Shoe11 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '9 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('9 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS12(){

    if(Shoe12 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '10 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('10 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS13(){

    if(Shoe13 == 0){
      return
        Container();
    }
    else
    {
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '11 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('11 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  KS14(){

    if(Shoe14 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '12 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('12 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  T1(){

    if(xxxs == 0){
      return
        Container();
    }
    else{
      return
        GestureDetector(
          onTap: (){
            setState(()  {

              usersize = '13 Y';
            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }

          },
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]
                ,borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            height: 40,
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: Text('13 Y',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),



        );
    }
  }
  T2(){

    if(xxs == 0){
      return
       Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '14 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child:

            Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              width: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(child: Text('14 Y',style: TextStyle(color: Colors.white),)),
                ],
              ),
            ),



      );
    }
  }
  T3(){

    if(xs == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '15 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 10,
          width: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('14 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  T4(){

    if(s == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = '16 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('15 Y',style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      );
    }
  }
  TS1(){
    if(Shoe1 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 13 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('13 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  TS2(){
    if(Shoe2 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 14 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('14 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  TS3(){
    if(Shoe3 == 0){
      return
        Container();
    }
    else{

      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 15 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('15 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),

            ],
          ),
        ),
      );
    }
  }
  TS4(){

    if(Shoe4 == 0){
      return
        Container();
    }
    else{
      return
      GestureDetector(
        onTap: (){
          setState(()  {

            usersize = 'S 16 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl.first,
                productname:productname);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
              ,borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          height: 40,
          width: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('16 Y',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
    }
  }
  MTO(){
    if(gender=='Men'||gender=='Women'){
      if(mto==0){
        return
            Container();
      }
      else{  return
        ExpansionTile(
          title: Text('Made-to-order',style:TextStyle(color:kText)),
          maintainState:true,
          children: [
            Column(children:[GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO XXXS';

            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }

          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
                  FittedBox(child: Text('XXXS',style: TextStyle(color: Colors.white),)),

            ),

          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO XXS';
            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl.first,
                  productname:productname);
            }

          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('XXS',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO XS';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('XS',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO S';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('S',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO M';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('M',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO L';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('L',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO XL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }

            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('XL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO XXL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }

            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('XXL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO XXXL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }

            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('XXXL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO 4XL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }

            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('4XL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO 5XL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }

            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('5XL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO 6XL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('6XL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO 7XL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('7XL',style: TextStyle(color: Colors.white),)),

            ),
          ),
          GestureDetector(
          onTap:(){
            setState(() {

              usersize = 'MTO 8XL';
              if (currentUser.country == 'India'){
                Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else if (currentUser.country == 'UK'){
                Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'Europe'){
                Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  if (currentUser.country == 'USA'){
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
              else  {
                Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                    username: username,
                    mediaUrl: shopmediaUrl.first,
                    productname:productname);
              }
            });
          },
            child: Container(
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                  ,borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: 40,
              child:
              FittedBox(child: Text('8XL',style: TextStyle(color: Colors.white),)),

            ),
          ),
            Text('________ENDS HERE________',style:TextStyle(color:Colors.red))
           ]) ,
          ],
        );}

    }
    else if(gender=='Baby-Boys'||gender=='Baby-Girls'){
      if(mto==0){
        return
          Container();
      }
      else {
        return
          ExpansionTile(
            title: Text('Made-to-order', style: TextStyle(color: kText)),
            maintainState: true,
            children: [Column(children:[
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 0-3 M';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('0-3 M',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 3-6 M';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('3-6 M',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 6-9 M';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('6-9 M',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 9-12 M';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('9-12 M',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 12-18 M';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('12-18 M',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 18-24 M';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('18-24 M',style: TextStyle(color: Colors.white),)),

                ),
              ),
              Text('________ENDS HERE________',style:TextStyle(color:Colors.red))

            ]),
            ],
          );
      }
    }
    else if(gender=='Kids-Boys'||gender=='Kids-Girls'){
      if(mto==0){
        return
          Container();
      }
      else {
        return
          ExpansionTile(
            title: Text('Made-to-order', style: TextStyle(color: kText)),
            maintainState: true,
            children: [
              Column(children:[
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 2 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 2 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 3-4 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 3-4 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 4-5 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 4-5 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 5-6 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 5-6 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 6-7 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 6-7 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 7-8 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 7-8 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 8-9 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 8-9 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 9-10 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 9-10 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 10-11 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 10-11 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 11-12 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 11-12 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              Text('________ENDS HERE________',style:TextStyle(color:Colors.red))
]),
            ],
          );
      }
    }
    else if(gender=='Teen-Boys'||gender=='Teen-Girls'){
      if(mto == 0){
        return Container();
      }
      else {
        return
          ExpansionTile(
            title: Text('Made-to-order', style: TextStyle(color: kText)),
            maintainState: true,
            children: [Column(children:[
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 13 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 13 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 14 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 14 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 15 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 15 Y',style: TextStyle(color: Colors.white),)),

                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 16 Y';
                    if (currentUser.country == 'India'){
                      Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else if (currentUser.country == 'UK'){
                      Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'Europe'){
                      Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  if (currentUser.country == 'USA'){
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }
                    else  {
                      Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                          username: username,
                          mediaUrl: shopmediaUrl.first,
                          productname:productname);
                    }

                  });
                },
                child: Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]
                      ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  child:
                  FittedBox(child: Text('MTO 16 Y',style: TextStyle(color: Colors.white),)),

                ),),
                  Text('________ENDS HERE________',style:TextStyle(color:Colors.red))


              ]),

            ],
          );
      }
    }
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
MenSizes(){
 return
     Expanded(child:Container(

       child: ListView(
         children: [
           MTO(),

           SizedBox(height:40.0),
           FREE(),
 XXXS(),
 XXS(),
 XS(),
 S(),
 M(),
 L(),
 XL(),
 XXL(),
 XXXL(),
 FXL(),
 FIVXL(),
 SIXXL(),
 SEVXL(),
 EIGXL(),
 MS1(),
 MS2(),
 MS3(),
 MS4(),
 MS5(),
 MS6(),
 MS7(),
 MS8(),
 MS9(),
 MS10(),
 MS11(),
 MS12(),
 MS13(),
 MS14(),
 MS15(),
 MS16(),
 MS17(),
 MS18(),
 MS19(),
 MS20(),
 MS21(),
         ],
       ),
     ));

}
WomenSizes(){
  return
    ListView(
      children: [
        MTO(),
        FREE(),
        XXXS(),
        XXS(),
        XS(),
        S(),
        M(),
        L(),
        XL(),
        XXL(),
        XXXL(),
        FXL(),
        FIVXL(),
        SIXXL(),
          SEVXL(),
          EIGXL(),

  WS1(),
  WS2(),
  WS3(),
  WS4(),
  WS5(),
  WS6(),
  WS7(),
  WS8(),
  WS9(),
  WS10(),
  WS11(),
  WS12(),
  WS13(),
  WS14(),
  WS15(),
  WS16(),
      ],
    );




}
BabySizes(){
  return
    Container(
    child: ListView(
      children: [
          MTO(),
          FREE(),
        B1(),
  B2(),
  B3(),
  B4(),
  B5(),
  B6(),


  BS1(),
  BS2(),
  BS3(),
  BS4(),
  BS5(),
  BS6(),
  BS7(),
      ],
    ),
    );

}
KidSizes(){
    return
      Expanded(child:Container(

        child: ListView(
            children: [
              MTO(),
            FREE(),

          K1(),
          K2(),
          K3(),
    K4(),
    K5(),
    K6(),
    K7(),
    K8(),
    K9(),
    K10(),
    KS1(),
    KS2(),
    KS3(),
    KS4(),
    KS5(),
    KS6(),
    KS7(),
    KS8(),
    KS9(),
    KS10(),
    KS11(),
    KS12(),
    KS13(),
    KS14(),

        ],
      ),
      ));

}
TeenSizes(){
  return

    ListView(
          children: [
            MTO(),
            FREE(),
          T1(),
          T2(),
          T3(),
  T4(),
  TS1(),
  TS2(),
  TS3(),
  TS4(),

          ],
    );



}
  Proceedtobuy({String prodId,
  String ownerId,
  String total,
    String userSize,
     String profileimg,
     String username,
    String mediaUrl,
 String productname,

    }){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>AddressBuy(Amount:total,Size: userSize,OwnerId: ownerId,prodId:prodId ,
        profileimg: profileimg ,
        username: username,
        mediaUrl: mediaUrl,
        productname:productname,
      eur:eur,
      usd:usd,
      inr:inr,
      gbp:gbp,
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
        freeSize: freesize,

    )));





  }
  Buynow(parentContext) {
    if (gender == 'Men') {
      return
        showModalBottomSheet(
            context: parentContext,
            builder: (BuildContext context) {
              return
                Container(

                  child:        MenSizes(),

                );

            }
        );
    }
    else if (gender == 'Women') {
      return
        showModalBottomSheet(
            backgroundColor: kSecondaryColor,
            context: parentContext,
            builder: (BuildContext context) {
              return
                Container(
                  child:       WomenSizes(),

                );

            }
        );
    }
    else if (gender == 'Baby-Boys'||gender == 'Baby-Girls') {
      return
        showModalBottomSheet(
            backgroundColor: kSecondaryColor,
            context: parentContext,
            builder: (BuildContext context) {
              return
                Container(
                  child:        BabySizes(),
                );



            }
        );
    }
    else if (gender == 'Kids-Boys'||gender == 'Kids-Girls') {
      return
        showModalBottomSheet(
            backgroundColor: kSecondaryColor,
            context: parentContext,
            builder: (BuildContext context) {
              return
                Container(
                  child:  KidSizes(),

                );

            }
        );
    }
    else if (gender == 'Teen-Boys'||gender == 'Teen-Girls') {
      return
        showModalBottomSheet(
            backgroundColor: kSecondaryColor,
            context: parentContext,
            builder: (BuildContext context) {
              return
                Container(
                  child:         TeenSizes(),


                );

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
              child: Container(
                height: 400,
                child:PhotoView(imageProvider: AssetImage
                  ('assets/img/MenClothingsize.jpg')),),
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
              child: Container(
                height: 400,
                child:PhotoView(imageProvider: AssetImage
                  ('assets/img/WomanClothingsize.jpg'),

                ),),
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
              child: Container(
                height: 400,
                child:PhotoView(imageProvider: AssetImage
                  ('assets/img/babysizecloth.jpg')),),
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
              child: Container(
                height: 400,
                child:PhotoView(imageProvider: AssetImage
                  ('assets/img/kisclothsize.jpg')),),
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
              child: Container(
                height: 400,
                child:PhotoView(imageProvider: AssetImage
                  ('assets/img/teenclothing.jpg')),),
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
                      subtitle: Text(
                        "€  $eur ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
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
    return Column(

      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),

      ],
    );
  }
}

