import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
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



class Men extends StatefulWidget {
  @override
  _MenState createState() => _MenState();
}

class _MenState extends State<Men> {

  void initState() {
    super.initState();

  }
  df({String productname,String usd,String inr,String cny,String eur,String gbp,String prodId,String ownerId,}){
    if(currentUser.country=='India'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "₹$inr",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if(currentUser.country=='US'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "\u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'China') {
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "¥ $cny",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'Europe'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "€ $eur",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'UK'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "£  $gbp ",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
    Get.to( ProductScreen(
      prodId: prodId,
      userId: ownerId,
    ),),
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         ProductScreen(
                  //           prodId: prodId,
                  //           userId: ownerId,
                  //         ),
                  //   ),
                  // ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else{
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "\u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
  }
Allin(){
  return  PaginateFirestore(
//    itemsPerPage: 2,
    itemBuilderType:
    PaginateBuilderType.listView,
    itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
   String ownerId = documentSnapshot.data['ownerId'];
String prodId = documentSnapshot.data['prodId'];
String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
String productname = documentSnapshot.data['productname'];
   String inr = documentSnapshot.data['inr'];
   String cny = documentSnapshot.data['cny'];
   String usd = documentSnapshot.data['usd'];
   String eur = documentSnapshot.data['eur'];
   String gbp = documentSnapshot.data['gbp'];
    return
      FutureBuilder(
        future: usersRef.document(ownerId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
          return Column(
            children: <Widget>[
            GestureDetector(
              onTap: () => showProfile(context, profileId: user.id),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  user.displayName,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(user.username,
                  style: TextStyle(color: kIcon),),),
            ),

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
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                ],),),
              df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

            Divider(color: kGrey,),
          ],

          );

        },
      );
    },
    query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
        .where('Gender',isEqualTo: 'Men')

  );
}
All(){
  return  PaginateFirestore(
//    itemsPerPage: 2,
    itemBuilderType:
    PaginateBuilderType.listView,
    itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
   String ownerId = documentSnapshot.data['ownerId'];
String prodId = documentSnapshot.data['prodId'];
String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
String productname = documentSnapshot.data['productname'];
   String inr = documentSnapshot.data['inr'];
   String cny = documentSnapshot.data['cny'];
   String usd = documentSnapshot.data['usd'];
   String eur = documentSnapshot.data['eur'];
   String gbp = documentSnapshot.data['gbp'];
    return
      FutureBuilder(
        future: usersRef.document(ownerId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
          return Column(
            children: <Widget>[
            GestureDetector(
              onTap: () => showProfile(context, profileId: user.id),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  user.displayName,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(user.username,
                  style: TextStyle(color: kIcon),),),
            ),

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
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                ],),),
              df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
            Divider(color: kGrey,),
          ],

          );

        },
      );
    },
    query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)

        .where('Gender',isEqualTo: 'Men')
        // .where('Category',isEqualTo: 'Caps')
        // .where('Category',isEqualTo: 'Balaclavas')
      //   .where('Category',isEqualTo: 'Beanies')
      //   .where('Category',isEqualTo: 'Berets')
      //   .where('Category',isEqualTo: 'Fedora & Trilbies')
      //   .where('Category',isEqualTo: 'Bucket Hats')
      //   .where('Category',isEqualTo: 'Sun Hats')
      //   .where('Category',isEqualTo: 'Belts')
      //
      //   .where('Category',isEqualTo: 'Scarves')
      //   .where('Category',isEqualTo: 'Braces')
      //   .where('Category',isEqualTo: 'Suspenders')
      //   .where('Category',isEqualTo: 'Ties')
      //   .where('Category',isEqualTo: 'Bow Ties')
      //   .where('Category',isEqualTo: 'Glasses & Frames')
      //   .where('Category',isEqualTo: 'Sunglasses')
      //   .where('Category',isEqualTo: 'Gloves')
      //   .where('Category',isEqualTo: 'Socks')
      //   .where('Category',isEqualTo: 'Pocket Square')
      //   .where('Category',isEqualTo: 'Wallets')
      //   .where('Category',isEqualTo: 'Umbrellas & Travel')
      //
      //   .where('Category',isEqualTo: 'Phone')
      //     .where('Category',isEqualTo: 'MATops')
      // .where('Category',isEqualTo: 'MAJackets')
      // .where('Category',isEqualTo: 'MATrouser')
      // .where('Category',isEqualTo: 'MAShorts')
      // .where('Category',isEqualTo: 'MAFootwear')
      // .where('Category',isEqualTo: 'MAAccessories')
      //   .where('Category',isEqualTo: 'Backpacks')
      //   .where('Category',isEqualTo: 'Briefcase')
      //   .where('Category',isEqualTo: 'Laptop Bags')
      //   .where('Category',isEqualTo: 'Shoulder Bags')
      //   .where('Category',isEqualTo: 'Duffle bags & holdall')
      //   .where('Category',isEqualTo: 'Belt Bags')
      //   .where('Category',isEqualTo: 'Clutch Bags')
      //   .where('Category',isEqualTo: 'Messenger Bags')
      //   .where('Category',isEqualTo: 'Tote Bags')
      //   .where('Category',isEqualTo: 'Luggage')
      //     .where('Category',isEqualTo: 'MBTops')
      // .where('Category',isEqualTo: 'MBShorts')
      // .where('Category',isEqualTo: 'MBTrunks')
      // .where('Category',isEqualTo: 'MBFootwear')
      //
      // .where('Category',isEqualTo: 'MBAccessories')
      //   .where('Category',isEqualTo: 'Single Breasted Coats')
      //   .where('Category',isEqualTo: 'Double Breasted Coats')
      //   .where('Category',isEqualTo: 'Duffle Coats')
      //   .where('Category',isEqualTo: 'Padded Coats')
      //   .where('Category',isEqualTo: 'Parka Coats')
      //   .where('Category',isEqualTo: 'Rain Coats')
      //   .where('Category',isEqualTo: 'Trench Coats')
      //   .where('Category',isEqualTo: 'Denim Jackets')
      //   .where('Category',isEqualTo: 'DMShorts')
      //   .where('Category',isEqualTo: 'Skinny-fit jeans')
      //   .where('Category',isEqualTo: 'Slim-fit jeans')
      //   .where('Category',isEqualTo: 'Regular-fit jeans')
      //   .where('Category',isEqualTo: 'Tapered-fit jeans')
      //   .where('Category',isEqualTo: 'Cropped jeans')
      //   .where('Category',isEqualTo: 'Bootcut jeans')
      //   .where('Category',isEqualTo: 'Fragrance')
      //   .where('Category',isEqualTo: 'Skin')
      //   .where('Category',isEqualTo: 'Hair')
      //   .where('Category',isEqualTo: 'Shave')
      //   .where('Category',isEqualTo: 'Bath Essentials')
      //
      //   .where('Category',isEqualTo: 'Body Care')
      //   .where('Category',isEqualTo: 'Suit Jackets')
      //   .where('Category',isEqualTo: 'Tuxedo')
      //   .where('Category',isEqualTo: 'Biker Jackets')
      //   .where('Category',isEqualTo: 'Bomber Jackets')
      //   .where('Category',isEqualTo: 'Blazers')
      //   .where('Category',isEqualTo: 'Hooded Jackets')
      //   .where('Category',isEqualTo: 'Leather Jackets')
      //   .where('Category',isEqualTo: 'Military jackets')
      //   .where('Category',isEqualTo: 'Sport jackets')
      //   .where('Category',isEqualTo: 'Waistcoats & Gillets')
      //   .where('Category',isEqualTo: 'Bracelets')
      //   .where('Category',isEqualTo: 'Cuff-links & Tie Bar')
      //   .where('Category',isEqualTo: 'Brooches & Pins')
      //   .where('Category',isEqualTo: 'Necklace')
      //   .where('Category',isEqualTo: 'Studs and Earrings')
      //
      //   .where('Category',isEqualTo: 'Rings')
      //   .where('Category',isEqualTo: 'Casual Wear')
      //   .where('Category',isEqualTo: 'Formal Wear')
      //   .where('Category',isEqualTo: 'Brogues')
      //   .where('Category',isEqualTo: 'Boots')
      //   .where('Category',isEqualTo: 'Boat Shoes')
      //   .where('Category',isEqualTo: 'Derby')
      //   .where('Category',isEqualTo: 'Espadrilles')
      //   .where('Category',isEqualTo: 'Loafers')
      //   .where('Category',isEqualTo: 'Monk Shoes')
      //   .where('Category',isEqualTo: 'Oxford Shoes')
      //   .where('Category',isEqualTo: 'Lace-Up Shoess')
      //   .where('Category',isEqualTo: 'Sandals')
      //   .where('Category',isEqualTo: 'Flip flops & Slides')
      //   .where('Category',isEqualTo: 'Slippers')
      //   .where('Category',isEqualTo: 'Bermuda Shorts')
      //   .where('Category',isEqualTo: 'Chino Shorts')
      //   .where('Category',isEqualTo: 'Tailored Shorts')
      //   .where('Category',isEqualTo: 'Sports Shorts')
      //   .where('Category',isEqualTo: 'Cargo Shorts')
      //   .where('Category',isEqualTo: 'High - Tops')
      //   .where('Category',isEqualTo: 'Low - Tops')
      //   .where('Category',isEqualTo: 'Slip-On Sneakers')
      //   .where('Category',isEqualTo: 'Single Breasted Suits')
      //   .where('Category',isEqualTo: 'Double Breasted Suits')
      //   .where('Category',isEqualTo: 'Dinner Suits')
      //   .where('Category',isEqualTo: 'Tuxedos')
      //   .where('Category',isEqualTo: 'Sweatshirts')
      //   .where('Category',isEqualTo: 'Knitwear')
      //   .where('Category',isEqualTo: 'Hoodies')
      //   .where('Category',isEqualTo: 'Cardigans')
      //   .where('Category',isEqualTo: 'Skinny fit')
      //   .where('Category',isEqualTo: 'Slim fit')
      //   .where('Category',isEqualTo: 'Tapered fit')
      //   .where('Category',isEqualTo: 'Regular fit')
      //   .where('Category',isEqualTo: 'Tailored Trousers')
      //   .where('Category',isEqualTo: 'Cargo pants')
      //   .where('Category',isEqualTo: 'Chinos')
      //   .where('Category',isEqualTo: 'Sweatpants')
      //   .where('Category',isEqualTo: 'T-shirts')
      //   .where('Category',isEqualTo: 'Polo shirts')
      //   .where('Category',isEqualTo: 'Tank tops and vests')
      //   .where('Category',isEqualTo: 'Chronograph Watches')
      //   .where('Category',isEqualTo: 'Analog Watches')
      //   .where('Category',isEqualTo: 'Sports & Smart Watches')
      //   .where('Category',isEqualTo: 'Hybrid')
  );
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(currentUser.country=='India'){
      return
      RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length:20,
              child: Scaffold(
                backgroundColor:  kPrimaryColor,
                appBar:AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 15,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,
//                indicatorSize: TabBarIndicatorSize.label,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)
//                           ),
//                           color: Colors.white),

                    tabs:[
                      Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8,),),
                      Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8,),),
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

                body: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        Allin(),
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
              )
          ),
        ),
      );
    }else{
    return
    RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:19,
            child: Scaffold(
              backgroundColor:  kPrimaryColor,

              appBar:AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 15,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,
//                indicatorSize: TabBarIndicatorSize.label,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)
//                           ),
//                           color: Colors.white),

                    tabs:[
                        Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8,),),
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

              body: RotatedBox(
quarterTurns: 1,
                child: TabBarView(

                    children:<Widget> [
                  All(),
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
            )
        ),
      ),
    );
  }
  }
}
