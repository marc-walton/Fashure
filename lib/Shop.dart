import 'package:fashow/Categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Categories/Men/Men.dart';
import 'package:fashow/Categories/Women/Women.dart';
import 'package:fashow/DesignerShop.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Resale/Resale.dart';
import 'package:fashow/Resale/upload_resale.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/fav.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:get/get.dart';

import 'package:fashow/shop_search.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/upload_Ecommerce.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Shop extends StatefulWidget {

  final Users currentUser;
  final String prodId;
  final String onwerId;
  Shop({ this.currentUser,
    this.prodId,

    this.onwerId});

  @override
  _ShopState createState() => _ShopState( prodId: this.prodId,ownerId:this.onwerId);
}

class _ShopState extends State<Shop>  with  TickerProviderStateMixin{

  //
  //   final List<Tabs> _maintabs = [new Tabs(title: "Shop",color: kPrimaryColor),
  //   new Tabs(title: "Resale",color: kPrimaryColor),
  //
  // ];
  //
  // Tabs _mainHandler ;

  TabController _Tabcontroller ;

  void initState() {
    super.initState();
 _Tabcontroller = new TabController(length: 2, vsync: this,initialIndex: 0);

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
      setState(() {});
    }

  //   void _mainHandleSelected() {
  //   setState(() {
  //     _mainHandler= _maintabs[_Tabcontroller.index];
  //   });
  // }
 final _firestore = FirebaseFirestore.instance;
  String postOrientation = "grid";
 double listViewOffset=0.0;
  String shopOrientation = "grid";
  bool isFollowing = false;
  bool isLoading = false;
  String uid="";
  String prodId;
  String ownerId;
  Prod products;
 List<String> followingList = [];
 Filter filter;
  _ShopState({
    this.prodId, this.products,this.ownerId,
  });




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      Scaffold(appBar: AppBar(title:  Text('Shop',style: TextStyle(fontSize: 30,fontFamily: 'MajorMonoDisplay'),),
        backgroundColor: Colors.black,

        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            height: 80.0,
            child: new TabBar(
controller: _Tabcontroller,
              ///filled
              labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
              ///outline
              unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
                 isScrollable: true,
              tabs: <Widget>[
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text('Men',
                    style: TextStyle(

                   fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Women',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),

              ],
            ),
          ),
        ),
        iconTheme: new IconThemeData(color: kIcon),
        actions:<Widget> [
           IconButton(
            color: Colors.white,
            icon: Icon(
             Icons.search,
            ),
            onPressed: () {
              Get.to (ShopSearch());
              tabs = !tabs ;


              // do something
            },
          ),          IconButton(
            color: Colors.white,
            icon: Icon(
             Icons.favorite,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Fav( currentUser: currentUser?.id)));
              tabs = !tabs ;

              // do something
            },
          ),
        ],
      ),
//        backgroundColor: kPrimaryColor,

        body:
        TabBarView(
          controller: _Tabcontroller,

          children: [
            DesignerShop(),
DFF(),


          ],
        ),



        floatingActionButton: _bottomButtons()
      );
  }
  Widget _bottomButtons() {
    if(_Tabcontroller.index == 0){return
      FloatingActionButton(
        heroTag:'shop',
        backgroundColor: Colors.black38,
        onPressed: (){
          WidgetsBinding.instance.addPostFrameCallback((_){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Uploadecom(currentUser:currentUser))) .then((value) {
              setState(() {});
            });
          },) ;    } ,
        child: Icon(Icons.add_box),
      );}
    else if(_Tabcontroller.index == 1){return
      FloatingActionButton(
        heroTag:'resale',
        backgroundColor: Colors.black38,
        onPressed: (){
          WidgetsBinding.instance.addPostFrameCallback((_){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadResale())) .then((value) {
              setState(() {});
            });
          },) ;    } ,
        child: Icon(Icons.add_box),
      );}

  }

}
// class Tabs {
//   final String title;
//   final Color color;
//   Tabs({this.title,this.color});
// }

class Filter{
  bool category= false;
  String price;
  Filter({this.category,this.price});
}

DFF(){
  return
Scaffold(
  body:   FutureBuilder(

    future:    FirebaseFirestore.instance.collection('Resale')

        .doc(currentUser.id)

        .collection('userResale').get(),

    builder: (context,snapshot)

    {



      return

        ListView.builder(physics: NeverScrollableScrollPhysics(),

    shrinkWrap: true,

    scrollDirection:Axis.vertical,

    itemCount: snapshot.data.docs.length,

    itemBuilder: (BuildContext context, int index) {

          return Container(

            child: CachedImage( snapshot.data.docs[index].data()['images']

              .first,

          ));



    });

    },



  ),
);
}