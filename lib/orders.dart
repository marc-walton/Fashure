import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
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
  Rating({String fulfill,String ProdId,String OwnerId,String mediaUrl,parentContext}){
    if(fulfill=='true') {

      return
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            String reviewId = Uuid().v4();

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
                      ElevatedButton(
                        onPressed: (){ FirebaseFirestore.instance.collection('Reviews')
                            .doc(ProdId).collection('prodReviews').doc(reviewId)
                            .set({
                          'userId': OwnerId,
                          'reviewId' : reviewId,
                          'prodId':ProdId,
                          'rating': rating,
                          'review':reviewController.text,
                          "reviewerId":currentUser.id,
                          "reviewerName":currentUser.username,
                          "reviewerImg":currentUser.photoUrl,

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
                         "mediaUrl": mediaUrl,
                          "timestamp": timestamp,
                          "read": 'false',
                          'message':'Your order received a review!',
                        });
                        rating = 0.0;
                        Get.back();},
                        style: ElevatedButton.styleFrom(
                          elevation : 0.001,
                          primary: Colors.grey.withOpacity(0.3), ),
                      child: Text('Post',style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),

              );

          }
      );


    }
    else{return
      Container();}
  }
 resaleRating({String fulfill,String ProdId,String OwnerId,String mediaUrl,parentContext}){

    if(fulfill=='true') {

      return
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            String reviewId = Uuid().v4();

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
                      ElevatedButton(
                        onPressed: (){ FirebaseFirestore.instance.collection('ResaleReviews')
                            .doc(OwnerId).collection('resaleReviews').doc(reviewId)
                            .set({
                          'userId': OwnerId,
                          'reviewId' : reviewId,
                          'prodId':ProdId,
                          'rating': rating,
                          'review':reviewController.text,
                          "reviewerId":currentUser.id,
                           "reviewerName":currentUser.username,
                           "reviewerImg":currentUser.photoUrl,

                          "timestamp":timestamp,
                          "image":mediaUrl,
                        });
                        FirebaseFirestore.instance.collection('feed')
                            .doc(ProdId)
                            .collection('feedItems')
                            .doc(reviewId)
                            .set({
                          "type": "resaleReview",
                          "username": currentUser.displayName,
                          "userId": OwnerId,
                          "userProfileImg": currentUser.photoUrl,
                          "postId": ProdId,
                          "mediaUrl": mediaUrl,
                          "timestamp": timestamp,
                          "read": 'false',
                          'message':'Your order received a review!',
                        });
                        rating = 0.0;
                        Get.back();},
                        style: ElevatedButton.styleFrom(
                          elevation : 0.001,
                          primary: Colors.grey.withOpacity(0.3), ),
                      child: Text('Post',style: TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),

              );

          }
      );


    }
    else{return
     Container();}
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
      var eur = documentSnapshot.data()['eur'];
      var usd =documentSnapshot.data()['usd'];
      var inr =documentSnapshot.data()['inr'];
      var gbp = documentSnapshot.data()['gbp'];
      String Address = documentSnapshot.data()['Address'];
      String mtoText = documentSnapshot.data()['mtoText'];
      String color = documentSnapshot.data()['color'];
      String variation = documentSnapshot.data()['variation'];
      String courierId = documentSnapshot.data()['courierId'];
String courier = documentSnapshot.data()['courier'];
      var shipcostuser = documentSnapshot.data()['shipcostuser'];
      var customprice = documentSnapshot.data()['customprice'];
 bool resale = documentSnapshot.data()['resale'];
var total = currentUser.currency == "INR"?inr + shipcostuser +customprice:
currentUser.currency == "EUR"?eur + shipcostuser +customprice:
currentUser.currency == "GBP"?gbp + shipcostuser +customprice:
usd + shipcostuser +customprice;
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

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading:GestureDetector(onTap:   ()=>  resale?Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResaleScreen(
                          postId: prodId,
                          userId: ownerId,
                        ),)):Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.1),
                        child: Container(child:  CachedImage(shopmediaUrl,width: 60,))),
                  ),
                  title: GestureDetector(onTap:   ()=> resale?Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResaleScreen(
                          postId: prodId,
                          userId: ownerId,
                        ),)):Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: prodId,
                          userId: ownerId,
                        ),)),
                  child:   RichText(
      maxLines: 1,softWrap:false,overflow:TextOverflow.fade,
      text: TextSpan(
      style:TextStyle(
      color:kText,
      fontSize: 20.0,
      fontWeight: FontWeight.bold),
      children: [
      TextSpan(
      text: productname,
      style: TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black),
      ),

      ]),
      ),
      ),
                  subtitle: Text(orderStatus),
                  // trailing: ,
                ),
                SizedBox(height:10.0),

                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Order Id: $orderId'),
      SizedBox(height:10.0),
      Text('Shipment company: $courierId'),
                      SizedBox(height:10.0),
      Text('Tracking Id: $courier'),
                      SizedBox(height:10.0),
                      Text(size),
      SizedBox(height:10.0),
                      Text('Address:  $Address'),
          SizedBox(height:10.0),
                      customprice == 0? Container():Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        currentUser.currency == "INR"? Row(
                          children: [
                            Text('variation:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text(" $variation -${cf.format(customprice, CurrencyFormatter.inr)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "EUR"?Row(
                          children: [
                            Text('variation:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text(" $variation -${cf.format(customprice, CurrencyFormatter.eur)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "GBP"?Row(
                          children: [
                            Text('variation:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text(" $variation -${cf.format(customprice, CurrencyFormatter.gbp)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        Row(
                          children: [
                            Text('variation:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text(" $variation -${cf.format(customprice, CurrencyFormatter.usd)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height:10.0),

                      shipcostuser == 0? Container():Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        currentUser.currency == "INR"? Row(
                          children: [
                            Text('shipping:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(shipcostuser, CurrencyFormatter.inr)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "EUR"?Row(
                          children: [
                            Text('shipping:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(shipcostuser, CurrencyFormatter.eur)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "GBP"?Row(
                          children: [
                            Text('shipping:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(shipcostuser, CurrencyFormatter.gbp)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        Row(
                          children: [
                            Text('shipping:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(shipcostuser, CurrencyFormatter.usd)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height:10.0),

                      total == 0? Container():Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        currentUser.currency == "INR"? Row(
                          children: [
                            Text('total:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(total, CurrencyFormatter.inr)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "EUR"?Row(
                          children: [
                            Text('total:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(total, CurrencyFormatter.eur)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "GBP"?Row(
                          children: [
                            Text('total:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(total, CurrencyFormatter.gbp)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        Row(
                          children: [
                            Text('total:',
                              style: TextStyle(color: kText),),Spacer(),
                            Text("${cf.format(total, CurrencyFormatter.usd)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),
                      ),

                      fulfilled=='true'?
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation : 0.1,
    primary:  Colors.black, ),
  onPressed:()

   {
    resale?  resaleRating(fulfill:fulfilled,mediaUrl:shopmediaUrl,parentContext: context,OwnerId: ownerId,ProdId: prodId):
     Rating(fulfill:fulfilled,mediaUrl:shopmediaUrl,parentContext: context,OwnerId: ownerId,ProdId: prodId);},child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
                          Container(),
                    ],
                  ),
                ),

              ],
            ),
          ),
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
return  Padding(
  padding: const EdgeInsets.all(8.0),
  child:   GestureDetector(
    onTap: () {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InvoiceView(orderId:orderId,ownerId: ownerId,)));
    },
    child: Card(
      child: Column(
        children: [
          ListTile(
            // leading:CachedNetworkImage(imageUrl: ds['shopmediUrl'],),
            title: Text(title),
            subtitle: Text(orderStatus),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation : 0.1,
              primary:  Colors.black, ),
            onPressed:()

            {     Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InvoiceView(orderId:orderId,ownerId: ownerId,)));},
            child: Text('More',style:TextStyle(color: Colors.white)),)
        ],
      ),
    ),
  ),
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
      Container(color:Cont,
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
