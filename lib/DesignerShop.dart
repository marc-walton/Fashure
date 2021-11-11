import 'package:fashow/Categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Categories/Men/Men.dart';
import 'package:fashow/Categories/Women/Women.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Resale/upload_resale.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/fav.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fashow/Constants.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class DesignerShop extends StatefulWidget {

  @override
  _DesignerShopState createState() => _DesignerShopState();
}

class _DesignerShopState extends State<DesignerShop>  with  TickerProviderStateMixin {

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
  Filter(){
    List<String> selectedSize = <String>[];


    if( _controller.index == 0) {
      return
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              // useRootNavigator:true,

              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return Builder(builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, State) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ExpansionTile(
                                      title: Text("Sort by price"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {});
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
                                              color: priceQuery == "0" ||
                                                  priceQuery == "0D" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'All',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "low" ||
                                                  priceQuery == "lowD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'Low to high',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "high" ||
                                                  priceQuery == "highD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'High to low',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),

                                  shoesIndex ? ExpansionTile(
                                      title: Text("Shoe Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("shoe1");
                                               sizeFilter = "shoe1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '3 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe2 = !shoe2;
                                        selectedSize = <String>[];
                                             if (shoe2 == true){
                                               selectedSize.add("shoe2");
                                               sizeFilter = "shoe2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe3 = !shoe3;
                                        selectedSize = <String>[];
                                             if (shoe3 == true){
                                               selectedSize.add("shoe3");
                                               sizeFilter = "shoe3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe4 = !shoe4;
                                        selectedSize = <String>[];
                                             if (shoe4 == true){
                                               selectedSize.add("shoe4");
                                               sizeFilter = "shoe4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe5 = !shoe5;
                                        selectedSize = <String>[];
                                             if (shoe5 == true){
                                               selectedSize.add("shoe5");
                                               sizeFilter = "shoe5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe6 = !shoe6;
                                        selectedSize = <String>[];
                                             if (shoe6 == true){
                                               selectedSize.add("shoe6");
                                               sizeFilter = "shoe6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe7 = !shoe7;
                                        selectedSize = <String>[];
                                             if (shoe7 == true){
                                               selectedSize.add("shoe7");
                                               sizeFilter = "shoe7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe8 = !shoe8;
                                        selectedSize = <String>[];
                                             if (shoe8 == true){
                                               selectedSize.add("shoe8");
                                               sizeFilter = "shoe8";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe8
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe9 = !shoe9;
                                        selectedSize = <String>[];
                                             if (shoe9 == true){
                                               selectedSize.add("shoe9");
                                               sizeFilter = "shoe9";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe9
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe10 = !shoe10;
                                        selectedSize = <String>[];
                                             if (shoe10 == true){
                                               selectedSize.add("shoe10");
                                               sizeFilter = "shoe10";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe10 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe11 = !shoe11;
                                        selectedSize = <String>[];
                                             if (shoe11 == true){
                                               selectedSize.add("shoe11");
                                               sizeFilter = "shoe11";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe11 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe12 = !shoe12;
                                        selectedSize = <String>[];
                                             if (shoe12 == true){
                                               selectedSize.add("shoe12");
                                               sizeFilter = "shoe12";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe12 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe13 = !shoe13;
                                        selectedSize = <String>[];
                                             if (shoe13 == true){
                                               selectedSize.add("shoe13");
                                               sizeFilter = "shoe13";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe13 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe14 = !shoe14;
                                        selectedSize = <String>[];
                                             if (shoe14 == true){
                                               selectedSize.add("shoe14");
                                               sizeFilter = "shoe14";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe14 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe15 = !shoe15;
                                        selectedSize = <String>[];
                                             if (shoe15== true){
                                               selectedSize.add("shoe15");
                                               sizeFilter = "shoe15";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe15 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe16 = !shoe16;
                                        selectedSize = <String>[];
                                             if (shoe16== true){
                                               selectedSize.add("shoe16");
                                               sizeFilter = "shoe16";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe16 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe17 = !shoe17;
                                        selectedSize = <String>[];
                                             if (shoe17== true){
                                               selectedSize.add("shoe17");
                                               sizeFilter = "shoe17";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe17 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe18 = !shoe18;
                                        selectedSize = <String>[];
                                             if (shoe18== true){
                                               selectedSize.add("shoe18");
                                               sizeFilter = "shoe18";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe18 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe19 = !shoe19;
                                        selectedSize = <String>[];
                                             if (shoe19== true){
                                               selectedSize.add("shoe19");
                                               sizeFilter = "shoe19";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe19 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe20 = !shoe20;
                                        selectedSize = <String>[];
                                             if (shoe20== true){
                                               selectedSize.add("shoe20");
                                               sizeFilter = "shoe20";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe20 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe21 = !shoe21;
                                        selectedSize = <String>[];
                                             if (shoe21== true){
                                               selectedSize.add("shoe21");
                                               sizeFilter = "shoe21";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe21 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ) :
                                  ringIndex?  ExpansionTile(
                                      title: Text("Ring Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring1 = !ring1;
                                        selectedSize = <String>[];
                                             if (ring1== true){
                                               selectedSize.add("ring1");
                                               sizeFilter = "ring1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring2 = !ring2;
                                        selectedSize = <String>[];
                                             if (ring2== true){
                                               selectedSize.add("ring2");
                                               sizeFilter = "ring2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring3 = !ring3;
                                        selectedSize = <String>[];
                                             if (ring3== true){
                                               selectedSize.add("ring3");
                                               sizeFilter = "ring3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring4 = !ring4;
                                        selectedSize = <String>[];
                                             if (ring4== true){
                                               selectedSize.add("ring4");
                                               sizeFilter = "ring4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring5 = !ring5;
                                        selectedSize = <String>[];
                                             if (ring5== true){
                                               selectedSize.add("ring5");
                                               sizeFilter = "ring5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring6 = !ring6;
                                        selectedSize = <String>[];
                                             if (ring6== true){
                                               selectedSize.add("ring6");
                                               sizeFilter = "ring6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring7 = !ring7;
                                        selectedSize = <String>[];
                                             if (ring7== true){
                                               selectedSize.add("ring7");
                                               sizeFilter = "ring7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring8 = !ring8;
                                        selectedSize = <String>[];
                                             if (ring8== true){
                                               selectedSize.add("ring8");
                                               sizeFilter = "ring8";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring8
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring9 = !ring9;
                                        selectedSize = <String>[];
                                             if (ring9== true){
                                               selectedSize.add("ring9");
                                               sizeFilter = "ring9";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring9
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring10 = !ring10;
                                        selectedSize = <String>[];
                                             if (ring10== true){
                                               selectedSize.add("ring10");
                                               sizeFilter = "ring10";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring10 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring11 = !ring11;
                                        selectedSize = <String>[];
                                             if (ring11== true){
                                               selectedSize.add("ring11");
                                               sizeFilter = "ring11";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring11 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring12 = !ring12;
                                        selectedSize = <String>[];
                                             if (ring12== true){
                                               selectedSize.add("ring12");
                                               sizeFilter = "ring12";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring12 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring13 = !ring13;
                                        selectedSize = <String>[];
                                             if (ring13== true){
                                               selectedSize.add("ring13");
                                               sizeFilter = "ring13";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring13 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring14 = !ring14;
                                        selectedSize = <String>[];
                                             if (ring14== true){
                                               selectedSize.add("ring14");
                                               sizeFilter = "ring14";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring14 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring15 = !ring15;
                                        selectedSize = <String>[];
                                             if (ring15== true){
                                               selectedSize.add("ring15");
                                               sizeFilter = "ring15";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring15 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring16 = !ring16;
                                        selectedSize = <String>[];
                                             if (ring16== true){
                                               selectedSize.add("ring16");
                                               sizeFilter = "ring16";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring16 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring17 = !ring17;
                                        selectedSize = <String>[];
                                             if (ring17== true){
                                               selectedSize.add("ring17");
                                               sizeFilter = "ring17";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring17 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring18 = !ring18;
                                        selectedSize = <String>[];
                                             if (ring18== true){
                                               selectedSize.add("ring18");
                                               sizeFilter = "ring18";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring18 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring19 = !ring19;
                                        selectedSize = <String>[];
                                             if (ring19== true){
                                               selectedSize.add("ring19");
                                               sizeFilter = "ring19";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring19 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring20 = !ring20;
                                        selectedSize = <String>[];
                                             if (ring20== true){
                                               selectedSize.add("ring20");
                                               sizeFilter = "ring20";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring20 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring21 = !ring21;
                                        selectedSize = <String>[];
                                             if (ring21== true){
                                               selectedSize.add("ring21");
                                               sizeFilter = "ring21";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring21 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring22 = !ring22;
                                        selectedSize = <String>[];
                                             if (ring22== true){
                                               selectedSize.add("ring22");
                                               sizeFilter = "ring22";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring22 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring23 = !ring23;
                                        selectedSize = <String>[];
                                             if (ring23== true){
                                               selectedSize.add("ring23");
                                               sizeFilter = "ring23";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring22 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '15',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ) :
                                  ExpansionTile(
                                      title: Text("Clothing Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: ()
                                            {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("XXXS");
                                                  sizeFilter = "XXXS";
                                                }

                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXXS',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxs = !xxs;
                                                selectedSize = <String>[];
                                                if (xxs == true){
                                                  selectedSize.add("XXS");
                                                  sizeFilter = "XXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXS',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xs = !xs;
                                                selectedSize = <String>[];
                                                if (xs == true){
                                                  selectedSize.add("XS");
                                                  sizeFilter = "XS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XS',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                s = !s;
                                                selectedSize = <String>[];
                                                if (s == true){
                                                  selectedSize.add("S");
                                                  sizeFilter = "S";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: s
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'S',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                m = !m;
                                                selectedSize = <String>[];
                                                if (m == true){
                                                  selectedSize.add("M");
                                                  sizeFilter = "M";
                                                }

                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: m
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'M',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                l = !l;
                                                selectedSize = <String>[];
                                                if (l == true){
                                                  selectedSize.add("L");
                                                  sizeFilter = "L";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: l
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'L',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xl = !xl;
                                                selectedSize = <String>[];
                                                if (xl == true){
                                                  selectedSize.add("XL");
                                                  sizeFilter = "XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxl = !xxl;
                                                selectedSize = <String>[];
                                                if (xxl == true){
                                                  selectedSize.add("XXL");
                                                  sizeFilter = "XXL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxl = !xxxl;
                                                selectedSize = <String>[];
                                                if (xxxl == true){
                                                  selectedSize.add("XXXL");
                                                  sizeFilter = "XXXL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxxl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXXL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                fourl = !fourl;
                                                selectedSize = <String>[];
                                                if (fourl == true){
                                                  selectedSize.add("4XL");
                                                  sizeFilter = "4XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: fourl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                fivel = !fivel;
                                                selectedSize = <String>[];
                                                if (fivel == true){
                                                  selectedSize.add("5XL");
                                                  sizeFilter = "5XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: fivel
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                sixl = !sixl;
                                                selectedSize = <String>[];
                                                if (sixl == true){
                                                  selectedSize.add("6XL");
                                                  sizeFilter = "6XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: sixl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                sevenl = !sevenl;
                                                selectedSize = <String>[];
                                                if (sevenl == true){
                                                  selectedSize.add("7XL");
                                                  sizeFilter = "7XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: sevenl ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                eightl = !eightl;
                                                selectedSize = <String>[];
                                                if (eightl == true){
                                                  selectedSize.add("8XL");
                                                  sizeFilter = "8XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: eightl ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),

                                  ExpansionTile(
                                      title: Text("Avoid Duties & Taxes"),
                                      children: [Column(
                                        children: [
                                          Text("(Shop within your country)"),
                                          GFToggle(
                                            onChanged: (val) {
                                              setState(() {
                                                duties = val;
                                              });
                                            },
                                            value: duties,
                                            type: GFToggleType.custom,
                                          ),
                                        ],
                                      ),
                                      ]
                                  ),
                                  FloatingActionButton.extended(onPressed: () {
                                    duties ? setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                      priceQuery = priceQuery + "D";
                                      AQuery = AQuery + "D";
                                      BQuery = BQuery + "D";
                                      CQuery = CQuery + "D";
                                      DQuery = DQuery + "D";
                                      EQuery = EQuery + "D";
                                      FQuery = FQuery + "D";
                                      GQuery = GQuery + "D";
                                      HQuery = HQuery + "D";
                                      IQuery = IQuery + "D";
                                      JQuery = JQuery + "D";
                                      KQuery = KQuery + "D";
                                      LQuery = LQuery + "D";
                                      MQuery = MQuery + "D";
                                      NQuery = NQuery + "D";
                                      OQuery = OQuery + "D";
                                      PQuery = PQuery + "D";
                                      QQuery = QQuery + "D";
                                      RQuery = RQuery + "D";
                                      SQuery = SQuery + "D";
                                    }) :
                                    setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                    });
                                    setState(() {
                                      priceQuery = priceQuery.replaceAll(sizeFilter, "");
                                      AQuery = AQuery.replaceAll(sizeFilter, "");
                                      BQuery = BQuery.replaceAll(sizeFilter, "");
                                      CQuery = CQuery.replaceAll(sizeFilter, "");
                                      DQuery = DQuery.replaceAll(sizeFilter, "");
                                      EQuery = EQuery.replaceAll(sizeFilter, "");
                                      FQuery = FQuery.replaceAll(sizeFilter, "");
                                      GQuery = GQuery.replaceAll(sizeFilter, "");
                                      HQuery = HQuery.replaceAll(sizeFilter, "");
                                      IQuery = IQuery.replaceAll(sizeFilter, "");
                                      JQuery = JQuery.replaceAll(sizeFilter, "");
                                      KQuery = KQuery.replaceAll(sizeFilter, "");
                                      LQuery = LQuery.replaceAll(sizeFilter, "");
                                      MQuery = MQuery.replaceAll(sizeFilter, "");
                                      NQuery = NQuery.replaceAll(sizeFilter, "");
                                      OQuery = OQuery.replaceAll(sizeFilter, "");
                                      PQuery = PQuery.replaceAll(sizeFilter, "");
                                      QQuery = QQuery.replaceAll(sizeFilter, "");
                                      RQuery = RQuery.replaceAll(sizeFilter, "");
                                      SQuery = SQuery.replaceAll(sizeFilter, "");
                                      priceQuery = priceQuery + sizeFilter;
                                      AQuery = AQuery + sizeFilter;
                                      BQuery = BQuery + sizeFilter;
                                      CQuery = CQuery + sizeFilter;
                                      DQuery = DQuery + sizeFilter;
                                      EQuery = EQuery + sizeFilter;
                                      FQuery = FQuery + sizeFilter;
                                      GQuery = GQuery + sizeFilter;
                                      HQuery = HQuery + sizeFilter;
                                      IQuery = IQuery + sizeFilter;
                                      JQuery = JQuery + sizeFilter;
                                      KQuery = KQuery + sizeFilter;
                                      LQuery = LQuery + sizeFilter;
                                      MQuery = MQuery + sizeFilter;
                                      NQuery = NQuery + sizeFilter;
                                      OQuery = OQuery + sizeFilter;
                                      PQuery = PQuery + sizeFilter;
                                      QQuery = QQuery + sizeFilter;
                                      RQuery = RQuery + sizeFilter;
                                      SQuery = SQuery + sizeFilter;
                                    });
                                  }, label: Text("Apply"))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                });
              },
            );
          },
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .height / 5,

              //icon: Icon(Icons.drag_handle),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 5,),
                  Text("Filter", style: TextStyle(color: Colors.black)),
                ],
              ),

            ),
          ),
        );
    }
  else  if( _controller.index == 1) {
      return
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              // useRootNavigator:true,

              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return Builder(builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, State) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ExpansionTile(
                                      title: Text("Sort by price"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {});
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
                                              color: priceQuery == "0" ||
                                                  priceQuery == "0D" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'All',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "low" ||
                                                  priceQuery == "lowD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'Low to high',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "high" ||
                                                  priceQuery == "highD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'High to low',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),

                                 shoesIndex == true? ExpansionTile(
                                      title: Text("Shoe Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("shoe1");
                                               sizeFilter = "shoe1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe2 = !shoe2;
                                        selectedSize = <String>[];
                                             if (shoe2 == true){
                                               selectedSize.add("shoe2");
                                               sizeFilter = "shoe2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe3 = !shoe3;
                                        selectedSize = <String>[];
                                             if (shoe3 == true){
                                               selectedSize.add("shoe3");
                                               sizeFilter = "shoe3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe4 = !shoe4;
                                        selectedSize = <String>[];
                                             if (shoe4 == true){
                                               selectedSize.add("shoe4");
                                               sizeFilter = "shoe4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe5 = !shoe5;
                                        selectedSize = <String>[];
                                             if (shoe5 == true){
                                               selectedSize.add("shoe5");
                                               sizeFilter = "shoe5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe6 = !shoe6;
                                        selectedSize = <String>[];
                                             if (shoe6 == true){
                                               selectedSize.add("shoe6");
                                               sizeFilter = "shoe6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe7 = !shoe7;
                                        selectedSize = <String>[];
                                             if (shoe7 == true){
                                               selectedSize.add("shoe7");
                                               sizeFilter = "shoe7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe8 = !shoe8;
                                        selectedSize = <String>[];
                                             if (shoe8 == true){
                                               selectedSize.add("shoe8");
                                               sizeFilter = "shoe8";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe8
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe9 = !shoe9;
                                        selectedSize = <String>[];
                                             if (shoe9 == true){
                                               selectedSize.add("shoe9");
                                               sizeFilter = "shoe9";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe9
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe10 = !shoe10;
                                        selectedSize = <String>[];
                                             if (shoe10 == true){
                                               selectedSize.add("shoe10");
                                               sizeFilter = "shoe10";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe10 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe11 = !shoe11;
                                        selectedSize = <String>[];
                                             if (shoe11 == true){
                                               selectedSize.add("shoe11");
                                               sizeFilter = "shoe11";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe11 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe12 = !shoe12;
                                        selectedSize = <String>[];
                                             if (shoe12 == true){
                                               selectedSize.add("shoe12");
                                               sizeFilter = "shoe12";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe12 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe13 = !shoe13;
                                        selectedSize = <String>[];
                                             if (shoe13 == true){
                                               selectedSize.add("shoe13");
                                               sizeFilter = "shoe13";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe13 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe14 = !shoe14;
                                        selectedSize = <String>[];
                                             if (shoe14 == true){
                                               selectedSize.add("shoe14");
                                               sizeFilter = "shoe14";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe14 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe15 = !shoe15;
                                        selectedSize = <String>[];
                                             if (shoe15== true){
                                               selectedSize.add("shoe15");
                                               sizeFilter = "shoe15";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe15 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe16 = !shoe16;
                                        selectedSize = <String>[];
                                             if (shoe16== true){
                                               selectedSize.add("shoe16");
                                               sizeFilter = "shoe16";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe16 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '15 ½',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      ]
                                  ) :
                                 ringIndex == true? ExpansionTile(
                                      title: Text("Ring Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring1 = !ring1;
                                        selectedSize = <String>[];
                                             if (ring1== true){
                                               selectedSize.add("ring1");
                                               sizeFilter = "ring1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring2 = !ring2;
                                        selectedSize = <String>[];
                                             if (ring2== true){
                                               selectedSize.add("ring2");
                                               sizeFilter = "ring2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring3 = !ring3;
                                        selectedSize = <String>[];
                                             if (ring3== true){
                                               selectedSize.add("ring3");
                                               sizeFilter = "ring3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring4 = !ring4;
                                        selectedSize = <String>[];
                                             if (ring4== true){
                                               selectedSize.add("ring4");
                                               sizeFilter = "ring4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring5 = !ring5;
                                        selectedSize = <String>[];
                                             if (ring5== true){
                                               selectedSize.add("ring5");
                                               sizeFilter = "ring5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring6 = !ring6;
                                        selectedSize = <String>[];
                                             if (ring6== true){
                                               selectedSize.add("ring6");
                                               sizeFilter = "ring6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring7 = !ring7;
                                        selectedSize = <String>[];
                                             if (ring7== true){
                                               selectedSize.add("ring7");
                                               sizeFilter = "ring7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring8 = !ring8;
                                        selectedSize = <String>[];
                                             if (ring8== true){
                                               selectedSize.add("ring8");
                                               sizeFilter = "ring8";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring8
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring9 = !ring9;
                                        selectedSize = <String>[];
                                             if (ring9== true){
                                               selectedSize.add("ring9");
                                               sizeFilter = "ring9";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring9
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring10 = !ring10;
                                        selectedSize = <String>[];
                                             if (ring10== true){
                                               selectedSize.add("ring10");
                                               sizeFilter = "ring10";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring10 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring11 = !ring11;
                                        selectedSize = <String>[];
                                             if (ring11== true){
                                               selectedSize.add("ring11");
                                               sizeFilter = "ring11";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring11 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring12 = !ring12;
                                        selectedSize = <String>[];
                                             if (ring12== true){
                                               selectedSize.add("ring12");
                                               sizeFilter = "ring12";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring12 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring13 = !ring13;
                                        selectedSize = <String>[];
                                             if (ring13== true){
                                               selectedSize.add("ring13");
                                               sizeFilter = "ring13";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring13 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring14 = !ring14;
                                        selectedSize = <String>[];
                                             if (ring14== true){
                                               selectedSize.add("ring14");
                                               sizeFilter = "ring14";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring14 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring15 = !ring15;
                                        selectedSize = <String>[];
                                             if (ring15== true){
                                               selectedSize.add("ring15");
                                               sizeFilter = "ring15";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring15 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring16 = !ring16;
                                        selectedSize = <String>[];
                                             if (ring16== true){
                                               selectedSize.add("ring16");
                                               sizeFilter = "ring16";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring16 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring17 = !ring17;
                                        selectedSize = <String>[];
                                             if (ring17== true){
                                               selectedSize.add("ring17");
                                               sizeFilter = "ring17";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring17 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring18 = !ring18;
                                        selectedSize = <String>[];
                                             if (ring18== true){
                                               selectedSize.add("ring18");
                                               sizeFilter = "ring18";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring18 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring19 = !ring19;
                                        selectedSize = <String>[];
                                             if (ring19== true){
                                               selectedSize.add("ring19");
                                               sizeFilter = "ring19";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring19 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring20 = !ring20;
                                        selectedSize = <String>[];
                                             if (ring20== true){
                                               selectedSize.add("ring20");
                                               sizeFilter = "ring20";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring20 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring21 = !ring21;
                                        selectedSize = <String>[];
                                             if (ring21== true){
                                               selectedSize.add("ring21");
                                               sizeFilter = "ring21";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring21 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring22 = !ring22;
                                        selectedSize = <String>[];
                                             if (ring22== true){
                                               selectedSize.add("ring22");
                                               sizeFilter = "ring22";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring22 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring23 = !ring23;
                                        selectedSize = <String>[];
                                             if (ring23== true){
                                               selectedSize.add("ring23");
                                               sizeFilter = "ring23";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring22 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '15',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ) :
                                  ExpansionTile(
                                      title: Text("Clothing Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: ()
                                            {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("XXXS");
                                                  sizeFilter = "XXXS";
                                                }

                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: xxxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXXS',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxs = !xxs;
                                                selectedSize = <String>[];
                                                if (xxs == true){
                                                  selectedSize.add("XXS");
                                                  sizeFilter = "XXS";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: xxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXS',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xs = !xs;
                                                selectedSize = <String>[];
                                                if (xs == true){
                                                  selectedSize.add("XS");
                                                  sizeFilter = "XS";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: xs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XS',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                s = !s;
                                                selectedSize = <String>[];
                                                if (s == true){
                                                  selectedSize.add("S");
                                                  sizeFilter = "S";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: s
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'S',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                m = !m;
                                                selectedSize = <String>[];
                                                if (m == true){
                                                  selectedSize.add("M");
                                                  sizeFilter = "M";
                                                }

                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: m
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'M',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                l = !l;
                                                selectedSize = <String>[];
                                                if (l == true){
                                                  selectedSize.add("L");
                                                  sizeFilter = "L";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: l
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'L',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xl = !xl;
                                                selectedSize = <String>[];
                                                if (xl == true){
                                                  selectedSize.add("XL");
                                                  sizeFilter = "XL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: xl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxl = !xxl;
                                                selectedSize = <String>[];
                                                if (xxl == true){
                                                  selectedSize.add("XXL");
                                                  sizeFilter = "XXL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: xxl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxl = !xxxl;
                                                selectedSize = <String>[];
                                                if (xxxl == true){
                                                  selectedSize.add("XXXL");
                                                  sizeFilter = "XXXL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: xxxl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'XXXL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                fourl = !fourl;
                                                selectedSize = <String>[];
                                                if (fourl == true){
                                                  selectedSize.add("4XL");
                                                  sizeFilter = "4XL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: fourl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                fivel = !fivel;
                                                selectedSize = <String>[];
                                                if (fivel == true){
                                                  selectedSize.add("5XL");
                                                  sizeFilter = "5XL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: fivel
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                sixl = !sixl;
                                                selectedSize = <String>[];
                                                if (sixl == true){
                                                  selectedSize.add("6XL");
                                                  sizeFilter = "6XL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: sixl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                sevenl = !sevenl;
                                                selectedSize = <String>[];
                                                if (sevenl == true){
                                                  selectedSize.add("7XL");
                                                  sizeFilter = "7XL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: sevenl ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                eightl = !eightl;
                                                selectedSize = <String>[];
                                                if (eightl == true){
                                                  selectedSize.add("8XL");
                                                  sizeFilter = "8XL";
                                                }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: eightl ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8XL',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),

                                  ExpansionTile(
                                      title: Text("Avoid Duties & Taxes"),
                                      children: [Column(
                                        children: [
                                          Text("(Shop within your country)"),
                                          GFToggle(
                                            onChanged: (val) {
                                              setState(() {
                                                duties = val;
                                              });
                                            },
                                            value: duties,
                                            type: GFToggleType.custom,
                                          ),
                                        ],
                                      ),
                                      ]
                                  ),
                                  FloatingActionButton.extended(onPressed: () {
                                    duties ? setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                      priceQuery = priceQuery + "D";
                                      AQuery = AQuery + "D";
                                      BQuery = BQuery + "D";
                                      CQuery = CQuery + "D";
                                      DQuery = DQuery + "D";
                                      EQuery = EQuery + "D";
                                      FQuery = FQuery + "D";
                                      GQuery = GQuery + "D";
                                      HQuery = HQuery + "D";
                                      IQuery = IQuery + "D";
                                      JQuery = JQuery + "D";
                                      KQuery = KQuery + "D";
                                      LQuery = LQuery + "D";
                                      MQuery = MQuery + "D";
                                      NQuery = NQuery + "D";
                                      OQuery = OQuery + "D";
                                      PQuery = PQuery + "D";
                                      QQuery = QQuery + "D";
                                      RQuery = RQuery + "D";
                                      SQuery = SQuery + "D";
                                    }) :
                                    setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                    });
                                    setState(() {
                                      priceQuery = priceQuery.replaceAll(sizeFilter, "");
                                      AQuery = AQuery.replaceAll(sizeFilter, "");
                                      BQuery = BQuery.replaceAll(sizeFilter, "");
                                      CQuery = CQuery.replaceAll(sizeFilter, "");
                                      DQuery = DQuery.replaceAll(sizeFilter, "");
                                      EQuery = EQuery.replaceAll(sizeFilter, "");
                                      FQuery = FQuery.replaceAll(sizeFilter, "");
                                      GQuery = GQuery.replaceAll(sizeFilter, "");
                                      HQuery = HQuery.replaceAll(sizeFilter, "");
                                      IQuery = IQuery.replaceAll(sizeFilter, "");
                                      JQuery = JQuery.replaceAll(sizeFilter, "");
                                      KQuery = KQuery.replaceAll(sizeFilter, "");
                                      LQuery = LQuery.replaceAll(sizeFilter, "");
                                      MQuery = MQuery.replaceAll(sizeFilter, "");
                                      NQuery = NQuery.replaceAll(sizeFilter, "");
                                      OQuery = OQuery.replaceAll(sizeFilter, "");
                                      PQuery = PQuery.replaceAll(sizeFilter, "");
                                      QQuery = QQuery.replaceAll(sizeFilter, "");
                                      RQuery = RQuery.replaceAll(sizeFilter, "");
                                      SQuery = SQuery.replaceAll(sizeFilter, "");
                                      priceQuery = priceQuery + sizeFilter;
                                      AQuery = AQuery + sizeFilter;
                                      BQuery = BQuery + sizeFilter;
                                      CQuery = CQuery + sizeFilter;
                                      DQuery = DQuery + sizeFilter;
                                      EQuery = EQuery + sizeFilter;
                                      FQuery = FQuery + sizeFilter;
                                      GQuery = GQuery + sizeFilter;
                                      HQuery = HQuery + sizeFilter;
                                      IQuery = IQuery + sizeFilter;
                                      JQuery = JQuery + sizeFilter;
                                      KQuery = KQuery + sizeFilter;
                                      LQuery = LQuery + sizeFilter;
                                      MQuery = MQuery + sizeFilter;
                                      NQuery = NQuery + sizeFilter;
                                      OQuery = OQuery + sizeFilter;
                                      PQuery = PQuery + sizeFilter;
                                      QQuery = QQuery + sizeFilter;
                                      RQuery = RQuery + sizeFilter;
                                      SQuery = SQuery + sizeFilter;
                                    });
                                  }, label: Text("Apply"))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                });
              },
            );
          },
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .height / 5,

              //icon: Icon(Icons.drag_handle),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 5,),
                  Text("Filter", style: TextStyle(color: Colors.black)),
                ],
              ),

            ),
          ),
        );
    }
  else  if( _controller.index == 2||_controller.index == 3) {
      return
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              // useRootNavigator:true,

              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return Builder(builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, State) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ExpansionTile(
                                      title: Text("Sort by price"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {});
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
                                              color: priceQuery == "0" ||
                                                  priceQuery == "0D" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'All',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "low" ||
                                                  priceQuery == "lowD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'Low to high',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "high" ||
                                                  priceQuery == "highD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'High to low',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),

                                  shoesIndex? ExpansionTile(
                                      title: Text("Shoe Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("shoe1");
                                               sizeFilter = "shoe1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '0-3 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe2 = !shoe2;
                                        selectedSize = <String>[];
                                             if (shoe2 == true){
                                               selectedSize.add("shoe2");
                                               sizeFilter = "shoe2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '3-6 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe3 = !shoe3;
                                        selectedSize = <String>[];
                                             if (shoe3 == true){
                                               selectedSize.add("shoe3");
                                               sizeFilter = "shoe3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe4 = !shoe4;
                                        selectedSize = <String>[];
                                             if (shoe4 == true){
                                               selectedSize.add("shoe4");
                                               sizeFilter = "shoe4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe5 = !shoe5;
                                        selectedSize = <String>[];
                                             if (shoe5 == true){
                                               selectedSize.add("shoe5");
                                               sizeFilter = "shoe5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9-12 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe6 = !shoe6;
                                        selectedSize = <String>[];
                                             if (shoe6 == true){
                                               selectedSize.add("shoe6");
                                               sizeFilter = "shoe6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12-18 mth',

                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
  InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe7 = !shoe7;
                                        selectedSize = <String>[];
                                             if (shoe7 == true){
                                               selectedSize.add("shoe7");
                                               sizeFilter = "shoe7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '18-24 mth',

                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ) :
                                  ExpansionTile(
                                      title: Text("Clothing Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("XXXS");
                                                  sizeFilter = "XXXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '0-3 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxs = !xxs;
                                                selectedSize = <String>[];
                                                if (xxs == true){
                                                  selectedSize.add("XXS");
                                                  sizeFilter = "XXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '3-6 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xs = !xs;
                                                selectedSize = <String>[];
                                                if (xs == true){
                                                  selectedSize.add("XS");
                                                  sizeFilter = "XS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6-9 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                s = !s;
                                                selectedSize = <String>[];
                                                if (s == true){
                                                  selectedSize.add("S");
                                                  sizeFilter = "S";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: s
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9-12 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                m = !m;
                                                selectedSize = <String>[];
                                                if (m == true){
                                                  selectedSize.add("M");
                                                  sizeFilter = "M";
                                                }

                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: m
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12-18 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                l = !l;
                                                selectedSize = <String>[];
                                                if (l == true){
                                                  selectedSize.add("L");
                                                  sizeFilter = "L";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: l
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '18-24 mth',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ),

                                  ExpansionTile(
                                      title: Text("Avoid Duties & Taxes"),
                                      children: [Column(
                                        children: [
                                          Text("(Shop within your country)"),
                                          GFToggle(
                                            onChanged: (val) {
                                              setState(() {
                                                duties = val;
                                              });
                                            },
                                            value: duties,
                                            type: GFToggleType.custom,
                                          ),
                                        ],
                                      ),
                                      ]
                                  ),
                                  FloatingActionButton.extended(onPressed: () {
                                    duties ? setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                      priceQuery = priceQuery + "D";
                                      AQuery = AQuery + "D";
                                      BQuery = BQuery + "D";
                                      CQuery = CQuery + "D";
                                      DQuery = DQuery + "D";
                                      EQuery = EQuery + "D";
                                      FQuery = FQuery + "D";
                                      GQuery = GQuery + "D";
                                      HQuery = HQuery + "D";
                                      IQuery = IQuery + "D";
                                      JQuery = JQuery + "D";
                                      KQuery = KQuery + "D";
                                      LQuery = LQuery + "D";
                                      MQuery = MQuery + "D";
                                      NQuery = NQuery + "D";
                                      OQuery = OQuery + "D";
                                      PQuery = PQuery + "D";
                                      QQuery = QQuery + "D";
                                      RQuery = RQuery + "D";
                                      SQuery = SQuery + "D";
                                    }) :
                                    setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                    });
                                    setState(() {
                                      priceQuery = priceQuery.replaceAll(sizeFilter, "");
                                      AQuery = AQuery.replaceAll(sizeFilter, "");
                                      BQuery = BQuery.replaceAll(sizeFilter, "");
                                      CQuery = CQuery.replaceAll(sizeFilter, "");
                                      DQuery = DQuery.replaceAll(sizeFilter, "");
                                      EQuery = EQuery.replaceAll(sizeFilter, "");
                                      FQuery = FQuery.replaceAll(sizeFilter, "");
                                      GQuery = GQuery.replaceAll(sizeFilter, "");
                                      HQuery = HQuery.replaceAll(sizeFilter, "");
                                      IQuery = IQuery.replaceAll(sizeFilter, "");
                                      JQuery = JQuery.replaceAll(sizeFilter, "");
                                      KQuery = KQuery.replaceAll(sizeFilter, "");
                                      LQuery = LQuery.replaceAll(sizeFilter, "");
                                      MQuery = MQuery.replaceAll(sizeFilter, "");
                                      NQuery = NQuery.replaceAll(sizeFilter, "");
                                      OQuery = OQuery.replaceAll(sizeFilter, "");
                                      PQuery = PQuery.replaceAll(sizeFilter, "");
                                      QQuery = QQuery.replaceAll(sizeFilter, "");
                                      RQuery = RQuery.replaceAll(sizeFilter, "");
                                      SQuery = SQuery.replaceAll(sizeFilter, "");
                                      priceQuery = priceQuery + sizeFilter;
                                      AQuery = AQuery + sizeFilter;
                                      BQuery = BQuery + sizeFilter;
                                      CQuery = CQuery + sizeFilter;
                                      DQuery = DQuery + sizeFilter;
                                      EQuery = EQuery + sizeFilter;
                                      FQuery = FQuery + sizeFilter;
                                      GQuery = GQuery + sizeFilter;
                                      HQuery = HQuery + sizeFilter;
                                      IQuery = IQuery + sizeFilter;
                                      JQuery = JQuery + sizeFilter;
                                      KQuery = KQuery + sizeFilter;
                                      LQuery = LQuery + sizeFilter;
                                      MQuery = MQuery + sizeFilter;
                                      NQuery = NQuery + sizeFilter;
                                      OQuery = OQuery + sizeFilter;
                                      PQuery = PQuery + sizeFilter;
                                      QQuery = QQuery + sizeFilter;
                                      RQuery = RQuery + sizeFilter;
                                      SQuery = SQuery + sizeFilter;
                                    });
                                  }, label: Text("Apply"))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                });
              },
            );
          },
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .height / 5,

              //icon: Icon(Icons.drag_handle),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 5,),
                  Text("Filter", style: TextStyle(color: Colors.black)),
                ],
              ),

            ),
          ),
        );
    }
 else  if( _controller.index == 4||_controller.index == 5) {
      return
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              // useRootNavigator:true,

              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return Builder(builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, State) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ExpansionTile(
                                      title: Text("Sort by price"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {});
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
                                              color: priceQuery == "0" ||
                                                  priceQuery == "0D" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'All',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "low" ||
                                                  priceQuery == "lowD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'Low to high',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "high" ||
                                                  priceQuery == "highD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'High to low',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),
                                  shoesIndex?  ExpansionTile(
                                      title: Text("Shoe Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("shoe1");
                                               sizeFilter = "shoe1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '2 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe2 = !shoe2;
                                        selectedSize = <String>[];
                                             if (shoe2 == true){
                                               selectedSize.add("shoe2");
                                               sizeFilter = "shoe2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '2 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe3 = !shoe3;
                                        selectedSize = <String>[];
                                             if (shoe3 == true){
                                               selectedSize.add("shoe3");
                                               sizeFilter = "shoe3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '3 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe4 = !shoe4;
                                        selectedSize = <String>[];
                                             if (shoe4 == true){
                                               selectedSize.add("shoe4");
                                               sizeFilter = "shoe4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '3 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe5 = !shoe5;
                                        selectedSize = <String>[];
                                             if (shoe5 == true){
                                               selectedSize.add("shoe5");
                                               sizeFilter = "shoe5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe6 = !shoe6;
                                        selectedSize = <String>[];
                                             if (shoe6 == true){
                                               selectedSize.add("shoe6");
                                               sizeFilter = "shoe6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe7 = !shoe7;
                                        selectedSize = <String>[];
                                             if (shoe7 == true){
                                               selectedSize.add("shoe7");
                                               sizeFilter = "shoe7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe8 = !shoe8;
                                        selectedSize = <String>[];
                                             if (shoe8 == true){
                                               selectedSize.add("shoe8");
                                               sizeFilter = "shoe8";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe8
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe9 = !shoe9;
                                        selectedSize = <String>[];
                                             if (shoe9 == true){
                                               selectedSize.add("shoe9");
                                               sizeFilter = "shoe9";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe9
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe10 = !shoe10;
                                        selectedSize = <String>[];
                                             if (shoe10 == true){
                                               selectedSize.add("shoe10");
                                               sizeFilter = "shoe10";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe10 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe11 = !shoe11;
                                        selectedSize = <String>[];
                                             if (shoe11 == true){
                                               selectedSize.add("shoe11");
                                               sizeFilter = "shoe11";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe11 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe12 = !shoe12;
                                        selectedSize = <String>[];
                                             if (shoe12 == true){
                                               selectedSize.add("shoe12");
                                               sizeFilter = "shoe12";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe12 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe13 = !shoe13;
                                        selectedSize = <String>[];
                                             if (shoe13 == true){
                                               selectedSize.add("shoe13");
                                               sizeFilter = "shoe13";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe13 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe14 = !shoe14;
                                        selectedSize = <String>[];
                                             if (shoe14 == true){
                                               selectedSize.add("shoe14");
                                               sizeFilter = "shoe14";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe14 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      ]
                                  ) :
                                  ExpansionTile(
                                      title: Text("Clothing Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("XXXS");
                                                  sizeFilter = "XXXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '2 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxs = !xxs;
                                                selectedSize = <String>[];
                                                if (xxs == true){
                                                  selectedSize.add("XXS");
                                                  sizeFilter = "XXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '3-4 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xs = !xs;
                                                selectedSize = <String>[];
                                                if (xs == true){
                                                  selectedSize.add("XS");
                                                  sizeFilter = "XS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4-5 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                s = !s;
                                                selectedSize = <String>[];
                                                if (s == true){
                                                  selectedSize.add("S");
                                                  sizeFilter = "S";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: s
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5-6 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                m = !m;
                                                selectedSize = <String>[];
                                                if (m == true){
                                                  selectedSize.add("M");
                                                  sizeFilter = "M";
                                                }

                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: m
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6-7 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                l = !l;
                                                selectedSize = <String>[];
                                                if (l == true){
                                                  selectedSize.add("L");
                                                  sizeFilter = "L";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: l
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7-8 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xl = !xl;
                                                selectedSize = <String>[];
                                                if (xl == true){
                                                  selectedSize.add("XL");
                                                  sizeFilter = "XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8-9 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxl = !xxl;
                                                selectedSize = <String>[];
                                                if (xxl == true){
                                                  selectedSize.add("XXL");
                                                  sizeFilter = "XXL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9-10 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxl = !xxxl;
                                                selectedSize = <String>[];
                                                if (xxxl == true){
                                                  selectedSize.add("XXXL");
                                                  sizeFilter = "XXXL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxxl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10-11 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                fourl = !fourl;
                                                selectedSize = <String>[];
                                                if (fourl == true){
                                                  selectedSize.add("4XL");
                                                  sizeFilter = "4XL";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: fourl
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11-12 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      ]
                                  ),

                                  ExpansionTile(
                                      title: Text("Avoid Duties & Taxes"),
                                      children: [Column(
                                        children: [
                                          Text("(Shop within your country)"),
                                          GFToggle(
                                            onChanged: (val) {
                                              setState(() {
                                                duties = val;
                                              });
                                            },
                                            value: duties,
                                            type: GFToggleType.custom,
                                          ),
                                        ],
                                      ),
                                      ]
                                  ),
                                  FloatingActionButton.extended(onPressed: () {
                                    duties ? setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                      priceQuery = priceQuery + "D";
                                      AQuery = AQuery + "D";
                                      BQuery = BQuery + "D";
                                      CQuery = CQuery + "D";
                                      DQuery = DQuery + "D";
                                      EQuery = EQuery + "D";
                                      FQuery = FQuery + "D";
                                      GQuery = GQuery + "D";
                                      HQuery = HQuery + "D";
                                      IQuery = IQuery + "D";
                                      JQuery = JQuery + "D";
                                      KQuery = KQuery + "D";
                                      LQuery = LQuery + "D";
                                      MQuery = MQuery + "D";
                                      NQuery = NQuery + "D";
                                      OQuery = OQuery + "D";
                                      PQuery = PQuery + "D";
                                      QQuery = QQuery + "D";
                                      RQuery = RQuery + "D";
                                      SQuery = SQuery + "D";
                                    }) :
                                    setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                    });
                                    setState(() {
                                      priceQuery = priceQuery.replaceAll(sizeFilter, "");
                                      AQuery = AQuery.replaceAll(sizeFilter, "");
                                      BQuery = BQuery.replaceAll(sizeFilter, "");
                                      CQuery = CQuery.replaceAll(sizeFilter, "");
                                      DQuery = DQuery.replaceAll(sizeFilter, "");
                                      EQuery = EQuery.replaceAll(sizeFilter, "");
                                      FQuery = FQuery.replaceAll(sizeFilter, "");
                                      GQuery = GQuery.replaceAll(sizeFilter, "");
                                      HQuery = HQuery.replaceAll(sizeFilter, "");
                                      IQuery = IQuery.replaceAll(sizeFilter, "");
                                      JQuery = JQuery.replaceAll(sizeFilter, "");
                                      KQuery = KQuery.replaceAll(sizeFilter, "");
                                      LQuery = LQuery.replaceAll(sizeFilter, "");
                                      MQuery = MQuery.replaceAll(sizeFilter, "");
                                      NQuery = NQuery.replaceAll(sizeFilter, "");
                                      OQuery = OQuery.replaceAll(sizeFilter, "");
                                      PQuery = PQuery.replaceAll(sizeFilter, "");
                                      QQuery = QQuery.replaceAll(sizeFilter, "");
                                      RQuery = RQuery.replaceAll(sizeFilter, "");
                                      SQuery = SQuery.replaceAll(sizeFilter, "");
                                      priceQuery = priceQuery + sizeFilter;
                                      AQuery = AQuery + sizeFilter;
                                      BQuery = BQuery + sizeFilter;
                                      CQuery = CQuery + sizeFilter;
                                      DQuery = DQuery + sizeFilter;
                                      EQuery = EQuery + sizeFilter;
                                      FQuery = FQuery + sizeFilter;
                                      GQuery = GQuery + sizeFilter;
                                      HQuery = HQuery + sizeFilter;
                                      IQuery = IQuery + sizeFilter;
                                      JQuery = JQuery + sizeFilter;
                                      KQuery = KQuery + sizeFilter;
                                      LQuery = LQuery + sizeFilter;
                                      MQuery = MQuery + sizeFilter;
                                      NQuery = NQuery + sizeFilter;
                                      OQuery = OQuery + sizeFilter;
                                      PQuery = PQuery + sizeFilter;
                                      QQuery = QQuery + sizeFilter;
                                      RQuery = RQuery + sizeFilter;
                                      SQuery = SQuery + sizeFilter;
                                    });
                                  }, label: Text("Apply"))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                });
              },
            );
          },
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .height / 5,

              //icon: Icon(Icons.drag_handle),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 5,),
                  Text("Filter", style: TextStyle(color: Colors.black)),
                ],
              ),

            ),
          ),
        );
    }
 else  if( _controller.index == 6||_controller.index == 7) {
      return
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              // useRootNavigator:true,

              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return Builder(builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, State) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ExpansionTile(
                                      title: Text("Sort by price"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {});
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
                                              color: priceQuery == "0" ||
                                                  priceQuery == "0D" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'All',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "low" ||
                                                  priceQuery == "lowD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'Low to high',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {});

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
                                              color: priceQuery == "high" ||
                                                  priceQuery == "highD" ? Colors
                                                  .pink.shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        'High to low',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ]
                                  ),

                                  shoesIndex?   ExpansionTile(
                                      title: Text("Shoe Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("shoe1");
                                               sizeFilter = "shoe1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe2 = !shoe2;
                                        selectedSize = <String>[];
                                             if (shoe2 == true){
                                               selectedSize.add("shoe2");
                                               sizeFilter = "shoe2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe3 = !shoe3;
                                        selectedSize = <String>[];
                                             if (shoe3 == true){
                                               selectedSize.add("shoe3");
                                               sizeFilter = "shoe3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '15 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe4 = !shoe4;
                                        selectedSize = <String>[];
                                             if (shoe4 == true){
                                               selectedSize.add("shoe4");
                                               sizeFilter = "shoe4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: shoe4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '16 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      ]
                                  ) :
                                  ringIndex?  ExpansionTile(
                                      title: Text("Ring Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring1 = !ring1;
                                        selectedSize = <String>[];
                                             if (ring1== true){
                                               selectedSize.add("ring1");
                                               sizeFilter = "ring1";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring1
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring2 = !ring2;
                                        selectedSize = <String>[];
                                             if (ring2== true){
                                               selectedSize.add("ring2");
                                               sizeFilter = "ring2";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring2
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '4.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring3 = !ring3;
                                        selectedSize = <String>[];
                                             if (ring3== true){
                                               selectedSize.add("ring3");
                                               sizeFilter = "ring3";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring3
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring4 = !ring4;
                                        selectedSize = <String>[];
                                             if (ring4== true){
                                               selectedSize.add("ring4");
                                               sizeFilter = "ring4";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring4
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '5.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring5 = !ring5;
                                        selectedSize = <String>[];
                                             if (ring5== true){
                                               selectedSize.add("ring5");
                                               sizeFilter = "ring5";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring5
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring6 = !ring6;
                                        selectedSize = <String>[];
                                             if (ring6== true){
                                               selectedSize.add("ring6");
                                               sizeFilter = "ring6";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring6
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '6.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring7 = !ring7;
                                        selectedSize = <String>[];
                                             if (ring7== true){
                                               selectedSize.add("ring7");
                                               sizeFilter = "ring7";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring7
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring8 = !ring8;
                                        selectedSize = <String>[];
                                             if (ring8== true){
                                               selectedSize.add("ring8");
                                               sizeFilter = "ring8";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring8
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '7.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring9 = !ring9;
                                        selectedSize = <String>[];
                                             if (ring9== true){
                                               selectedSize.add("ring9");
                                               sizeFilter = "ring9";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring9
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring10 = !ring10;
                                        selectedSize = <String>[];
                                             if (ring10== true){
                                               selectedSize.add("ring10");
                                               sizeFilter = "ring10";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring10 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '8.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring11 = !ring11;
                                        selectedSize = <String>[];
                                             if (ring11== true){
                                               selectedSize.add("ring11");
                                               sizeFilter = "ring11";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring11 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring12 = !ring12;
                                        selectedSize = <String>[];
                                             if (ring12== true){
                                               selectedSize.add("ring12");
                                               sizeFilter = "ring12";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring12 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '9.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring13 = !ring13;
                                        selectedSize = <String>[];
                                             if (ring13== true){
                                               selectedSize.add("ring13");
                                               sizeFilter = "ring13";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring13 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring14 = !ring14;
                                        selectedSize = <String>[];
                                             if (ring14== true){
                                               selectedSize.add("ring14");
                                               sizeFilter = "ring14";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring14 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '10.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring15 = !ring15;
                                        selectedSize = <String>[];
                                             if (ring15== true){
                                               selectedSize.add("ring15");
                                               sizeFilter = "ring15";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring15 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring16 = !ring16;
                                        selectedSize = <String>[];
                                             if (ring16== true){
                                               selectedSize.add("ring16");
                                               sizeFilter = "ring16";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring16 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '11.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring17 = !ring17;
                                        selectedSize = <String>[];
                                             if (ring17== true){
                                               selectedSize.add("ring17");
                                               sizeFilter = "ring17";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring17 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring18 = !ring18;
                                        selectedSize = <String>[];
                                             if (ring18== true){
                                               selectedSize.add("ring18");
                                               sizeFilter = "ring18";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring18 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '12.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring19 = !ring19;
                                        selectedSize = <String>[];
                                             if (ring19== true){
                                               selectedSize.add("ring19");
                                               sizeFilter = "ring19";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring19 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring20 = !ring20;
                                        selectedSize = <String>[];
                                             if (ring20== true){
                                               selectedSize.add("ring20");
                                               sizeFilter = "ring20";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring20 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring21 = !ring21;
                                        selectedSize = <String>[];
                                             if (ring21== true){
                                               selectedSize.add("ring21");
                                               sizeFilter = "ring21";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring21 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring22 = !ring22;
                                        selectedSize = <String>[];
                                             if (ring22== true){
                                               selectedSize.add("ring22");
                                               sizeFilter = "ring22";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring22 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14.5',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring23 = !ring23;
                                        selectedSize = <String>[];
                                             if (ring23== true){
                                               selectedSize.add("ring23");
                                               sizeFilter = "ring23";
                                             }
                                              else{
sizeFilter = "";
}
});
                                            },
                                            child: Container(
                                              color: ring22 ? Colors.pink
                                                  .shade50 : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '15',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ):
                                  ExpansionTile(
                                      title: Text("Clothing Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("XXXS");
                                                  sizeFilter = "XXXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '13 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxs = !xxs;
                                                selectedSize = <String>[];
                                                if (xxs == true){
                                                  selectedSize.add("XXS");
                                                  sizeFilter = "XXS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xxs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '14 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xs = !xs;
                                                selectedSize = <String>[];
                                                if (xs == true){
                                                  selectedSize.add("XS");
                                                  sizeFilter = "XS";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: xs
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '15 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                s = !s;
                                                selectedSize = <String>[];
                                                if (s == true){
                                                  selectedSize.add("S");
                                                  sizeFilter = "S";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: s
                                                  ? Colors.pink.shade50
                                                  : Colors.white,

                                              height: 50,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  FittedBox(
                                                      child: Text(
                                                        '16 years',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      ]
                                  ),


                                  ExpansionTile(
                                      title: Text("Avoid Duties & Taxes"),
                                      children: [Column(
                                        children: [
                                          Text("(Shop within your country)"),
                                          GFToggle(
                                            onChanged: (val) {
                                              setState(() {
                                                duties = val;
                                              });
                                            },
                                            value: duties,
                                            type: GFToggleType.custom,
                                          ),
                                        ],
                                      ),
                                      ]
                                  ),
                                  FloatingActionButton.extended(onPressed: () {
                                    duties ? setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                      priceQuery = priceQuery + "D";
                                      AQuery = AQuery + "D";
                                      BQuery = BQuery + "D";
                                      CQuery = CQuery + "D";
                                      DQuery = DQuery + "D";
                                      EQuery = EQuery + "D";
                                      FQuery = FQuery + "D";
                                      GQuery = GQuery + "D";
                                      HQuery = HQuery + "D";
                                      IQuery = IQuery + "D";
                                      JQuery = JQuery + "D";
                                      KQuery = KQuery + "D";
                                      LQuery = LQuery + "D";
                                      MQuery = MQuery + "D";
                                      NQuery = NQuery + "D";
                                      OQuery = OQuery + "D";
                                      PQuery = PQuery + "D";
                                      QQuery = QQuery + "D";
                                      RQuery = RQuery + "D";
                                      SQuery = SQuery + "D";
                                    }) :
                                    setState(() {
                                      priceQuery =
                                          priceQuery.replaceAll("D", "");
                                      AQuery = AQuery.replaceAll("D", "");
                                      BQuery = BQuery.replaceAll("D", "");
                                      CQuery = CQuery.replaceAll("D", "");
                                      DQuery = DQuery.replaceAll("D", "");
                                      EQuery = EQuery.replaceAll("D", "");
                                      FQuery = FQuery.replaceAll("D", "");
                                      GQuery = GQuery.replaceAll("D", "");
                                      HQuery = HQuery.replaceAll("D", "");
                                      IQuery = IQuery.replaceAll("D", "");
                                      JQuery = JQuery.replaceAll("D", "");
                                      KQuery = KQuery.replaceAll("D", "");
                                      LQuery = LQuery.replaceAll("D", "");
                                      MQuery = MQuery.replaceAll("D", "");
                                      NQuery = NQuery.replaceAll("D", "");
                                      OQuery = OQuery.replaceAll("D", "");
                                      PQuery = PQuery.replaceAll("D", "");
                                      QQuery = QQuery.replaceAll("D", "");
                                      RQuery = RQuery.replaceAll("D", "");
                                      SQuery = SQuery.replaceAll("D", "");
                                    });
                                    setState(() {
                                      priceQuery = priceQuery.replaceAll(sizeFilter, "");
                                      AQuery = AQuery.replaceAll(sizeFilter, "");
                                      BQuery = BQuery.replaceAll(sizeFilter, "");
                                      CQuery = CQuery.replaceAll(sizeFilter, "");
                                      DQuery = DQuery.replaceAll(sizeFilter, "");
                                      EQuery = EQuery.replaceAll(sizeFilter, "");
                                      FQuery = FQuery.replaceAll(sizeFilter, "");
                                      GQuery = GQuery.replaceAll(sizeFilter, "");
                                      HQuery = HQuery.replaceAll(sizeFilter, "");
                                      IQuery = IQuery.replaceAll(sizeFilter, "");
                                      JQuery = JQuery.replaceAll(sizeFilter, "");
                                      KQuery = KQuery.replaceAll(sizeFilter, "");
                                      LQuery = LQuery.replaceAll(sizeFilter, "");
                                      MQuery = MQuery.replaceAll(sizeFilter, "");
                                      NQuery = NQuery.replaceAll(sizeFilter, "");
                                      OQuery = OQuery.replaceAll(sizeFilter, "");
                                      PQuery = PQuery.replaceAll(sizeFilter, "");
                                      QQuery = QQuery.replaceAll(sizeFilter, "");
                                      RQuery = RQuery.replaceAll(sizeFilter, "");
                                      SQuery = SQuery.replaceAll(sizeFilter, "");
                                      priceQuery = priceQuery + sizeFilter;
                                      AQuery = AQuery + sizeFilter;
                                      BQuery = BQuery + sizeFilter;
                                      CQuery = CQuery + sizeFilter;
                                      DQuery = DQuery + sizeFilter;
                                      EQuery = EQuery + sizeFilter;
                                      FQuery = FQuery + sizeFilter;
                                      GQuery = GQuery + sizeFilter;
                                      HQuery = HQuery + sizeFilter;
                                      IQuery = IQuery + sizeFilter;
                                      JQuery = JQuery + sizeFilter;
                                      KQuery = KQuery + sizeFilter;
                                      LQuery = LQuery + sizeFilter;
                                      MQuery = MQuery + sizeFilter;
                                      NQuery = NQuery + sizeFilter;
                                      OQuery = OQuery + sizeFilter;
                                      PQuery = PQuery + sizeFilter;
                                      QQuery = QQuery + sizeFilter;
                                      RQuery = RQuery + sizeFilter;
                                      SQuery = SQuery + sizeFilter;
                                    });
                                  }, label: Text("Apply"))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                });
              },
            );
          },
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .height / 5,

              //icon: Icon(Icons.drag_handle),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 5,),
                  Text("Filter", style: TextStyle(color: Colors.black)),
                ],
              ),

            ),
          ),
        );
    }


  }
  @override
  Widget build(BuildContext context) {
  return  Row(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Container(
            decoration: new BoxDecoration(color: Colors.black),
            width: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.height/20,
            child: new TabBar(

              ///filled
              labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
              ///outline
              unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
              isScrollable: true,
              controller: _controller,
              tabs: <Widget>[
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Women',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),

                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text('Men',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Baby-Boys',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Baby-Girls',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Kids-Boys',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Kids-Girls',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(

                  fit:BoxFit.fitWidth,
                  child: Text(   'Teen-Boys',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Text(   'Teen-Girls',
                    style: TextStyle(

                        fontSize:    SizeConfig.blockSizeHorizontal*4,
                        color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height/2.3,

          child: Column(
            children: [
              Container(
                  height:MediaQuery.of(context).size.height/19,
                  child:Row(
                    children: [
                      Filter(),
                      InkWell(
                        onTap: (){ setState(() {
                          tabs = !tabs ;
                        });   },
                        child: FittedBox(
                          fit:  BoxFit.fitHeight,
                          child: Container(

                            width:MediaQuery.of(context).size.height/5,

                            //icon: Icon(Icons.drag_handle),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Category",style:TextStyle(color: Colors.black)),
                                SizedBox(width: 5,),

                                Icon(Icons.sort),

                              ],
                            ),

                          ),
                        ),
                      ),


                    ],
                  )),

              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*0.65,
                width:MediaQuery.of(context).size.height*0.97,
                child: Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Women(),
                      Men(),

                      BabyBoy(),
                      BabyGirl(),
                      KidBoy(),
                      KidGirl(),
                      TeenBoy(),
                      TeenGirl(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class Tabs {
  final String title;
  final Color color;
  Tabs({this.title,this.color});
}
