import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/Categories/Men/hats.dart';
import 'package:fashow/Categories/Men/braces.dart';
import 'package:fashow/Categories/Men/ties.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/Product_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:get/get.dart';
import 'package:fashow/ProductS.dart';

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
                subtitle:            Text( "${currentUser.currencysym} $price",style: TextStyle(color: kText,
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
class Accessories extends StatefulWidget {
  final  int selectedPage;

  const Accessories({Key key, this.selectedPage}) : super(key: key);

  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
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
  String priceQuery = "0";
  String AQuery = "A0";
  String BQuery = "B0";
  String CQuery = "C0";
  String DQuery = "D0";
  String EQuery = "E0";
  String FQuery = "F0";
  String GQuery = "G0";
  String HQuery = "H0";
  String IQuery = "I0";
  String JQuery = "art0";
  all() {
    return InkWell(
      onTap: () {
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
        JQuery = "art0";

        setState(() {});

        Get.back();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  'All',
                )),
          ],
        ),
      ),
    );
  }
  low() {
    return InkWell(
      onTap: () {
        priceQuery = "low";
        AQuery = "A50";
        BQuery = "B50";
        CQuery = "C50";
        DQuery = "D50";
        EQuery = "D50";
        FQuery = "E50";
        GQuery = "E50";
        HQuery = "E50";
        IQuery = "E50";
        JQuery = "E50";

        setState(() {});

        Get.back();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  'Low to high',
                )),
          ],
        ),
      ),
    );
  }
  high() {
    return InkWell(
      onTap: () {
        priceQuery = "high";
        AQuery = "A50-100";
        BQuery = "B50-100";
        CQuery = "C50-100";
        DQuery = "D50-100";
        EQuery = "D50-100";
        FQuery = "E50-100";
        GQuery = "E50-100";
        HQuery = "E50-100";
        IQuery = "E50-100";
        JQuery = "E50-100";

        setState(() {});

        Get.back();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  'High to low',
                )),
          ],
        ),
      ),
    );
  }


  Scarves(){
    return  StickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: ListTile(
            trailing: FloatingActionButton(child: Icon(Icons.filter_alt_outlined),
              onPressed: (){        showDialog<void>(
                context: context,
                // useRootNavigator:true,

                barrierDismissible: true,
                // false = user must tap button, true = tap outside dialog
                builder: (BuildContext dialogContext) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height:400,
                      child: ExpansionTile(
                          title: Text(""),
                          children: [Column(
                            children: [
                              all(),
                              low(),
                              high(),

                            ],
                          ),
                          ]
                      ),
                    ),
                  );
                },
              );},
            )
        ),
      ),
      content: PaginateFirestore(
          emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),)),
          key:ValueKey<String>(AQuery),
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
            String ownerId = documentSnapshot.data()['ownerId'];
            String prodId = documentSnapshot.data()['prodId'];
//String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
            String productname = documentSnapshot.data()['productname'];
            String inr = documentSnapshot.data()['inr'];
            String usd = documentSnapshot.data()['usd'];

            return
              FutureBuilder(
                future: usersRef.doc(ownerId).get(),
                builder: (context, snapshot) {
                  List<CItem> searchResults = [];

                  Prod prod = Prod.fromDocument(documentSnapshot);
                  CItem searchResult = CItem(prod);
                  searchResults.add(searchResult);

                  if (!snapshot.hasData) {
                    return circularProgress();
                  }
                  Users user = Users.fromDocument(snapshot.data);
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => showProfile(context, profileId: user.id),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children:[
                            CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: 7.0,),
                            Text(
                              user.displayName,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
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
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: pics(userid:ownerId,prodid: prodId)),),

                      Column(

                        children: searchResults,

                      ),              Divider(color: kGrey,),
                    ],

                  );

                },
              );
          },
          query: priceQuery == "low"?
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('round',descending: false)
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Scarves'):
          priceQuery == "high"?
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('round',descending: true)
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men') 
              .where('Category',isEqualTo: 'Scarves'):
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Scarves'),




        //  FirebaseFirestore.instance.collectionGroup('userProducts')
        //     .orderBy('timestamp',descending: true)

        //    .where('Gender',isEqualTo: 'Men')
//.where('indian', isEqualTo:false)
      ),
    );
  }
  Belts(){
    return  StickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: ListTile(
            trailing: FloatingActionButton(child: Icon(Icons.filter_alt_outlined),
              onPressed: (){        showDialog<void>(
                context: context,
                // useRootNavigator:true,

                barrierDismissible: true,
                // false = user must tap button, true = tap outside dialog
                builder: (BuildContext dialogContext) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height:400,
                      child: ExpansionTile(
                          title: Text(""),
                          children: [Column(
                            children: [
                              all(),
                              low(),
                              high(),

                            ],
                          ),
                          ]
                      ),
                    ),
                  );
                },
              );},
            )
        ),
      ),
      content: PaginateFirestore(
          emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),)),
          key:ValueKey<String>(AQuery),
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
            String ownerId = documentSnapshot.data()['ownerId'];
            String prodId = documentSnapshot.data()['prodId'];
//String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
            String productname = documentSnapshot.data()['productname'];
            String inr = documentSnapshot.data()['inr'];
            String usd = documentSnapshot.data()['usd'];

            return
              FutureBuilder(
                future: usersRef.doc(ownerId).get(),
                builder: (context, snapshot) {
                  List<CItem> searchResults = [];

                  Prod prod = Prod.fromDocument(documentSnapshot);
                  CItem searchResult = CItem(prod);
                  searchResults.add(searchResult);

                  if (!snapshot.hasData) {
                    return circularProgress();
                  }
                  Users user = Users.fromDocument(snapshot.data);
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => showProfile(context, profileId: user.id),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children:[
                            CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: 7.0,),
                            Text(
                              user.displayName,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
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
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: pics(userid:ownerId,prodid: prodId)),),

                      Column(

                        children: searchResults,

                      ),              Divider(color: kGrey,),
                    ],

                  );

                },
              );
          },
          query: priceQuery == "low"?
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('round',descending: false)
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Belts'):
          priceQuery == "high"?
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('round',descending: true)
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men') 
              .where('Category',isEqualTo: 'Belts'):
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Belts'),




        //  FirebaseFirestore.instance.collectionGroup('userProducts')
        //     .orderBy('timestamp',descending: true)

        //    .where('Gender',isEqualTo: 'Men')
//.where('indian', isEqualTo:false)
      ),
    );
  }
  Glasses(){
    return  StickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: ListTile(
            trailing: FloatingActionButton(child: Icon(Icons.filter_alt_outlined),
              onPressed: (){        showDialog<void>(
                context: context,
                // useRootNavigator:true,

                barrierDismissible: true,
                // false = user must tap button, true = tap outside dialog
                builder: (BuildContext dialogContext) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height:400,
                      child: ExpansionTile(
                          title: Text(""),
                          children: [Column(
                            children: [
                              all(),
                              low(),
                              high(),

                            ],
                          ),
                          ]
                      ),
                    ),
                  );
                },
              );},
            )
        ),
      ),
      content: PaginateFirestore(
          emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),)),
          key:ValueKey<String>(AQuery),
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
            String ownerId = documentSnapshot.data()['ownerId'];
            String prodId = documentSnapshot.data()['prodId'];
//String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
            String productname = documentSnapshot.data()['productname'];
            String inr = documentSnapshot.data()['inr'];
            String usd = documentSnapshot.data()['usd'];

            return
              FutureBuilder(
                future: usersRef.doc(ownerId).get(),
                builder: (context, snapshot) {
                  List<CItem> searchResults = [];

                  Prod prod = Prod.fromDocument(documentSnapshot);
                  CItem searchResult = CItem(prod);
                  searchResults.add(searchResult);

                  if (!snapshot.hasData) {
                    return circularProgress();
                  }
                  Users user = Users.fromDocument(snapshot.data);
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => showProfile(context, profileId: user.id),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children:[
                            CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: 7.0,),
                            Text(
                              user.displayName,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
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
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),child: pics(userid:ownerId,prodid: prodId)),),

                      Column(

                        children: searchResults,

                      ),              Divider(color: kGrey,),
                    ],

                  );

                },
              );
          },
          query: priceQuery == "low"?
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('round',descending: false)
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Glasses & Frames'):
          priceQuery == "high"?
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('round',descending: true)
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Glasses & Frames'):
          FirebaseFirestore.instance.collectionGroup('userProducts')
              .orderBy('timestamp',descending: true)
              .where('Gender',isEqualTo: 'Men')
              .where('Category',isEqualTo: 'Glasses & Frames'),




        //  FirebaseFirestore.instance.collectionGroup('userProducts')
        //     .orderBy('timestamp',descending: true)

        //    .where('Gender',isEqualTo: 'Men')
//.where('indian', isEqualTo:false)
      ),
    );
  }

  Sunglasses(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Sunglasses'),


    );
  }
  Gloves(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Gloves'),


    );
  }
  Socks(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Socks'),


    );
  }
  PocketSquare(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'PocketSquare'),


    );
  }
  Wallets(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Wallets'),


    );
  }
  Umbrellas(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Umbrellas & Travel'),


    );
  }
  Phone(){
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
          .where('Gender',isEqualTo: 'Men')
          .where('Category',isEqualTo: 'Phone'),


    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            initialIndex:widget.selectedPage ?? 0,
            length:13,
            child: Scaffold(
              appBar:AppBar(
                toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom: TabBar(

                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,

                  tabs:[
                    Text("Hats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Scarves",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Belts",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Braces & Suspenders",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Ties & Bow Ties",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Glasses & Frames",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Sunglasses",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Gloves",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Socks",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                     Text("Pocket Square & Handkerchiefs",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                     Text("Wallets",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Umbrellas & Travel",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Phone cases",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                  ],
                ),
              ),

              body: Container(

              decoration: BoxDecoration(
    gradient: fabGradient
    ),
    alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children:<Widget> [
                        Hats(),
                        Scarves(),
                        Belts(),
                        Braces(),
                        Ties(),
                        Glasses(),
                        Sunglasses(),
                        Gloves(),
                        Socks(),
                        PocketSquare(),
                        Wallets(),
                        Umbrellas(),
                        Phone(),


                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }

}
