import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
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
import 'package:fashow/SellerDash/Editshop.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';

import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
List <Widget>listOfImages = <Widget>[];

class SellerShop extends StatefulWidget {
  @override
  _SellerShopState createState() => _SellerShopState();
}

class _SellerShopState extends State<SellerShop> {
  df({String productname,var usd,var inr,var cny,var eur,var gbp,String prodId,String ownerId,}){
  return  ListTile(
        title:            Text(productname, style: TextStyle(
            color: kText,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),),
        subtitle:            currentUser.currency == "INR"? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("${cf.format(inr, CurrencyFormatter.inr)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ):
        currentUser.currency == "EUR"?Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("${cf.format(eur, CurrencyFormatter.eur)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ):
        currentUser.currency == "GBP"?Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ):
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("${cf.format(usd, CurrencyFormatter.usd)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),
        ),

        trailing:                   ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation : 0.1,
            primary:  Colors.black, ),
          child: Text('Edit Inventory',style: TextStyle(color: Colors.white),),
          onPressed: ()=> Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditShop(
                prodId: prodId,
                userId: ownerId,
              ),
            ),
          ),
        )

    );

  }

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
            String ownerId = documentSnapshot.data()['ownerId'];

            String prodId = documentSnapshot.data()['prodId'];
            String productname = documentSnapshot.data()['productname'];
             List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];

            var eur = documentSnapshot.data()['eur'];
            var usd =documentSnapshot.data()['usd'];
            var inr =documentSnapshot.data()['inr'];
            var gbp = documentSnapshot.data()['gbp'];
            return Padding(
                padding: const EdgeInsets.all(8.0),
            child:Card(
              child: Column(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () => showProfile(context, profileId: currentUser.id),
                  //   child: ListTile(
                  //     leading: CircleAvatar(
                  //       backgroundImage: CachedNetworkImageProvider(currentUser.photoUrl),
                  //       backgroundColor: Colors.grey,
                  //     ),
                  //     title: Text(
                  //       currentUser.displayName,
                  //       style: TextStyle(
                  //         color: kText,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),

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
                            borderRadius: BorderRadius.circular(20.0),child:CachedImage(shopmediaUrl.first,
                          height: MediaQuery.of(context).size.height/3,
                          width: MediaQuery.of(context).size.width,

                        )),
                      ],),),
                  df(productname:productname, usd:usd,inr:inr, gbp:gbp,eur:eur, prodId:prodId, ownerId:ownerId,),
                ],

              ),
            ));
          },
          query: FirebaseFirestore.instance.collection('products')
              .doc(currentUser.id)
              .collection('userProducts').orderBy('timestamp',descending: true)


      ),
    );

  }
}
