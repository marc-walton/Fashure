import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/invoiceview.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/product_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:uuid/uuid.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fashow/HomePage.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String reviewId = Uuid().v4();
  TextEditingController reviewController = TextEditingController();
  Rating({String fulfill,String ProdId,String OwnerId,parentContext}){
    if(fulfill=='true') {

      return
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            return
              Container(

                child:           Center(
                  child: Column(
                    children:[
                      Text('Please rate the order',style: TextStyle(
                          color: Colors.white),),
                      SmoothStarRating(
                        allowHalfRating: true,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        rating: rating,
                        size: 35,
                        starCount: 5,
                        onRated: (value) {
                          setState(() {
                            rating = value;
                          });
                        },
                      ),
                      TextField(
                        controller: reviewController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                          labelText: 'Review',labelStyle: TextStyle(color: kText),
                          hintText: 'Review',
                        ),
                        textAlign: TextAlign.start,
                      ),
                      RaisedButton(
                        onPressed: (){ FirebaseFirestore.instance.collection('Reviews')
                            .doc(ProdId).collection('prodReviews').doc(reviewId)
                            .set({
                          'userId': OwnerId,
                          'reviewId' : reviewId,
                          'prodId':ProdId,
                          'rating': rating,
                          'review':reviewController.text,
                          "timestamp":timestamp,
                        });
                        FirebaseFirestore.instance.collection('feed')
                            .doc(ProdId)
                            .collection('feedItems')
                            .doc(reviewId)
                            .set({
                          "type": "ReviewO",
                          "username": currentUser.displayName,
                          "userId": OwnerId,
                          "userProfileImg": currentUser.photoUrl,
                          "postId": ProdId,
                          // "mediaUrl": mediaUrl,
                          "timestamp": timestamp,
                          "read": 'false',
                          'message':'Your order received a review!',
                        });
                        Get.back();},
                        color: kblue,
                      child: Text('Save',style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),

              );

          }
      );


    }
    else{return
      Text('');}
  }

  var rating = 0.0;
  shopOrders(){
return PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
    itemBuilderType:
    PaginateBuilderType.listView,
    itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
      String ownerId = documentSnapshot.data()['ownerId'];
      String prodId = documentSnapshot.data()['prodId'];
      String orderStatus = documentSnapshot.data()['orderStatus'];
      String size = documentSnapshot.data()['size'];
      String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
      String orderId = documentSnapshot.data()['orderId'];
       String fulfilled = documentSnapshot.data()['fulfilled'];

      String productname = documentSnapshot.data()['productname'];
 String Address = documentSnapshot.data()['Address'];
String courierId = documentSnapshot.data()['courierId'];
String courier = documentSnapshot.data()['courier'];

      if (!documentSnapshot.exists) {
        return  Center(child: Text('No Orders',
          style: TextStyle(
              fontFamily :"MajorMonoDisplay",
              fontSize:  35.0 ,
              color: Colors.white),
        )
        );
      }
      else{    return

        Column(
          children: [
            ListTile(
              leading:GestureDetector(onTap:   ()=>  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      prodId: prodId,
                      userId: ownerId,
                    ),)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(child: Image.network(shopmediaUrl),)),
              ),
              title: GestureDetector(onTap:   ()=>  Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ProductScreen(
              prodId: prodId,
              userId: ownerId,
              ),)),
              child: Text(productname)),
              subtitle: Text(orderStatus),
              trailing: Text(size),
            ),
            SizedBox(height:10.0),

            ListTile(
              title: Text('Address:  $Address'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shipment company: $courierId'),
                  SizedBox(height:10.0),

                  Text('Tracking Id: $courier'),
                  SizedBox(height:10.0),

                  Text('Order Id: $orderId'),
                  SizedBox(height:10.0),

                  fulfilled=='true'?
RaisedButton(
  onPressed:()

   {Rating(fulfill:fulfilled,parentContext: context,OwnerId: ownerId,ProdId: prodId);},color:kblue,child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
                      Container(),
                ],
              ),
            ),

          ],
        );}



    },
    query:  FirebaseFirestore.instance.collection('ordersCustomer')
        .doc(currentUser.id)
        .collection('userOrder')
        .orderBy('timestamp',descending: true)


);


  }
  jobOrders(){
  return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {

          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String orderStatus = documentSnapshot.data()['orderStatus'];
          String size = documentSnapshot.data()['size'];
          String Address = documentSnapshot.data()['Address'];
          String orderId = documentSnapshot.data()['orderId'];
           // String wnerId = documentSnapshot.data()['ownerId'];

          String fulfilled = documentSnapshot.data()['fulfilled'];
String advance = documentSnapshot.data()['advance'];
String finall = documentSnapshot.data()['final'];
String title = documentSnapshot.data()['title'];
          if (!documentSnapshot.exists) {
            return  Center(child: Text('No Orders',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  fontSize:  35.0 ,
                  color: Colors.white),
            )
            );
          }else{
return  Column(
  children: [
    GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InvoiceView(orderId:orderId,ownerId: ownerId,)));
        },
      child: ListTile(
        // leading:CachedNetworkImage(imageUrl: ds['shopmediUrl'],),
        title: Text(title),
        subtitle: Text(orderStatus),
      ),
    )
  ],
);}


        },
        query:   FirebaseFirestore.instance.collection('serviceCustomer')
        .doc(currentUser.id)
        .collection('customerService')
            .orderBy('timestamp',descending: true)


    );


  }
  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar:  AppBar(backgroundColor: kPrimaryColor,
        title: Text('My Orders',
          style: TextStyle(
              fontFamily :"MajorMonoDisplay",
              fontSize:  35.0 ,
              color: Colors.white),),
        iconTheme: new IconThemeData(color: kIcon),
      ),
      backgroundColor: kPrimaryColor,

      body:
      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: ContainedTabBarView(
          tabs: [
            Text('Shop',style:TextStyle(color:kText)),
            Text('Services',style:TextStyle(color:kText)),
          ],
          views: [
            shopOrders(),
            jobOrders(),
          ],

          // child: Column(
          //   children: <Widget>[shopOrders(),
          //   ],
          // ),
        ),
      ),
);
  }
}
