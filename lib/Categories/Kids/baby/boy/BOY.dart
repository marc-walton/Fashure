import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/Categories/Kids/baby/boy/Accessories.dart';
import 'package:fashow/Categories/Kids/baby/boy/Babysuits.dart';
import 'package:fashow/Categories/Kids/baby/boy/Coats and Jackets.dart';
import 'package:fashow/Categories/Kids/baby/boy/knitwear.dart';
import 'package:fashow/Categories/Kids/baby/boy/Shoes.dart';
import 'package:fashow/Categories/Kids/baby/boy/Shorts.dart';
import 'package:fashow/Categories/Kids/baby/boy/Swimwear.dart';
import 'package:fashow/Categories/Kids/baby/boy/Tops.dart';
import 'package:fashow/Categories/Kids/baby/boy/Tracks.dart';
import 'package:fashow/Categories/Kids/baby/boy/Trousers.dart';
import 'package:fashow/Categories/Kids/baby/boy/ETHNIC.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';

import 'package:fashow/Product_screen.dart';

import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';

class BabyBoy extends StatefulWidget {
  @override
  _BabyBoyState createState() => _BabyBoyState();
}

class _BabyBoyState extends State<BabyBoy> with  TickerProviderStateMixin {
  TabController _Tabcontroller ;


  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
      _Tabcontroller = new TabController(length: 12, vsync: this,initialIndex: 0);

    // _mainHandler = _maintabs[0];
    _Tabcontroller.addListener(_handleTabIndex);
    _Tabcontroller.index == 10?shoesIndex = true:clothingIndex = true;
  }
  void _handleTabIndex() {
    setState(() {});
  }

  Allin(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
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
        Map likes =  documentSnapshot.data()['likes'];
        bool _isLiked = likes[currentUser.id] == true;
        bool isLiked;
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
                                FutureBuilder(
              future: usersRef.doc(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
                return
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          user.username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  );

              },
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

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                      Spacer(),
                      
                    ],
                  ),

                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );   
        },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          :
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          
          :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0S$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "highS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userProducts')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          ,

    );
  }
 

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  RotatedBox(
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
                   RotatedBox(quarterTurns:3,child: Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Babysuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Coast & Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Tracksuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                   RotatedBox(quarterTurns:3,child: Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                  ],
                ),
              ),
            ),
          ):null,

          body: Container(
            child: RotatedBox(
              quarterTurns: 3,
              child: TabBarView(
                  controller: _Tabcontroller,

                  children:<Widget> [
                    Allin(),
                    BBEthnic(),
                    BabysB(),
                    BabyCB(),
                    BabykB(),
                    BabyshB(),
                    BabyswB(),
                    BabytB(),
                    BabytrB(),
                    BabytuB(),
                    BabySB(),
                    BabyAcB(),

                  ]),
            ),
          ),
        ),
      ),
    );

  }
}
