import 'package:auto_search/auto_search.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Categories/Men/Accessories.dart';
import 'package:fashow/Categories/Men/Indianethnuc.dart';
import 'package:fashow/Categories/Men/Shirt.dart';
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
import 'package:fashow/Categories/Kids/baby/boy/hats.dart';
import 'package:fashow/Categories/Kids/baby/boy/ties.dart';

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
import 'package:fashow/Categories/Kids/baby/girl/Accessories.dart';
import 'package:fashow/Categories/Kids/baby/girl/Babysuits.dart';
import 'package:fashow/Categories/Kids/baby/girl/Coats and Jackets.dart';
import 'package:fashow/Categories/Kids/baby/girl/Dresses.dart';
import 'package:fashow/Categories/Kids/baby/girl/knitwear.dart';
import 'package:fashow/Categories/Kids/baby/girl/skirts.dart';
import 'package:fashow/Categories/Kids/baby/girl/Shoes.dart';
import 'package:fashow/Categories/Kids/baby/girl/Swimwear.dart';
import 'package:fashow/Categories/Kids/baby/girl/Shorts.dart';
import 'package:fashow/Categories/Kids/baby/girl/Tops.dart';
import 'package:fashow/Categories/Kids/baby/girl/Tracks.dart';
import 'package:fashow/Categories/Kids/baby/girl/Trousers.dart';
import 'package:fashow/Categories/Kids/baby/girl/ethnic.dart';
import 'package:fashow/Categories/Kids/baby/girl/hats.dart';
import 'package:fashow/Categories/Kids/kids/boy/hats.dart';
import 'package:fashow/Categories/Kids/kids/boy/ties.dart';
import 'package:fashow/Categories/Kids/kids/boy/bags.dart';
import 'package:fashow/Categories/Kids/kids/boy/glasses.dart';
import 'package:fashow/Categories/Kids/kids/boy/braces.dart';

import 'package:fashow/Categories/Kids/kids/boy/Accessories.dart';
import 'package:fashow/Categories/Kids/kids/boy/Denim.dart';
import 'package:fashow/Categories/Kids/kids/boy/Coats and Jackets.dart';
import 'package:fashow/Categories/Kids/kids/boy/kniywear.dart';
import 'package:fashow/Categories/Kids/kids/boy/Shoes.dart';
import 'package:fashow/Categories/Kids/kids/boy/Shorts.dart';
import 'package:fashow/Categories/Kids/kids/boy/Swimwear.dart';
import 'package:fashow/Categories/Kids/kids/boy/Top.dart';
import 'package:fashow/Categories/Kids/kids/boy/Tracks.dart';
import 'package:fashow/Categories/Kids/kids/boy/Trousers.dart';
import 'package:fashow/Categories/Kids/kids/boy/ETHNIC.dart';
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
"Waistcoats in Men",
    "Men's Waistcoats",
    "Mens Waistcoats",
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
    "Lapel Pins in Men",
    "Men's Lapel Pins",
    "Mens Lapel Pins",
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
"Caps in Women",
    "Women's Caps",
    "Womens Caps",
"Hats in Women",
    "Women's Hats",
    "Womens Hats",
"Baker Boy Hats in Women",
    ///500
"Women's Baker Boy Hats",
    "Womens Baker Boy Hats",
"Beanies in Women",
    "Women's Beanies",
    "Womens Beanies",
"Berets in Women",
    "Women's Berets",
    "Womens Berets",
"Fedora in Women",
    "Women's Fedora",
    ///510
    "Womens Fedora",
"Bucket Hats in Women",
    "Women's Bucket Hats",
    "Womens Bucket Hats",
"Sun Hats in Women",
    "Women's Sun Hats",
    "Womens Sun Hats",
"Ties in Women",
    "Women's Ties",
    "Womens Ties",
    ///520
"Collars in Women",
    "Women's Collars",
    "Womens Collars",
"Hair Accessories in Women",
    "Women's Hair Accessories",
    "Womens Hair Accessories",
"Accessories in Women",
    "Women's Accessories",
    "Womens Accessories",
"Bridal Accessories in Women",
    ///530
    "Women's Bridal Accessories",
    "Womens Bridal Accessories",
"Wedding Accessories in Women",
    "Women's Wedding Accessories",
    "Womens Wedding Accessories",
"Scarves in Women",
    "Women's Scarves",
    "Womens Scarves",
"Belts in Women",
    "Women's Belts",
    ///540
    "Womens Belts",
"Braces in Women",
    "Women's Braces",
    "Womens Braces",
"Ties in Women",
    "Women's Ties",
    "Womens Ties",
"Collars in Women",
    "Women's Collars",
    "Womens Collars",
    ///550
"Glasses in Women",
    "Women's Glasses",
    "Womens Glasses",
"Frames in Women",
    "Women's Frames",
    "Womens Frames",
"Sunglasses in Women",
    "Women's Sunglasses",
    "Womens Sunglasses",
"Gloves in Women",
    ///560
    "Women's Gloves",
    "Womens Gloves",
"Socks in Women",
    "Women's Socks",
    "Womens Socks",
"Umbrellas in Women",
    "Women's Umbrellas",
    "Womens Umbrellas",
"Travel in Women",
    "Women's Travel",
    ///570
    "Womens Travel",
"Phone cases in Women",
    "Women's Phone cases",
    "Womens Phone cases",
"Active Wear in Women",
    "Women's Active Wear",
    "Womens Active Wear",
"Jackets in Active Wear\n in Women",
    "Women's Jackets in Active Wear",
    "Womens Jackets in Active Wear",
    ///580
"Trouser in Active Wear\n in Women",
    "Women's Trouser in Active Wear",
    "Womens Trouser in Active Wear",
"Shorts in Active Wear\n in Women",
    "Women's Shorts in Active Wear",
    "Womens Shorts in Active Wear",
"Skirts in Active Wear\n in Women",
    "Women's Skirts in Active Wear",
    "Womens Skirts in Active Wear",
"Footwear in Active Wear\n in Women",
    ///590
"Women's Footwear in Active Wear",
    "Womens Footwear in Active Wear",
 "Accessories in Active Wear\n in Women",
    "Women's Accessories in Active Wear",
    "Womens Accessories in Active Wear",
"Backpacks in Women",
    "Women's Backpacks",
    "Womens Backpacks",
"Mini Bag in Women",
"Women's Mini Bag",
    ///600
    "Womens Mini Bag",
"Laptop Bags in Women",
    "Women's Laptop Bags",
    "Womens Laptop Bags",
"Shoulder Bags in Women",
"Women's Shoulder Bags",
    "Womens Shoulder Bags",
"Cross body Bags in Women",
    "Women's Cross body Bags",
    "Womens Cross body Bags",
    ///610
"Duffle Bags in Women",
"Women's Duffle Bags",
    "Womens Duffle Bags",
"Holdall Bags in Women",
    "Women's Holdall Bags",
"Womens Holdall Bags",
"Cosmetic Bags in Women",
"Women's Cosmetic Bags",
"Womens Cosmetic Bags",
"Belt Bags in Women",
    ///620
    "Women's Belt Bags",
    "Womens Belt Bags",
"Clutch Bags in Women",
    "Women's Clutch Bags",
    "Womens Clutch Bags",
"Bucket Bags in Women",
    "Women's Bucket Bags",
    "Womens Bucket Bags",
"Beach Bags in Women",
    "Women's Beach Bags",
    ///630
    "Womens Beach Bags",
"Tote Bags in Women",
    "Women's Tote Bags",
    "Womens Tote Bags",
"Trolley & Luggage in Women",
    "Women's Trolley & Luggage",
    "Womens Trolley & Luggage",
"Swimsuits in Women",
    "Women's Swimsuits",
    "Womens Swimsuits",
    ///640
"Beach wear in Women",
    "Women's Beach wear",
    "Womens Beach wear",
"Dresses in Beach wear /nin Women",
    "Women's Dresses in Beach wear",
    "Womens Dresses in Beach wear",
"Bikinis in Women",
    "Women's Bikinis",
    "Womens Bikinis",
"Footwear in Beach wear /nin Women",
    ///650
    "Women's Footwear in Beach wear",
    "Womens Footwear in Beach wear",
"Accessories in Women",
    "Women's Accessories",
    "Womens Accessories",
"Coats in Women",
    "Women's Coats",
    "Womens Coats",
"Single Breasted Coats in Women",
    "Women's Single Breasted Coats",
    ///660
    "Womens Single Breasted Coats",
"Double Breasted Coats in Women",
    "Women's Double Breasted Coats",
    "Womens Double Breasted Coats",
"Duffle Coats in Women",
    "Women's Duffle Coats",
    "Womens Duffle Coats",
"Padded Coats in Women",
    "Women's Padded Coats",
    "Womens Padded Coats",
    ///670
"Leather Coats in Women",
    "Women's Leather Coats",
    "Womens Leather Coats",
"Wool Coats in Women",
    "Women's Wool Coats",
    "Womens Wool Coats",
"Cargo Coats in Women",
    "Women's Cargo Military Coats",
    "Womens Cargo Military Coats",
"Military Coats in Women",
    ///680
    "Women's Military Coats",
    "Womens Military Coats",
"Faux Coats in Women",
    "Women's Faux Coats",
    "Womens Faux Coats",
"Shearling Coats in Women",
    "Women's Shearling Coats",
    "Womens Shearling Coats",
"Parka Coats in Women",
    "Women's Parka Coats",
    ///690
    "Womens Parka Coats",
"Rain Coats in Women",
    "Women's Rain Coats",
    "Womens Rain Coats",
"Trench Coats in Women",
    "Women's Trench Coats",
    "Womens Trench Coats",
"Denim Jackets in Women",
    "Women's Denim Jackets",
    "Womens Denim Jackets",
    ///700
"Denim wear in Women",
    "Women's Denim wear",
    "Womens Denim wear",
"Shorts in Denim wear \nin Women",
    "Women's Shorts in Denim wear",
    "Womens Shorts in Denim wear",
"Skirts in Denim wear \nin Women",
    "Women's Skirts in Denim wear",
    "Womens Skirts in Denim wear",
"Skinny fit jeans in Women",
    ///710
    "Women's Skinny fit jeans",
    "Womens Skinny fit jeans",
"Slim fit jeans in Women",
    "Women's Slim fit jeans",
    "Womens Slim fit jeans",
"Tapered fit jeans in Women",
    "Women's Tapered fit jeans",
    "Womens Tapered fit jeans",
"Straight fit jeans in Women",
    "Women's Straight fit jeans",
    ///720
    "Womens Straight fit jeans",
"Wide Leg jeans in Women",
    "Women's Wide Leg jeans",
    "Womens Wide Leg jeans",
"Cropped jeans in Women",
    "Women's Cropped jeans",
    "Womens Cropped jeans",
"Bootcut jeans in Women",
    "Women's Bootcut jeans",
    "Womens Bootcut jeans",
    ///730
"Boyfriend fit jeans in Women",
    "Women's Boyfriend fit jeans",
    "Womens Boyfriend fit jeans",
"Flare jeans in Women",
    "Women's Flare jeans",
    "Womens Flare jeans",
"Bell Bottom jeans in Women",
    "Women's Bell Bottom jeans",
    "Womens Bell Bottom jeans",
"Jeggings in Women",
    ///740
    "Women's Jeggings",
    "Womens Jeggings",
"Wedding Dresses in Women",
    "Women's Wedding Dresses",
    "Womens Wedding Dresses",
"Maxi Dresses in Women",
    "Women's Maxi Dresses",
    "Womens Maxi Dresses",
"Mini Dresses in Women",
    "Women's Mini Dresses",
    ///750
"Womens Mini Dresses",
"Midi Dresses in Women",
    "Women's Midi Dresses",
    "Womens Midi Dresses",
"Kaftan Dresses in Women",
"Women's Kaftan Dresses",
    "Womens Kaftan Dresses",
"Gowns in Women",
    "Women's Gowns",
    "Womens Gowns",
    ///760
"Off Shoulder in Women",
    "Women's Off Shoulder",
    "Womens Off Shoulder",
"One Shoulder in Women",
    "Women's One Shoulder",
    "Womens One Shoulder",
"Shirt Dresses in Women",
    "Women's Shirt Dresses",
    "Womens Shirt Dresses",
"T-Shirt Dresses in Women",
    ///770
    "Women's T-Shirt Dresses",
    "Womens T-Shirt Dresses",
"Jersey Dresses in Women",
    "Women's Jersey Dresses",
    "Womens Jersey Dresses",
"Short Dresses in Women",
    "Women's Short Dresses",
    "Womens Short Dresses",
"Indian Bridal wear in Women",
    "Women's Indian Bridal wear",
    ///780
    "Womens Indian Bridal wear",
"Indian Ethnic wear in Women",
    "Women's Indian Ethnic wear",
    "Womens Indian Ethnic wear",
"Ethnic wear(Indian) in Women",
    "Women's Ethnic wear(Indian)",
    "Womens Ethnic wear(Indian)",
"Kurtis in Women",
    "Women's Kurtis",
    "Womens Kurtis",
    ///790
"Tunics in Ethnic wear in Women",
    "Women's Tunics in Ethnic wear",
    "Womens Tunics in Ethnic wear",
"Tops in Ethnic wear in Women",
    "Women's Tops in Ethnic wear",
    "Womens Tops in Ethnic wear",
"Ethnic Suits in Women",
    "Women's Ethnic Suits",
    "Womens Ethnic Suits",
"Sarees in Women",
    ///800
    "Women's Sarees",
    "Womens Sarees",
"Dupattas in Women",
    "Women's Dupattas",
    "Womens Dupattas",
"Bottoms(Ethnic) in Women",
    "Women's Bottoms(Ethnic)",
    "Womens Bottoms(Ethnic)",
"Skirts(Ethnic) in Women",
    "Women's Skirts(Ethnic)",
    ///810
    "Womens Skirts(Ethnic)",
"Jackets(Ethnic) in Women",
    "Women's Jackets(Ethnic)",
    "Womens Jackets(Ethnic)",
"Blouse(Ethnic) in Women",
    "Women's Blouse(Ethnic)",
    "Womens Blouse(Ethnic)",
"Lehengas in Women",
    "Women's Lehengas",
    "Womens Lehengas",
    ///820
"Palazzos in Women",
    "Women's Palazzos",
    "Womens Palazzos",
"Footwear(Ethnic) in Women",
    "Women's Footwear(Ethnic)",
    "Womens Footwear(Ethnic)",
"Suit Jackets in Women",
    "Women's Suit Jackets",
    "Womens Suit Jackets",
"Jackets in Women",
    ///830
    "Women's Jackets",
    "Womens Jackets",
"Fitted Jackets in Women",
    "Women's Fitted Jackets",
    "Womens Fitted Jackets",
"Biker Jackets in Women",
    "Women's Biker Jackets",
    "Womens Biker Jackets",
"Bomber Jackets in Women",
    "Women's Bomber Jackets",
    ///840
    "Womens Bomber Jackets",
"Blazers in Women",
    "Women's Blazers",
    "Womens Blazers",
"Over sized Jackets in Women",
    "Women's Over sized Jackets",
    "Womens Over sized Jackets",
"Tweed Jackets in Women",
    "Women's Tweed Jackets",
    "Womens Tweed Jackets",
    ///850
"Cropped Jackets in Women",
    "Women's Cropped Jackets",
    "Womens Cropped Jackets",
"Padded Jackets in Women",
    "Women's Padded Jackets",
    "Womens Padded Jackets",
"Puffer Jackets in Women",
    "Women's Puffer Jackets",
    "Womens Puffer Jackets",
"Hooded Jackets in Women",
    ///860
    "Women's Hooded Jackets",
    "Womens Hooded Jackets",
"Leather Jackets in Women",
    "Women's Leather Jackets",
    "Womens Leather Jackets",
"Military Jackets in Women",
    "Women's Military Jackets",
    "Womens Military Jackets",
"Sport Jackets in Women",
    "Women's Sport Jackets",
    ///870
    "Womens Sport Jackets",
"Waistcoats in Women",
    "Women's Waistcoats",
    "Womens Waistcoats",
"Gilets in Women",
    "Women's Gilets",
    "Womens Gilets",
 "Jumpsuits in Women",
    "Women's Jumpsuits",
    "Womens Jumpsuits",
    ///880
   "Playsuits in Women",
    "Women's Playsuits",
    "Womens Playsuits",
     "Body Suits in Women",
    "Women's Body Suits",
    "Womens Body Suits",
 "Anklets in Women",
    "Women's Anklets",
    "Womens Anklets",
  "Bracelets in Women",
    ///890
    "Women's Bracelets",
    "Womens Bracelets",
"Body Jewellery in Women",
    "Women's Body Jewellery",
    "Womens Body Jewellery",
"Brooches in Women",
    "Women's Brooches",
    "Womens Brooches",
 "Lapel Pins in Women",
    "Women's Lapel Pins",
    ///900
    "Womens Lapel Pins",
"Necklace in Women",
    "Women's Necklace",
    "Womens Necklace",
"Earrings in Women",
    "Women's Earrings",
    "Womens Earrings",
"Rings in Women",
    "Women's Rings",
    "Womens Rings",
    ///910
"Cardigans in Women",
    "Women's Cardigans",
    "Womens Cardigans",
"Knitted Skirts in Women",
    "Women's Knitted Skirts",
    "Womens Knitted Skirts",
"Knitted Tops in Women",
    "Women's Knitted Tops",
    "Womens Knitted Tops",
 "Knitted Dresses in Women",
    ///920
    "Women's Knitted Dresses",
    "Womens Knitted Dresses",
"Sweaters in Women",
    "Women's Sweaters",
    "Womens Sweaters",
"Ballerinas in Women",
    "Women's Ballerinas",
    "Womens Ballerinas",
"Espadrilles in Women",
    "Women's Espadrilles",
    ///930
    "Womens Espadrilles",
"Brogues in Women",
    "Women's Brogues",
    "Womens Brogues",
"Boots in Women",
    "Women's Boots",
    "Womens Boots",
"Mules in Women",
    "Women's Mules",
    "Womens Mules",
    ///940
"Pumps in Women",
    "Women's Pumps",
    "Womens Pumps",
"Loafers in Women",
    "Women's Loafers",
    "Womens Loafers",
"Oxford Shoes in Women",
    "Women's Oxford Shoes",
    "Womens Oxford Shoes",
"Lace Up Shoes in Women",
    ///950
    "Women's Lace Up Shoes",
    "Womens Lace Up Shoes",
"Sandals in Women",
    "Women's Sandals",
    "Womens Sandals",
"Flip flops in Women",
    "Women's Flip flops",
    "Womens Flip flops",
"Slides in Women",
    "Women's Slides",
    ///960
    "Womens Slides",
"Slippers in Women",
    "Women's Slippers",
    "Womens Slippers",
"Shoes in Women",
    "Women's Shoes",
    "Womens Shoes",
"Short-length Shorts in Women",
    "Women's Short-length Shorts ",
    "Womens Short-length Shorts ",
    ///970
"Shorts in Women",
    "Women's Shorts ",
    "Womens Shorts ",
"Knee-length Shorts in Women",
    "Women's Knee-length Shorts ",
    "Womens Knee-length Shorts ",
"Sports Shorts in Women",
    "Women's Sports Shorts",
    "Womens Sports Shorts ",
"Mini Skirts in Women",
    ///980
    "Women's Mini Skirts",
    "Womens Mini Skirts",
"Skirts in Women",
    "Women's Skirts",
    "Womens Skirts",
"Midi Skirts in Women",
    "Women's Midi Skirts",
    "Womens Midi Skirts",
"Maxi Skirts in Women",
    "Women's Maxi Skirts",
    ///990
    "Womens Maxi Skirts",
"Fitted Skirts in Women",
    "Women's Fitted Skirts",
    "Womens Fitted Skirts",
"A-Line Skirts in Women",
    "Women's A-Line Skirts",
    "Womens A-Line Skirts",
"A Line Skirts in Women",
    "Women's A Line Skirts",
    "Womens A Line Skirts",
    ///1000
"Pencil Skirts in Women",
    "Women's Pencil Skirts",
    "Womens Pencil Skirts",
"Asymmetric Skirts in Women",
    "Women's Asymmetric Skirts",
    "Womens Asymmetric Skirts",
"High Top Sneakers in Women",
    "Women's High Top Sneakers",
    "Womens High Top Sneakers",
"Low Top Sneakers in Women",
    ///1010
    "Women's Low Top Sneakers",
    "Womens Low Top Sneakers",
"High Heel Sneakers in Women",
    "Women's High Heel Sneakers",
    "Womens High Heel Sneakers",
"Slip-On Sneakers in Women",
    "Women's Slip-On Sneakers",
    "Womens Slip-On Sneakers",
"Blouses in Women",
    "Women's Blouses",
    ///1020
    "Womens Blouses",
"Tops in Women",
    "Women's Tops",
    "Womens Tops",
"Tunics in Women",
    "Women's Tunics",
    "Womens Tunics",
"Kaftans in Women",
    "Women's Kaftans",
    "Womens Kaftans",
    ///1030
"ponchos in Women",
    "Women's ponchos",
    "Womens ponchos",
"Crop Tops in Women",
    "Women's Crop Tops",
    "Womens Crop Tops",
"Shirts in Women",
    "Women's Shirts",
    "Womens Shirts",
"T-shirts in Women",
    ///1040
    "Women's T-shirts",
    "Womens T-shirts",
"Polo Shirts in Women",
    "Women's Polo Shirts",
    "Womens Polo Shirts",
"Sleeveless Tops in Women",
    "Women's Sleeveless Tops",
    "Womens Sleeveless Tops",
"Vests Tops in Women",
    "Women's Vests Tops",
    ///1050
    "Womens Vests Tops",
"Tank Tops in Women",
    "Women's Tank Tops",
    "Womens Tank Tops",
"Hoodies in Women",
    "Women's Hoodies",
    "Womens Hoodies",
"Sweatshirt in Women",
    "Women's Sweatshirt",
    "Womens Sweatshirt",
    ///1060
"Trouser in Women",
    "Women's Trouser",
    "Womens Trouser",
"Skinny fit Trouser in Women",
    "Women's Skinny fit Trouser",
    "Womens Skinny fit Trouser",
"Slim fit Trouser in Women",
    "Women's Slim fit Trouser",
    "Womens Slim fit Trouser",
"Tapered fit Trouser in Women",
    ///1070
    "Women's Tapered fit Trouser",
    "Womens Tapered fit Trouser",
"Straight fit Trouser in Women",
    "Women's Straight fit Trouser",
    "Womens Straight fit Trouser",
"Wide Leg fit Trouser in Women",
    "Women's Wide Leg fit Trouser",
    "Womens Wide Leg fit Trouser",
    "Cropped Trouser in Women",
    "Women's Cropped Trouser",
    ///1080
    "Womens Cropped Trouser",
"High Waisted Trouser in Women",
    "Women's High Waisted Trouser",
    "Womens High Waisted Trouser",
"Flare Trouser in Women",
    "Women's Flare Trouser",
    "Womens Flare Trouser",
"Bell Bottom Trouser in Women",
    "Women's Bell Bottom Trouser",
    "Womens Bell Bottom Trouser",
    ///1090
"Tailored Trouser in Women",
    "Women's Tailored Trouser",
    "Womens Tailored Trouser",
  "Leggings Trouser in Women",
    "Women's Leggings Trouser",
    "Womens Leggings Trouser",
  "Sweatpants Trouser in Women",
    "Women's Sweatpants Trouser",
    "Womens Sweatpants Trouser",
  "Chronograph Watches in Women",
    ///1100
    "Women's Chronograph Watches",
    "Womens Chronograph Watches",
 "Watches in Women",
    "Women's Watches",
    "Womens Watches",
 "Analog Watches in Women",
    "Women's Analog Watches",
    "Womens Analog Watches",
 "Sports Watches in Women",
    "Women's Sports Watches",
    ///1110
    "Womens Sports Watches",
 "Smart Watches in Women",
    "Women's Smart Watches",
    "Womens Smart Watches",
 "Hybrid Watches in Women",
    "Women's Hybrid Watches",
    "Womens Hybrid Watches",
 "High Waist jeans in Women",
    "Women's High Waist jeans",
    "Womens High Waist jeans",
    ///1120
 "Caps in Baby Boy",
    "Baby Boy's Caps",
    "Baby Boys Caps",
 "Knitted Hats in Baby Boy",
    "Baby Boy's Knitted Hats",
    "Baby Boys Knitted Hats",
 "Sun Hats in Baby Boy",
    "Baby Boy's Sun Hats",
    "Baby Boys Sun Hats",
 "Hat Sets in Baby Boy",
    ///1130
    "Baby Boy's Hat Sets",
    "Baby Boys Hat Sets",
"Hat Sets in Baby Boy",
    "Baby Boy's Hat Sets",
    "Baby Boys Hat Sets",
"Ties in Baby Boy",
    "Baby Boy's Ties",
    "Baby Boys Ties",
"Bow Ties in Baby Boy",
    "Baby Boy's Bow Ties",
    ///1140
    "Baby Boys Bow Ties",
"Scarves in Baby Boy",
    "Baby Boy's Scarves",
    "Baby Boys Scarves",
"Gloves in Baby Boy",
    "Baby Boy's Gloves",
    "Baby Boys Gloves",
"Socks in Baby Boy",
    "Baby Boy's Socks",
    "Baby Boys Socks",
    ///1150
"Travel Accessories in Baby Boy",
    "Baby Boy's Travel Accessories",
    "Baby Boys Travel Accessories",
"Accessories in Baby Boy",
    "Baby Boy's Accessories",
    "Baby Boys Accessories",
"Rompers in Baby Boy",
    "Baby Boy's Rompers",
    "Baby Boys Rompers",
"Babysuits in Baby Boy",
    ///1160
    "Baby Boy's Babysuits",
    "Baby Boys Babysuits",
"Shorties in Baby Boy",
    "Baby Boy's Shorties",
    "Baby Boys Shorties",
"Pyjamas in Baby Boy",
    "Baby Boy's Pyjamas",
    "Baby Boys Pyjamas",
"Snowsuits in Baby Boy",
    "Baby Boy's Snowsuits",
    ///1170
    "Baby Boys Snowsuits",
"Blazer in Baby Boy",
    "Baby Boy's Blazer",
    "Baby Boys Blazer",
"Coats in Baby Boy",
    "Baby Boy's Coats",
    "Baby Boys Coats",
"Jackets in Baby Boy",
    "Baby Boy's Jackets",
    "Baby Boys Jackets",
    ///1180
"Duffle coats in Baby Boy",
    "Baby Boy's Duffle coats",
    "Baby Boys Duffle coats",
"Padded coats in Baby Boy",
    "Baby Boy's Padded coats",
    "Baby Boys Padded coats",
"Bomber Jackets in Baby Boy",
    "Baby Boy's Bomber Jackets",
    "Baby Boys Bomber Jackets",
"Wool coats in Baby Boy",
    ///1190
    "Baby Boy's Wool coats",
    "Baby Boys Wool coats",
"Rain coats in Baby Boy",
    "Baby Boy's Rain coats",
    "Baby Boys Rain coats",
"Waistcoats in Baby Boy",
    "Baby Boy's Waistcoats",
    "Baby Boys Waistcoats",
"Gilets in Baby Boy",
"Baby Boy's Gilets",
    ///1200
"Baby Boys Gilets",
"Kurta Set in Baby Boy",
"Baby Boy's Kurta Set",
"Baby Boys Kurta Set",
"Ethnic wear in Baby Boy",
"Baby Boy's Ethnic wear",
"Baby Boys Ethnic wear",
"Indian Ethnic in Baby Boy",
"Baby Boy's Indian Ethnic",
"Baby Boys Indian Ethnic",
    ///1210
"Suit Sets in Baby Boy",
"Baby Boy's Suit Sets",
"Baby Boys Suit Sets",
"Kurta in Baby Boy",
"Baby Boy's Kurta",
"Baby Boys Kurta",
"Ethnic Bottoms in Baby Boy",
"Baby Boy's Ethnic Bottoms",
"Baby Boys Ethnic Bottoms",
"Indo Western in Baby Boy",
    ///1220
"Baby Boy's Indo Western",
"Baby Boys Indo Western",
"Fusion Wear in Baby Boy",
"Baby Boy's Fusion Wear",
"Baby Boys Fusion Wear",
"Sherwanis in Baby Boy",
"Baby Boy's Sherwanis",
"Baby Boys Sherwanis",
"Jackets in Baby Boy",
"Baby Boy's Jackets",
    ///1230
"Baby Boys Jackets",
"Cardigans in Baby Boy",
"Baby Boy's Cardigans",
"Baby Boys Cardigans",
"Knitwear in Baby Boy",
"Baby Boy's Knitwear",
"Baby Boys Knitwear",
"Sweaters in Baby Boy",
"Baby Boy's Sweaters",
"Baby Boys Sweaters",
    ///1240
 "Boots in Baby Boy",
"Baby Boy's Boots",
"Baby Boys Boots",
  "Shoes in Baby Boy",
"Baby Boy's Shoes",
"Baby Boys Shoes",
   "Slippers in Baby Boy",
"Baby Boy's Slippers",
"Baby Boys Slippers",
    "Sneakers in Baby Boy",
    ///1250
"Baby Boy's Sneakers",
"Baby Boys Sneakers",
     "Pre-walkers in Baby Boy",
"Baby Boy's Pre-walkers",
"Baby Boys Pre-walkers",
      "Casual Shorts in Baby Boy",
"Baby Boy's Casual Shorts",
"Baby Boys Casual Shorts",
       "Shorts in Baby Boy",
"Baby Boy's Shorts",
    ///1260
"Baby Boys Shorts",
       "Denim Shorts in Baby Boy",
"Baby Boy's Denim Shorts",
"Baby Boys Denim Shorts",
        "Shorts sets in Baby Boy",
"Baby Boy's Shorts sets",
"Baby Boys Shorts sets",
     "Swimwear in Baby Boy",
"Baby Boy's Swimwear",
"Baby Boys Swimwear",
    ///1270
     "Short Sets in Swimwear\n in Baby Boy",
"Baby Boy's Short Sets in Swimwear",
"Baby Boys Short Sets in Swimwear",
     "Polo Shirts in Baby Boy",
"Baby Boy's Polo Shirts",
"Baby Boys Polo Shirts",
     "Shirts in Baby Boy",
"Baby Boy's Shirts",
"Baby Boys Shirts",
     "T-shirts in Baby Boy",
    ///1280
"Baby Boy's T-shirts",
"Baby Boys T-shirts",
     "Hoodies in Baby Boy",
"Baby Boy's Hoodies",
"Baby Boys Hoodies",
     "Sweatshirt in Baby Boy",
"Baby Boy's Sweatshirt",
"Baby Boys Sweatshirt",
      "Tracks in Baby Boy",
"Baby Boy's Tracks",
    ///1290
"Baby Boys Tracks",
       "Dungarees in Baby Boy",
"Baby Boy's Dungarees",
"Baby Boys Dungarees",
       "Trousers in Baby Boy",
"Baby Boy's Trousers",
"Baby Boys Trousers",
       "Chinos in Baby Boy",
"Baby Boy's Chinos",
"Baby Boys Chinos",
    ///1300
       "Jeans in Baby Boy",
"Baby Boy's Jeans",
"Baby Boys Jeans",
        "Leggings in Baby Boy",
"Baby Boy's Leggings",
"Baby Boys Leggings",
       "Caps in Baby Girl",
"Baby Girl's Caps",
"Baby Girls Caps",
        "Hats in Baby Girl",
    ///1310
"Baby Girl's Hats",
"Baby Girls Hats",
         "Headbands in Baby Girl",
"Baby Girl's Headbands Hats",
"Baby Girls Headbands",
       "Knitted Hats in Baby Girl",
"Baby Girl's Knitted Hats",
"Baby Girls Knitted Hats",
        "Sun Hats in Baby Girl",
"Baby Girl's Sun Hats",
    ///1320
"Baby Girls Sun Hats",
         "Hat Sets in Baby Girl",
"Baby Girl's Hat Sets",
"Baby Girls Hat Sets",
        "Accessories in Baby Girl",
"Baby Girl's Accessories",
"Baby Girls Accessories",
          "Scarves in Baby Girl",
"Baby Girl's Scarves",
"Baby Girls Scarves",
    ///1330
          "Gloves in Baby Girl",
"Baby Girl's Gloves",
"Baby Girls Gloves",
           "Socks in Baby Girl",
"Baby Girl's Socks",
"Baby Girls Socks",
              "Travel Accessories in Baby Girl",
"Baby Girl's Travel Accessories",
"Baby Girls Travel Accessories",
              "Rompers in Baby Girl",
    ///1340
"Baby Girl's Rompers",
"Baby Girls Rompers",
              "Baby Suits in Baby Girl",
"Baby Girl's Baby Suits",
"Baby Girls Baby Suits",
              "Shorties in Baby Girl",
"Baby Girl's Shorties",
"Baby Girls Shorties",
              "Pyjamas in Baby Girl",
"Baby Girl's Pyjamas",
   /// 1350
"Baby Girls Pyjamas",
              "Snowsuits in Baby Girl",
"Baby Girl's Snowsuits",
"Baby Girls Snowsuits",
             "Blazer in Baby Girl",
"Baby Girl's Blazer",
"Baby Girls Blazer",
             "Coats in Baby Girl",
"Baby Girl's Coats",
"Baby Girls Coats",
    ///1360
             "Jackets in Baby Girl",
"Baby Girl's Jackets",
"Baby Girls Jackets",
             "Duffle coats in Baby Girl",
"Baby Girl's Duffle coats",
"Baby Girls Duffle coats",
             "Padded coats in Baby Girl",
"Baby Girl's Padded coats",
"Baby Girls Padded coats",
             "Faux coats in Baby Girl",
    ///1370
"Baby Girl's Faux coats",
"Baby Girls Faux coats",
             "Bomber Jackets in Baby Girl",
"Baby Girl's Bomber Jackets",
"Baby Girls Bomber Jackets",
             "Wool coats in Baby Girl",
"Baby Girl's Wool coats",
"Baby Girls Wool coats",
             "Rain coats in Baby Girl",
"Baby Girl's Rain coats",
    ///1380
"Baby Girls Rain coats",
             "Waist coats in Baby Girl",
"Baby Girl's Waist coats",
"Baby Girls Waist coats",
             "Gilets in Baby Girl",
"Baby Girl's Gilets",
"Baby Girls Gilets",
             "Dresses in Baby Girl",
"Baby Girl's Casual Dresses",
"Baby Girls Casual Dresses",
    ///1390
             "Dresses in Baby Girl",
"Baby Girl's Dresses",
"Baby Girls Dresses",
             "Party Wear in Baby Girl",
"Baby Girl's Party Wear",
"Baby Girls Party Wear",
    "Knitted Dresses in Baby Girl",
    "Baby Girl's Knitted Dresses",
    "Baby Girls Knitted Dresses",
    "Lehenga in Baby Girl",
    ///1400
    "Baby Girl's Lehenga",
    "Baby Girls Lehenga",
    "Ghagra in Baby Girl",
    "Baby Girl's Ghagra",
    "Baby Girls Ghagra",
 "Ethnic wear(indian) in Baby Girl",
    "Baby Girl's Ethnic wear(indian)",
    "Baby Girls Ethnic wear(indian)",
 "Indian Ethnic wear in Baby Girl",
    "Baby Girl's Indian Ethnic wear",
    ///1410
    "Baby Girls Indian Ethnic wear",
    "Ethnic Dresses in Baby Girl",
    "Baby Girl's Ethnic Dresses",
    "Baby Girls Ethnic Dresses",
 "Ethnic Jumpsuits in Baby Girl",
    "Baby Girl's Ethnic Jumpsuits",
    "Baby Girls Ethnic Jumpsuits",
    "Ethnic Tops in Baby Girl",
    "Baby Girl's Ethnic Tops",
    "Baby Girls Ethnic Tops",
    ///1420
       "Ethnic Bottoms in Baby Girl",
    "Baby Girl's Ethnic Bottoms",
    "Baby Girls Ethnic Bottoms",
           "Ethnic Skirts in Baby Girl",
    "Baby Girl's Ethnic Skirts",
    "Baby Girls Ethnic Skirts",
            "Indo Western in Baby Girl",
    "Baby Girl's Indo Western",
    "Baby Girls Indo Western",
               "Fusion Wear in Baby Girl",
    ///1430
    "Baby Girl's Fusion Wear",
    "Baby Girls Fusion Wear",
                   "Cardigans in Baby Girl",
    "Baby Girl's Cardigans",
    "Baby Girls Cardigans",
                   "Knitwear in Baby Girl",
    "Baby Girl's Knitwear",
    "Baby Girls Knitwear",
                     "Sweaters in Baby Girl",
    "Baby Girl's Sweaters",
    ///1440
    "Baby Girls Sweaters",
                    "Ballerinas in Baby Girl",
    "Baby Girl's Ballerinas",
    "Baby Girls Ballerinas",
                   "Shoes in Baby Girl",
    "Baby Girl's Shoes",
    "Baby Girls Shoes",
                   "Sneakers in Baby Girl",
    "Baby Girl's Sneakers",
    "Baby Girls Sneakers",
    ///1450
                    "Pre-walkers in Baby Girl",
    "Baby Girl's Pre-walkers",
    "Baby Girls Pre-walkers",
                    "Sandals in Baby Girl",
    "Baby Girl's Sandals",
    "Baby Girls Sandals",
                    "Boots in Baby Girl",
    "Baby Girl's Boots",
    "Baby Girls Boots",
                    "Slippers in Baby Girl",
    ///1460
    "Baby Girl's Slippers",
    "Baby Girls Slippers",
                  "Casual Shorts in Baby Girl",
    "Baby Girl's Casual Shorts",
    "Baby Girls Casual Shorts",
                  "Shorts in Baby Girl",
    "Baby Girl's Shorts",
    "Baby Girls Shorts",
                 "Denim Shorts in Baby Girl",
    "Baby Girl's Denim Shorts",
    ///1470
    "Baby Girls Denim Shorts",
                 "Shorts sets in Baby Girl",
    "Baby Girl's Shorts sets",
    "Baby Girls Shorts sets",
                 "Casual Skirts in Baby Girl",
    "Baby Girl's Casual Skirts",
    "Baby Girls Casual Skirts",
                 "Skirts in Baby Girl",
    "Baby Girl's Skirts",
    "Baby Girls Skirts",
    ///1480
                 "Tutu Skirts in Baby Girl",
    "Baby Girl's Tutu Skirts",
    "Baby Girls Tutu Skirts",
                 "Party wear Skirts in Baby Girl",
    "Baby Girl's Party wear Skirts",
    "Baby Girls Party wear Skirts",
               "Denim Skirts in Baby Girl",
    "Baby Girl's Denim Skirts",
    "Baby Girls Denim Skirts",
               "Skirt sets in Baby Girl",
    ///1490
    "Baby Girl's Denim Skirt sets",
    "Baby Girls Denim Skirt sets",
             "Swimwear in Baby Girl",
    "Baby Girl's Swimwear",
    "Baby Girls Swimwear",
          "Blouses in Baby Girl",
    "Baby Girl's Blouses",
    "Baby Girls Blouses",
          "Tops in Baby Girl",
    "Baby Girl's Tops",
    ///1500
    "Baby Girls Tops",
         "Tunics in Baby Girl",
    "Baby Girl's Tunics",
    "Baby Girls Tunics",
         "Polo Shirts in Baby Girl",
    "Baby Girl's Polo Shirts",
    "Baby Girls Polo Shirts",
        "Shirts in Baby Girl",
    "Baby Girl's Shirts",
    "Baby Girls Shirts",
    ///1510
        "T-shirts in Baby Girl",
    "Baby Girl's T-shirts",
    "Baby Girls T-shirts",
        "Hoodies in Baby Girl",
    "Baby Girl's Hoodies",
    "Baby Girls Hoodies",
       "Sweatshirts in Baby Girl",
    "Baby Girl's Sweatshirts",
    "Baby Girls Sweatshirts",
    "Tracks in Baby Girl",
    ///1520
    "Baby Girl's Tracks",
    "Baby Girls Tracks",
 "Dungarees in Baby Girl",
    "Baby Girl's Dungarees",
    "Baby Girls Dungarees",
 "Trousers in Baby Girl",
    "Baby Girl's Trousers",
    "Baby Girls Trousers",
 "Chinos in Baby Girl",
    "Baby Girl's Chinos",
    ///1530
    "Baby Girls Chinos",
 "Jeans in Baby Girl",
    "Baby Girl's Jeans",
    "Baby Girls Jeans",
 "Leggings in Baby Girl",
    "Baby Girl's Leggings",
    "Baby Girls Leggings",
 "Jeggings in Baby Girl",
    "Baby Girl's Jeggings",
    "Baby Girls Jeggings",
    ///1540
 "Caps in Kid's Boy",
    "Kid Boy's Caps",
    "Boys Caps",
"Hats in Kid's Boy",
    "Boy's Hats",
    "Boys Hats",
 "Balaclavas in Kid's Boy",
    "Boy's Balaclavas",
    "Boys Balaclavas",
 "Knitted Hats in Kid's Boy",
    ///1550
    "Boy's Knitted Hats",
    "Boys Knitted Hats",
 "Sun Hats in Kid's Boy",
    "Boy's Sun Hats",
    "Boys Sun Hats",
 "Hat Sets in Kid's Boy",
    "Boy's Hat Sets",
    "Boys Hat Sets",
 "Ties in Kid's Boy",
    "Boy's Ties",
    ///1560
    "Boys Ties",
 "Bow Ties in Kid's Boy",
    "Boy's Bow Ties",
    "Boys Bow Ties",
 "Backpacks in Kid's Boy",
    "Boy's Backpacks",
    "Boys Backpacks",
    "Bags in Kid's Boy",
    "Boy's Bags",
    "Boys Bags",
    ///1570
    "Shoulder Bags in Kid's Boy",
    "Boy's Shoulder Bags",
    "Boys Shoulder Bags",
 "Beach Bags in Kid's Boy",
    "Boy's Beach Bags",
    "Boy's Beach Bags",
 "Belts in Kid's Boy",
    "Boy's Belts",
    "Boy's Belts",
 "Braces in Kid's Boy",
    ///1580
    "Boy's Braces",
    "Boy's Braces",
 "Glasses & Frames in Kid's Boy",
    "Boy's Glasses & Frames",
    "Boy's Glasses & Frames",
 "Frames in Kid's Boy",
    "Boy's Frames",
    "Boy's Frames",
    "Sunglasses in Kid's Boy",
    "Boy's Sunglasses",
    ///1590
    "Boy's Sunglasses",
   "Accessories in Kid's Boy",
    "Boy's Accessories",
    "Boy's Accessories",
   "Scarves in Kid's Boy",
    "Boy's Scarves",
    "Boy's Scarves",
   "Gloves in Kid's Boy",
    "Boy's Gloves",
    "Boy's Gloves",
    ///1600
    "Socks in Kid's Boy",
    "Boy's Socks",
    "Boy's Socks",
     "Travel Accessories in Kid's Boy",
    "Boy's Travel Accessories",
    "Boy's Travel Accessories",
      "Single Breasted Coats in Kid's Boy",
    "Boy's Single Breasted Coats",
    "Boy's Single Breasted Coats",
       "Coats in Kid's Boy",
    ///1610
    "Boy's Coats",
    "Boy's Coats",
     "Jackets in Kid's Boy",
    "Boy's Jackets",
    "Boy's Jackets",
"Double Breasted Coats in Kid's Boy",
    "Boy's Double Breasted Coats",
    "Boy's Double Breasted Coats",
 "Blazer in Kid's Boy",
    "Boy's Blazer",
    ///1620
    "Boy's Blazer",
   "Duffle coats in Kid's Boy",
    "Boy's Duffle coats",
    "Boy's Duffle coats",
"Padded coats in Kid's Boy",
    "Boy's Padded coats",
    "Boy's Padded coats",

    "Bomber Jackets in Kid's Boy",
    "Boy's Bomber Jackets",
    "Boy's Bomber Jackets",
    ///1630
     "Denim Jackets in Kid's Boy",
    "Boy's Denim Jackets",
    "Boy's Denim Jackets",
       "Snowsuits in Kid's Boy",
    "Boy's Snowsuits",
    "Boy's Snowsuits",
          "Wool coats in Kid's Boy",
    "Boy's Wool coats",
    "Boy's Wool coats",
           "Rain coats in Kid's Boy",
    ///1640
    "Boy's Rain coats",
    "Boy's Rain coats",
           "Waist coats in Kid's Boy",
    "Boy's Waist coats",
    "Boy's Waist coats",
           "Gilets in Kid's Boy",
    "Boy's Gilets",
    "Boy's Gilets",
           "Denim wear in Kid's Boy",
    "Boy's Denim wear",
    ///1650
    "Boy's Denim wear",
           "Denim Shorts in Kid's Boy",
    "Boy's Denim Shorts",
    "Boy's Denim Shorts",
             "Skinny fit jeans in Kid's Boy",
    "Boy's Skinny fit jeans",
    "Boy's Skinny fit jeans",
              "Slim fit jeans in Kid's Boy",
    "Boy's Slim fit jeans",
    "Boy's Slim fit jeans",
    ///1660
         "Regular fit jeans in Kid's Boy",
    "Boy's Regular fit jeans",
    "Boy's Regular fit jeans",
             "Kurta Set in Kid's Boy",
    "Boy's Kurta Set",
    "Boy's Kurta Set",
        "Suit Sets in Kid's Boy",
    "Boy's Suit Sets",
    "Boy's Suit Sets",
        "Kurta in Kid's Boy",
    ///1670
    "Boy's Kurta",
    "Boy's Kurta",
          "Ethnic Bottoms in Kid's Boy",
    "Boy's Ethnic Bottoms",
    "Boy's Ethnic Bottoms",
         "Indo Western in Kid's Boy",
    "Boy's Indo Western",
    "Boy's Indo Western",
         "Fusion Wear in Kid's Boy",
    "Boy's Fusion Wear",
    ///1680
    "Boy's Fusion Wear",
         "Sherwanis in Kid's Boy",
    "Boy's Sherwanis",
    "Boy's Sherwanis",
        "Ethnic Jackets in Kid's Boy",
    "Boy's Ethnic Jackets",
    "Boy's Ethnic Jackets",
         "Ethnic wear(Indian) in Kid's Boy",
    "Boy's Ethnic wear(Indian)",
    "Boy's Ethnic wear(Indian)",
    ///1690
         "Indian Ethnic wear in Kid's Boy",
    "Boy's Indian Ethnic wear",
    "Boy's Indian Ethnic wear",
           "Knit wear in Kid's Boy",
    "Boy's Knit wear",
    "Boy's Knit wear",
           "Cardigans in Kid's Boy",
    "Boy's Cardigans",
    "Boy's Cardigans",
           "Sweaters in Kid's Boy",
    ///1700
    "Boy's Sweaters",
    "Boy's Sweaters",
           "Sneakers in Kid's Boy",
    "Boy's Sneakers",
    "Boy's Sneakers",
             "Shoes in Kid's Boy",
    "Boy's Shoes",
    "Boy's Shoes",
              "Loafers in Kid's Boy",
    "Boy's Loafers",
    ///1710
    "Boy's Loafers",
                 "Brogues in Kid's Boy",
    "Boy's Brogues",
    "Boy's Brogues",
                  "Sandals in Kid's Boy",
    "Boy's Sandals",
    "Boy's Sandals",
                     "Boots in Kid's Boy",
    "Boy's Boots",
    "Boy's Boots",
    ///1720
                       "Slippers in Kid's Boy",
    "Boy's Slippers",
    "Boy's Slippers",
                          "Flip flops in Kid's Boy",
    "Boy's Flip flops",
    "Boy's Flip flops",

                            "Slides in Kid's Boy",
    "Boy's Slides",
    "Boy's Slides",
       "Casual Shorts in Kid's Boy",
    ///1730
    "Boy's Casual Shorts",
    "Boy's Casual Shorts",
        "Shorts in Kid's Boy",
    "Boy's Shorts",
    "Boy's Shorts",
         "Shorts sets in Kid's Boy",
    "Boy's Shorts sets",
    "Boy's Shorts sets",
         "Swimwear in Kid's Boy",
    "Boy's Swimwear",
    ///1740
    "Boy's Swimwear",
         "Shorts in Swimwear\n in Kid's Boy",
    "Boy's Shorts in Swimwear",
    "Boy's Shorts in Swimwear",
           "Trunks in Swimwear\n in Kid's Boy",
    "Boy's Trunks in Swimwear",
    "Boy's Trunks in Swimwear",
           "Polo Shirts in Kid's Boy",
    "Boy's Polo Shirts",
    "Boy's Polo Shirts",
    ///1750
          "Shirts in Kid's Boy",
    "Boy's Shirts",
    "Boy's Shirts",
         "T-shirts in Kid's Boy",
    "Boy's T-shirts",
    "Boy's T-shirts",
        "Vests in Kid's Boy",
    "Boy's Vests",
    "Boy's Vests",
     "Tank-Tops in Kid's Boy",
    ///1760
    "Boy's Tank-Tops",
    "Boy's Tank-Tops",
     "Hoodies in Kid's Boy",
    "Boy's Hoodies",
    "Boy's Hoodies",
     "Sweatshirt in Kid's Boy",
    "Boy's Sweatshirt",
    "Boy's Sweatshirt",
   "Casual Trousers in Kid's Boy",
    "Boy's Casual Trousers",
    ///1770
    "Boy's Casual Trousers",
"Trousers in Kid's Boy",
    "Boy's Trousers",
    "Boy's Trousers",
"Dungarees in Kid's Boy",
    "Boy's Dungarees",
    "Boy's Dungarees",
"Chinos in Kid's Boy",
    "Boy's Chinos",
    "Boy's Chinos",
    ///1780
"Tailored Trousers in Kid's Boy",
    "Boy's Tailored Trousers",
    "Boy's Tailored Trousers",
"Sweatpants in Kid's Boy",
    "Boy's Sweatpants",
    "Boy's Sweatpants",
"Tracks in Kid's Boy",
    "Boy's Tracks",
    "Boy's Tracks",


  ];

  search({int i}){
     if(i==0||i==10||i==25||i==742||i==743||i==744){
      Get.off(DressesW());
    }
     else if(i==1||i==11||i==29){      Get.off(Accessories());
     }
     else if(i==2||i==12||i==30||i==886||i==887||i==888){      Get.off(JewelW());
     }
     else if(i==3||i==13||i==31||i==265||i==266||i==267){      Get.off(JacketM());
     }
else if(i==4){      Get.off(Bridal());
     }
else if(i==5||i==14||i==32){      Get.off(CapesW(selectedPage: 4));
     }
else if(i==6||i==15||i==33||i==328||i==329||i==330){      Get.off(ShirtM());
     }
else if(i==7||i==16||i==34||i==910||i==911||i==912||i==925||i==926||i==927){      Get.off(KnitwearW());
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
else if(i==493||i==494||i==495||i==496||i==497||i==498){      Get.off(Hats(selectedPage: 0,));
     }
else if(i==499||i==500||i==501){      Get.off(Hats(selectedPage: 1,));
     }
else if(i==502||i==503||i==504){      Get.off(Hats(selectedPage: 2,));
     }
else if(i==505||i==506||i==507){      Get.off(Hats(selectedPage: 3,));
     }
else if(i==508||i==509||i==510){      Get.off(Hats(selectedPage: 4,));
     }
else if(i==511||i==512||i==513){      Get.off(Hats(selectedPage: 5,));
     }
else if(i==514||i==515||i==516){      Get.off(Hats(selectedPage: 6,));
     }
else if(i==517||i==518||i==519){      Get.off(Ties(selectedPage: 0,));
     }
else if(i==520||i==521||i==522){      Get.off(Ties(selectedPage: 1,));
     }
else if(i==523||i==524||i==525||i==526||i==527||i==528){      Get.off(AccessW(selectedPage: 1,));
     }
else if(i==529||i==530||i==531||i==532||i==533||i==534){      Get.off(AccessW(selectedPage: 2,));
     }
else if(i==535||i==536||i==537){      Get.off(AccessW(selectedPage: 3,));
     }
else if(i==538||i==539||i==540){      Get.off(AccessW(selectedPage: 4,));
     }
else if(i==541||i==542||i==543){      Get.off(AccessW(selectedPage: 5,));
     }
else if(i==544||i==545||i==546||i==547||i==548||i==549){      Get.off(AccessW(selectedPage: 6,));
     }
else if(i==550||i==551||i==552||i==553||i==554||i==555){      Get.off(AccessW(selectedPage: 7,));
     }
else if(i==556||i==557||i==558){      Get.off(AccessW(selectedPage: 8,));
     }
else if(i==559||i==560||i==561){      Get.off(AccessW(selectedPage: 9,));
     }
else if(i==562||i==563||i==564){      Get.off(AccessW(selectedPage: 10,));
     }
else if(i==565||i==566||i==567||i==568||i==569||i==570){      Get.off(AccessW(selectedPage: 11,));
     }
else if(i==571||i==572||i==573){      Get.off(AccessW(selectedPage: 12,));
     }
else if(i==574||i==575||i==576){      Get.off(ActiveWearW(selectedPage: 0,));
     }
else if(i==577||i==578||i==579){      Get.off(ActiveWearW(selectedPage: 1,));
     }
else if(i==580||i==581||i==582){      Get.off(ActiveWearW(selectedPage: 2,));
     }
else if(i==583||i==584||i==585){      Get.off(ActiveWearW(selectedPage: 3,));
     }
else if(i==586||i==587||i==588){      Get.off(ActiveWearW(selectedPage: 4,));
     }
else if(i==589||i==590||i==591){      Get.off(ActiveWearW(selectedPage: 5,));
     }
else if(i==592||i==593||i==594){      Get.off(ActiveWearW(selectedPage: 6,));
     }
else if(i==595||i==596||i==597){      Get.off(BagsW(selectedPage: 0,));
     }
else if(i==598||i==599||i==600){      Get.off(BagsW(selectedPage: 1,));
     }
else if(i==601||i==602||i==603){      Get.off(BagsW(selectedPage: 2,));
     }
else if(i==604||i==605||i==606||i==607||i==608||i==609){      Get.off(BagsW(selectedPage: 3,));
     }
else if(i==610||i==611||i==612||i==613||i==614||i==615){      Get.off(BagsW(selectedPage: 4,));
     }
else if(i==616||i==617||i==618){      Get.off(BagsW(selectedPage: 5,));
     }
else if(i==619||i==620||i==621){      Get.off(BagsW(selectedPage: 6,));
     }
else if(i==622||i==623||i==624){      Get.off(BagsW(selectedPage: 7,));
     }
else if(i==625||i==626||i==627){      Get.off(BagsW(selectedPage: 8,));
     }
else if(i==628||i==629||i==630){      Get.off(BagsW(selectedPage: 9,));
     }
else if(i==631||i==632||i==633){      Get.off(BagsW(selectedPage: 10,));
     }
else if(i==634||i==635||i==636){      Get.off(BagsW(selectedPage: 11,));
     }
else if(i==637||i==638||i==639||i==640||i==641||i==642){      Get.off(BeachwearW(selectedPage: 0,));
     }
else if(i==643||i==644||i==645){      Get.off(BeachwearW(selectedPage: 1,));
     }
else if(i==646||i==647||i==648){      Get.off(BeachwearW(selectedPage: 2,));
     }
else if(i==649||i==650||i==651){      Get.off(BeachwearW(selectedPage: 3,));
     }
else if(i==652||i==653||i==654){      Get.off(BeachwearW(selectedPage: 4,));
     }
else if(i==655||i==656||i==657||i==658||i==659||i==660){      Get.off(CapesW(selectedPage: 0,));
     }
else if(i==661||i==662||i==663){      Get.off(CapesW(selectedPage: 1,));
     }
else if(i==664||i==665||i==666){      Get.off(CapesW(selectedPage: 2,));
     }
else if(i==667||i==668||i==669){      Get.off(CapesW(selectedPage: 3,));
     }
else if(i==670||i==671||i==672){      Get.off(CapesW(selectedPage: 5,));
     }
else if(i==673||i==674||i==675){      Get.off(CapesW(selectedPage: 6,));
     }
else if(i==676||i==677||i==678||i==679||i==680||i==681){      Get.off(CapesW(selectedPage: 7,));
     }
else if(i==682||i==683||i==684||i==685||i==686||i==687){      Get.off(CapesW(selectedPage: 8,));
     }

else if(i==688||i==689||i==690){ Get.off(CapesW(selectedPage: 9,));
     }
else if(i==691||i==692||i==693){ Get.off(CapesW(selectedPage: 10,));
     }
else if(i==694||i==695||i==696){ Get.off(CapesW(selectedPage: 11,));
     }
else if(i==697||i==698||i==699||i==700||i==701||i==702){ Get.off(DenimW(selectedPage: 0,));
     }
else if(i==703||i==704||i==705){ Get.off(DenimW(selectedPage: 1,));
     }
else if(i==706||i==707||i==708){ Get.off(DenimW(selectedPage: 2,));
     }
else if(i==709||i==710||i==711){ Get.off(DenimW(selectedPage: 3,));
     }
else if(i==712||i==713||i==714){ Get.off(DenimW(selectedPage: 4,));
     }
else if(i==715||i==716||i==717){ Get.off(DenimW(selectedPage: 5,));
     }
else if(i==718||i==719||i==720){ Get.off(DenimW(selectedPage: 6,));
     }
else if(i==721||i==722||i==723){ Get.off(DenimW(selectedPage: 7,));
     }

else if(i==1117||i==1118||i==1119){ Get.off(DenimW(selectedPage: 8,));
     }
else if(i==724||i==725||i==726){ Get.off(DenimW(selectedPage: 9,));
     }
else if(i==727||i==728||i==729){ Get.off(DenimW(selectedPage: 10,));
     }
else if(i==730||i==731||i==732){ Get.off(DenimW(selectedPage: 11,));
     }
else if(i==733||i==734||i==735||i==736||i==737||i==738){ Get.off(DenimW(selectedPage: 12,));
     }
else if(i==739||i==740||i==741){ Get.off(DenimW(selectedPage: 13,));
     }
else if(i==745||i==746||i==747){ Get.off(DressesW(selectedPage: 1,));
     }
else if(i==748||i==749||i==750){ Get.off(DressesW(selectedPage: 2,));
     }
else if(i==751||i==752||i==753){ Get.off(DressesW(selectedPage: 3,));
     }
else if(i==754||i==755||i==756){ Get.off(DressesW(selectedPage: 4,));
     }
else if(i==757||i==758||i==759){ Get.off(DressesW(selectedPage: 5,));
     }
else if(i==760||i==761||i==762){ Get.off(DressesW(selectedPage: 6,));
     }
else if(i==763||i==764||i==765){ Get.off(DressesW(selectedPage: 7,));
     }
else if(i==766||i==767||i==768){ Get.off(DressesW(selectedPage: 8,));
     }
else if(i==769||i==770||i==771||i==772||i==773||i==774){ Get.off(DressesW(selectedPage: 9,));
     }
else if(i==775||i==776||i==777){ Get.off(DressesW(selectedPage: 10,));
     }
else if(i==778||i==779||i==780||i==781||i==782||i==783||i==784||i==785||i==786){ Get.off(WEthnic(selectedPage: 0,));
     }
else if(i==787||i==788||i==789){ Get.off(WEthnic(selectedPage: 1,));
     }
else if(i==790||i==791||i==792||i==793||i==794||i==795){ Get.off(WEthnic(selectedPage: 2,));
     }
else if(i==796||i==797||i==798){ Get.off(WEthnic(selectedPage: 3,));
     }
else if(i==799||i==800||i==801){ Get.off(WEthnic(selectedPage: 4,));
     }
else if(i==802||i==803||i==804){ Get.off(WEthnic(selectedPage: 5,));
     }
else if(i==805||i==806||i==807){ Get.off(WEthnic(selectedPage: 6,));
     }
else if(i==808||i==809||i==810){ Get.off(WEthnic(selectedPage: 7,));
     }
else if(i==811||i==812||i==813){ Get.off(WEthnic(selectedPage: 8,));
     }
else if(i==814||i==815||i==816){ Get.off(WEthnic(selectedPage: 9,));
     }
else if(i==817||i==818||i==819){ Get.off(WEthnic(selectedPage: 10,));
     }
else if(i==820||i==821||i==822){ Get.off(WEthnic(selectedPage: 11,));
     }
else if(i==823||i==824||i==825){ Get.off(WEthnic(selectedPage: 12,));
     }
else if(i==826||i==827||i==828||i==829||i==830||i==831){ Get.off(JacketW(selectedPage: 0,));
     }
else if(i==832||i==833||i==834){ Get.off(JacketW(selectedPage: 1,));
     }
else if(i==835||i==836||i==837){ Get.off(JacketW(selectedPage: 2,));
     }
else if(i==838||i==839||i==840){ Get.off(JacketW(selectedPage: 3,));
     }
else if(i==841||i==842||i==843){ Get.off(JacketW(selectedPage: 4,));
     }
else if(i==844||i==845||i==846){ Get.off(JacketW(selectedPage: 5,));
     }
else if(i==847||i==848||i==849){ Get.off(JacketW(selectedPage: 6,));
     }
else if(i==850||i==851||i==852){ Get.off(JacketW(selectedPage: 7,));
     }
else if(i==853||i==854||i==855||i==856||i==857||i==858){ Get.off(JacketW(selectedPage: 8,));
     }
else if(i==859||i==860||i==861){ Get.off(JacketW(selectedPage: 9,));
     }

else if(i==862||i==863||i==864){ Get.off(JacketW(selectedPage: 10,));
     }
else if(i==865||i==866||i==867){ Get.off(JacketW(selectedPage: 11,));
     }
else if(i==868||i==869||i==870){ Get.off(JacketW(selectedPage: 12,));
     }
else if(i==871||i==872||i==873||i==874||i==875||i==876){ Get.off(JacketW(selectedPage: 13,));
     }
else if(i==877||i==878||i==879){ Get.off(JumpsuitW(selectedPage: 0,));
     }
else if(i==880||i==881||i==882){ Get.off(JumpsuitW(selectedPage: 1,));
     }
else if(i==883||i==884||i==885){ Get.off(JumpsuitW(selectedPage: 2,));
     }
else if(i==886||i==887||i==888){ Get.off(JewelW(selectedPage: 0,));
     }
else if(i==889||i==890||i==891){ Get.off(JewelW(selectedPage: 1,));
     }
else if(i==892||i==893||i==894){ Get.off(JewelW(selectedPage: 2,));
     }
else if(i==895||i==896||i==897||i==898||i==899||i==900){ Get.off(JewelW(selectedPage: 3,));
     }
else if(i==901||i==902||i==903){ Get.off(JewelW(selectedPage: 4,));
     }
else if(i==904||i==905||i==906){ Get.off(JewelW(selectedPage: 5,));
     }
else if(i==907||i==908||i==909){ Get.off(JewelW(selectedPage: 6,));
     }
else if(i==913||i==914||i==915){ Get.off(KnitwearW(selectedPage: 1,));
     }
else if(i==916||i==917||i==918){ Get.off(KnitwearW(selectedPage: 2,));
     }
else if(i==919||i==920||i==921){ Get.off(KnitwearW(selectedPage: 4,));
     }
else if(i==922||i==923||i==924){ Get.off(KnitwearW(selectedPage: 5,));
     }
else if(i==925||i==926||i==927||i==964||i==965||i==966){ Get.off(ShoesW(selectedPage: 0,));
     }
else if(i==928||i==929||i==930){ Get.off(ShoesW(selectedPage: 1,));
     }
else if(i==931||i==932||i==933){ Get.off(ShoesW(selectedPage: 2,));
     }
else if(i==934||i==935||i==936){ Get.off(ShoesW(selectedPage: 3,));
     }
else if(i==937||i==938||i==939){ Get.off(ShoesW(selectedPage: 4,));
     }
else if(i==940||i==941||i==942){ Get.off(ShoesW(selectedPage: 5,));
     }
else if(i==943||i==944||i==945){ Get.off(ShoesW(selectedPage: 6,));
     }
else if(i==946||i==947||i==948){ Get.off(ShoesW(selectedPage: 7,));
     }
else if(i==949||i==950||i==951){ Get.off(ShoesW(selectedPage: 8,));
     }
else if(i==952||i==953||i==954){ Get.off(ShoesW(selectedPage: 9,));
     }
else if(i==955||i==956||i==957||i==958||i==959||i==960){ Get.off(ShoesW(selectedPage: 10,));
     }
else if(i==961||i==962||i==963){ Get.off(ShoesW(selectedPage: 11,));
     }
else if(i==967||i==968||i==969||i==970||i==971||i==972){ Get.off(ShortsW(selectedPage: 0,));
     }
else if(i==973||i==974||i==975){ Get.off(ShortsW(selectedPage: 1,));
     }
else if(i==976||i==977||i==978){ Get.off(ShortsW(selectedPage: 2,));
     }
else if(i==979||i==980||i==981||i==982||i==983||i==984){ Get.off(SkirtW(selectedPage: 0,));
     }
else if(i==985||i==986||i==987){ Get.off(SkirtW(selectedPage: 1,));
     }
else if(i==988||i==989||i==990){ Get.off(SkirtW(selectedPage: 2,));
     }
else if(i==991||i==992||i==993){ Get.off(SkirtW(selectedPage: 3,));
     }
else if(i==994||i==995||i==996||i==997||i==998||i==999){ Get.off(SkirtW(selectedPage: 4,));
     }
else if(i==1000||i==1001||i==1002){ Get.off(SkirtW(selectedPage: 4,));
     }
else if(i==1003||i==1004||i==1005){ Get.off(SkirtW(selectedPage: 5,));
     }
else if(i==1006||i==1007||i==1008){ Get.off(SneakersW(selectedPage: 0,));
     }
else if(i==1009||i==1010||i==1011){ Get.off(SneakersW(selectedPage: 1,));
     }
else if(i==1012||i==1013||i==1014){ Get.off(SneakersW(selectedPage: 2,));
     }
else if(i==1015||i==1016||i==1017){ Get.off(SneakersW(selectedPage: 3,));
     }
else if(i==1018||i==1019||i==1020||i==1021||i==1022||i==1023){ Get.off(TopsW(selectedPage: 0,));
     }
else if(i==1024||i==1025||i==1026){ Get.off(TopsW(selectedPage: 1,));
     }
else if(i==1027||i==1028||i==1029||i==1030||i==1031||i==1032){ Get.off(TopsW(selectedPage: 2,));
     }
else if(i==1033||i==1034||i==1035){ Get.off(TopsW(selectedPage: 3,));
     }
else if(i==1036||i==1037||i==1038){ Get.off(TopsW(selectedPage: 4,));
     }
else if(i==1039||i==1040||i==1041){ Get.off(TopsW(selectedPage: 5,));
     }
else if(i==1042||i==1043||i==1044){ Get.off(TopsW(selectedPage: 6,));
     }
else if(i==1045||i==1046||i==1047||i==1048||i==1049||i==1050||i==1051||i==1052||i==1053){ Get.off(TopsW(selectedPage: 7,));
     }
else if(i==1054||i==1055||i==1056||i==1057||i==1058||i==1059){ Get.off(TopsW(selectedPage: 8,));
     }
else if(i==1060||i==1061||i==1062||i==1063||i==1064||i==1065){ Get.off(TrouserW(selectedPage: 0,));
     }
else if(i==1066||i==1067||i==1068){ Get.off(TrouserW(selectedPage: 1,));
     }
else if(i==1069||i==1070||i==1071){ Get.off(TrouserW(selectedPage: 2,));
     }
else if(i==1072||i==1073||i==1074){ Get.off(TrouserW(selectedPage: 3,));
     }
else if(i==1075||i==1076||i==1077){ Get.off(TrouserW(selectedPage: 4,));
     }
else if(i==1078||i==1079||i==1080){ Get.off(TrouserW(selectedPage: 5,));
     }
else if(i==1081||i==1082||i==1083){ Get.off(TrouserW(selectedPage: 6,));
     }
else if(i==1084||i==1085||i==1086||i==1087||i==1088||i==1089){ Get.off(TrouserW(selectedPage: 7,));
     }
else if(i==1090||i==1091||i==1092){ Get.off(TrouserW(selectedPage: 8,));
     }
else if(i==1093||i==1094||i==1095){ Get.off(TrouserW(selectedPage: 9,));
     }
else if(i==1096||i==1097||i==1098){ Get.off(TrouserW(selectedPage: 10,));
     }
else if(i==1099||i==1100||i==1101||i==1102||i==1103||i==1104){ Get.off(WatchesW(selectedPage: 0,));
     }
else if(i==1105||i==1106||i==1107){ Get.off(WatchesW(selectedPage: 1,));
     }
else if(i==1108||i==1109||i==1110||i==1111||i==1112||i==1113){ Get.off(WatchesW(selectedPage: 2,));
     }
else if(i==1114||i==1115||i==1116){ Get.off(WatchesW(selectedPage: 3,));
     }
else if(i==1120||i==1121||i==1122||i==1123||i==1124||i==1125){ Get.off(HatsBB(selectedPage: 0,));
     }
else if(i==1126||i==1127||i==1128){ Get.off(HatsBB(selectedPage: 1,));
     }
else if(i==1129||i==1130||i==1131){ Get.off(HatsBB(selectedPage: 2,));
     }
else if(i==1132||i==1133||i==1134){ Get.off(HatsBB(selectedPage: 3,));
     }
else if(i==1135||i==1136||i==1137){ Get.off(TiesBB(selectedPage: 0,));
     }
else if(i==1138||i==1139||i==1140){ Get.off(TiesBB(selectedPage: 0,));
     }
else if(i==1141||i==1142||i==1143){ Get.off(BabyAcB(selectedPage: 1,));
     }
else if(i==1144||i==1145||i==1146){ Get.off(BabyAcB(selectedPage: 3,));
     }
else if(i==1147||i==1148||i==1149){ Get.off(BabyAcB(selectedPage: 4,));
     }
else if(i==1150||i==1151||i==1152){ Get.off(BabyAcB(selectedPage: 5,));
     }
else if(i==1153||i==1154||i==1155){ Get.off(BabyAcB(selectedPage: 0,));
    }
else if(i==1153||i==1154||i==1155){ Get.off(BabyAcB(selectedPage: 0,));
     }
else if(i==1156||i==1157||i==1158||i==1159||i==1160||i==1161){ Get.off(BabysB(selectedPage: 0,));
     }
else if(i==1162||i==1163||i==1164){ Get.off(BabysB(selectedPage: 1,));
     }
else if(i==1165||i==1166||i==1167){ Get.off(BabysB(selectedPage: 2,));
     }
else if(i==1168||i==1169||i==1170){ Get.off(BabysB(selectedPage: 3,));
     }
else if(i==1171||i==1172||i==1173||i==1174||i==1175||i==1176||i==1177||i==1178||i==1179){ Get.off(BabyCB(selectedPage: 0,));
     }
else if(i==1180||i==1181||i==1182){ Get.off(BabyCB(selectedPage: 1,));
     }
else if(i==1183||i==1184||i==1185){ Get.off(BabyCB(selectedPage: 2,));
     }
else if(i==1186||i==1187||i==1188){ Get.off(BabyCB(selectedPage: 3,));
     }
else if(i==1189||i==1190||i==1191){ Get.off(BabyCB(selectedPage: 4,));
     }
else if(i==1192||i==1193||i==1194){ Get.off(BabyCB(selectedPage: 5,));
     }
else if(i==1195||i==1196||i==1197||i==1198||i==1199||i==1200){ Get.off(BabyCB(selectedPage: 6,));
     }
else if(i==1201||i==1202||i==1203||i==1204||i==1205||i==1206||i==1207||i==1208||i==1209){ Get.off(BBEthnic(selectedPage: 0,));
     }
else if(i==1210||i==1211||i==1212){ Get.off(BBEthnic(selectedPage: 1,));
     }
else if(i==1213||i==1214||i==1215){ Get.off(BBEthnic(selectedPage: 2,));
     }
else if(i==1216||i==1217||i==1218){ Get.off(BBEthnic(selectedPage: 3,));
     }
else if(i==1219||i==1220||i==1221||i==1222||i==1223||i==1224){ Get.off(BBEthnic(selectedPage: 4,));
     }
else if(i==1225||i==1226||i==1227){ Get.off(BBEthnic(selectedPage: 5,));
     }
else if(i==1228||i==1229||i==1230){ Get.off(BBEthnic(selectedPage: 6,));
     }
else if(i==1231||i==1232||i==1233||i==1234||i==1235||i==1236){ Get.off(BabykB(selectedPage: 0,));
     }
else if(i==1237||i==1238||i==1239){ Get.off(BabykB(selectedPage: 1,));
     }
else if(i==1240||i==1241||i==1242||i==1243||i==1244||i==1245){ Get.off(BabykB(selectedPage: 0,));
     }
else if(i==1246||i==1247||i==1248){ Get.off(BabySB(selectedPage: 1,));
     }
else if(i==1249||i==1250||i==1251){ Get.off(BabySB(selectedPage: 2,));
     }
else if(i==1252||i==1253||i==1254){ Get.off(BabySB(selectedPage: 3,));
     }

else if(i==1255||i==1256||i==1257||i==1258||i==1259||i==1260){ Get.off(BabyshB(selectedPage: 0,));
     }
else if(i==1261||i==1262||i==1263){ Get.off(BabyshB(selectedPage: 1,));
     }
else if(i==1264||i==1265||i==1266){ Get.off(BabyshB(selectedPage: 2,));
     }
else if(i==1267||i==1268||i==1269){ Get.off(BabyswB(selectedPage: 0,));
     }
else if(i==1270||i==1271||i==1272){ Get.off(BabyswB(selectedPage: 1,));
     }
else if(i==1273||i==1274||i==1275){ Get.off(BabytB(selectedPage: 0,));
     }
else if(i==1276||i==1277||i==1278){ Get.off(BabytB(selectedPage: 1,));
     }
else if(i==1279||i==1280||i==1281){ Get.off(BabytB(selectedPage: 2,));
     }
else if(i==1282||i==1283||i==1284||i==1285||i==1286||i==1287){ Get.off(BabytB(selectedPage: 3,));
     }
else if(i==1288||i==1289||i==1290){ Get.off(BabytrB(selectedPage: 0,));
     }
else if(i==1291||i==1292||i==1293||i==1294||i==1295||i==1296){ Get.off(BabytuB(selectedPage: 0,));
     }
else if(i==1297||i==1298||i==1299){ Get.off(BabytuB(selectedPage: 1,));
     }
else if(i==1300||i==1301||i==1302){ Get.off(BabytuB(selectedPage: 2,));
     }
else if(i==1303||i==1304||i==1305){ Get.off(BabytuB(selectedPage: 3,));
     }
else if(i==1306||i==1307||i==1308||i==1309||i==1310||i==1311){ Get.off(HatsBG(selectedPage: 0,));
     }
else if(i==1312||i==1313||i==1314){ Get.off(HatsBG(selectedPage: 1,));
     }
else if(i==1315||i==1316||i==1317){ Get.off(HatsBG(selectedPage: 2,));
     }
else if(i==1318||i==1319||i==1320){ Get.off(HatsBG(selectedPage: 3,));
     }
else if(i==1321||i==1322||i==1323){ Get.off(HatsBG(selectedPage: 4,));
     }
else if(i==1324||i==1325||i==1326){ Get.off(BabyAcG(selectedPage: 0,));
     }
else if(i==1327||i==1328||i==1329){ Get.off(BabyAcG(selectedPage: 1,));
     }
else if(i==1330||i==1331||i==1332){ Get.off(BabyAcG(selectedPage: 2,));
     }
else if(i==1333||i==1334||i==1335){ Get.off(BabyAcG(selectedPage: 3,));
     }
else if(i==1336||i==1337||i==1338){ Get.off(BabyAcG(selectedPage: 4,));
     }
else if(i==1339||i==1340||i==1341){ Get.off(BabysG(selectedPage: 0,));
     }
else if(i==1342||i==1343||i==1344||i==1345||i==1346||i==1347){ Get.off(BabysG(selectedPage: 1,));
     }
else if(i==1348||i==1349||i==1350){ Get.off(BabysG(selectedPage: 2,));
     }
else if(i==1351||i==1352||i==1353){ Get.off(BabysG(selectedPage: 3,));
     }
else if(i==1354||i==1355||i==1356||i==1357||i==1358||i==1359||i==1360||i==1361||i==1362){ Get.off(BabyCG(selectedPage: 0,));
     }
else if(i==1363||i==1364||i==1365){ Get.off(BabyCG(selectedPage: 1,));
     }
else if(i==1366||i==1367||i==1368){ Get.off(BabyCG(selectedPage: 2,));
     }
else if(i==1369||i==1370||i==1371){ Get.off(BabyCG(selectedPage: 3,));
     }
else if(i==1372||i==1373||i==1374){ Get.off(BabyCG(selectedPage: 4,));
     }
else if(i==1375||i==1376||i==1377){ Get.off(BabyCG(selectedPage: 5,));
     }
else if(i==1378||i==1379||i==1380){ Get.off(BabyCG(selectedPage: 6,));
     }
else if(i==1381||i==1382||i==1383||i==1384||i==1385||i==1386){ Get.off(BabyCG(selectedPage: 7,));
     }
else if(i==1387||i==1388||i==1389||i==1390||i==1391||i==1392){ Get.off(BabydrG(selectedPage: 0,));
     }
else if(i==1393||i==1394||i==1395){ Get.off(BabydrG(selectedPage: 1,));
     }
else if(i==1396||i==1397||i==1398){ Get.off(BabydrG(selectedPage: 2,));
     }
else if(i==1399||i==1400||i==1401||i==1402||i==1403||i==1404||i==1405||i==1406||i==1407||i==1408||i==1409||i==1410){ Get.off(GGEthnic(selectedPage: 0,));
     }
else if(i==1411||i==1412||i==1413||i==1414||i==1415||i==1416){ Get.off(GGEthnic(selectedPage: 1,));
     }
else if(i==1417||i==1418||i==1419){ Get.off(GGEthnic(selectedPage: 2,));
     }
else if(i==1420||i==1421||i==1422){ Get.off(GGEthnic(selectedPage: 3,));
     }
else if(i==1423||i==1424||i==1425){ Get.off(GGEthnic(selectedPage: 4,));
     }
else if(i==1426||i==1427||i==1428||i==1429||i==1430||i==1431){ Get.off(GGEthnic(selectedPage: 5,));
     }
else if(i==1432||i==1433||i==1434||i==1435||i==1436||i==1437){ Get.off(BabykG(selectedPage: 0,));
     }
else if(i==1438||i==1439||i==1440){ Get.off(BabykG(selectedPage: 1,));
     }
else if(i==1441||i==1442||i==1443||i==1444||i==1445||i==1446){ Get.off(BabySG(selectedPage: 0,));
     }
else if(i==1447||i==1448||i==1449){ Get.off(BabySG(selectedPage: 1,));
     }
else if(i==1450||i==1451||i==1452){ Get.off(BabySG(selectedPage: 2,));
     }
else if(i==1453||i==1454||i==1455){ Get.off(BabySG(selectedPage: 3,));
     }
else if(i==1456||i==1457||i==1458){ Get.off(BabySG(selectedPage: 4,));
     }
else if(i==1459||i==1460||i==1461){ Get.off(BabySG(selectedPage: 5,));
     }
else if(i==1462||i==1463||i==1464||i==1465||i==1466||i==1467){ Get.off(BabyshG(selectedPage: 0,));
     }
else if(i==1468||i==1469||i==1470){ Get.off(BabyshG(selectedPage: 1,));
     }
else if(i==1471||i==1472||i==1473){ Get.off(BabyshG(selectedPage: 2,));
     }
else if(i==1474||i==1475||i==1476||i==1477||i==1478||i==1479){ Get.off(BabyskG(selectedPage: 0,));
     }
else if(i==1480||i==1481||i==1482){ Get.off(BabyskG(selectedPage: 1,));
     }
else if(i==1483||i==1484||i==1485){ Get.off(BabyskG(selectedPage: 2,));
     }
else if(i==1486||i==1487||i==1488){ Get.off(BabyskG(selectedPage: 3,));
     }
else if(i==1489||i==1490||i==1491){ Get.off(BabyskG(selectedPage: 4,));
     }
else if(i==1492||i==1493||i==1494){ Get.off(BabyswG(selectedPage: 0,));
     }
else if(i==1495||i==1496||i==1497||i==1498||i==1499||i==1500){ Get.off(TopsBG(selectedPage: 0,));
     }
else if(i==1501||i==1502||i==1503){ Get.off(TopsBG(selectedPage: 1,));
     }
else if(i==1504||i==1505||i==1506){ Get.off(TopsBG(selectedPage: 2,));
     }
else if(i==1507||i==1508||i==1509){ Get.off(TopsBG(selectedPage: 3,));
     }
else if(i==1510||i==1511||i==1512){ Get.off(TopsBG(selectedPage: 4,));
     }
else if(i==1513||i==1514||i==1515||i==1516||i==1517||i==1518){ Get.off(TopsBG(selectedPage: 5,));
     }
else if(i==1519||i==1520||i==1521){ Get.off(BabytrG());
     }
else if(i==1522||i==1523||i==1524||i==1525||i==1526||i==1527){ Get.off(BabytuG(selectedPage: 0,));
     }
else if(i==1528||i==1529||i==1530){ Get.off(BabytuG(selectedPage: 1,));
     }
else if(i==1531||i==1532||i==1533){ Get.off(BabytuG(selectedPage: 2,));
     }
else if(i==1534||i==1535||i==1536||i==1537||i==1538||i==1539){ Get.off(BabytuG(selectedPage: 3,));
     }
else if(i==1540||i==1541||i==1542||i==1543||i==1544||i==1545){ Get.off(HatsKB(selectedPage: 0,));
     }
else if(i==1546||i==1547||i==1548){ Get.off(HatsKB(selectedPage: 1,));
     }
else if(i==1549||i==1550||i==1551){ Get.off(HatsKB(selectedPage: 2,));
     }
else if(i==1552||i==1553||i==1554){ Get.off(HatsKB(selectedPage: 3,));
     }
else if(i==1555||i==1556||i==1557){ Get.off(HatsKB(selectedPage: 4,));
     }
else if(i==1558||i==1559||i==1560){ Get.off(TiesKB(selectedPage: 0,));
     }
else if(i==1561||i==1562||i==1563){ Get.off(TiesKB(selectedPage: 1,));
     }
else if(i==1564||i==1565||i==1566||i==1567||i==1568||i==1569){ Get.off(BagsKB(selectedPage: 0,));
     }
else if(i==1570||i==1571||i==1572){ Get.off(BagsKB(selectedPage: 1,));
     }
else if(i==1573||i==1574||i==1575){ Get.off(BagsKB(selectedPage: 2,));
     }
else if(i==1576||i==1577||i==1578){ Get.off(BracesKB(selectedPage: 0,));
     }
else if(i==1579||i==1580||i==1581){ Get.off(BracesKB(selectedPage: 1,));
     }
else if(i==1582||i==1583||i==1584||i==1585||i==1586||i==1587){ Get.off(EyeKB(selectedPage: 0,));
     }
else if(i==1588||i==1589||i==1590){ Get.off(EyeKB(selectedPage: 1,));
     }
else if(i==1591||i==1592||i==1593){ Get.off(AccessKB(selectedPage: 0,));
     }
else if(i==1594||i==1595||i==1596){ Get.off(AccessKB(selectedPage: 1,));
     }
else if(i==1597||i==1598||i==1599){ Get.off(AccessKB(selectedPage: 4,));
     }
else if(i==1600||i==1601||i==1602){ Get.off(AccessKB(selectedPage: 7,));
     }
else if(i==1603||i==1604||i==1605){ Get.off(AccessKB(selectedPage: 8,));
     }
else if(i==1606||i==1607||i==1608||i==1609||i==1610||i==1611||i==1612||i==1613||i==1614){ Get.off(KidCB(selectedPage: 0,));
     }
else if(i==1615||i==1616||i==1617){ Get.off(KidCB(selectedPage: 1,));
     }
else if(i==1618||i==1619||i==1620){ Get.off(KidCB(selectedPage: 2,));
     }
else if(i==1621||i==1622||i==1623){ Get.off(KidCB(selectedPage: 3,));
     }
else if(i==1624||i==1625||i==1626){ Get.off(KidCB(selectedPage: 4,));
     }
else if(i==1627||i==1628||i==1629){ Get.off(KidCB(selectedPage: 5,));
     }
else if(i==1630||i==1631||i==1632){ Get.off(KidCB(selectedPage: 6,));
     }
else if(i==1633||i==1634||i==1635){ Get.off(KidCB(selectedPage: 7,));
     }
else if(i==1636||i==1637||i==1638){ Get.off(KidCB(selectedPage: 8,));
     }
else if(i==1639||i==1640||i==1641){ Get.off(KidCB(selectedPage: 9,));
     }
else if(i==1642||i==1643||i==1644||i==1645||i==1646||i==1647){ Get.off(KidCB(selectedPage: 10,));
     }
else if(i==1648||i==1649||i==1650){ Get.off(DenimB(selectedPage: 0,));
     }
else if(i==1651||i==1652||i==1653){ Get.off(DenimB(selectedPage: 1,));
     }
else if(i==1654||i==1655||i==1656){ Get.off(DenimB(selectedPage: 2,));
     }
else if(i==1657||i==1658||i==1659){ Get.off(DenimB(selectedPage: 3,));
     }
else if(i==1660||i==1661||i==1662){ Get.off(DenimB(selectedPage: 4,));
     }
else if(i==1663||i==1664||i==1665||i==1687||i==1688||i==1689||i==1690||i==1691||i==1692){ Get.off(KBEthnic(selectedPage: 0,));
     }
else if(i==1666||i==1667||i==1668){ Get.off(KBEthnic(selectedPage: 1,));
     }
else if(i==1669||i==1670||i==1671){ Get.off(KBEthnic(selectedPage: 2,));
     }
else if(i==1672||i==1673||i==1674){ Get.off(KBEthnic(selectedPage: 3,));
     }
else if(i==1675||i==1676||i==1677||i==1678||i==1679||i==1680){ Get.off(KBEthnic(selectedPage: 4,));
     }
else if(i==1681||i==1682||i==1683){ Get.off(KBEthnic(selectedPage: 5,));
     }
else if(i==1684||i==1685||i==1686){ Get.off(KBEthnic(selectedPage: 6,));
     }
else if(i==1693||i==1694||i==1695||i==1696||i==1697||i==1698||i==1699||i==1700||i==1701){ Get.off(KidkB());
     }
else if(i==1702||i==1703||i==1704||i==1705||i==1706||i==1707){ Get.off(KidSB(selectedPage: 0,));
     }
else if(i==1708||i==1709||i==1710){ Get.off(KidSB(selectedPage: 1,));
     }
else if(i==1711||i==1712||i==1713){ Get.off(KidSB(selectedPage: 2,));
     }
else if(i==1714||i==1715||i==1716){ Get.off(KidSB(selectedPage: 3,));
     }
else if(i==1717||i==1718||i==1719){ Get.off(KidSB(selectedPage: 4,));
     }
else if(i==1720||i==1721||i==1722){ Get.off(KidSB(selectedPage: 5,));
     }
else if(i==1723||i==1724||i==1725||i==1726||i==1727||i==1728){ Get.off(KidSB(selectedPage: 6,));
     }
else if(i==1729||i==1730||i==1731||i==1732||i==1733||i==1734){ Get.off(KidshB(selectedPage: 0,));
     }
else if(i==1735||i==1736||i==1737){ Get.off(KidshB(selectedPage: 2,));
     }
else if(i==1738||i==1739||i==1740){ Get.off(KidswB(selectedPage: 0,));
     }
else if(i==1741||i==1742||i==1743||i==1744||i==1745||i==1746){ Get.off(KidswB(selectedPage: 1,));
     }
else if(i==1747||i==1748||i==1749){ Get.off(TopsB(selectedPage: 0,));
     }
else if(i==1750||i==1751||i==1752){ Get.off(TopsB(selectedPage: 1,));
     }
else if(i==1753||i==1754||i==1755){ Get.off(TopsB(selectedPage: 2,));
     }
else if(i==1756||i==1757||i==1758||i==1759||i==1760||i==1761){ Get.off(TopsB(selectedPage: 3,));
     }
else if(i==1762||i==1763||i==1764||i==1765||i==1766||i==1767){ Get.off(TopsB(selectedPage: 4,));
     }
else if(i==1768||i==1769||i==1770||i==1771||i==1772||i==1773){ Get.off(TrouserkM(selectedPage: 0,));
     }
else if(i==1774||i==1775||i==1776){ Get.off(TrouserkM(selectedPage: 1,));
     }
else if(i==1777||i==1778||i==1779){ Get.off(TrouserkM(selectedPage: 2,));
     }
else if(i==1780||i==1781||i==1782){ Get.off(TrouserkM(selectedPage: 3,));
     }
else if(i==1783||i==1784||i==1785){ Get.off(TrouserkM(selectedPage: 4,));
     }
else if(i==1786||i==1787||i==1788){ Get.off(TrackKB());
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

