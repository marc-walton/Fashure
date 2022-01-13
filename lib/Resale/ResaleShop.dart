import 'package:fashow/Resale/categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Resale/categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Resale/categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Resale/categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Resale/categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Resale/categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Resale/categories/Men/Men.dart';
import 'package:fashow/Resale/categories/Women/Women.dart';

import 'package:fashow/size_config.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:fashow/Constants.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';


class ResaleShop extends StatefulWidget {

  @override
  _ResaleShopState createState() => _ResaleShopState();
}

class _ResaleShopState extends State<ResaleShop>  with  TickerProviderStateMixin {

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
    return  Column(
      children: [
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
        Container(
          height:MediaQuery.of(context).size.height/18,


          child: Row(
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
          ),
        ),
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

      ],
    );
  }
}
class Tabs {
  final String title;
  final Color color;
  Tabs({this.title,this.color});
}
