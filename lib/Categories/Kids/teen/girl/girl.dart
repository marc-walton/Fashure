import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/Categories/Kids/teen//girl/Accessories.dart';
import 'package:fashow/Categories/Kids/teen/girl/Capes.dart';
import 'package:fashow/Categories/Kids/teen/girl/Denim.dart';
import 'package:fashow/Categories/Kids/teen/girl/Dresses.dart';
import 'package:fashow/Categories/Kids/teen/girl/jacket.dart';
import 'package:fashow/Categories/Kids/teen/girl/jumpsuit.dart';
import 'package:fashow/Categories/Kids/teen/girl/KNITWEAR.dart';
import 'package:fashow/Categories/Kids/teen/girl/Shoes.dart';
import 'package:fashow/Categories/Kids/teen/girl/skirts.dart';
import 'package:fashow/Categories/Kids/teen/girl/shorts.dart';
import 'package:fashow/Categories/Kids/teen/girl/Swimwear.dart';
import 'package:fashow/Categories/Kids/teen/girl/Tops.dart';
import 'package:fashow/Categories/Kids/teen/girl/TRACKS.dart';
import 'package:fashow/Categories/Kids/teen/girl/Trousers.dart';
import 'package:fashow/Categories/Kids/teen/girl/ETHNIC.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:get/get.dart';
import 'package:fashow/Products.dart';

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
            return new ListView.builder(physics: NeverScrollableScrollPhysics(),
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
                          margin: EdgeInsets.all(1.0),

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
                                pauseAutoPlayOnManualNavigate: true,
                                pauseAutoPlayOnTouch: true,
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

class CItem extends StatefulWidget {
  final Prod prod;
  String products;
  CItem(this.prod);
  @override
  _CItemState createState() => _CItemState(this.prod);
}

class _CItemState extends State<CItem> {
  final Prod prod;
  String products;
  int client;
  String price;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _CItemState(this.prod);
  @override
  void initState() {
    super.initState();

    conversion();
  }
  conversion()async{
    var resultUSD1 = await Currency.getConversion(
        from: 'USD', to: '${currentUser.currencyISO}', amount: prod.usd  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          margin:
          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[


              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                title:            Text(prod.productname, style: TextStyle(
                    color: kText,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold),),
                subtitle:      currentUser.country == prod.country?
                Text( "${currentUser.currencysym} ${prod.inr}",style: TextStyle(color: kText,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.bold)) :       Text( "${currentUser.currencysym} $price",style: TextStyle(color: kText,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.bold)),

              ),


              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),

      ],
    );
  }
}
class TeenGirl extends StatefulWidget {
  @override
  _TeenGirlState createState() => _TeenGirlState();
}

class _TeenGirlState extends State<TeenGirl> {
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
  String productname = documentSnapshot.data()['productname'];
          String inr = documentSnapshot.data()['inr'];
          String usd = documentSnapshot.data()['usd'];
     
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
                    df(productname:productname, usd:usd,inr:inr, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')

    );
  }  All(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
  String productname = documentSnapshot.data()['productname'];
          String inr = documentSnapshot.data()['inr'];
          String usd = documentSnapshot.data()['usd'];
     
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
                    df(productname:productname, usd:usd,inr:inr, prodId:prodId, ownerId:ownerId,),

                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query: FirebaseFirestore.instance.collectionGroup('userProducts').orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Teen-Girls')
            .where('indian', isEqualTo:false)

    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (currentUser.country == 'India'){
    return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:16,
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
                    Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Indian Ethnic",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Jumpsuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Skirts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Tracks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                  ],
                ),
              ),

              body: Container(     decoration: BoxDecoration(
                  gradient: fabGradient
              ) ,
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        Allin(),
                        TGEthnic(),
                        TopsTG(),
                        KiddrGT(),
                        JumpsuitGT(),
                        CapesGT(),
                        JackGT(),
                        DenimGT(),
                        KidtuGT(),
                        KidkGT(),
                        KidskGT(),
                        KidshGT(),
                        KidswGT(),
                        TrackBG(),
                        KidSGT(),
                        AccessGT(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );
    }
    else{ return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length:15,
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
                    Text("New Arrivals",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Tops",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Dresses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Jumpsuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Jackets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Denim",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Trousers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Knitwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Skirts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shorts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Swimwear",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Tracks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    Text("Shoes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Accessories",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                  ],
                ),
              ),

              body: Container(     decoration: BoxDecoration(
                  gradient: fabGradient
              ) ,
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        All(),
                        TopsTG(),
                        KiddrGT(),
                        JumpsuitGT(),
                        CapesGT(),
                        JackGT(),
                        DenimGT(),
                        KidtuGT(),
                        KidkGT(),
                        KidskGT(),
                        KidshGT(),
                        KidswGT(),
                        TrackBG(),
                        KidSGT(),
                        AccessGT(),

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
