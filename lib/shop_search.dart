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
import 'package:fashow/Categories/Men/hats.dart';
import 'package:fashow/Categories/Men/braces.dart';
import 'package:fashow/Categories/Men/ties.dart';

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
    ///10
    "Dresses in Women",
    "Accessories in Men",
    "Jewellery in Women",
"Jacket in Men",
"Capes in Women",
"Shirts in Men",
"Knitwear in Women",
"Denim in Men",
"Denim in Women",
  "Single Breasted Coats\n in Men",
    ///20
    "Men's Single Breasted Coats",
 "Coats in Men",
    "Men's Coats",
"Double Breasted Coats\n in Men",
 "Men's Double Breasted Coats",
    "Womens Dresses",
    "Mens Single Breasted Coats",
    "Mens Coats",
    "Mens Double Breasted Coats",
    "Mens Accessories",
    ///30
    "Womens Jewellery",
    "Mens Jacket",
    "Womens Capes",
    "Mens Shirts",
    "Womens Knitwear",
    "Mens Denim",
    "Womens Denim",
 "Duffle Coats in Men",
"Men's Duffle Coats",
"Mens Duffle Coats",
    ///40
 "Padded Coats in Men",
"Men's Padded Coats",
"Mens Padded Coats",
 "Parka Coats in Men",
"Men's Parka Coats",
"Mens Parka Coats",
"Rain Coats in Men",
"Men's Rain Coats",
"Mens Rain Coats",
    ///50
    "Trench Coats in Men",
"Men's Trench Coats",
"Mens Trench Coats",
   "Caps in Men",
"Men's Caps",
"Mens Caps",
   "Hats in Men",
"Men's Hats",
"Mens Hats",
  "Balaclavas in Men",
"Men's Balaclavas",
    ///60
"Mens Balaclavas",
  "Beanies in Men",
"Men's Beanies",
"Mens Beanies",
  "Berets in Men",
"Men's Berets",
"Mens Berets",
   "Fedora & Trilbies in Men",
"Men's Fedora & Trilbies",
"Mens Fedora & Trilbies",
    ///70
  "Bucket Hats in Men",
"Men's Bucket Hats",
"Mens Bucket Hats",
   "Sun Hats in Men",
"Men's Sun Hats",
"Mens Sun Hats",
  "Braces in Men",
"Men's Braces",
"Mens Braces",
  "Suspenders in Men",
    ///80
"Men's Suspenders",
"Mens Suspenders",
    "Ties in Men",
    "Men's Ties",
    "Mens Ties",
  "Bow Ties in Men",
    "Men's Bow Ties",
    "Mens Bow Ties",
"Scarves in Men",
    "Men's Scarves",
    ///90
    "Mens Scarves",
"Belts in Men",
    "Men's Belts",
    "Mens Belts",
"Glasses & Frames in Men",
    "Men's Glasses & Frames ",
    "Mens Glasses & Frames ",
"Frames in Men",
    "Men's Frames",
    "Mens Frames",
    ///100
"Sunglasses in Men",
    "Men's Sunglasses",
    "Mens Sunglasses",
"Gloves in Men",
    "Men's Gloves",
    "Mens Gloves",
"Socks in Men",
    "Men's Socks",
    "Mens Socks",
"Pocket Square in Men",
    ///110
    "Men's Pocket Square ",
    "Mens Pocket Square ",
"Handkerchiefs in Men",
    "Men's Handkerchiefs",
    "Mens Handkerchiefs",
"Wallets in Men",
    "Men's Wallets",
    "Mens Wallets",
   "Umbrellas & Travel in Men",
    "Men's Umbrellas & Travel",
    ///120
    "Mens Umbrellas & Travel",
    "Phone cases in Men",
    "Men's Phone cases",
    "Mens Phone cases",
    "Active wear in Men",
    "Men's Active wear",
    "Mens Active wear",
 "Accessories in Active wear\n in Men",
    "Men's Active wear Accessories",
    "Mens Active wear Accessories",
    ///130
    "Backpacks in Men",
    "Men's Backpacks",
    "Mens Backpacks",
    "Bags in Men",
    "Men's Bags",
    "Mens Bags",
    "Briefcase in Men",
    "Men's Briefcase",
    "Mens Briefcase",
    "Laptop Bags in Men",
    ///140
    "Men's Laptop Bags",
    "Mens Laptop Bags",
    "Shoulder Bags in Men",
    "Men's Shoulder Bags",
    "Mens Shoulder Bags",
    "Duffle bags & holdall\n in Men",
    "Men's Duffle bags & holdall",
    "Mens Duffle bags & holdall",
     "Belt Bags in Men",
    "Men's Belt Bags",
    ///150
    "Mens Belt Bags",
     "Clutch bags in Men",
    "Men's Clutch bags",
    "Mens Clutch bags",
     "Messenger bags in Men",
    "Men's Messenger bags",
    "Mens Messenger bags",
     "Tote bags in Men",
    "Men's Tote bags",
    "Mens Tote bags",
    ///160
     "Trolley & Luggage in Men",
    "Men's Trolley & Luggage",
    "Mens Trolley & Luggage",
     "Beachwear in Men",
    "Men's Beachwear",
    "Mens Beachwear",
     "Trunks in beachwear\n in Men",
    "Men's Trunks in beachwear",
    "Mens Trunks in beachwear",
     "Shorts in beachwear\n in Men",
    ///170
    "Men's Shorts in beachwear",
    "Mens Shorts in beachwear",
      "Footwear in beachwear\n in Men",
    "Men's Footwear in beachwear",
    "Mens Footwear in beachwear",
      "Accessories in beachwear\n in Men",
    "Men's Accessories in beachwear",
    "Mens Accessories in beachwear",
     "Denim Jackets in Men",
    "Men's Denim Jackets",
    ///180                                                                         ///denim jack
    "Mens Denim Jackets",
 "Denim wear in Men",
    "Men's Denim wear",
    "Mens Denim wear",
"Shorts in Denim wear\n in Men",
    "Men's Shorts in Denim wear",
    "Mens Shorts in Denim wear",
"Skinny-fit jeans in Men",
    "Men's Skinny-fit jeans",
    "Mens Skinny-fit jeans",
    ///190
"jeans in Men",
    "Men's jeans",
    "Mens jeans",
"Slim-fit jeans in Men",
    "Men's Slim-fit jeans",
    "Mens Slim-fit jeans",
"Regular-fit jeans in Men",
    "Men's Regular-fit jeans",
    "Mens Regular-fit jeans",
"Tapered-fit jeans in Men",
    ///200
    "Men's Tapered-fit jeans",
    "Mens Tapered-fit jeans",
"Cropped jeans in Men",
    "Men's Cropped jeans",
    "Mens Cropped jeans",
"Bootcut jeans in Men",
    "Men's Bootcut jeans",
    "Mens Bootcut jeans",
"Fragrance in Men",
    "Men's Fragrance",
    ///210
    "Mens Fragrance",
"Grooming in Men",
    "Men's Grooming",
    "Mens GroomingM",
"Skin Care in Men",
    "Men's Skin Care",
    "Mens Skin Care",
"Hair Care in Men",
    "Men's Hair Care",
    "Mens Hair Care",
   ///220
"Shave in Men",
    "Men's Shave",
    "Mens Shave",
"Bath Essentials in Men",
    "Men's Bath Essentials",
    "Mens Bath Essentials",
"Body Care in Men",
    "Men's Body Care",
    "Mens Body Care",
"Kurtas in Men",
    ///230
    "Men's Kurtas",
    "Mens Kurtas",
"Indian ethnic wear in Men",
    "Men's Indian ethnic wear",
    "Mens Indian ethnic wear",
    "Ethnic wear in Men",
    "Men's Ethnic wear",
    "Mens Ethnic wear",
 "Sherwani in Men",
    "Men's Sherwani",
    ///240
    "Mens Sherwani",
 "Nehru Jacket in Men",
    "Men's Nehru Jacket",
    "Mens Nehru Jacket",
 "Bandhgalas in Men",
    "Men's Bandhgalas",
    "Mens Bandhgalas",
"Ethnic Bottoms in Men",
    "Men's Ethnic Bottoms",
    "Mens Ethnic Bottoms",
    ///250
"Ethnic Jacket & Tuxedo in Men",
    "Men's Ethnic Jacket & Tuxedo",
    "Mens Ethnic Jacket & Tuxedo",
"Jacket & Tuxedo(Ethnic) in Men",
    "Men's Jacket & Tuxedo(Ethnic)",
    "Mens Jacket & Tuxedo(Ethnic)",
"Footwear(Ethnic) in Men",
    "Men's Footwear(Ethnic)",
    "Mens Footwear(Ethnic)",
"Ethnic Footwear in Men",
    ///260
    "Men's Ethnic Footwear",
    "Mens Ethnic Footwear",
"Indian Footwear in Men",
    "Men's Indian Footwear",
    "Mens Indian Footwear",
"Suit Jackets in Men",
    "Men's Suit Jackets",
    "Mens Suit Jackets",
"Tuxedo in Men",
    "Men's Tuxedo",
    ///270
    "Mens Tuxedo",
"Biker Jackets in Men",
    "Men's Biker Jackets",
    "Mens Biker Jackets",
"Bomber Jackets in Men",
    "Men's Bomber Jackets",
    "Mens Bomber Jackets",
"Blazers in Men",
    "Men's Blazers",
    "Mens Blazers",
    ///280
    "Denim Jackets in Men",
    "Men's Denim Jackets",
    "Mens Denim Jackets",
 "Hooded Jackets in Men",
    "Men's Hooded Jackets",
    "Mens Hooded Jackets",
"Leather Jackets in Men",
    "Men's Leather Jackets",
    "Mens Leather Jackets",
    "Military Jackets in Men",
    ///290
    "Men's Military Jackets",
    "Mens Military Jackets",
"Sport Jackets in Men",
    "Men's Sport Jackets",
    "Mens Sport Jackets",
"Waistcoats & Gillets in Men",
    "Men's Waistcoats & Gillets",
    "Mens Waistcoats & Gillets",
"Bracelets in Men",
    "Men's Bracelets",
    ///300
    "Mens Bracelets",
"Jewellery in Men",
    "Men's Jewellery",
    "Mens Jewellery",
"Cuff-links in Men",
    "Men's Cuff-links",
    "Mens Cuff-links",
"Tie Bar in Men",
    "Men's Tie Bar",
    "Mens Tie Bar",
    ///310
    "Brooches in Men",
    "Men's Brooches",
    "Mens Brooches",
    "Pins in Men",
    "Men's Pins",
    "Mens Pins",
"Necklace in Men",
    "Men's Necklace",
    "Mens Necklace",
  "Studs in Men",
    ///320
    "Men's Studs",
    "Mens Studs",
"Earrings in Men",
    "Men's Earrings",
    "Mens Earrings",
"Rings in Men",
    "Men's Rings",
    "Mens Rings",
"Casual Shirts in Men",
    "Men's Casual Shirts",
    ///330
    "Mens Casual Shirts",
"Formal Shirts in Men",
    "Men's Formal Shirts",
    "Mens Formal Shirts",
"Shoes in Men",
    "Men's Shoes",
    "Mens Shoes",
"Brogues in Men",
    "Men's Brogues",
    "Mens Brogues",
    ///340
    "Boots in Men",
    "Men's Boots",
    "Mens Boots",
"Boat Shoes in Men",
    "Men's Boat Shoes",
    "Mens Boat Shoes",
"Derby in Men",
    "Men's Derby",
    "Mens Derby",
"Espadrilles in Men",
    ///350
    "Men's Espadrilles",
    "Mens Espadrilles",
"Loafers in Men",
    "Men's Loafers",
    "Mens Loafers",
"Monk Shoes in Men",
    "Men's Monk Shoes",
    "Mens Monk Shoes",
"Oxford Shoes in Men",
    "Men's Oxford Shoes",
    ///360
    "Mens Oxford Shoes",
"Lace-Up Shoes in Men",
    "Men's Lace-Up Shoes",
    "Mens Lace-Up Shoes",
"Sandals in Men",
    "Men's Sandals",
    "Mens Sandals",
"Flip flops in Men",
    "Men's Flip flops",
    "Mens Flip flops",
    ///370
"Slides in Men",
    "Men's Slides",
    "Mens Slides",
"Slippers in Men",
    "Men's Slippers",
    "Mens Slippers",
"Shorts in Men",
    "Men's Shorts",
    "Mens Shorts",
"Bermuda Shorts in Men",
    ///380
    "Men's Bermuda Shorts",
    "Mens Bermuda Shorts",
 "Chino Shorts in Men",
    "Men's Chino Shorts",
    "Mens Chino Shorts",
 "Tailored Shorts in Men",
    "Men's Tailored Shorts",
    "Mens Tailored Shorts",
 "Sports Shorts in Men",
    "Men's Sports Shorts",
    ///390
    "Mens Sports Shorts",
 "Cargo Shorts in Men",
    "Men's Cargo Shorts",
    "Mens Cargo Shorts",
"High - Tops in Men",
    "Men's High - Tops",
    "Mens High - Tops",
"Sneakers in Men",
    "Men's Sneakers",
    "Mens Sneakers",
    ///400
 "Low - Tops in Men",
    "Men's Low - Tops",
    "Mens Low - Tops",
 "Slip-On Sneakers in Men",
    "Men's Slip-On Sneakers",
    "Mens Slip-On Sneakers",
 "Single Breasted Suits in Men",
    "Men's Single Breasted Suits",
    "Mens Single Breasted Suits",
 "Suits in Men",
    ///410
    "Men's Suits",
    "Mens Suits",
"Double Breasted Suits in Men",
    "Men's Double Breasted Suits",
    "Mens Double Breasted Suits",
"Dinner Suits in Men",
    "Men's Dinner Suits",
    "Mens Dinner Suits",
"Tuxedoss in Men",
    "Men's Tuxedos",
    ///420
    "Mens Tuxedos",
"Sweatshirts in Men",
    "Men's Sweatshirts",
    "Mens Sweatshirts",
"Sweaters in Men",
    "Men's Sweaters",
    "Mens Sweaters",
"Knitwear in Men",
    "Men's Knitwear",
    "Mens Knitwear",
    ///430
"Hoodies in Men",
    "Men's Hoodies",
    "Mens Hoodies",
"Cardigans in Men",
    "Men's Cardigans",
    "Mens Cardigans",
"Skinny fit Trousers in Men",
    "Men's Skinny fit Trousers",
    "Mens Skinny fit Trousers",
"Trousers in Men",
    ///440
    "Men's Trousers",
    "Mens Trousers",
"Slim fit Trousers in Men",
    "Men's Slim fit Trousers",
    "Mens Slim fit Trousers",
"Tapered fit Trousers in Men",
    "Men's Tapered fit Trousers",
    "Mens Tapered fit Trousers",
"Regular fit Trousers in Men",
    "Men's Regular fit Trousers",
    ///450
    "Mens Regular fit Trousers",
"Tailored Trousers in Men",
    "Men's Tailored Trousers",
    "Mens Tailored Trousers",
"Cargo pants in Men",
    "Men's Cargo pants",
    "Mens Cargo pants",
"Chinos in Men",
    "Men's Chinos",
    "Mens Chinos",
    ///460
"Sweatpants in Men",
    "Men's Sweatpants",
    "Mens Sweatpants",
"T-shirts in Men",
    "Men's T-shirts",
    "Mens T-shirts",
"Polo Shirts in Men",
    "Men's Polo Shirts",
    "Mens Polo Shirts",
"Tank tops in Men",
    ///470
    "Men's Tank tops",
    "Mens Tank tops",
"Vests in Men",
    "Men's Vests",
    "Mens Vests",
"Watches in Men",
    "Men's Watches",
    "Mens Watches",
    "Chronograph Watches in Men",
    "Men's Chronograph Watches",
    ///480
    "Mens Chronograph Watches",

"Analog Watches in Men",
    "Men's Analog Watches",
    "Mens Analog Watches",
"Sports Watches in Men",
    "Men's Sports Watches",
    "Mens Sports Watches",
"Smart Watches in Men",
    "Men's Smart Watches",
    "Mens Smart Watches",
    ///490
"Hybrid Watches in Men",
    "Men's Hybrid Watches",
    "Mens Hybrid Watches",

  ];
  search({int i}){
     if(i==0||i==10||i==25){
      Get.off(DressesW());
    }
     else if(i==1||i==11||i==29){      Get.off(Accessories());
     }
     else if(i==2||i==12||i==30){      Get.off(JewelW());
     }
     else if(i==3||i==13||i==31||i==265||i==266||i==267){      Get.off(JacketM());
     }
else if(i==4){      Get.off(Bridal());
     }
else if(i==5||i==14||i==32){      Get.off(CapesW(selectedPage: 4));
     }
else if(i==6||i==15||i==33||i==328||i==329||i==330){      Get.off(ShirtM());
     }
else if(i==7||i==16||i==34){      Get.off(KnitwearW());
     }
else if(i==8||i==17||i==35){      Get.off(DenimM());
     }
else if(i==9||i==18||i==36){      Get.off(DenimW());
     }
else if(i==19||i==20||i==21||i==22||i==27||i==26){      Get.off(CoatsM(selectedPage: 0,));
     }
else if(i==23||i==24||i==28){      Get.off(CoatsM(selectedPage: 1,));
     }
else if(i==37||i==38||i==39){      Get.off(CoatsM(selectedPage: 2,));
     }
else if(i==40||i==41||i==42){      Get.off(CoatsM(selectedPage: 3,));
     }
else if(i==43||i==44||i==45){      Get.off(CoatsM(selectedPage: 4,));
     }
else if(i==46||i==47||i==48){      Get.off(CoatsM(selectedPage: 5,));
     }
else if(i==49||i==50||i==51){      Get.off(CoatsM(selectedPage: 6,));
     }
else if(i==52||i==53||i==54||i==55||i==56||i==57){      Get.off(Hats(selectedPage: 0,));
     }
else if(i==58||i==59||i==60){      Get.off(Hats(selectedPage: 1,));
     }
else if(i==61||i==62||i==63){      Get.off(Hats(selectedPage: 2,));
     }
else if(i==64||i==65||i==66){      Get.off(Hats(selectedPage: 3,));
     }
else if(i==67||i==68||i==69){      Get.off(Hats(selectedPage: 4,));
     }
else if(i==70||i==71||i==72){      Get.off(Hats(selectedPage: 5,));
     }
else if(i==73||i==74||i==75){      Get.off(Hats(selectedPage: 6,));
     }
else if(i==76||i==77||i==78){      Get.off(Braces(selectedPage: 0,));
     }
else if(i==79||i==80||i==81){      Get.off(Braces(selectedPage: 1,));
     }
else if(i==82||i==83||i==84){      Get.off(Ties(selectedPage: 0,));
     }
else if(i==85||i==86||i==87){      Get.off(Ties(selectedPage: 1,));
     }
else if(i==88||i==89||i==90){      Get.off(Accessories(selectedPage: 1,));
     }
else if(i==91||i==92||i==93){      Get.off(Accessories(selectedPage: 2,));
     }
else if(i==94||i==95||i==96||i==97||i==98||i==99){      Get.off(Accessories(selectedPage: 5,));
     }
else if(i==100||i==101||i==102){      Get.off(Accessories(selectedPage: 6,));
     }
else if(i==103 ||i==104||i==105){      Get.off(Accessories(selectedPage: 7,));
     }
else if(i==106||i==107||i==108){      Get.off(Accessories(selectedPage: 8,));
     }
else if(i==109||i==110||i==111||i==112||i==113||i==114){      Get.off(Accessories(selectedPage: 9,));
     }
else if(i==115||i==116||i==117){      Get.off(Accessories(selectedPage: 10,));
     }
else if(i==118||i==119||i==120){      Get.off(Accessories(selectedPage: 11,));
     }
else if(i==121||i==122||i==123){      Get.off(Accessories(selectedPage: 12,));
}
else if(i==124||i==125||i==126){      Get.off(ActiveWear(selectedPage: 0,));
}
else if(i==127||i==128||i==129){      Get.off(ActiveWear(selectedPage: 5,));
}
else if(i==130||i==131||i==132||i==133||i==134||i==135){      Get.off(Bags(selectedPage: 0,));
}
else if(i==136||i==137||i==138){      Get.off(Bags(selectedPage: 1,));
}
else if(i==139||i==140||i==141){      Get.off(Bags(selectedPage: 2,));
}
else if(i==142||i==143||i==144){      Get.off(Bags(selectedPage: 3,));
}
else if(i==145||i==146||i==147){      Get.off(Bags(selectedPage: 4,));
}
else if(i==148||i==149||i==150){      Get.off(Bags(selectedPage: 5));
}
else if(i==151||i==152||i==153){      Get.off(Bags(selectedPage: 6));
}
else if(i==154||i==155||i==156){      Get.off(Bags(selectedPage: 7));
}
else if(i==157||i==158||i==159){      Get.off(Bags(selectedPage: 8));
}
else if(i==160||i==161||i==162){      Get.off(Bags(selectedPage: 9));
}
else if(i==163||i==164||i==165){      Get.off(BeachwearM(selectedPage: 0));

}
else if(i==166||i==167||i==168){      Get.off(BeachwearM(selectedPage: 1));
}
else if(i==169||i==170||i==171){      Get.off(BeachwearM(selectedPage: 2));
}
else if(i==172||i==173||i==174){      Get.off(BeachwearM(selectedPage: 3));
}
else if(i==175||i==176||i==177){      Get.off(BeachwearM(selectedPage: 4));
}
else if(i==178||i==179||i==180||i==181||i==182||i==183){      Get.off(DenimM(selectedPage: 0));
}
  else if(i==184||i==185||i==186){      Get.off(DenimM(selectedPage: 1));
}
     else if(i==187||i==188||i==189||i==190||i==191||i==192){      Get.off(DenimM(selectedPage: 2));
     }
  else if(i==193||i==194||i==195){      Get.off(DenimM(selectedPage: 3));
     }
else if(i==196||i==197||i==198){      Get.off(DenimM(selectedPage: 4));
     }
else if(i==199||i==200||i==201){      Get.off(DenimM(selectedPage: 5));
     }
else if(i==202||i==203||i==204){      Get.off(DenimM(selectedPage: 6));
     }
else if(i==205||i==206||i==207){      Get.off(DenimM(selectedPage: 7));
     }
else if(i==208||i==209||i==210||i==211||i==212||i==213){      Get.off(GroomingM(selectedPage: 0));
     }
else if(i==214||i==215||i==216){      Get.off(GroomingM(selectedPage: 1));
     }
else if(i==217||i==218||i==219){      Get.off(GroomingM(selectedPage: 2));
     }
else if(i==220||i==221||i==222){      Get.off(GroomingM(selectedPage: 3));
     }
else if(i==223||i==224||i==225){      Get.off(GroomingM(selectedPage: 4));
     }
else if(i==226||i==227||i==228){      Get.off(GroomingM(selectedPage: 5));
     }
else if(i==229||i==230||i==231||i==232||i==233||i==234||i==235||i==236||i==237){      Get.off(IndianM(selectedPage: 0));
     }
else if(i==238||i==239||i==240){      Get.off(IndianM(selectedPage: 1));
     }
else if(i==241||i==242||i==243){      Get.off(IndianM(selectedPage: 2));
     }
else if(i==244||i==245||i==246){      Get.off(IndianM(selectedPage: 3));
     }
else if(i==247||i==248||i==249){      Get.off(IndianM(selectedPage: 4));
     }
else if(i==250||i==251||i==252||i==253||i==254||i==255){      Get.off(IndianM(selectedPage: 5));
     }
else if(i==256||i==257||i==258||i==259||i==260||i==261||i==262||i==263||i==264){      Get.off(IndianM(selectedPage: 6));
     }
else if(i==268||i==269||i==270){      Get.off(JacketM(selectedPage: 1));
     }
else if(i==271||i==272||i==273){      Get.off(JacketM(selectedPage: 2));
     }
else if(i==274||i==275||i==276){      Get.off(JacketM(selectedPage: 3));
     }
else if(i==277||i==278||i==279){      Get.off(JacketM(selectedPage: 4));
     }
else if(i==280||i==281||i==282){      Get.off(JacketM(selectedPage: 5));
     }
else if(i==283||i==284||i==285){      Get.off(JacketM(selectedPage: 6));
     }
else if(i==286||i==287||i==288){      Get.off(JacketM(selectedPage: 7));
     }
else if(i==289||i==290||i==291){      Get.off(JacketM(selectedPage: 8));
     }
else if(i==292||i==293||i==294){      Get.off(JacketM(selectedPage: 9));
     }
else if(i==295||i==296||i==297){      Get.off(JacketM(selectedPage: 10));
     }
else if(i==298||i==299||i==300||i==301||i==302||i==303){      Get.off(JewelleryM(selectedPage: 0));
     }
else if(i==304||i==305||i==306||i==307||i==308||i==309){      Get.off(JewelleryM(selectedPage: 1));
     }
else if(i==310||i==311||i==312||i==313||i==314||i==315){      Get.off(JewelleryM(selectedPage: 2));
     }
else if(i==316||i==317||i==318){      Get.off(JewelleryM(selectedPage: 3));
     }
else if(i==319||i==320||i==321||i==322||i==323||i==324){      Get.off(JewelleryM(selectedPage: 4));
     }
else if(i==326||i==327||i==325){      Get.off(JewelleryM(selectedPage: 5));
     }
     else if(i==331||i==332||i==333){      Get.off(ShirtM(selectedPage: 1,));
     }
  else if(i==334||i==335||i==336||i==337||i==338||i==339){      Get.off(ShoesM(selectedPage: 0,));
     }
else if(i==340||i==341||i==342){      Get.off(ShoesM(selectedPage: 1,));
     }
else if(i==343||i==344||i==345){      Get.off(ShoesM(selectedPage: 2,));
     }
else if(i==346||i==347||i==348){      Get.off(ShoesM(selectedPage: 3,));
     }
else if(i==349||i==350||i==351){      Get.off(ShoesM(selectedPage: 4,));
     }
else if(i==352||i==353||i==354){      Get.off(ShoesM(selectedPage: 5,));
     }
else if(i==355||i==356||i==357){      Get.off(ShoesM(selectedPage: 6,));
     }
else if(i==358||i==359||i==360){      Get.off(ShoesM(selectedPage: 7,));
     }
else if(i==361||i==362||i==363){      Get.off(ShoesM(selectedPage: 8,));
     }
else if(i==364||i==365||i==366){      Get.off(ShoesM(selectedPage: 9,));
     }
else if(i==367||i==368||i==369||i==370||i==371||i==372){      Get.off(ShoesM(selectedPage: 10,));
     }
else if(i==373||i==374||i==375){      Get.off(ShoesM(selectedPage: 11,));
     }
else if(i==376||i==377||i==378||i==379||i==380||i==381){      Get.off(ShortsM(selectedPage: 0,));
     }
else if(i==382||i==383||i==384){      Get.off(ShortsM(selectedPage: 1,));
     }
else if(i==385||i==386||i==387){      Get.off(ShortsM(selectedPage: 2,));
     }
else if(i==388||i==389||i==390){      Get.off(ShortsM(selectedPage: 3,));
     }
else if(i==391||i==392||i==393){      Get.off(ShortsM(selectedPage: 4,));
     }
else if(i==394||i==395||i==396||i==397||i==398||i==399){      Get.off(SneakersM(selectedPage: 0,));
     }
else if(i==400||i==401||i==402){      Get.off(SneakersM(selectedPage: 1,));
     }
else if(i==403||i==404||i==405){      Get.off(SneakersM(selectedPage: 2,));
     }
else if(i==406||i==407||i==408||i==409||i==410||i==411){      Get.off(SuitsM(selectedPage: 0,));
     }
else if(i==412||i==413||i==414){      Get.off(SuitsM(selectedPage: 1,));
     }
else if(i==415||i==416||i==417){      Get.off(SuitsM(selectedPage: 2,));
     }
else if(i==418||i==419||i==420){      Get.off(SuitsM(selectedPage: 3,));
     }
else if(i==421||i==422||i==423||i==424||i==425||i==426){      Get.off(SweaterM(selectedPage: 0,));
     }
else if(i==427||i==428||i==429){      Get.off(SweaterM(selectedPage: 1,));
     }
else if(i==430||i==431||i==432){      Get.off(SweaterM(selectedPage: 2,));
     }
else if(i==433||i==434||i==435){      Get.off(SweaterM(selectedPage: 3,));
     }
else if(i==436||i==437||i==438||i==439||i==440||i==441){      Get.off(TrouserM(selectedPage: 0,));
     }
else if(i==442||i==443||i==444){      Get.off(TrouserM(selectedPage: 1,));
     }
else if(i==445||i==446||i==447){      Get.off(TrouserM(selectedPage: 2,));
     }
else if(i==448||i==449||i==450){      Get.off(TrouserM(selectedPage: 3,));
     }
else if(i==451||i==452||i==453){      Get.off(TrouserM(selectedPage: 4,));
     }
else if(i==454||i==455||i==456){      Get.off(TrouserM(selectedPage: 5,));
     }
else if(i==457||i==458||i==459){      Get.off(TrouserM(selectedPage: 6,));
     }
else if(i==460||i==461||i==462){      Get.off(TrouserM(selectedPage: 7,));
     }
else if(i==463||i==464||i==465){      Get.off(TrouserM(selectedPage: 7,));
     }
else if(i==466||i==467||i==468){      Get.off(TrouserM(selectedPage: 7,));
     }
else if(i==469||i==470||i==471||i==472||i==473||i==474){      Get.off(TrouserM(selectedPage: 7,));
     }
else if(i==475||i==476||i==477||i==478||i==479||i==480){      Get.off(WatchesM(selectedPage: 0,));
     }
else if(i==481||i==482||i==483){      Get.off(WatchesM(selectedPage: 1,));
     }
else if(i==484||i==485||i==486||i==487||i==488||i==489){      Get.off(WatchesM(selectedPage: 2,));
     }
else if(i==490||i==491||i==492){      Get.off(WatchesM(selectedPage: 3,));
     }





    else{
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),

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

