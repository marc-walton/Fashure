import 'package:flutter/material.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';

import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
class BabysB extends StatefulWidget {
  final  int selectedPage;

  const BabysB({Key key, this.selectedPage}) : super(key: key);
  @override
  _BabysBState createState() => _BabysBState();
}

class _BabysBState extends State<BabysB> {

  void initState() {
    super.initState();
    priceQuery = "";
    sizeFilter = "";
  }


  BBRompers(){
    return  PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(AQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
      String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
        bool _isLiked = likes[currentUser.id] == true;
bool isLiked;
        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              FutureBuilder(
              future: usersRef.doc(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
                return
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          user.username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  );

              },
            ),
GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResaleScreen(
                          postId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                        
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
                    color: kText,
                  ),),
                  
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0S$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "highS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBRompers'),

    );
  }
  BBShorties(){
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(BQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
      String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
        bool _isLiked = likes[currentUser.id] == true;
bool isLiked;
        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              FutureBuilder(
              future: usersRef.doc(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
                return
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          user.username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  );

              },
            ),
GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResaleScreen(
                          postId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                        
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
                    color: kText,
                  ),),
                  
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0S$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "highS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBShorties'),

    );
  }
  BBPyjamas(){
    return   PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(CQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
      String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
        bool _isLiked = likes[currentUser.id] == true;
bool isLiked;
        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              FutureBuilder(
              future: usersRef.doc(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
                return
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          user.username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  );

              },
            ),
GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResaleScreen(
                          postId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                        
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
                    color: kText,
                  ),),
                  
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0S$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "highS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBPyjamas'),

    );
  }
  BBSnowsuits(){
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("Nothing found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(DQuery),
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)   {
      String ownerId = documentSnapshot.data()['ownerId'];
        String username = documentSnapshot.data()['username'];
        String productname = documentSnapshot.data()['title'];
        String size = documentSnapshot.data()['size'];
        Map likes =  documentSnapshot.data()['likes'];
        var eur = documentSnapshot.data()['eur'];
        var usd = documentSnapshot.data()['usd'];
        var inr = documentSnapshot.data()['eur'];
        var gbp = documentSnapshot.data()['usd'];

        String photoUrl = documentSnapshot.data()['photoUrl'];
        String prodId = documentSnapshot.data()['resaleId'];
        List shopmediaUrl = documentSnapshot.data()['images'];
        bool _isLiked = likes[currentUser.id] == true;
bool isLiked;
        return
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              FutureBuilder(
              future: usersRef.doc(ownerId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
                return
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: ownerId),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 7.0,),
                        Text(
                          user.username,
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                  );

              },
            ),
GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResaleScreen(
                          postId: prodId,
                          userId: ownerId,
                        ),
                      ),
                    ),
                    child: CachedImage(shopmediaUrl.first,height: MediaQuery
                        .of(context)
                        .size
                        .height/3,width: MediaQuery
                        .of(context)
                        .size
                        .width,),),
                  SizedBox(height: 7.0,),

                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                        color: kText,
                      ),),
                        
                    ],
                  ),
                  SizedBox(height: 7.0,),

                  Text("size:$size", style: TextStyle(
                    color: kText,
                  ),),
                  
                  SizedBox(height: 7.0,),

                  currentUser.currency == "INR"?  Text( "${cf.format(inr, CurrencyFormatter.inr)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",style:TextStyle(fontWeight:FontWeight.bold) ):
                  Text(
                      "${cf.format(usd, CurrencyFormatter.usd)}",style:TextStyle(fontWeight:FontWeight.bold))


                ],

              ),
            ),


          );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits'):
      priceQuery == "high"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          :priceQuery == "0D"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "0S$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "highD"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      priceQuery == "highS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "0DS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "lowDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: false)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1)
          :priceQuery == "highDS$sizeFilter"?
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('round',descending: true)
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits')

          .where('country',isEqualTo: '${currentUser.country}')
          .where('$sizeFilter',isGreaterThanOrEqualTo: 1):
      FirebaseFirestore.instance.collectionGroup('userResale')
          .orderBy('timestamp',descending: true)
          .where('Gender',isEqualTo: 'Baby-Boys')
          .where('Category',isEqualTo: 'BBSnowsuits'),

    );
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  RotatedBox(
      quarterTurns: 1,
      child: Expanded(
        child: DefaultTabController(
            initialIndex:widget.selectedPage ?? 0,

            length:4,
            child: Scaffold(

              appBar:tabs? AppBar(
                toolbarHeight: SizeConfig.screenWidth * 0.3,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom:  PreferredSize(
                  preferredSize: Size.fromHeight(100.0),

                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 30,
                    child: TabBar(

                      isScrollable: true,

                      ///filled
                      labelStyle:TextStyle(fontFamily: "AlteroDCURegular",color: Colors.white ),
                      ///outline
                      unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU",color: Colors.white  ),
                      tabs:[
                      RotatedBox(quarterTurns:3,child: Text("Rompers",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Shorties",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Pyjamas",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      RotatedBox(quarterTurns:3,child: Text("Snowsuits",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.4,))),
                      ],
                    ),
                  ),
                ),
              ):null,

              body: Container( 
                child: RotatedBox(
                  quarterTurns: 3,
                  child: TabBarView(
                      children:<Widget> [
                        BBRompers(),
                        BBShorties(),
                        BBPyjamas(),
                        BBSnowsuits(),
                      ]),
                ),
              ),
            )
        ),
      ),
    );
  }
}
