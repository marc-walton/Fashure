import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';

import 'package:fashow/Product_screen.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/Categories/Men/Accessories.dart';
import 'package:fashow/Categories/Men/Indianethnuc.dart';
import 'package:fashow/Categories/Men/Shirt.dart';
import 'package:fashow/Categories/Men/Tshirtm.dart';
import 'package:fashow/Categories/Men/Coats.dart';
import 'package:fashow/Categories/Men/jacketmen.dart';
import 'package:fashow/Categories/Men/Sweaters & Sweatshirts.dart';
import 'package:fashow/Categories/Men/denim.dart';
import 'package:fashow/Categories/Men/Suits.dart';
import 'package:fashow/Categories/Men/Trousers.dart';
import 'package:fashow/Categories/Men/Shorts.dart';
import 'package:fashow/Categories/Men/Activewear.dart';
import 'package:fashow/Categories/Men/beachwear.dart';
import 'package:fashow/Categories/Men/bags.dart';
import 'package:fashow/Categories/Men/Shoes.dart';
import 'package:fashow/Categories/Men/Sneakers.dart';
import 'package:fashow/Categories/Men/Grooming.dart';
import 'package:fashow/Categories/Men/Jewellery.dart';
import 'package:fashow/Categories/Men/watches.dart';

import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
class Men extends StatefulWidget {
  @override
  _MenState createState() => _MenState();
}

class _MenState extends State<Men> with  TickerProviderStateMixin {
  TabController _Tabcontroller ;

  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
    _Tabcontroller = new TabController(length: 20, vsync: this,initialIndex: 0);

    // _mainHandler = _maintabs[0];
    _Tabcontroller.addListener(_handleTabIndex);
  }
  @override
  void dispose() {
    _Tabcontroller.removeListener(_handleTabIndex);
    _Tabcontroller.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {    _Tabcontroller.index == 14?shoesIndex = true:shoesIndex = false;
    _Tabcontroller.index == 18?ringIndex = true:ringIndex = false;
    _Tabcontroller.index == 14||_Tabcontroller.index == 18?clothingIndex = false:clothingIndex = true;
    });
  }

All(){
  return PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(AQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
        String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['productname'];
       var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        return
          Container(
height: MediaQuery.of(context).size.height,
 width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  ),

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
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Text(productname, style: TextStyle(
                      color: kText,
                      ),),
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                    "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),



            // GridView.count(
            //   crossAxisCount: 2,
            //     childAspectRatio: (0.1 / .4),
            //
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   children:
            //     searchResults
            // ),
          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')

          :
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')

          :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "highS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0S$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):

      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Men')





  );
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
  return
      RotatedBox(
        quarterTurns: 1,
        child: Expanded(
          child: Scaffold(

           appBar:tabs? AppBar(
              toolbarHeight: SizeConfig.screenWidth * 0.3,
              backgroundColor: kPrimaryColor,
              elevation: 0,
              bottom:  PreferredSize(
              preferredSize: Size.fromHeight(100.0),

                child: Container(
                height: SizeConfig.safeBlockHorizontal * 30,
                  child: TabBar(
                    controller: _Tabcontroller,

                    isScrollable: true,

                    ///filled
                    labelStyle:TextStyle(fontFamily: "AlteroDCURegular",color: Colors.white ),
                    ///outline
                    unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU",color: Colors.white  ),
                    tabs:[
                      RotatedBox(quarterTurns:3,child: Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,),)),

                      RotatedBox(quarterTurns:3,child: Text("Shirts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,),)),
                      RotatedBox(quarterTurns:3,child: Text("Casual Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Sweatshirts &  Sweaters",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Suits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Activewear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Beach & Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Bags",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Sneakers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Grooming",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Jewellery",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                      RotatedBox(quarterTurns:3,child: Text("Watches",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4),)),
                    ],
                  ),
                ),
              ),
            ):null,

            body: Container(
              // color:Colors.grey.shade200,
              child: RotatedBox(
                    quarterTurns: 3,
                    child: TabBarView(
                        controller: _Tabcontroller,

                        children:<Widget> [
                          All(),
                          IndianM(),
                          ShirtM(),
                          TshirtM(),
                          CoatsM(),
                          JacketM(),
                          SweaterM(),
                          DenimM(),
                          SuitsM(),
                          TrouserM(),
                          ShortsM(),
                          ActiveWear(),
                          BeachwearM(),
                          Bags(),
                          ShoesM(),
                          SneakersM(),
                          Accessories(),
                          GroomingM(),
                          JewelleryM(),
                          WatchesM(),

                        ]),
                  ),
            ),
          ),
        ),
      );}




}
