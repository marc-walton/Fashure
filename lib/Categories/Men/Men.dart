import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:intl/intl.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/Products.dart';
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
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:share/share.dart';

class Men extends StatefulWidget {
  @override
  _MenState createState() => _MenState();
}

class _MenState extends State<Men> {
bool a = true;
bool b= false;
bool c = true;


  all() {
    return InkWell(
      onTap: () {
        priceQuery = "0";
        AQuery = "A0";
        BQuery = "B0";
        CQuery = "C0";
        DQuery = "D0";
        EQuery = "E0";
        FQuery = "F0";
        GQuery = "G0";
        HQuery = "H0";
        IQuery = "I0";
        JQuery = "J0";
        KQuery = "K0";
        LQuery = "L0";
         MQuery = "M0";
         NQuery = "N0";
         OQuery = "O0";
         PQuery = "P0";
         QQuery = "Q0";
         RQuery = "R0";
         SQuery = "S0";

      },
      child: Container(
        color: priceQuery == "0"?kPrimaryColor:Colors.white,

        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  'All',
                )),
          ],
        ),
      ),
    );
  }
low() {
    return InkWell(
      onTap: () {
        priceQuery = "low";
        AQuery = "Alow";
        BQuery = "Blow";
        CQuery = "Clow";
        DQuery = "Dlow";
        EQuery = "Elow";
        FQuery = "Flow";
        GQuery = "Glow";
        HQuery = "Hlow";
        IQuery = "Ilow";
        JQuery = "Jlow";
        KQuery = "Klow";
        LQuery = "Llow";
        MQuery = "Mlow";
        NQuery = "Nlow";
        OQuery = "Olow";
        PQuery = "Plow";
        QQuery = "Qlow";
        RQuery = "Rlow";
        SQuery = "Slow";

      },
      child: Container(
        color: priceQuery == "low"?kPrimaryColor:Colors.white,

        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  'Low to high',
                )),
          ],
        ),
      ),
    );
  }
   high() {
    return InkWell(
      onTap: () {
        priceQuery = "high";
        AQuery = "Ahigh";
        BQuery = "Bhigh";
        CQuery = "Chigh";
        DQuery = "Dhigh";
        EQuery = "Ehigh";
        FQuery = "Fhigh";
        GQuery = "Ghigh";
        HQuery = "Hhigh";
        IQuery = "Ihigh";
        JQuery = "Jhigh";
        KQuery = "Khigh";
        LQuery = "Lhigh";
        MQuery = "Mhigh";
        NQuery = "Nhigh";
        OQuery = "Ohigh";
        PQuery = "Phigh";
        QQuery = "Qhigh";
        RQuery = "Rhigh";
        SQuery = "Shigh";


      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  'High to low',
                )),
          ],
        ),
      ),
    );
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
        String displayName = documentSnapshot.data()['displayName'];
        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['prodId'];
        List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

        List<CItem> searchResults = [];

        Prod prod = Prod.fromDocument(documentSnapshot);
        CItem searchResult = CItem(prod);
        searchResults.add(searchResult);

        print(priceQuery);
        return
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Card(
                child:Column(
                  children: <Widget>[

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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child:CachedImage(shopmediaUrl.first),),),
                    GestureDetector(
                      onTap: () => showProfile(context, profileId: ownerId),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children:[
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(photoUrl),
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(width: 7.0,),
                          Text(
                            displayName,
                            style: TextStyle(
                              color: kText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),

                    ),

                    Column(

                      children: searchResults,

                    ),
                  ],

                ),
              ),
            ),
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

          :

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
          child: DefaultTabController(
              length:20,
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

                        isScrollable: true,

                        ///filled
                        labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
                        ///outline
                        unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
                        tabs:[
                          RotatedBox(quarterTurns:3,child: Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3,))),
                          RotatedBox(quarterTurns:3,child: Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3,),)),

                          Text("Shirts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8,),),
                          Text("Casual Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Sweatshirts & Sweaters",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Suits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Activewear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Beach & Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Bags",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Sneakers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Grooming",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Jewellery",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                          Text("Watches",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        ],
                      ),
                    ),
                  ),
                ):null,

                body: Container(
                  color:Colors.grey.shade200,
                  child: RotatedBox(
                        quarterTurns: 3,
                        child: TabBarView(

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
              )
          ),
        ),
      );}




}
class CItem extends StatefulWidget {
  final Prod prod;
  String products;
  CItem(this.prod);
  @override
  _CItemState createState() => _CItemState(this.prod);
}

class _CItemState extends State<CItem> {
  final Prod prod;
  String products;
  int client;
  var price = 0.0;


  var currencyFormatter = currentUser.countryISO == 'US'?NumberFormat('#,##0.00', ):NumberFormat('#,##0.00', '${currentUser.countryISO}');

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _CItemState(this.prod);
  @override
  void initState() {
    super.initState();

    conversion();

  }
  conversion()async{

    if(currentUser.currencyISO == "USD") {
  setState(() {

    price =prod.usd ;

  }); }
  else {
  var resultUSD1 = await Currency.getConversion(
      from: 'USD', to: '${currentUser.currencyISO}', amount: prod.usd.toString());
  setState(() {
    price = resultUSD1.rate;
  });
}


  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          margin:
          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[


              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                title:            Text(prod.productname, style: TextStyle(
                    color: kText,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold),),
                subtitle:    currentUser.country == prod.country?
    Text( " ${currentUser.currencysym} ${ currencyFormatter.format(prod.inr)}",style: TextStyle(color: kText,
    fontSize: SizeConfig.safeBlockHorizontal * 4,
    fontWeight: FontWeight.bold)) :
                Text( " ${currentUser.currencysym} ${currencyFormatter.format(price)}",style: TextStyle(color: kText,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.bold)),

              ),


              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),

      ],
    );
  }
}