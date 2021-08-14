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
            return new Container( height:490,child:ListView.builder(

                physics:NeverScrollableScrollPhysics(),
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
                    listOfImages.add(GestureDetector(
                      onTap: (){
                        showDialog<void>(
                          context: context,
                          // useRootNavigator:true,

                          barrierDismissible: true,
                          // false = user must tap button, true = tap outside dialog
                          builder: (BuildContext dialogContext) {
                            return
                              Dialog(

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),),
                                child: Container(
                                  height: 400,
                                  child:PhotoView(imageProvider: CachedNetworkImageProvider
                                    (snapshot
                                      .data.docs[index].data()['shopmediaUrl'][i])),),
                              );
                          },
                        );
                      },
                      child: Container(
                        height:490,
                        child: CachedNetworkImage(imageUrl:snapshot
                            .data.docs[index].data()['shopmediaUrl'][i]),
                      ),
                    ));
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                          height:490,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          CarouselSlider(

                              items: listOfImages,
                              options: CarouselOptions(
                                height:500,
                                pauseAutoPlayOnManualNavigate: true,
                                pauseAutoPlayOnTouch: true,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: false,
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
            ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );

        });

}
class SellerShop extends StatefulWidget {
  @override
  _SellerShopState createState() => _SellerShopState();
}

class _SellerShopState extends State<SellerShop> {
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
            trailing:                   RaisedButton(
              color: kblue,
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
            trailing:                   RaisedButton(
              color: kblue,
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
          trailing:                   RaisedButton(
            color: kblue,
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
,

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
            trailing:                   RaisedButton(
              color: kblue,
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
            trailing:                   RaisedButton(
              color: kblue,
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
          query: FirebaseFirestore.instance.collection('products')
              .doc(currentUser.id)
              .collection('userProducts').orderBy('timestamp',descending: true)


      ),
    );

  }
}
