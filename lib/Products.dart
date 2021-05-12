import 'package:fashow/model/addressbuynow.dart';
import 'package:fashow/payments/Buynow.dart';
import 'package:fashow/payments/payment.dart';
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
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/model/address.dart';
import 'package:fashow/user.dart';
import 'package:fashow/main.dart';

import 'package:fashow/progress.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Profile.dart';
import 'package:get/get.dart';
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
    // this.selectedSizes,

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
    this.photoUrl,
    this.currentUser,
  });

  factory Prod.fromDocument(DocumentSnapshot doc) {
//    Map data = doc.data ;

    return Prod(
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
      likes: doc['likes'],
        photoUrl:doc['photoUrl'],
        freesize:doc['freesizeQuantity'],
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
  int likeCount;
  Map likes;
  bool isLiked;
  bool isfav;
  bool showHeart = false;
  bool details1 = true;


  _ProdState({
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
    this.likes,
    this.likeCount,
    this.photoUrl,
  });


  void initState() {
    // initialize controller
    // parse();

    super.initState();
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
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'UK'){
  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'China'){
  Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'USA'){
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  {
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
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
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else if (currentUser.country == 'China'){
              Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
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
         setState(() async {

           usersize = 'XXS';
         });

         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'China'){
           Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'XS';
          });

          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
         setState(() async {

           usersize = 'S';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'China'){
           Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
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
         setState(() async {

           usersize = 'M';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'China'){
           Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'L';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'XXL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'XXXL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '4XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '5XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '6XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '7XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '8XL';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
  setState(() async {

  usersize = '(US)3-1/2';
  });
  if (currentUser.country == 'India'){
  Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'UK'){
  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'China'){
  Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'USA'){
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  {
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
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
       setState(() async {

         usersize = '(US)4';
       });
       if (currentUser.country == 'India'){
         Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else if (currentUser.country == 'UK'){
         Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else if (currentUser.country == 'China'){
         Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else  if (currentUser.country == 'Europe'){
         Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else  if (currentUser.country == 'USA'){
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else  {
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
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
  setState(() async {

  usersize = '(US)4-1/2';
  });
  if (currentUser.country == 'India'){
  Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'UK'){
  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'China'){
  Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'USA'){
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  {
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
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
         setState(() async {

           usersize = '(US)5';
         });
         if (currentUser.country == 'India'){
           Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'UK'){
           Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else if (currentUser.country == 'China'){
           Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'Europe'){
           Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  if (currentUser.country == 'USA'){
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
               productname:productname);
         }
         else  {
           Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
               username: username,
               mediaUrl: shopmediaUrl,
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
        setState(() async {

          usersize = '(US)5-1/2';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'China'){
          Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)6';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)6-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
        setState(() async {

          usersize = '(US)7';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'China'){
          Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)7-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
        setState(() async {

          usersize = '(US)8';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'China'){
          Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)8-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)9';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
        setState(() async {

          usersize = '(US)9-1/2';
        });
        if (currentUser.country == 'India'){
          Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'UK'){
          Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else if (currentUser.country == 'China'){
          Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'Europe'){
          Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  if (currentUser.country == 'USA'){
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
              productname:productname);
        }
        else  {
          Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
              username: username,
              mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)10';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)10-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)11';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)11-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)12';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)12-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
  setState(() async {

  usersize = '(US)13';
  });
  if (currentUser.country == 'India'){
  Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'UK'){
  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else if (currentUser.country == 'China'){
  Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'Europe'){
  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  if (currentUser.country == 'USA'){
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
  productname:productname);
  }
  else  {
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
  username: username,
  mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '(US)13-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '5';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '5-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '6';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '6-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '7';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '7-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '8';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '8-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '9';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '9-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '10';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '10-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '12';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '13';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '14';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '15-1/2';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '0-3 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '3-6 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
       setState(() async {

         usersize = '6-9 M';
       });
       if (currentUser.country == 'India'){
         Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else if (currentUser.country == 'UK'){
         Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else if (currentUser.country == 'China'){
         Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else  if (currentUser.country == 'Europe'){
         Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else  if (currentUser.country == 'USA'){
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
             productname:productname);
       }
       else  {
         Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
             username: username,
             mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '9-12 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '12-18 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '18-24 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 0-3 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 3-6 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '6 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '9 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 9-12 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 12-18 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 18-24 M';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '3-4 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '4-5 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '5-6 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '6-7 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '7-8 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '8-9 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '9-10 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '10-11 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '11-12 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
            setState(() async {

              usersize = '2-1/2 Y';
            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else if (currentUser.country == 'China'){
              Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '3 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '3-1/2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '4 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '5 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '6 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '7 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '8 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '8-1/2 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '9 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '10 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '11 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '12 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
            setState(() async {

              usersize = '13 Y';
            });
            if (currentUser.country == 'India'){
              Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else if (currentUser.country == 'UK'){
              Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else if (currentUser.country == 'China'){
              Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  if (currentUser.country == 'Europe'){
              Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  if (currentUser.country == 'USA'){
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
                  productname:productname);
            }
            else  {
              Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                  username: username,
                  mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '14 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '15 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = '16 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 13 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 14 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 15 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          setState(() async {

            usersize = 'S 16 Y';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
    if(gender=='Men'){
      if(mto==0){
        return
            Container();
      }
      else{  return
        ExpansionTile(
          title: Text('Made-to-order',style:TextStyle(color:kText)),
          maintainState:true,
          children: [
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO XXXS';

                });
                if (currentUser.country == 'India'){
                  Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else if (currentUser.country == 'UK'){
                  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else if (currentUser.country == 'China'){
                  Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else  if (currentUser.country == 'Europe'){
                  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else  if (currentUser.country == 'USA'){
                  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else  {
                  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('XXXS',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
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
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else if (currentUser.country == 'UK'){
                  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else if (currentUser.country == 'China'){
                  Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else  if (currentUser.country == 'Europe'){
                  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else  if (currentUser.country == 'USA'){
                  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
                else  {
                  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                      username: username,
                      mediaUrl: shopmediaUrl,
                      productname:productname);
                }
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('XXS',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO XS';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('XS',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO S';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('S',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO M';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('M',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO L';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('L',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO XL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('XL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO XXL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('XXL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO XXXL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('XXXL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO 4XL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('4XL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO 5XL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('5XL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO 6XL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('6XL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO 7XL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('7XL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {

                  usersize = 'MTO 8XL';
                  if (currentUser.country == 'India'){
                    Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'UK'){
                    Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else if (currentUser.country == 'China'){
                    Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'Europe'){
                    Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  if (currentUser.country == 'USA'){
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }
                  else  {
                    Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname:productname);
                  }                });
              },
              child: Container(

                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                    ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 40,
                width: 40,
                child: Text('8XL',  style: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),




          ],
        );}

    }
    else if(gender=='Women'){
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO XXXS';
                  });
                  if (currentUser.country == 'India') {
                    Proceedtobuy(total: inr,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'UK') {
                    Proceedtobuy(total: gbp,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'China') {
                    Proceedtobuy(total: cny,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'Europe') {
                    Proceedtobuy(total: eur,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'USA') {
                    Proceedtobuy(total: usd,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else {
                    Proceedtobuy(total: usd,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('XXXS', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO XXS';
                  });
                  if (currentUser.country == 'India') {
                    Proceedtobuy(total: inr,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'UK') {
                    Proceedtobuy(total: gbp,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'China') {
                    Proceedtobuy(total: cny,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'Europe') {
                    Proceedtobuy(total: eur,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else if (currentUser.country == 'USA') {
                    Proceedtobuy(total: usd,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                  else {
                    Proceedtobuy(total: usd,
                        prodId: prodId,
                        ownerId: ownerId,
                        userSize: usersize,
                        profileimg: photoUrl,
                        username: username,
                        mediaUrl: shopmediaUrl,
                        productname: productname);
                  }
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('XXS', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO XS';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('XS', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO S';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('S', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO L';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('L', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO XL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('XL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO XXL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('XXL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO XXXL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('XXXL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 4XL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('4XL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 5XL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('5XL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 6XL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('6XL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 7XL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('7XL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 8XL';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('8XL', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),


            ],
          );
      }
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
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 0-3 M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('0-3 M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 3-6 M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('3-6 M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 6-9 M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('6-9 M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 9-12 M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('9-12 M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 12-18 M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('12-18 M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 18-24 M';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('18-24 M', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),

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
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 2 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('2 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 3-4 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('3-4 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 4-5 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('4-5 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 5-6 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('5-6 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 6-7 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('6-7 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 7-8 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('7-8 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 8-9 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('8-9 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 9-10 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('9-10 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 10-11 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('10-11 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 11-12 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('11-12 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),

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
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 13 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('13 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 14 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('14 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 15 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('15 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    usersize = 'MTO 16 Y';
                    if (currentUser.country == 'India') {
                      Proceedtobuy(total: inr,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'UK') {
                      Proceedtobuy(total: gbp,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'China') {
                      Proceedtobuy(total: cny,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'Europe') {
                      Proceedtobuy(total: eur,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else if (currentUser.country == 'USA') {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                    else {
                      Proceedtobuy(total: usd,
                          prodId: prodId,
                          ownerId: ownerId,
                          userSize: usersize,
                          profileimg: photoUrl,
                          username: username,
                          mediaUrl: shopmediaUrl,
                          productname: productname);
                    }
                  });
                },
                child: Container(

                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                      ]
                      , borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  height: 40,
                  width: 40,
                  child: Text('16 Y', style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),

            ],
          );
      }
    }
  }
  MEASUREMENTS(){
    return
      GestureDetector(
        onTap: (){
          setState(() async {

            usersize = 'Send Measurements(Seller will contact you)';
          });
          if (currentUser.country == 'India'){
            Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'UK'){
            Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else if (currentUser.country == 'China'){
            Proceedtobuy(total:cny,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'Europe'){
            Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  if (currentUser.country == 'USA'){
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
                productname:productname);
          }
          else  {
            Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
                username: username,
                mediaUrl: shopmediaUrl,
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
          height: 12,
          width: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              FittedBox(child: Text('Send Measurements(Contact client for Measurements)',style: TextStyle(color: Colors.white,fontSize: 8),)),


            ],
          ),
        ),
      );
  }
MenSizes(){
 return
     Expanded(child:Container(

       child: ListView(
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

    )));


    // Get.to(AddressBuy(Amount:total,Size: userSize,OwnerId: ownerId,prodId:prodId ,
    //   profileimg: profileimg ,
    //   username: username,
    //   mediaUrl: mediaUrl,
    //     productname:productname));


  }
  Buynow(parentContext) {
    if (gender == 'Men') {
      return
        showModalBottomSheet(
            backgroundColor: kSecondaryColor,
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
// BottomBar(){
//     return
//         BottomAppBar(
//           color: Colors.transparent,
//           child: Row(
//             children: [
//               RaisedButton(
//                 onPressed: ()=>addToCart(),
//                 color: kblue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0)
//                 ),
//                 child: Text('ADD TO CART', style: TextStyle(color: kText),),
//               ), RaisedButton(
//                 onPressed:()=>Buynow(),
//                 color: kblue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0)
//                 ),
//                 child: Text('BUY NOW', style: TextStyle(color: kText),),
//               ),
//             ],
//           ),
//         );
// }
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

  cartfirestore(){
  cartRef.document(currentUser.id).collection("userCart").document(prodId).setData({
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
    "productname":productname,
    "shopmediaUrl":shopmediaUrl,
    "userSize":usersize,
  });
}
  // addToCart() {
  //
  //  if(gender=='Men'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 InteractiveViewer(
  //                   child: Container(
  //                     height:  MediaQuery.of(context).size.height * 0.20,
  //                      width:  MediaQuery.of(context).size.width ,
  //
  //                     child: Image.asset('assets/img/MenClothingsize.jpg') ,
  //                   ),
  //                 );
  //               },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Women'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 InteractiveViewer(
  //                   child: Container(
  //                     height:  MediaQuery.of(context).size.height * 0.20,
  //                     width:  MediaQuery.of(context).size.width ,
  //
  //                     child: Image.asset('assets/img/WomanClothingsize.jpg') ,
  //                   ),
  //                 );
  //               },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Baby-Boys'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 InteractiveViewer(
  //                   child: Container(
  //                     height:  MediaQuery.of(context).size.height * 0.20,
  //                     width:  MediaQuery.of(context).size.width ,
  //
  //                     child: Image.asset('assets/img/babysizecloth.jpg') ,
  //                   ),
  //                 );
  //               },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Baby-Girls'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () {  InteractiveViewer(
  //                 child: Container(
  //                   height:  MediaQuery.of(context).size.height * 0.20,
  //                   width:  MediaQuery.of(context).size.width ,
  //
  //                   child: Image.asset('assets/img/babysizecloth.jpg') ,
  //                 ),
  //               ); },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Kids-Boys'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 InteractiveViewer(
  //                 child: Container(
  //                   height:  MediaQuery.of(context).size.height * 0.20,
  //                   width:  MediaQuery.of(context).size.width ,
  //
  //                   child: Image.asset('assets/img/kisclothsize.jpg') ,
  //                 ),
  //               ); },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Kids-Girls'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () { InteractiveViewer(
  //                 child: Container(
  //                   height:  MediaQuery.of(context).size.height * 0.20,
  //                   width:  MediaQuery.of(context).size.width ,
  //
  //                   child: Image.asset('assets/img/kisclothsize.jpg') ,
  //                 ),
  //               ); },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Teen-Boys'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () { InteractiveViewer(
  //                 child: Container(
  //                   height:  MediaQuery.of(context).size.height * 0.20,
  //                   width:  MediaQuery.of(context).size.width ,
  //
  //                   child: Image.asset('assets/img/teenclothing.jpg') ,
  //                 ),
  //               ); },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //  else if(gender=='Teen-Girls'){
  //     showModalBottomSheet(
  //         backgroundColor:kSecondaryColor,
  //         context:context,
  //         builder: (BuildContext context)
  //     {
  //       return
  //         Row(
  //           children: [
  //             RaisedButton(
  //               // ignore: unnecessary_statements
  //               onPressed: (){
  //                 SizeSelect;
  //                 cartfirestore();
  //                 final snackBar = SnackBar(
  //                   content: Text('Added to Cart!'),
  //                   action: SnackBarAction(
  //                     // label: 'Undo',
  //                     // onPressed: () {
  //                     //   // Some code to undo the change.
  //                     // },
  //                   ),
  //                 );
  //
  //                 // Find the Scaffold in the widget tree and use
  //                 // it to show a SnackBar.
  //                 Scaffold.of(context).showSnackBar(snackBar);
  //               },
  //               color: kblue,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(18.0)
  //               ),
  //               child: Text('Select Size', style: TextStyle(color: kText),),
  //             ),
  //             GestureDetector(
  //               onTap: () {InteractiveViewer(
  //                 child: Container(
  //                   height:  MediaQuery.of(context).size.height * 0.20,
  //                   width:  MediaQuery.of(context).size.width ,
  //
  //                   child: Image.asset('assets/img/teenclothing.jpg') ,
  //                 ),
  //               ); },
  //               child: ListTile(
  //
  //                 trailing: Column(children: [
  //                   FaIcon(FontAwesomeIcons.rulerCombined),
  //                   Text('Size Guide', style: TextStyle(color: kText),),
  //                 ],),
  //               ),
  //             ),
  //           ],
  //         );
  //
  //   }
  //     );
  //  }
  //
  //
  // }
  handleLikePost() {
    bool _isFav = true;
    if(_isFav) {
      favRef.document(currentUser.id).collection("userFav")
          .document(prodId)
          .setData({
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
        "shopmediaUrl": shopmediaUrl,
      });
      setState(() {

        isfav = false;
//        likes[currentUserId] = false;
      });
    } else if (!_isFav) {
      var docReference = favRef.document(currentUser.id).collection("userFav").document(prodId);
      docReference.delete();

    }
      else{
      var docReference = favRef.document(currentUser.id).collection("userFav").document(prodId);
      docReference.delete();

    }
    handleLikePost();
  }
  reviews() {
    showModalBottomSheet(
        backgroundColor: kSecondaryColor,
        context: context,
        builder: (BuildContext context) {

          return  PaginateFirestore(
//    itemsPerPage: 2,
              itemBuilderType:
              PaginateBuilderType.listView,
              itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
                String ownerId = documentSnapshot.data['userId'];
                var rating =   documentSnapshot.data['rating'];
                String review  = documentSnapshot.data['review'];

                return
                  FutureBuilder(
                    future: usersRef.document(ownerId).get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return circularProgress();
                      }
                      User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                      return Column(
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
                              subtitle: Text(user.username,
                                style: TextStyle(color: kIcon),),),
                          ),
                          SmoothStarRating(
                            isReadOnly: true,
                            filledIconData: Icons.blur_off,
                            halfFilledIconData: Icons.blur_on,
                            rating: rating,
                            size: 35,
                            starCount: 5,

                          ),
                          SizedBox(height: 8.0,),
                          Text(review,style: TextStyle(color: Colors.white),),
                          Divider(color: kGrey,),
                        ],

                      );

                    },
                  );
              },
              query: Firestore.instance.collection('Reviews').document(prodId)
                  .collection('prodReviews').orderBy('timestamp',descending: true)


          );

        });
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


          GestureDetector(
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
                      height: MediaQuery.of(context).size.height * 0.65,

                      width:     MediaQuery.of(context).size.width,
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: cachedNetworkImage(shopmediaUrl)))),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child:   ListTile(
                    leading:FloatingActionButton(
                      mini: true,
                      backgroundColor:kText.withOpacity(0.5),
                      child:Icon(Icons.arrow_back_ios,color: kText,),
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
                        }),

                  ),
                ),
              ),
            ],
          ),
      ),




      ],
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
                      color: kText,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: Colors.white,
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
                          color: kText,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color: kText) ,),
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
                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      ):null,
                    ),
                  ),

                ],
              ),
              ListTileTheme(
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                          Text('', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
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


                  GestureDetector(
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
                                height: MediaQuery.of(context).size.height * 0.65,

                                width:     MediaQuery.of(context).size.width,
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: cachedNetworkImage(shopmediaUrl)))),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child:   ListTile(
                              leading:FloatingActionButton(
                                mini: true,
                                backgroundColor:kText.withOpacity(0.5),
                                child:Icon(Icons.arrow_back_ios,color: kText,),
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
                                  }),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),




                ],
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
                      color: kText,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: Colors.white,
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
                          color: kText,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color: kText) ,),
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
                        "€  $inr ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      trailing: !isPostOwner? FloatingActionButton(
                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      ):null,
                    ),
                  ),

                ],
              ),
              ListTileTheme(
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                          Text('', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
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


                  GestureDetector(
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
                                height: MediaQuery.of(context).size.height * 0.65,

                                width:     MediaQuery.of(context).size.width,
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: cachedNetworkImage(shopmediaUrl)))),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child:   ListTile(
                              leading:FloatingActionButton(
                                mini: true,
                                backgroundColor:kText.withOpacity(0.5),
                                child:Icon(Icons.arrow_back_ios,color: kText,),
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
                                  }),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),




                ],
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
                      color: kText,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: Colors.white,
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
                          color: kText,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color: kText) ,),
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
                        "£  $inr ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      trailing: !isPostOwner? FloatingActionButton(
                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      ):null,
                    ),
                  ),

                ],
              ),
              ListTileTheme(
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                          Text('', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
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


                  GestureDetector(
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
                                height: MediaQuery.of(context).size.height * 0.65,

                                width:     MediaQuery.of(context).size.width,
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: cachedNetworkImage(shopmediaUrl)))),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child:   ListTile(
                              leading:FloatingActionButton(
                                mini: true,
                                backgroundColor:kText.withOpacity(0.5),
                                child:Icon(Icons.arrow_back_ios,color: kText,),
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
                                  }),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),




                ],
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
                      color: kText,
                    ),
                  ),
                  Container(
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color: Colors.white,
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
                          color: kText,
                        ),
                        SizedBox(width: 3.0,),
                      ],
                    ),


                  ),
                  Text('Rating' ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[   FloatingActionButton.extended(
                  backgroundColor: kblue,
                  onPressed: ()=>sizeGuide(),
                  label: Text('Size Guide',style:TextStyle(color: kText) ,),
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
                        onPressed: () => Buynow(context),
                        child: Icon(Icons.add_shopping_cart,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      ):null,
                    ),
                  ),

                ],
              ),
              ListTileTheme(
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                tileColor:kPrimaryColor,
                child: ExpansionTile(
                  backgroundColor:kSecondaryColor,
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
                          Text('', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
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

  addToFav() {
    bool _isLiked = likes[currentUser.id] == true;

    if (_isLiked) {

      var docReference = favRef.document(currentUser.id).collection("userFav").document(prodId);
      docReference.delete();

      productsRef
          .document(ownerId)
          .collection('userProducts')
          .document(prodId)
          .updateData({'likes.${currentUser.id}': false});
      removeLikeFromActivityFeed();
       setState(() {
         likeCount -= 1;
         isfav = false;
         likes[currentUser.id] = false;
       });
    } else if (!_isLiked) {
      favRef.document(currentUser.id).collection("userFav")
          .document(prodId)
          .setData({
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
        "shopmediaUrl": shopmediaUrl,
      });
      productsRef
          .document(ownerId)
          .collection('userProducts')
          .document(prodId)
          .updateData({'likes.${currentUser.id}': true});
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
          .document(ownerId)
          .collection("feedItems")
          .document(prodId)
          .setData({
        "type": "fav",
        "username": currentUser.username,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": prodId,
        "mediaUrl": shopmediaUrl,
        "timestamp": timestamp,
      });
    }
  }

  removeLikeFromActivityFeed() {
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .document(ownerId)
          .collection("feedItems")
          .document(prodId)
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
//        buildPostImage(),
//        buildPostFooter(),
      ],
    );
  }
}

