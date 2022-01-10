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
import 'package:fashow/Resale/ResaleShop.dart';
import 'package:fashow/Resale/Wishlist.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/Resale/resale_search.dart';
import 'package:fashow/Resale/upload_resale.dart';
import 'package:fashow/Resale/userCart.dart';
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
 // Filter filter;
  _ShopState({
    this.prodId, this.products,this.ownerId,
  });




  @override
  Widget build(BuildContext context) {
    return
      Scaffold(appBar: AppBar(title:  Text('Shop',style: TextStyle(fontSize: 30,fontFamily: 'MajorMonoDisplay'),),
        backgroundColor: Colors.black,

        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(80.0),
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

                   // fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Women',
                    style: TextStyle(

                        // fontSize:    SizeConfig.blockSizeHorizontal*4,
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
               _Tabcontroller.index == 0 ? Get.to (ShopSearch()):Get.to (ResaleSearch());
              tabs = !tabs ;


              // do something
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(
             Icons.favorite,
            ),
            onPressed: () {
              _Tabcontroller.index == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) =>Fav( currentUser: currentUser?.id))):
               Navigator.push(context, MaterialPageRoute(builder: (context) =>ResaleWishList( currentUser: currentUser?.id)));
              tabs = !tabs ;

              // do something
            },
          ),
          _Tabcontroller.index == 1 ?   IconButton(
            color: Colors.white,
            icon: Icon(
             Icons.shopping_cart_outlined,
            ),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) =>UserCart( )));
              tabs = !tabs ;

              // do something
            },
          ):Container(),

        ],
      ),
//        backgroundColor: kPrimaryColor,

        body:
        TabBarView(
          controller: _Tabcontroller,

          children: [
            DesignerShop(),
            ResaleShop(),


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

            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResaleScreen(
                    postId: snapshot.data.docs[index].data()['resaleId'],
                    userId: snapshot.data.docs[index].data()['ownerId'],
                  ),
                ),
              ),
              child: CachedImage( snapshot.data.docs[index].data()['images']

                .first,

          ),
            ));



    });

    },



  ),
);
}
// sg(){
//   Container(
//       height:MediaQuery.of(context).size.height/19,
//       child:Row(
//         children: [
//           InkWell(
//             onTap: (){        showDialog<void>(
//               context: context,
//               // useRootNavigator:true,
//
//               barrierDismissible: true,
//               // false = user must tap button, true = tap outside dialog
//               builder: (BuildContext dialogContext) {
//                 return Builder(builder: (BuildContext context) {
//                   return StatefulBuilder(builder: (BuildContext context, State){
//                     return Dialog(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Container(
//                         height:MediaQuery.of(context).size.height/2,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               ExpansionTile(
//                                   title: Text("Sort by price"),
//                                   children: [Column(
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           State((){});
//                                           priceQuery = "0";
//                                           AQuery = "A0";
//                                           BQuery = "B0";
//                                           CQuery = "C0";
//                                           DQuery = "D0";
//                                           EQuery = "E0";
//                                           FQuery = "F0";
//                                           GQuery = "G0";
//                                           HQuery = "H0";
//                                           IQuery = "I0";
//                                           JQuery = "J0";
//                                           KQuery = "K0";
//                                           LQuery = "L0";
//                                           MQuery = "M0";
//                                           NQuery = "N0";
//                                           OQuery = "O0";
//                                           PQuery = "P0";
//                                           QQuery = "Q0";
//                                           RQuery = "R0";
//                                           SQuery = "S0";
//
//                                         },
//                                         child: Container(
//                                           color: priceQuery == "0"||priceQuery == "0D"?Colors.pink.shade50:Colors.white,
//
//                                           height: 50,
//                                           width: MediaQuery.of(context).size.width,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               FittedBox(
//                                                   child: Text(
//                                                     'All',
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           State((){});
//
//                                           priceQuery = "low";
//                                           AQuery = "Alow";
//                                           BQuery = "Blow";
//                                           CQuery = "Clow";
//                                           DQuery = "Dlow";
//                                           EQuery = "Elow";
//                                           FQuery = "Flow";
//                                           GQuery = "Glow";
//                                           HQuery = "Hlow";
//                                           IQuery = "Ilow";
//                                           JQuery = "Jlow";
//                                           KQuery = "Klow";
//                                           LQuery = "Llow";
//                                           MQuery = "Mlow";
//                                           NQuery = "Nlow";
//                                           OQuery = "Olow";
//                                           PQuery = "Plow";
//                                           QQuery = "Qlow";
//                                           RQuery = "Rlow";
//                                           SQuery = "Slow";
//
//                                         },
//                                         child: Container(
//                                           color: priceQuery == "low"||priceQuery == "lowD"?Colors.pink.shade50:Colors.white,
//
//                                           height: 50,
//                                           width: MediaQuery.of(context).size.width,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               FittedBox(
//                                                   child: Text(
//                                                     'Low to high',
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           State((){});
//
//                                           priceQuery = "high";
//                                           AQuery = "Ahigh";
//                                           BQuery = "Bhigh";
//                                           CQuery = "Chigh";
//                                           DQuery = "Dhigh";
//                                           EQuery = "Ehigh";
//                                           FQuery = "Fhigh";
//                                           GQuery = "Ghigh";
//                                           HQuery = "Hhigh";
//                                           IQuery = "Ihigh";
//                                           JQuery = "Jhigh";
//                                           KQuery = "Khigh";
//                                           LQuery = "Lhigh";
//                                           MQuery = "Mhigh";
//                                           NQuery = "Nhigh";
//                                           OQuery = "Ohigh";
//                                           PQuery = "Phigh";
//                                           QQuery = "Qhigh";
//                                           RQuery = "Rhigh";
//                                           SQuery = "Shigh";
//
//
//                                         },
//                                         child: Container(
//                                           color: priceQuery == "high"||priceQuery == "highD"?Colors.pink.shade50:Colors.white,
//
//                                           height: 50,
//                                           width: MediaQuery.of(context).size.width,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               FittedBox(
//                                                   child: Text(
//                                                     'High to low',
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),
//                                   ]
//                               ),
//                               ExpansionTile(
//                                   title: Text("Avoid Duties & Taxes"),
//                                   children: [Column(
//                                     children: [
//                                       Text("(Shop within your country)"),
//                                       GFToggle(
//                                         onChanged: (val){
//                                           setState(() {
//                                             duties = val;
//                                           });
//                                         },
//                                         value: duties,
//                                         type: GFToggleType.custom,
//                                       ),
//                                     ],
//                                   ),
//                                   ]
//                               ),
//                               FloatingActionButton.extended(onPressed: (){
//                                 duties? setState((){
//                                   priceQuery = priceQuery.replaceAll("D","");
//                                   AQuery =AQuery.replaceAll("D","");
//                                   BQuery =BQuery.replaceAll("D","");
//                                   CQuery =CQuery.replaceAll("D","");
//                                   DQuery =DQuery.replaceAll("D","");
//                                   EQuery =EQuery.replaceAll("D","");
//                                   FQuery =FQuery.replaceAll("D","");
//                                   GQuery =GQuery.replaceAll("D","");
//                                   HQuery =HQuery.replaceAll("D","");
//                                   IQuery =IQuery.replaceAll("D","");
//                                   JQuery =JQuery.replaceAll("D","");
//                                   KQuery =KQuery.replaceAll("D","");
//                                   LQuery =LQuery.replaceAll("D","");
//                                   MQuery =MQuery.replaceAll("D","");
//                                   NQuery =NQuery.replaceAll("D","");
//                                   OQuery =OQuery.replaceAll("D","");
//                                   PQuery =PQuery.replaceAll("D","");
//                                   QQuery =QQuery.replaceAll("D","");
//                                   RQuery =RQuery.replaceAll("D","");
//                                   SQuery =SQuery.replaceAll("D","");
//                                   priceQuery = priceQuery + "D";
//                                   AQuery = AQuery + "D";
//                                   BQuery = BQuery + "D";
//                                   CQuery = CQuery + "D";
//                                   DQuery = DQuery + "D";
//                                   EQuery = EQuery + "D";
//                                   FQuery = FQuery + "D";
//                                   GQuery = GQuery + "D";
//                                   HQuery = HQuery + "D";
//                                   IQuery = IQuery + "D";
//                                   JQuery = JQuery + "D";
//                                   KQuery = KQuery + "D";
//                                   LQuery = LQuery + "D";
//                                   MQuery = MQuery + "D";
//                                   NQuery = NQuery + "D";
//                                   OQuery = OQuery + "D";
//                                   PQuery = PQuery + "D";
//                                   QQuery = QQuery + "D";
//                                   RQuery = RQuery + "D";
//                                   SQuery = SQuery + "D";
//
//
//                                 }):
//                                 setState((){
//                                   priceQuery = priceQuery.replaceAll("D","");
//                                   AQuery =AQuery.replaceAll("D","");
//                                   BQuery =BQuery.replaceAll("D","");
//                                   CQuery =CQuery.replaceAll("D","");
//                                   DQuery =DQuery.replaceAll("D","");
//                                   EQuery =EQuery.replaceAll("D","");
//                                   FQuery =FQuery.replaceAll("D","");
//                                   GQuery =GQuery.replaceAll("D","");
//                                   HQuery =HQuery.replaceAll("D","");
//                                   IQuery =IQuery.replaceAll("D","");
//                                   JQuery =JQuery.replaceAll("D","");
//                                   KQuery =KQuery.replaceAll("D","");
//                                   LQuery =LQuery.replaceAll("D","");
//                                   MQuery =MQuery.replaceAll("D","");
//                                   NQuery =NQuery.replaceAll("D","");
//                                   OQuery =OQuery.replaceAll("D","");
//                                   PQuery =PQuery.replaceAll("D","");
//                                   QQuery =QQuery.replaceAll("D","");
//                                   RQuery =RQuery.replaceAll("D","");
//                                   SQuery =SQuery.replaceAll("D","");
//
//                                 });
//
//                               }, label: Text("Apply"))
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   });
//                 });
//               },
//             );},
//             child: FittedBox(
//               fit:  BoxFit.fitHeight,
//               child: Container(
//
//                 width:MediaQuery.of(context).size.height/5,
//
//                 //icon: Icon(Icons.drag_handle),
//                 child:Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.filter_list_outlined),
//                     SizedBox(width: 5,),
//                     Text("Filter",style:TextStyle(color: Colors.black)),
//                   ],
//                 ),
//
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: (){ setState(() {
//               tabs = !tabs ;
//             });   },
//             child: FittedBox(
//               fit:  BoxFit.fitHeight,
//               child: Container(
//
//                 width:MediaQuery.of(context).size.height/5,
//
//                 //icon: Icon(Icons.drag_handle),
//                 child:Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Category",style:TextStyle(color: Colors.black)),
//                     SizedBox(width: 5,),
//
//                     Icon(Icons.sort),
//
//                   ],
//                 ),
//
//               ),
//             ),
//           ),
//
//
//         ],
//       )),
//
// }