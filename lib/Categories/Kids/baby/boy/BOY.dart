import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
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
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';
import 'package:translated_text/translated_text.dart';

class BabyBoy extends StatefulWidget {
  @override
  _BabyBoyState createState() => _BabyBoyState();
}

class _BabyBoyState extends State<BabyBoy> {
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
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
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
                              borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                        ],),),
                    df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Baby-Boys'),
      isLive: true,

    );
  }
   All(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
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
                              borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                        ],),),
                    df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query:  FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Baby-Boys')
            .where('indian', isEqualTo:false),
      isLive: true,

    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(currentUser.country=='India'){
      return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:12,
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
                    TranslatedText("New Arrivals",to:'${currentUser.language}',
                    textStyle: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                    ),),
                    TranslatedText("Indian Ethnic",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Babysuits",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Coast & Jackets",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Knitwear",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Shorts",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Swimwear",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Tops",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Tracksuits",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Trousers",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Shoes",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
                    TranslatedText("Accessories",to:'${currentUser.language}',
                      textStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                      ),),
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
                      children:<Widget> [
                        Allin(),
                        BBEthnic(),
                        BabysB(),
                        BabyCB(),
                        BabykB(),
                        BabyshB(),
                        BabyswB(),
                        BabytB(),
                        BabytrB(),
                        BabytuB(),
                        BabySB(),
                        BabyAcB(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );

    }else{
      return  RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length:11,
              child: Scaffold(

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
                      Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Babysuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Coast & Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Tracksuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
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
                          BabysB(),
                          BabyCB(),
                          BabykB(),
                          BabyshB(),
                          BabyswB(),
                          BabytB(),
                          BabytrB(),
                          BabytuB(),
                          BabySB(),
                          BabyAcB(),

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
