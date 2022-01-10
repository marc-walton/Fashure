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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("Shoe1");
                                               sizeFilter = "Shoe1";
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
                                               selectedSize.add("Shoe2");
                                               sizeFilter = "Shoe2";
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
                                               selectedSize.add("Shoe3");
                                               sizeFilter = "Shoe3";
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
                                               selectedSize.add("Shoe4");
                                               sizeFilter = "Shoe4";
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
                                               selectedSize.add("Shoe5");
                                               sizeFilter = "Shoe5";
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
                                               selectedSize.add("Shoe6");
                                               sizeFilter = "Shoe6";
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
                                               selectedSize.add("Shoe7");
                                               sizeFilter = "Shoe7";
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
                                               selectedSize.add("Shoe8");
                                               sizeFilter = "Shoe8";
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
                                               selectedSize.add("Shoe9");
                                               sizeFilter = "Shoe9";
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
                                               selectedSize.add("Shoe10");
                                               sizeFilter = "Shoe10";
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
                                               selectedSize.add("Shoe11");
                                               sizeFilter = "Shoe11";
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
                                               selectedSize.add("Shoe12");
                                               sizeFilter = "Shoe12";
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
                                               selectedSize.add("Shoe13");
                                               sizeFilter = "Shoe13";
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
                                               selectedSize.add("Shoe14");
                                               sizeFilter = "Shoe14";
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
                                               selectedSize.add("Shoe15");
                                               sizeFilter = "Shoe15";
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
                                               selectedSize.add("Shoe16");
                                               sizeFilter = "Shoe16";
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
                                               selectedSize.add("Shoe17");
                                               sizeFilter = "Shoe17";
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
                                               selectedSize.add("Shoe18");
                                               sizeFilter = "Shoe18";
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
                                               selectedSize.add("Shoe19");
                                               sizeFilter = "Shoe19";
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
                                               selectedSize.add("Shoe20");
                                               sizeFilter = "Shoe20";
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
                                               selectedSize.add("Shoe21");
                                               sizeFilter = "Shoe21";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring1 = !ring1;
                                        selectedSize = <String>[];
                                             if (ring1== true){
                                               selectedSize.add("Ring1");
                                               sizeFilter = "Ring1";
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
                                               selectedSize.add("Ring2");
                                               sizeFilter = "Ring2";
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
                                               selectedSize.add("Ring3");
                                               sizeFilter = "Ring3";
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
                                               selectedSize.add("Ring4");
                                               sizeFilter = "Ring4";
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
                                               selectedSize.add("Ring5");
                                               sizeFilter = "Ring5";
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
                                               selectedSize.add("Ring6");
                                               sizeFilter = "Ring6";
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
                                               selectedSize.add("Ring7");
                                               sizeFilter = "Ring7";
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
                                               selectedSize.add("Ring8");
                                               sizeFilter = "Ring8";
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
                                               selectedSize.add("Ring9");
                                               sizeFilter = "Ring9";
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
                                               selectedSize.add("Ring10");
                                               sizeFilter = "Ring10";
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
                                               selectedSize.add("Ring11");
                                               sizeFilter = "Ring11";
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
                                               selectedSize.add("Ring12");
                                               sizeFilter = "Ring12";
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
                                               selectedSize.add("Ring13");
                                               sizeFilter = "Ring13";
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
                                               selectedSize.add("Ring14");
                                               sizeFilter = "Ring14";
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
                                               selectedSize.add("Ring15");
                                               sizeFilter = "Ring15";
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
                                               selectedSize.add("Ring16");
                                               sizeFilter = "Ring16";
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
                                               selectedSize.add("Ring17");
                                               sizeFilter = "Ring17";
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
                                               selectedSize.add("Ring18");
                                               sizeFilter = "Ring18";
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
                                               selectedSize.add("Ring19");
                                               sizeFilter = "Ring19";
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
                                               selectedSize.add("Ring20");
                                               sizeFilter = "Ring20";
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
                                               selectedSize.add("Ring21");
                                               sizeFilter = "Ring21";
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
                                               selectedSize.add("Ring22");
                                               sizeFilter = "Ring22";
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
                                               selectedSize.add("Ring23");
                                               sizeFilter = "Ring23";
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
                                      title: Text("Sort by Size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                frees = !frees;
                                                selectedSize = <String>[];
                                                if (frees== true){
                                                  selectedSize.add("freesizeQuantity");
                                                  sizeFilter = "freesizeQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: frees ? Colors.pink
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
                                                        'Free Size',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: ()
                                            {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("xxxsQuantity");
                                                  sizeFilter = "xxxsQuantity";
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
                                                  selectedSize.add("xxsQuantity");
                                                  sizeFilter = "xxsQuantity";
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
                                                  selectedSize.add("xsQuantity");
                                                  sizeFilter = "xsQuantity";
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
                                                  selectedSize.add("sQuantity");
                                                  sizeFilter = "sQuantity";
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
                                                  selectedSize.add("mQuantity");
                                                  sizeFilter = "mQuantity";
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
                                                  selectedSize.add("lQuantity");
                                                  sizeFilter = "lQuantity";
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
                                                  selectedSize.add("xlQuantity");
                                                  sizeFilter = "xlQuantity";
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
                                                  selectedSize.add("xxlQuantity");
                                                  sizeFilter = "xxlQuantity";
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
                                                  selectedSize.add("xxxlQuantity");
                                                  sizeFilter = "xxxlQuantity";
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
                                                  selectedSize.add("fourxlQuantity");
                                                  sizeFilter = "fourxlQuantity";
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
                                                  selectedSize.add("fivexlQuantity");
                                                  sizeFilter = "fivexlQuantity";
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
                                                  selectedSize.add("sixxlQuantity");
                                                  sizeFilter = "sixxlQuantity";
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
                                                  selectedSize.add("sevenxlQuantity");
                                                  sizeFilter = "sevenxlQuantity";
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
                                                  selectedSize.add("eightxlQuantity");
                                                  sizeFilter = "eightxlQuantity";
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
                                   priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
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
                                      priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
                                      priceQuery = priceQuery + "S$sizeFilter";
                                      AQuery = AQuery + "S$sizeFilter";
                                      BQuery = BQuery + "S$sizeFilter";
                                      CQuery = CQuery + "S$sizeFilter";
                                      DQuery = DQuery + "S$sizeFilter";
                                      EQuery = EQuery + "S$sizeFilter";
                                      FQuery = FQuery + "S$sizeFilter";
                                      GQuery = GQuery + "S$sizeFilter";
                                      HQuery = HQuery + "S$sizeFilter";
                                      IQuery = IQuery + "S$sizeFilter";
                                      JQuery = JQuery + "S$sizeFilter";
                                      KQuery = KQuery + "S$sizeFilter";
                                      LQuery = LQuery + "S$sizeFilter";
                                      MQuery = MQuery + "S$sizeFilter";
                                      NQuery = NQuery + "S$sizeFilter";
                                      OQuery = OQuery + "S$sizeFilter";
                                      PQuery = PQuery + "S$sizeFilter";
                                      QQuery = QQuery + "S$sizeFilter";
                                      RQuery = RQuery + "S$sizeFilter";
                                      SQuery = SQuery + "S$sizeFilter";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("Shoe1");
                                               sizeFilter = "Shoe1";
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
                                               selectedSize.add("Shoe2");
                                               sizeFilter = "Shoe2";
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
                                               selectedSize.add("Shoe3");
                                               sizeFilter = "Shoe3";
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
                                               selectedSize.add("Shoe4");
                                               sizeFilter = "Shoe4";
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
                                               selectedSize.add("Shoe5");
                                               sizeFilter = "Shoe5";
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
                                               selectedSize.add("Shoe6");
                                               sizeFilter = "Shoe6";
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
                                               selectedSize.add("Shoe7");
                                               sizeFilter = "Shoe7";
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
                                               selectedSize.add("Shoe8");
                                               sizeFilter = "Shoe8";
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
                                               selectedSize.add("Shoe9");
                                               sizeFilter = "Shoe9";
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
                                               selectedSize.add("Shoe10");
                                               sizeFilter = "Shoe10";
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
                                               selectedSize.add("Shoe11");
                                               sizeFilter = "Shoe11";
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
                                               selectedSize.add("Shoe12");
                                               sizeFilter = "Shoe12";
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
                                               selectedSize.add("Shoe13");
                                               sizeFilter = "Shoe13";
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
                                               selectedSize.add("Shoe14");
                                               sizeFilter = "Shoe14";
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
                                               selectedSize.add("Shoe15");
                                               sizeFilter = "Shoe15";
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
                                               selectedSize.add("Shoe16");
                                               sizeFilter = "Shoe16";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring1 = !ring1;
                                        selectedSize = <String>[];
                                             if (ring1== true){
                                               selectedSize.add("Ring1");
                                               sizeFilter = "Ring1";
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
                                               selectedSize.add("Ring2");
                                               sizeFilter = "Ring2";
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
                                               selectedSize.add("Ring3");
                                               sizeFilter = "Ring3";
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
                                               selectedSize.add("Ring4");
                                               sizeFilter = "Ring4";
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
                                               selectedSize.add("Ring5");
                                               sizeFilter = "Ring5";
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
                                               selectedSize.add("Ring6");
                                               sizeFilter = "Ring6";
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
                                               selectedSize.add("Ring7");
                                               sizeFilter = "Ring7";
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
                                               selectedSize.add("Ring8");
                                               sizeFilter = "Ring8";
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
                                               selectedSize.add("Ring9");
                                               sizeFilter = "Ring9";
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
                                               selectedSize.add("Ring10");
                                               sizeFilter = "Ring10";
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
                                               selectedSize.add("Ring11");
                                               sizeFilter = "Ring11";
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
                                               selectedSize.add("Ring12");
                                               sizeFilter = "Ring12";
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
                                               selectedSize.add("Ring13");
                                               sizeFilter = "Ring13";
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
                                               selectedSize.add("Ring14");
                                               sizeFilter = "Ring14";
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
                                               selectedSize.add("Ring15");
                                               sizeFilter = "Ring15";
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
                                               selectedSize.add("Ring16");
                                               sizeFilter = "Ring16";
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
                                               selectedSize.add("Ring17");
                                               sizeFilter = "Ring17";
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
                                               selectedSize.add("Ring18");
                                               sizeFilter = "Ring18";
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
                                               selectedSize.add("Ring19");
                                               sizeFilter = "Ring19";
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
                                               selectedSize.add("Ring20");
                                               sizeFilter = "Ring20";
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
                                               selectedSize.add("Ring21");
                                               sizeFilter = "Ring21";
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
                                               selectedSize.add("Ring22");
                                               sizeFilter = "Ring22";
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
                                               selectedSize.add("Ring23");
                                               sizeFilter = "Ring23";
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
                                      title: Text("Sort by size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                frees = !frees;
                                                selectedSize = <String>[];
                                                if (frees== true){
                                                  selectedSize.add("freesizeQuantity");
                                                  sizeFilter = "freesizeQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: frees ? Colors.pink
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
                                                        'Free Size',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: ()
                                            {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("xxxsQuantity");
                                                  sizeFilter = "xxxsQuantity";
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
                                                  selectedSize.add("xxsQuantity");
                                                  sizeFilter = "xxsQuantity";
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
                                                  selectedSize.add("xsQuantity");
                                                  sizeFilter = "xsQuantity";
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
                                                  selectedSize.add("sQuantity");
                                                  sizeFilter = "sQuantity";
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
                                                  selectedSize.add("mQuantity");
                                                  sizeFilter = "mQuantity";
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
                                                  selectedSize.add("lQuantity");
                                                  sizeFilter = "lQuantity";
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
                                                  selectedSize.add("xlQuantity");
                                                  sizeFilter = "xlQuantity";
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
                                                  selectedSize.add("xxlQuantity");
                                                  sizeFilter = "xxlQuantity";
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
                                                  selectedSize.add("xxxlQuantity");
                                                  sizeFilter = "xxxlQuantity";
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
                                                  selectedSize.add("fourxlQuantity");
                                                  sizeFilter = "fourxlQuantity";
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
                                                  selectedSize.add("fivexlQuantity");
                                                  sizeFilter = "fivexlQuantity";
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
                                                  selectedSize.add("sixxlQuantity");
                                                  sizeFilter = "sixxlQuantity";
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
                                                  selectedSize.add("sevenxlQuantity");
                                                  sizeFilter = "sevenxlQuantity";
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
                                                  selectedSize.add("eightxlQuantity");
                                                  sizeFilter = "eightxlQuantity";
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
                                   priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
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
                                      priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
                                      priceQuery = priceQuery + "S$sizeFilter";
                                      AQuery = AQuery + "S$sizeFilter";
                                      BQuery = BQuery + "S$sizeFilter";
                                      CQuery = CQuery + "S$sizeFilter";
                                      DQuery = DQuery + "S$sizeFilter";
                                      EQuery = EQuery + "S$sizeFilter";
                                      FQuery = FQuery + "S$sizeFilter";
                                      GQuery = GQuery + "S$sizeFilter";
                                      HQuery = HQuery + "S$sizeFilter";
                                      IQuery = IQuery + "S$sizeFilter";
                                      JQuery = JQuery + "S$sizeFilter";
                                      KQuery = KQuery + "S$sizeFilter";
                                      LQuery = LQuery + "S$sizeFilter";
                                      MQuery = MQuery + "S$sizeFilter";
                                      NQuery = NQuery + "S$sizeFilter";
                                      OQuery = OQuery + "S$sizeFilter";
                                      PQuery = PQuery + "S$sizeFilter";
                                      QQuery = QQuery + "S$sizeFilter";
                                      RQuery = RQuery + "S$sizeFilter";
                                      SQuery = SQuery + "S$sizeFilter";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("Shoe1");
                                               sizeFilter = "Shoe1";
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
                                               selectedSize.add("Shoe2");
                                               sizeFilter = "Shoe2";
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
                                               selectedSize.add("Shoe3");
                                               sizeFilter = "Shoe3";
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
                                               selectedSize.add("Shoe4");
                                               sizeFilter = "Shoe4";
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
                                               selectedSize.add("Shoe5");
                                               sizeFilter = "Shoe5";
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
                                               selectedSize.add("Shoe6");
                                               sizeFilter = "Shoe6";
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
                                               selectedSize.add("Shoe7");
                                               sizeFilter = "Shoe7";
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
                                      title: Text("Sort by size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                frees = !frees;
                                                selectedSize = <String>[];
                                                if (frees== true){
                                                  selectedSize.add("freesizeQuantity");
                                                  sizeFilter = "freesizeQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: frees ? Colors.pink
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
                                                        'Free Size',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("xxxsQuantity");
                                                  sizeFilter = "xxxsQuantity";
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
                                                  selectedSize.add("xxsQuantity");
                                                  sizeFilter = "xxsQuantity";
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
                                                  selectedSize.add("xsQuantity");
                                                  sizeFilter = "xsQuantity";
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
                                                  selectedSize.add("sQuantity");
                                                  sizeFilter = "sQuantity";
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
                                                  selectedSize.add("mQuantity");
                                                  sizeFilter = "mQuantity";
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
                                                  selectedSize.add("lQuantity");
                                                  sizeFilter = "lQuantity";
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
                                   priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
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
                                      priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
                                      priceQuery = priceQuery + "S$sizeFilter";
                                      AQuery = AQuery + "S$sizeFilter";
                                      BQuery = BQuery + "S$sizeFilter";
                                      CQuery = CQuery + "S$sizeFilter";
                                      DQuery = DQuery + "S$sizeFilter";
                                      EQuery = EQuery + "S$sizeFilter";
                                      FQuery = FQuery + "S$sizeFilter";
                                      GQuery = GQuery + "S$sizeFilter";
                                      HQuery = HQuery + "S$sizeFilter";
                                      IQuery = IQuery + "S$sizeFilter";
                                      JQuery = JQuery + "S$sizeFilter";
                                      KQuery = KQuery + "S$sizeFilter";
                                      LQuery = LQuery + "S$sizeFilter";
                                      MQuery = MQuery + "S$sizeFilter";
                                      NQuery = NQuery + "S$sizeFilter";
                                      OQuery = OQuery + "S$sizeFilter";
                                      PQuery = PQuery + "S$sizeFilter";
                                      QQuery = QQuery + "S$sizeFilter";
                                      RQuery = RQuery + "S$sizeFilter";
                                      SQuery = SQuery + "S$sizeFilter";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("Shoe1");
                                               sizeFilter = "Shoe1";
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
                                               selectedSize.add("Shoe2");
                                               sizeFilter = "Shoe2";
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
                                               selectedSize.add("Shoe3");
                                               sizeFilter = "Shoe3";
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
                                               selectedSize.add("Shoe4");
                                               sizeFilter = "Shoe4";
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
                                               selectedSize.add("Shoe5");
                                               sizeFilter = "Shoe5";
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
                                               selectedSize.add("Shoe6");
                                               sizeFilter = "Shoe6";
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
                                               selectedSize.add("Shoe7");
                                               sizeFilter = "Shoe7";
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
                                               selectedSize.add("Shoe8");
                                               sizeFilter = "Shoe8";
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
                                               selectedSize.add("Shoe9");
                                               sizeFilter = "Shoe9";
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
                                               selectedSize.add("Shoe10");
                                               sizeFilter = "Shoe10";
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
                                               selectedSize.add("Shoe11");
                                               sizeFilter = "Shoe11";
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
                                               selectedSize.add("Shoe12");
                                               sizeFilter = "Shoe12";
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
                                               selectedSize.add("Shoe13");
                                               sizeFilter = "Shoe13";
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
                                               selectedSize.add("Shoe14");
                                               sizeFilter = "Shoe14";
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
                                      title: Text("Sort by size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                frees = !frees;
                                                selectedSize = <String>[];
                                                if (frees== true){
                                                  selectedSize.add("freesizeQuantity");
                                                  sizeFilter = "freesizeQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: frees ? Colors.pink
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
                                                        'Free Size',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("xxxsQuantity");
                                                  sizeFilter = "xxxsQuantity";
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
                                                  selectedSize.add("xxsQuantity");
                                                  sizeFilter = "xxsQuantity";
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
                                                  selectedSize.add("xsQuantity");
                                                  sizeFilter = "xsQuantity";
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
                                                  selectedSize.add("sQuantity");
                                                  sizeFilter = "sQuantity";
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
                                                  selectedSize.add("mQuantity");
                                                  sizeFilter = "mQuantity";
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
                                                  selectedSize.add("lQuantity");
                                                  sizeFilter = "lQuantity";
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
                                                  selectedSize.add("xlQuantity");
                                                  sizeFilter = "xlQuantity";
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
                                                  selectedSize.add("xxlQuantity");
                                                  sizeFilter = "xxlQuantity";
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
                                                  selectedSize.add("xxxlQuantity");
                                                  sizeFilter = "xxxlQuantity";
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
                                                  selectedSize.add("fourxlQuantity");
                                                  sizeFilter = "fourxlQuantity";
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
                                   priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
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
                                      priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
                                      priceQuery = priceQuery + "S$sizeFilter";
                                      AQuery = AQuery + "S$sizeFilter";
                                      BQuery = BQuery + "S$sizeFilter";
                                      CQuery = CQuery + "S$sizeFilter";
                                      DQuery = DQuery + "S$sizeFilter";
                                      EQuery = EQuery + "S$sizeFilter";
                                      FQuery = FQuery + "S$sizeFilter";
                                      GQuery = GQuery + "S$sizeFilter";
                                      HQuery = HQuery + "S$sizeFilter";
                                      IQuery = IQuery + "S$sizeFilter";
                                      JQuery = JQuery + "S$sizeFilter";
                                      KQuery = KQuery + "S$sizeFilter";
                                      LQuery = LQuery + "S$sizeFilter";
                                      MQuery = MQuery + "S$sizeFilter";
                                      NQuery = NQuery + "S$sizeFilter";
                                      OQuery = OQuery + "S$sizeFilter";
                                      PQuery = PQuery + "S$sizeFilter";
                                      QQuery = QQuery + "S$sizeFilter";
                                      RQuery = RQuery + "S$sizeFilter";
                                      SQuery = SQuery + "S$sizeFilter";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       shoe1 = !shoe1;
                                        selectedSize = <String>[];
                                             if (shoe1 == true){
                                               selectedSize.add("Shoe1");
                                               sizeFilter = "Shoe1";
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
                                               selectedSize.add("Shoe2");
                                               sizeFilter = "Shoe2";
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
                                               selectedSize.add("Shoe3");
                                               sizeFilter = "Shoe3";
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
                                               selectedSize.add("Shoe4");
                                               sizeFilter = "Shoe4";
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
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                       ring1 = !ring1;
                                        selectedSize = <String>[];
                                             if (ring1== true){
                                               selectedSize.add("Ring1");
                                               sizeFilter = "Ring1";
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
                                               selectedSize.add("Ring2");
                                               sizeFilter = "Ring2";
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
                                               selectedSize.add("Ring3");
                                               sizeFilter = "Ring3";
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
                                               selectedSize.add("Ring4");
                                               sizeFilter = "Ring4";
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
                                               selectedSize.add("Ring5");
                                               sizeFilter = "Ring5";
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
                                               selectedSize.add("Ring6");
                                               sizeFilter = "Ring6";
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
                                               selectedSize.add("Ring7");
                                               sizeFilter = "Ring7";
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
                                               selectedSize.add("Ring8");
                                               sizeFilter = "Ring8";
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
                                               selectedSize.add("Ring9");
                                               sizeFilter = "Ring9";
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
                                               selectedSize.add("Ring10");
                                               sizeFilter = "Ring10";
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
                                               selectedSize.add("Ring11");
                                               sizeFilter = "Ring11";
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
                                               selectedSize.add("Ring12");
                                               sizeFilter = "Ring12";
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
                                               selectedSize.add("Ring13");
                                               sizeFilter = "Ring13";
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
                                               selectedSize.add("Ring14");
                                               sizeFilter = "Ring14";
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
                                               selectedSize.add("Ring15");
                                               sizeFilter = "Ring15";
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
                                               selectedSize.add("Ring16");
                                               sizeFilter = "Ring16";
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
                                               selectedSize.add("Ring17");
                                               sizeFilter = "Ring17";
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
                                               selectedSize.add("Ring18");
                                               sizeFilter = "Ring18";
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
                                               selectedSize.add("Ring19");
                                               sizeFilter = "Ring19";
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
                                               selectedSize.add("Ring20");
                                               sizeFilter = "Ring20";
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
                                               selectedSize.add("Ring21");
                                               sizeFilter = "Ring21";
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
                                               selectedSize.add("Ring22");
                                               sizeFilter = "Ring22";
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
                                               selectedSize.add("Ring23");
                                               sizeFilter = "Ring23";
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
                                      title: Text("Sort by size"),
                                      children: [Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                mtos = !mtos;
                                                selectedSize = <String>[];
                                                if (mtos== true){
                                                  selectedSize.add("mtoQuantity");
                                                  sizeFilter = "mtoQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: mtos ? Colors.pink
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
                                                        'Made-to-order',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                frees = !frees;
                                                selectedSize = <String>[];
                                                if (frees== true){
                                                  selectedSize.add("freesizeQuantity");
                                                  sizeFilter = "freesizeQuantity";
                                                }
                                                else{
                                                  sizeFilter = "";
                                                }
                                              });
                                            },
                                            child: Container(
                                              color: frees ? Colors.pink
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
                                                        'Free Size',
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              State(() {
                                                xxxs = !xxxs;
                                                selectedSize = <String>[];
                                                if (xxxs == true){
                                                  selectedSize.add("xxxsQuantity");
                                                  sizeFilter = "xxxsQuantity";
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
                                                  selectedSize.add("xxsQuantity");
                                                  sizeFilter = "xxsQuantity";
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
                                                  selectedSize.add("xsQuantity");
                                                  sizeFilter = "xsQuantity";
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
                                                  selectedSize.add("sQuantity");
                                                  sizeFilter = "sQuantity";
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
                                   priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
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
                                      priceQuery = priceQuery.replaceAll("S$sizeFilter", "");
                                      AQuery = AQuery.replaceAll("S$sizeFilter", "");
                                      BQuery = BQuery.replaceAll("S$sizeFilter", "");
                                      CQuery = CQuery.replaceAll("S$sizeFilter", "");
                                      DQuery = DQuery.replaceAll("S$sizeFilter", "");
                                      EQuery = EQuery.replaceAll("S$sizeFilter", "");
                                      FQuery = FQuery.replaceAll("S$sizeFilter", "");
                                      GQuery = GQuery.replaceAll("S$sizeFilter", "");
                                      HQuery = HQuery.replaceAll("S$sizeFilter", "");
                                      IQuery = IQuery.replaceAll("S$sizeFilter", "");
                                      JQuery = JQuery.replaceAll("S$sizeFilter", "");
                                      KQuery = KQuery.replaceAll("S$sizeFilter", "");
                                      LQuery = LQuery.replaceAll("S$sizeFilter", "");
                                      MQuery = MQuery.replaceAll("S$sizeFilter", "");
                                      NQuery = NQuery.replaceAll("S$sizeFilter", "");
                                      OQuery = OQuery.replaceAll("S$sizeFilter", "");
                                      PQuery = PQuery.replaceAll("S$sizeFilter", "");
                                      QQuery = QQuery.replaceAll("S$sizeFilter", "");
                                      RQuery = RQuery.replaceAll("S$sizeFilter", "");
                                      SQuery = SQuery.replaceAll("S$sizeFilter", "");
                                      priceQuery = priceQuery + "S$sizeFilter";
                                      AQuery = AQuery + "S$sizeFilter";
                                      BQuery = BQuery + "S$sizeFilter";
                                      CQuery = CQuery + "S$sizeFilter";
                                      DQuery = DQuery + "S$sizeFilter";
                                      EQuery = EQuery + "S$sizeFilter";
                                      FQuery = FQuery + "S$sizeFilter";
                                      GQuery = GQuery + "S$sizeFilter";
                                      HQuery = HQuery + "S$sizeFilter";
                                      IQuery = IQuery + "S$sizeFilter";
                                      JQuery = JQuery + "S$sizeFilter";
                                      KQuery = KQuery + "S$sizeFilter";
                                      LQuery = LQuery + "S$sizeFilter";
                                      MQuery = MQuery + "S$sizeFilter";
                                      NQuery = NQuery + "S$sizeFilter";
                                      OQuery = OQuery + "S$sizeFilter";
                                      PQuery = PQuery + "S$sizeFilter";
                                      QQuery = QQuery + "S$sizeFilter";
                                      RQuery = RQuery + "S$sizeFilter";
                                      SQuery = SQuery + "S$sizeFilter";
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
  return
    Column(children:[
      Container(
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

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),

            FittedBox(
              fit:BoxFit.fitWidth,
              child: Text('Men',
                style: TextStyle(

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),
            FittedBox(
              fit:BoxFit.fitWidth,
              child: Text(   'Baby-Boys',
                style: TextStyle(

                color: Colors.white),),
            ),
            FittedBox(
              fit:BoxFit.fitWidth,
              child: Text(   'Baby-Girls',
                style: TextStyle(

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),
            FittedBox(
              fit:BoxFit.fitWidth,
              child: Text(   'Kids-Boys',
                style: TextStyle(

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),
            FittedBox(
              fit:BoxFit.fitWidth,
              child: Text(   'Kids-Girls',
                style: TextStyle(

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),
            FittedBox(

              fit:BoxFit.fitWidth,
              child: Text(   'Teen-Boys',
                style: TextStyle(

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),
            FittedBox(
              fit:BoxFit.fitWidth,
              child: Text(   'Teen-Girls',
                style: TextStyle(

                    // fontSize:    SizeConfig.blockSizeHorizontal*4,
                    color: Colors.white),),
            ),
          ],
        ),
      ),
    Container(
              height:MediaQuery.of(context).size.height/18,
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
      Flexible(
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
    ]);


  //   Scaffold(
  //   appBar:AppBar(
  //     toolbarHeight: 50,
  //     backgroundColor: kPrimaryColor,
  //     bottom:    PreferredSize(
  //     preferredSize: Size.fromHeight(50.0),
  //
  //     child:
  //     Container(
  //       decoration: new BoxDecoration(color: Colors.black),
  //       width: MediaQuery.of(context).size.height,
  //       height: MediaQuery.of(context).size.height/20,
  //       child: new TabBar(
  //
  //         ///filled
  //         labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
  //         ///outline
  //         unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
  //         isScrollable: true,
  //         controller: _controller,
  //         tabs: <Widget>[
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Women',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text('Men',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Baby-Boys',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Baby-Girls',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Kids-Boys',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Kids-Girls',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //           FittedBox(
  //
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Teen-Boys',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //           FittedBox(
  //             fit:BoxFit.fitWidth,
  //             child: Text(   'Teen-Girls',
  //               style: TextStyle(
  //
  //                   fontSize:    SizeConfig.blockSizeHorizontal*4,
  //                   color: Colors.white),),
  //           ),
  //         ],
  //       ),
  //     ),
  //     // Row(
  //     //   children: [
  //     //     RotatedBox(
  //     //       quarterTurns: 3,
  //     //       child: Container(
  //     //         decoration: new BoxDecoration(color: Colors.black),
  //     //         width: MediaQuery.of(context).size.height,
  //     //         height: MediaQuery.of(context).size.height/20,
  //     //         child: new TabBar(
  //     //
  //     //           ///filled
  //     //           labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
  //     //           ///outline
  //     //           unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
  //     //           isScrollable: true,
  //     //           controller: _controller,
  //     //           tabs: <Widget>[
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Women',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text('Men',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Baby-Boys',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Baby-Girls',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Kids-Boys',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Kids-Girls',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //             FittedBox(
  //     //
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Teen-Boys',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //             FittedBox(
  //     //               fit:BoxFit.fitWidth,
  //     //               child: Text(   'Teen-Girls',
  //     //                 style: TextStyle(
  //     //
  //     //                     fontSize:    SizeConfig.blockSizeHorizontal*4,
  //     //                     color: Colors.white),),
  //     //             ),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //     ),
  //     //   ],
  //     // ),
  //   ),
  //   ),
  //   body:
  //
  //   // Column(
  //   //   children: [
  //   //     Container(
  //   //         height:MediaQuery.of(context).size.height/18,
  //   //         child:Row(
  //   //           children: [
  //   //             Filter(),
  //   //             InkWell(
  //   //               onTap: (){ setState(() {
  //   //                 tabs = !tabs ;
  //   //               });   },
  //   //               child: FittedBox(
  //   //                 fit:  BoxFit.fitHeight,
  //   //                 child: Container(
  //   //
  //   //                   width:MediaQuery.of(context).size.height/5,
  //   //
  //   //                   //icon: Icon(Icons.drag_handle),
  //   //                   child:Row(
  //   //                     mainAxisAlignment: MainAxisAlignment.center,
  //   //                     children: [
  //   //                       Text("Category",style:TextStyle(color: Colors.black)),
  //   //                       SizedBox(width: 5,),
  //   //
  //   //                       Icon(Icons.sort),
  //   //
  //   //                     ],
  //   //                   ),
  //   //
  //   //                 ),
  //   //               ),
  //   //             ),
  //   //
  //   //
  //   //           ],
  //   //         )),
  //   //     Flexible(
  //   //       child: TabBarView(
  //   //         controller: _controller,
  //   //         children: [
  //   //           Women(),
  //   //           Men(),
  //   //
  //   //           BabyBoy(),
  //   //           BabyGirl(),
  //   //           KidBoy(),
  //   //           KidGirl(),
  //   //           TeenBoy(),
  //   //           TeenGirl(),
  //   //         ],
  //   //       ),
  //   //     ),
  //   //
  //   //     // Expanded(
  //   //     //   child: ListView(
  //   //     //     children: [
  //   //     //     ],
  //   //     //   ),
  //   //     // ),
  //   //   ],
  //   // ),
  //   TabBarView(
  //     controller: _controller,
  //     children: [
  //       Women(),
  //       Men(),
  //
  //       BabyBoy(),
  //       BabyGirl(),
  //       KidBoy(),
  //       KidGirl(),
  //       TeenBoy(),
  //       TeenGirl(),
  //     ],
  //   ),
  // );
  }
}
class Tabs {
  final String title;
  final Color color;
  Tabs({this.title,this.color});
}
