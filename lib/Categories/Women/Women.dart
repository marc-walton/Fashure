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



class Women extends StatefulWidget {
  @override
  _WomenState createState() => _WomenState();
}

class _WomenState extends State<Women> {

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
                              borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                        ],),),
                    df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('indian', isEqualTo:false)

    );
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
                              borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                        ],),),
                    df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query: Firestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')

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
                length:21,
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
                        Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8,),),
                        Text("Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Jumpsuit",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Bridal & Wedding",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Skirts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Activewear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Beach & Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Bags",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Sneakers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
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
                            Allin(),
                            WEthnic(),
                            TopsW(),
                            DressesW(),
                            JumpsuitW(),
                            Bridal(),
                            CapesW(),
                            JacketW(),
                            KnitwearW(),
                            DenimW(),
                            TrouserW(),
                            ShortsW(),
                            SkirtW(),
                            ActiveWearW(),
                            BeachwearW(),
                            BagsW(),
                            ShoesW(),
                            SneakersW(),
                            AccessW(),
                            JewelW(),
                            WatchesW(),

                          ]),
                    ),
                  ),
                )
            ),
          ),
        );
    }
    else{
      return
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
                        Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8,),),
                        Text("Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Jumpsuit",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Bridal & Wedding",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Skirts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Activewear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Beach & Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Bags",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Sneakers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
                        Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8),),
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
                            TopsW(),
                            DressesW(),
                            JumpsuitW(),
                            Bridal(),
                            CapesW(),
                            JacketW(),
                            KnitwearW(),
                            DenimW(),
                            TrouserW(),
                            ShortsW(),
                            SkirtW(),
                            ActiveWearW(),
                            BeachwearW(),
                            BagsW(),
                            ShoesW(),
                            SneakersW(),
                            AccessW(),
                            JewelW(),
                            WatchesW(),

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
