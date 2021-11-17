import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
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

class CapesW extends StatefulWidget {
  final  int selectedPage;

  const CapesW({Key key, this.selectedPage}) : super(key: key);
  @override
  _CapesWState createState() => _CapesWState();
}

class _CapesWState extends State<CapesW> {


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
        JQuery = "J0";
        KQuery = "K0";
        LQuery = "L0";

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
        KQuery = "K50";
        LQuery = "L50";

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
        KQuery = "K100";
        LQuery = "L100";

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


  Single(){
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
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WSingle Breasted Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WSingle Breasted Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WSingle Breasted Coats'),

      ),
    );
  }
  Double(){
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
        key:ValueKey<String>(BQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WDouble Breasted Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WDouble Breasted Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WDouble Breasted Coats'),

      ),
    );
  }
  Duffle(){
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
        key:ValueKey<String>(CQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WDuffle Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WDuffle Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WDuffle Coats'),

      ),
    );
  }
  Padded(){
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
        key:ValueKey<String>(DQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WPadded Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WPadded Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
            .where('Category',isEqualTo: 'WPadded Coats'),

      ),
    );
  }
  WCapes(){
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
        key:ValueKey<String>(EQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WCapes'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WCapes'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WCapes'),

      ),
    );
  }
  WLeather(){
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
        key:ValueKey<String>(FQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WLeather Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WLeather Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WLeather Coats'),

      ),
    );
  }
  WWool(){
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
        key:ValueKey<String>(GQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WWool Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WWool Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WWool Coats'),

      ),
    );
  }
  WCargo(){
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
        key:ValueKey<String>(HQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WCargo & Military Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WCargo & Military Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WCargo & Military Coats'),

      ),
    );
  }
  WFaux(){
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
        key:ValueKey<String>(IQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WFaux  & Shearling Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WFaux  & Shearling Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WFaux  & Shearling Coats'),

      ),
    );
  }
  Parka(){
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
        key:ValueKey<String>(JQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WParka Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WParka Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WParka Coats'),

      ),
    );
  }
  Rain(){
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
        key:ValueKey<String>(KQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WRain Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WRain Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'WRain Coats'),

      ),
    );
  }
  Trench(){
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
        key:ValueKey<String>(LQuery),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];

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
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'Trench Coats'):
        priceQuery == "high"?
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('round',descending: true)
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'Trench Coats'):
        FirebaseFirestore.instance.collectionGroup('userProducts')
            .orderBy('timestamp',descending: true)
            .where('Gender',isEqualTo: 'Women')
             .where('Category',isEqualTo: 'Trench Coats'),

      ),
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

            length:12,
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
                    Text("Single Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Double Breasted Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Duffle Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Padded coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Capes",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Leather Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Wool Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Cargo & Military Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Faux  & Shearling Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Parka coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Rain Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    Text("Trench Coats",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),),
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
                        Single(),
                        Double(),
                        Duffle(),
                        Padded(),
                         WCapes(),
                         WLeather(),

                        WWool(),
                        WCargo(),
                       WFaux(),
                        Parka(),
                        Rain(),
                        Trench(),

                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}