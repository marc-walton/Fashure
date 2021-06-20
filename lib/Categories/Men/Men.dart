import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
import 'package:carousel_slider/carousel_slider.dart';
List <Widget>listOfImages = <Widget>[];

pics({String userid,String prodid}){
  return
    FutureBuilder<QuerySnapshot> (
        future:     productsRef
        .doc(userid)
        .collection('userProducts')
     .where('prodId' ,isEqualTo: '$prodid')
           // .where('ownerId' ,isEqualTo: '$ownerId')
            .get(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return new ListView.builder(
                shrinkWrap: true,
                scrollDirection:Axis.vertical,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                  listOfImages = [];
                  for (int i = 0;
                  i <
                      snapshot.data.docs[index].data()['shopmediaUrl']
                          .length;
                  i++) {
                    listOfImages.add(CachedNetworkImage(imageUrl:snapshot
                        .data.docs[index].data()['shopmediaUrl'][i]));
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10.0),

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          CarouselSlider(
                              items: listOfImages,
                              options: CarouselOptions(
                                height: 500,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                // onPageChanged: callbackFunction,
                                scrollDirection: Axis.horizontal,
                              )
                          )
                      ),

                    ],
                  );
                }
            );
          }
            return Center(
              child: CircularProgressIndicator(),
            );

        });

}

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

        ListTile(
          title:            Text(productname, style: TextStyle(
              color: kText,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),),
          subtitle:            Text( "₹$inr",style: TextStyle(color: kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),

        );

    }
    else if(currentUser.country=='US'){
      return

        ListTile(
          title:                      Text(productname, style: TextStyle(
              color: kText,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),),

          subtitle:          Text( "\u0024 $usd",style: TextStyle(color: kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),

        );


    }
    else if (currentUser.country == 'Europe'){
      return

        ListTile(
          title:                      Text(productname, style: TextStyle(
              color: kText,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),),

          subtitle:           Text( "€ $eur",style: TextStyle(color: kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),

        );

    }
    else if (currentUser.country == 'UK'){
      return

        ListTile(
          title:                    Text(productname, style: TextStyle(
              color: kText,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),),

          subtitle:                     Text( "£  $gbp ",style: TextStyle(color: kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),


        );

    }
    else{
      return

        ListTile(
          title:                      Text(productname, style: TextStyle(
              color: kText,
              fontSize: 15.0,
              fontWeight: FontWeight.bold),),

          subtitle:          Text( "\u0024 $usd",style: TextStyle(color: kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),

        );


    }
  }
Allin(){
  return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
    itemBuilderType:
    PaginateBuilderType.listView,
    itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
   String ownerId = documentSnapshot.data()['ownerId'];
String prodId = documentSnapshot.data()['prodId'];
//String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
String productname = documentSnapshot.data()['productname'];
   String inr = documentSnapshot.data()['inr'];
   String usd = documentSnapshot.data()['usd'];
   String eur = documentSnapshot.data()['eur'];
   String gbp = documentSnapshot.data()['gbp'];
    return
      FutureBuilder(
        future: usersRef.doc(ownerId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
           Users user = Users.fromDocument(snapshot.data);
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
                ),
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
                      borderRadius: BorderRadius.circular(20.0),child:pics(userid:ownerId,prodid: prodId)),
                ],),),
              df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

            Divider(color: kGrey,),
          ],

          );

        },
      );
    },
    query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
        .where('Gender',isEqualTo: 'Men')

  );
}
All(){
  return  PaginateFirestore(
    itemBuilderType:
    PaginateBuilderType.listView,
    itemBuilder: (index, context, documentSnapshot)   {
   String ownerId = documentSnapshot.data()['ownerId'];
String prodId = documentSnapshot.data()['prodId'];
//String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
String productname = documentSnapshot.data()['productname'];
   String inr = documentSnapshot.data()['inr'];
   String usd = documentSnapshot.data()['usd'];
   String eur = documentSnapshot.data()['eur'];
   String gbp = documentSnapshot.data()['gbp'];
    return
      FutureBuilder(
        future: usersRef.doc(ownerId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
           Users user = Users.fromDocument(snapshot.data);
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
               ),
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
                      borderRadius: BorderRadius.circular(20.0),child: pics(userid:ownerId,prodid: prodId)),
                ],),),
              df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
            Divider(color: kGrey,),
          ],

          );

        },
      );
    },
    query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)

        .where('Gender',isEqualTo: 'Men')
.where('indian', isEqualTo:false)
  );
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(currentUser.country=='India'){ return
      RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length:20,
              child: Scaffold(

                appBar:AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 15,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,

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

                body: Container(
                  decoration: BoxDecoration(
                      gradient: fabGradient
                  ) ,
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: TabBarView(

                        children:<Widget> [
                          All(),
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
                ),
              )
          ),
        ),
      );}
    else{
      return
        RotatedBox(
          quarterTurns: 3,
          child: Expanded(
            child: DefaultTabController(
                length:19,
                child: Scaffold(

                  appBar:AppBar(
                    toolbarHeight: SizeConfig.safeBlockHorizontal * 15,
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,

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

                  body: Container(
                    decoration: BoxDecoration(
                        gradient: fabGradient
                    ) ,
                    alignment: Alignment.center,
                    child: RotatedBox(
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
                  ),
                )
            ),
          ),
        );
    }


  }
}
