import 'package:auto_search/auto_search.dart';
import 'package:flutter/material.dart';
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
import 'package:fashow/Categories/Women/Accessories.dart';
import 'package:fashow/Categories/Women/Activewear.dart';
import 'package:fashow/Categories/Women/Bags.dart';
import 'package:fashow/Categories/Women/indethnic.dart';
import 'package:fashow/Categories/Women/Beachwearw.dart';
import 'package:fashow/Categories/Women/BRIDAL.dart';
import 'package:fashow/Categories/Women/Capes.dart';
import 'package:fashow/Categories/Women/Denim.dart';
import 'package:fashow/Categories/Women/Dresses.dart';
import 'package:fashow/Categories/Women/Jackets.dart';
import 'package:fashow/Categories/Women/Jumpsuits.dart';
import 'package:fashow/Categories/Women/Jwellery.dart';
import 'package:fashow/Categories/Women/Knitwear.dart';
import 'package:fashow/Categories/Women/sneaker.dart';
import 'package:fashow/Categories/Women/Shoes.dart';
import 'package:fashow/Categories/Women/Shorts.dart';
import 'package:fashow/Categories/Women/Skirt.dart';
import 'package:fashow/Categories/Women/Tops.dart';
import 'package:fashow/Categories/Women/Troser.dart';
import 'package:fashow/Categories/Women/Watches.dart';
import 'package:fashow/Categories/Women/Dresses.dart';

import 'package:fashow/Constants.dart';
import 'package:get/get.dart';

class ShopSearch extends StatefulWidget {
  @override
  _ShopSearchState createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch> {
  final List<String> names = [
     "Women's Dresses",
    "Men's Accessories",
    "Women's Jewellery",
    "Men's Jacket",
    "Bridal wear",
    "Women's Capes",
    "Men's Shirts",
    "Women's Knitwear",
    "Men's Denim",
    "Women's Denim",
    "Dresses in Women",
    "Accessories in Men",
    "Jewellery in Women",
"Jacket in Men",
"Capes in Women",
"Shirts in Men",
"Knitwear in Women",
"Denim in Men",
"Denim in Women",

  ];
  search({int i}){
     if(i==0||i==10){
      Get.off(DressesW());
    }
     else if(i==1||i==11){      Get.off(Accessories());
     }
     else if(i==2||i==12){      Get.off(JewelW());
     }
     else if(i==3||i==13){      Get.off(JacketM());
     }
else if(i==4){      Get.off(Bridal());
     }
else if(i==5||i==14){      Get.off(CapesW(selectedPage: 4));
     }
else if(i==6||i==15){      Get.off(ShirtM());
     }
else if(i==7||i==16){      Get.off(KnitwearW());
     }
else if(i==8||i==17){      Get.off(DenimM());
     }
else if(i==9||i==18){      Get.off(DenimW());
     }

    else{
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height:  MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: fabGradient
            ),
            alignment: Alignment.center,
            child: AutoSearchInput(
              unSelectedTextColor: kText,
              selectedTextColor: kText,
              hintText: 'Search',
              itemsShownAtStart: 10,
              singleItemHeight: 60.0,
                data: names,
                maxElementsToDisplay: 8,
                onItemTap: (int index) {
                  //Do something cool
                  print(index);
                  search(i:index);
                }
            ),
          ),
        ),
      ),
    );
  }
  }

