import 'package:fashow/Categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Categories/Men/Men.dart';
import 'package:fashow/Categories/Women/Women.dart';
import 'package:fashow/fav.dart';
import 'package:flutter/cupertino.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/upload_Ecommerce.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';

class Shop extends StatefulWidget {

  final User currentUser;
  final String prodId;
  final String onwerId;
  Shop({ this.currentUser,
    this.prodId,

    this.onwerId});

  @override
  _ShopState createState() => _ShopState( prodId: this.prodId,ownerId:this.onwerId);
}

class _ShopState extends State<Shop>  with  TickerProviderStateMixin{


  final List<Tabs> _tabs = [new Tabs(title: "Men",color: kPrimaryColor),
    new Tabs(title: "Women",color: kPrimaryColor),
    new Tabs(title: "Baby-Boys",color:kPrimaryColor),
    new Tabs(title: "Baby-Girls",color: kPrimaryColor),
     new Tabs(title: "Kids-Boys",color: kPrimaryColor),
     new Tabs(title: "Kids-Girls",color: kPrimaryColor),
new Tabs(title: "Teen-Boys",color: kPrimaryColor),
new Tabs(title: "Teen-Girls",color: kPrimaryColor),

  ];
  Tabs _myHandler ;
  TabController _controller ;
  void initState() {
    super.initState();
    _controller = new TabController(length: 8, vsync: this);
    _myHandler = _tabs[1];
    _controller.addListener(_handleSelected);
  }
  void _handleSelected() {
    setState(() {
      _myHandler= _tabs[_controller.index];
    });
  }
 final _firestore = Firestore.instance;
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
  _ShopState({
    this.prodId, this.products,this.ownerId,
  });




  @override
  Widget build(BuildContext context) {
    return
      Scaffold(appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(title:  Text('Shop',style: TextStyle(fontSize: 30,fontFamily: 'MajorMonoDisplay'),),
          backgroundColor: kPrimaryColor,

          bottom: new TabBar(
               isScrollable: true,
            controller: _controller,
            tabs: <Widget>[
              FittedBox(
                fit:BoxFit.fitWidth,
                child: Text('Men',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",
                      // fontSize:  MediaQuery.of(context).size.width,
                      color: Colors.white),),
              ),
              FittedBox(
                fit:BoxFit.fitWidth,
                child: Text(   'Women',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),
          FittedBox(
            fit:BoxFit.fitWidth,
                child: Text(   'Baby-Boys',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),
              FittedBox(
                fit:BoxFit.fitWidth,
                child: Text(   'Baby-Girls',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),  FittedBox(
                fit:BoxFit.fitWidth,
                child: Text(   'Kids-Boys',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),
              FittedBox(
                fit:BoxFit.fitWidth,
                child: Text(   'Kids-Girls',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),FittedBox(
                fit:BoxFit.fitWidth,
                child: Text(   'Teen-Boys',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),FittedBox(
                fit:BoxFit.fitWidth,
                child: Text(   'Teen-Girls',
                  style: TextStyle(
                      fontFamily :"MajorMonoDisplay",

                      color: Colors.white),),
              ),
            ],
          ),
          iconTheme: new IconThemeData(color: kIcon),
          actions:<Widget> [
            IconButton(
              color: Colors.white,
              icon: Icon(
               Icons.search,
              ),
              onPressed: () {

                // do something
              },
            ),          IconButton(
              color: Colors.white,
              icon: Icon(
               Icons.favorite,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Fav( currentUser: currentUser?.id)));

                // do something
              },
            ),
          ],
        ),),
//        backgroundColor: kPrimaryColor,

        body:
            TabBarView(
              controller: _controller,
               children: [
                 Container(

                     decoration: BoxDecoration(
                         gradient: fabGradient
                     ) ,
                     alignment: Alignment.center,
                     child: Men()),
Women(),
                 BabyBoy(),
                 BabyGirl(),
                 KidBoy(),
                 KidGirl(),
                 TeenBoy(),
                 TeenGirl(),
            ],
            ),



        floatingActionButton: FloatingActionButton(
          heroTag:'shop',
          backgroundColor: Colors.black38,
          onPressed: (){
            WidgetsBinding.instance.addPostFrameCallback((_){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Uploadecom(currentUser: currentUser, )));
            },) ;    } ,
          child: Icon(Icons.add_box),
        ),
      );
  }
}
class Tabs {
  final String title;
  final Color color;
  Tabs({this.title,this.color});
}

