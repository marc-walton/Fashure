import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:fashow/Shipping/shipEngine/ship_engine.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerOrders extends StatefulWidget {
  @override
  _SellerOrdersState createState() => _SellerOrdersState();
}

class _SellerOrdersState extends State<SellerOrders> {
String fulfill = 's';
  UpcomingOrders(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String fulfilled = documentSnapshot.data()['fulfilled'];
          String Accepted = documentSnapshot.data()['Accepted'];
            String size = documentSnapshot.data()['size'];
             String cusName = documentSnapshot.data()['cusName'];
             String address = documentSnapshot.data()['address'];
             String city = documentSnapshot.data()['city'];
             String state = documentSnapshot.data()['state'];
             String zip = documentSnapshot.data()['zip'];
             String code = documentSnapshot.data()['code'];
             String type = documentSnapshot.data()['type'];
              String phone = documentSnapshot.data()['phone'];
              String country_code = documentSnapshot.data()['country_code'];
              String country = documentSnapshot.data()['country'];
String email = documentSnapshot.data()['email'];

bool shipmentCreated = documentSnapshot.data()['shipmentCreated'];
          String label = documentSnapshot.data()['label'];
 String labelId = documentSnapshot.data()['labelId'];
 String TrackingNo = documentSnapshot.data()['TrackingNo'];
 String invoice = documentSnapshot.data()['invoice'];



          String orderId = documentSnapshot.data()['orderId'];
List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
String cusId = documentSnapshot.data()['cusId'];
String productname = documentSnapshot.data()['productname'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => showProfile(context, profileId: currentUser.id),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(currentUser.photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      currentUser.displayName,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                    key: ValueKey<String>(fulfill),
                    future: productsRef.doc(ownerId).collection('userProducts').doc(prodId).get(),
                    builder: (context, snapshot){
                      DocumentSnapshot ds = snapshot.data;
                      String usd= ds['usd'];
                      String inr= ds['inr'];
                      int price = int.tryParse(inr);
                       int depth= ds['depth'];
                       int height= ds['height'];
                      int width= ds['width'];
                     String boxType= ds['boxType'];
                      int weight= ds['weight'];
                        bool returns= ds['returns'];
                      int hs= ds['hs'];

                      if(snapshot.data != null||snapshot.hasData){
                        return
                          Column(
                            children: [
                              ListTile(


                                leading: GestureDetector(
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
                                      borderRadius: BorderRadius.circular(20.0),child: Container(child: cachedNetworkImage(shopmediaUrl.first))),),
                                subtitle:  Text( "${currentUser.currencysym} $inr",style: TextStyle(color: kText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                                title:Text(productname, style: TextStyle(
                                    color:kText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),),


                              ),

                              Row(
                                children: [
                                  Text('Size:  $type',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              SizedBox(height:10.0),
                              Row(
                                children: [
                                  Text('Address: $cusName',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('$address',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(' $city',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('$state',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(' $zip',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('$code$phone',
                                    style: TextStyle(color: kText),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('$country',
                                    style: TextStyle(color: kText),),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Accepted=='false'?   Center(child: ElevatedButton(
                                    onPressed:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>submit(orderId:orderId ,ownerId: ownerId,shopmediaUrl:shopmediaUrl.first,prodId:prodId,cusId:cusId)));},
                                    child:  Text('Accept order',
                                      style: TextStyle(color: Colors.white),),)):Container(),
                                  fulfilled=='false'?   Center(child: ElevatedButton(
                                    onPressed:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>OrderFulfill(orderId:orderId ,ownerId: ownerId,shopmediaUrl:shopmediaUrl.first,prodId:prodId,cusId:cusId)));},
                                    child:  Text('Fulfill order',
                                      style: TextStyle(color: Colors.white),),)):Container(),

                                ],
                              ),

                            ],
                          );}
                      else {return Center(child: CircularProgressIndicator(),);}

                    }),

                Divider(color: kGrey,),
              ],

            ),
          );
        },
        query:  FirebaseFirestore.instance.collection('ordersSeller')
      .doc(currentUser.id)
      .collection('sellerOrder').orderBy('timestamp',descending: true)
            .where('fulfilled',isEqualTo: 'false')

    );
  }
  OrdersFulfilled(){
    return  PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String fulfilled = documentSnapshot.data()['fulfilled'];
          String courierId = documentSnapshot.data()['courierId'];

          String Address = documentSnapshot.data()['Address'];

          String orderStatus = documentSnapshot.data()['orderStatus'];
          String size = documentSnapshot.data()['size'];
          String orderId = documentSnapshot.data()['orderId'];
          List shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
          String productname = documentSnapshot.data()['productname'];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,

              children: <Widget>[
                GestureDetector(
                  onTap: () => showProfile(context, profileId: currentUser.id),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(currentUser.photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      currentUser.displayName,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                StreamBuilder(  stream: productsRef.doc(ownerId).collection('userProducts').doc(prodId).snapshots(),
                    builder: (context, snapshot){
                      DocumentSnapshot ds = snapshot.data;

                      String usd= ds['usd'];
                      String inr= ds['inr'];



                      return
                        ListTile(


                          leading: GestureDetector(
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
                                borderRadius: BorderRadius.circular(20.0),child: Container(child: cachedNetworkImage(shopmediaUrl.first))),),
                          subtitle: Text( "₹$inr",style: TextStyle(color: kText,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                          title:Text(productname, style: TextStyle(
                              color:kText,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),),


                        );
                    }),

                Row(
                  children: [
                    Text('Size:  $size',
                      style: TextStyle(color: kText),),
                  ],
                ),
                SizedBox(height:10.0),
                Row(
                  children: [
                    Text('Address: $Address',
                      style: TextStyle(color: kText),),
                  ],
                ),
                SizedBox(height:10.0),

                Row(
                  children: [
                    Text('orderStatus:  $orderStatus',
                      style: TextStyle(color: kText),),
                  ],
                ),
                SizedBox(height:10.0),

                Row(
                  children: [
                    Text('Shipment Service:  $courierId',
                      style: TextStyle(color: kText),),
                  ],
                ),Row(
                  children: [
                    Text('Shipment Id:  $courierId',
                      style: TextStyle(color: kText),),
                  ],
                ),

              ],

            ),
          );
        },
        query:  FirebaseFirestore.instance.collection('ordersSeller')
            .doc(currentUser.id)
            .collection('sellerOrder').orderBy('timestamp',descending: true)
            .where('fulfilled',isEqualTo: 'true')

    );
  }
  void initState() {
    super.initState();
    update();
  }
  submit({String ownerId,String orderId,String cusId,String shopmediaUrl,String prodId,}){
    FirebaseFirestore.instance.collection('ordersSeller')
        .doc(ownerId)
        .collection('sellerOrder')
        .doc(orderId)
        .update({
      'Accepted':'true',

      'orderStatus':'Processing',
      "timestamp": timestamp,

    });
    FirebaseFirestore.instance.collection('ordersCustomer')
        .doc(cusId)
        .collection('userOrder')
        .doc(orderId)
        .update({
      'Accepted':'true',

      'orderStatus':'Processing',
      "timestamp": timestamp,

    }); FirebaseFirestore.instance.collection('feed')
        .doc(cusId)
        .collection('feedItems')
        .doc(orderId)
        .update({'message':'Your order has been accepted!',
      "timestamp": timestamp,
      "type": "Payment",
      "userId": ownerId,
      "mediaUrl":shopmediaUrl,
      "postId": prodId,
      "username": currentUser.displayName,
      "userProfileImg": currentUser.photoUrl,
      "read": 'false',
    });FirebaseFirestore.instance.collection('feed')
        .doc(ownerId)
        .collection('feedItems')
        .doc(orderId)
        .update({'message':'You accepted an order!',
      "timestamp": timestamp,
      "type": "PaymentO",
      "userId": ownerId,
      "mediaUrl":shopmediaUrl,
      "postId": prodId,
      "username": currentUser.displayName,
      "userProfileImg": currentUser.photoUrl,
      "read": 'false',
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
     RotatedBox(
      quarterTurns: 3,
      child: Expanded(
        child: DefaultTabController(
            length: 2,
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
                    Text("Upcoming orders", style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    Text("Fulfilled orders", style: TextStyle(
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
                        UpcomingOrders(),
                        OrdersFulfilled(),


                      ]),
                ),
              ),
            )
        ),
      ),
    );

  }
  main(){
    Column(
      children: [
        ExpansionTile (
          title: Text('Upcoming Orders'),
          maintainState:true,
          children: [
            UpcomingOrders()
          ],
        ),
        ExpansionTile (
          title: Text('Orders Fulfilled'),
          maintainState:true,
          children: [
            OrdersFulfilled()
          ],
        ),

      ],
    );

  }
  update() async {

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('ordersSeller')
        .doc(currentUser.id)
        .collection('sellerOrder').get();
    snapshot.docs.forEach((doc) {
    doc.reference.update({'read':'true'});
  });
        }

}
