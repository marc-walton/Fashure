import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/Categories/Kids/kids/girl/Accessories.dart';
import 'package:fashow/Categories/Kids/kids/girl/Capes.dart';
import 'package:fashow/Categories/Kids/kids/girl/Denim.dart';
import 'package:fashow/Categories/Kids/kids/girl/Dresses.dart';
import 'package:fashow/Categories/Kids/kids/girl/Jackets.dart';
import 'package:fashow/Categories/Kids/kids/girl/Jumpsuits.dart';
import 'package:fashow/Categories/Kids/kids/girl/knitwear.dart';
import 'package:fashow/Categories/Kids/kids/girl/Shoes.dart';
import 'package:fashow/Categories/Kids/kids/girl/skirts.dart';
import 'package:fashow/Categories/Kids/kids/girl/Shorts.dart';
import 'package:fashow/Categories/Kids/kids/girl/Swimwear.dart';
import 'package:fashow/Categories/Kids/kids/girl/Tops.dart';
import 'package:fashow/Categories/Kids/kids/girl/TRACKS.dart';
import 'package:fashow/Categories/Kids/kids/girl/Trousers.dart';
import 'package:fashow/Categories/Kids/kids/girl/ethnic.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';

class KidGirl extends StatefulWidget {
  @override
  _KidGirlState createState() => _KidGirlState();
}

class _KidGirlState extends State<KidGirl> {
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
            .where('Gender',isEqualTo: 'Kids-Girls')

    );
  }All(){
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
            .where('Gender',isEqualTo: 'Kids-Girls')
            .where('indian', isEqualTo:false)

    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (currentUser.country == 'India') {
      return RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length: 16,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,

                    tabs: [
                      Text("New Arrivals", style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Tops", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Dresses", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Jumpsuits", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Coast", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Jackets", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Denim", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Trousers", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Knitwear", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Skirts", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Shorts", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Swimwear", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Tracks", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Shoes", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Accessories", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    ],
                  ),
                ),

                body: Container( decoration: BoxDecoration(
                    gradient: fabGradient
                ) ,
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: TabBarView(
                        children: <Widget>[
                          Allin(),
                          KGEthnic(),
                          TopsG(),
                          KiddrG(),
                          JumpsuitG(),
                          CapesG(),
                          JackG(),
                          DenimG(),
                          KidtuG(),
                          KidkG(),
                          KidskG(),
                          KidshG(),
                          KidswG(),
                          TrackB(),
                          KidSG(),
                          AccessG(),

                        ]),
                  ),
                ),
              )
          ),
        ),
      );
    }else{
      return RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length: 15,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,

                    tabs: [
                      Text("New Arrivals", style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Tops", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Dresses", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Jumpsuits", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Coast", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Jackets", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Denim", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Trousers", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Knitwear", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Skirts", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Shorts", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Swimwear", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Tracks", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                      Text("Shoes", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Accessories", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
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
                        children: <Widget>[
                          All(),
                          TopsG(),
                          KiddrG(),
                          JumpsuitG(),
                          CapesG(),
                          JackG(),
                          DenimG(),
                          KidtuG(),
                          KidkG(),
                          KidskG(),
                          KidshG(),
                          KidswG(),
                          TrackB(),
                          KidSG(),
                          AccessG(),

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
