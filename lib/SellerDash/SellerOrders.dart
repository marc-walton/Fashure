import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:fashow/Shipping/shipEngine/ship_engine.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
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
  UpcomingOrders(){
    return  PaginateFirestore(
isLive: true,
        key: ValueKey<String>(accept),
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String fulfilled = documentSnapshot.data()['fulfilled'];
          String Accepted = documentSnapshot.data()['Accepted'];
            String size = documentSnapshot.data()['size'];
             String cusName = documentSnapshot.data()['cusName'];
             String cusImg = documentSnapshot.data()['cusImg'];
          var eur = documentSnapshot.data()['eur'];
          var usd =documentSnapshot.data()['usd'];
          var inr =documentSnapshot.data()['inr'];
          var gbp = documentSnapshot.data()['gbp'];
          String Address = documentSnapshot.data()['Address'];
          String mtoText = documentSnapshot.data()['mtoText'];
          String color = documentSnapshot.data()['color'];
          String variation = documentSnapshot.data()['variation'];
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
          String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
String cusId = documentSnapshot.data()['cusId'];
String productname = documentSnapshot.data()['productname'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[
                  FutureBuilder(
                    future: usersRef.doc(cusId).get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return circularProgress();
                      }
                      Users user = Users.fromDocument(snapshot.data);
                      return
                        GestureDetector(
                          onTap: () => showProfile(context, profileId: cusId),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                              backgroundColor: Colors.grey,
                            ),
                            title: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );

                    },
                  ),


                  Column(
                    children: [
                      ListTile(


                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  prodId: prodId,
                                  userId: ownerId,
                                ),
                              ),
                            ),
                            child: Container(child: CachedImage(shopmediaUrl,width: 60,)),
                          ),
                        ),
                        subtitle:    currentUser.currency == "INR"? Row(
                          children: [
                            Text("${cf.format(inr, CurrencyFormatter.inr)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "EUR"?Row(
                          children: [
                            Text("${cf.format(eur, CurrencyFormatter.eur)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "GBP"?Row(
                          children: [
                            Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        Row(
                          children: [
                            Text("${cf.format(usd, CurrencyFormatter.usd)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),
                        title:RichText(
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

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Size:  $size',
                              style: TextStyle(color: kText),),
                          ],
                        ),
                      ),

          mtoText ==""? Container(): Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                          children: [
                            Text('Made-to-Order:  $mtoText',
                              style: TextStyle(color: kText),),
                          ],
                        ),
          ),
                      mtoText ==""? Container():Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('color:  $color',
                              style: TextStyle(color: kText),),
                          ],
                        ),
                      ),
          variation == ""? Container():Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                          children: [
                            Text('variation:  $variation',
                              style: TextStyle(color: kText),),
                          ],
                        ),
          ),
                      SizedBox(height:10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Address: $cusName',
                              style: TextStyle(color: kText),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('$Address',
                              style: TextStyle(color: kText),),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Text(' $city',
                      //         style: TextStyle(color: kText),),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Text('$state',
                      //         style: TextStyle(color: kText),),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Text(' $zip',
                      //         style: TextStyle(color: kText),),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       Text('$code$phone',
                      //         style: TextStyle(color: kText),),
                      //     ],
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     Text('$country',
                      //       style: TextStyle(color: kText),),
                      //   ],
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Accepted=='false'?   Center(child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation : 0.1,
                              primary:  Colors.black, ),
                            onPressed:(){
                              submit(orderId:orderId ,ownerId: ownerId,shopmediaUrl:shopmediaUrl,prodId:prodId,cusId:cusId);},
                            child:  Text('Process order',
                              style: TextStyle(color: Colors.white),),)):Container(),
                          fulfilled=='false'?   Center(child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation : 0.1,
                              primary:  Colors.black, ),
                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>OrderFulfill(orderId:orderId ,ownerId: ownerId,shopmediaUrl:shopmediaUrl,prodId:prodId,cusId:cusId)));},
                            child:  Text('Fulfill order',
                              style: TextStyle(color: Colors.white),),)):Container(),

                        ],
                      ),

                    ],
                  ),

                ],

              ),
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
        key: ValueKey<String>(fulfill),

        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['ownerId'];
          String prodId = documentSnapshot.data()['prodId'];
          String fulfilled = documentSnapshot.data()['fulfilled'];
          String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
          String cusId = documentSnapshot.data()['cusId'];
          String courierId = documentSnapshot.data()['courierId'];
          String courier = documentSnapshot.data()['courier'];

          String cusName = documentSnapshot.data()['cusName'];
          String cusImg = documentSnapshot.data()['cusImg'];
          var eur = documentSnapshot.data()['eur'];
          var usd =documentSnapshot.data()['usd'];
          var inr =documentSnapshot.data()['inr'];
          var gbp = documentSnapshot.data()['gbp'];
          String Address = documentSnapshot.data()['Address'];
          String mtoText = documentSnapshot.data()['mtoText'];
          String color = documentSnapshot.data()['color'];
          String variation = documentSnapshot.data()['variation'];
          String orderStatus = documentSnapshot.data()['orderStatus'];
          String size = documentSnapshot.data()['size'];
          String orderId = documentSnapshot.data()['orderId'];
          String productname = documentSnapshot.data()['productname'];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,

                children: <Widget>[
                  FutureBuilder(
                    future: usersRef.doc(cusId).get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return circularProgress();
                      }
                      Users user = Users.fromDocument(snapshot.data);
                      return
                        GestureDetector(
                          onTap: () => showProfile(context, profileId: cusId),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                              backgroundColor: Colors.grey,
                            ),
                            title: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );

                    },
                  ),

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
                          borderRadius: BorderRadius.circular(20.0),child: Container(child: CachedImage(shopmediaUrl,width: 60,))),),
                    subtitle:    currentUser.currency == "INR"? Row(
                      children: [
                        Text("${cf.format(inr, CurrencyFormatter.inr)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    currentUser.currency == "EUR"?Row(
                      children: [
                        Text("${cf.format(eur, CurrencyFormatter.eur)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    currentUser.currency == "GBP"?Row(
                      children: [
                        Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    Row(
                      children: [
                        Text("${cf.format(usd, CurrencyFormatter.usd)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ),
                    title:RichText(
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Size:  $size',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),

                  mtoText ==""? Container(): Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Made-to-Order:  $mtoText',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  mtoText ==""? Container():Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('color:  $color',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  variation == ""? Container():Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('variation:  $variation',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  SizedBox(height:10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Address: $cusName',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('$Address',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  SizedBox(height:10.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('orderStatus:  $orderStatus',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  SizedBox(height:10.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Shipment Service:  $courier',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Shipment Id:  $courierId',
                          style: TextStyle(color: kText),),
                      ],
                    ),
                  ),

                ],

              ),
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
    accept =accept.replaceAll("D","");
    accept = accept + "D";
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
                toolbarHeight: SizeConfig.safeBlockHorizontal * 9,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: kIcon,
                  labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
                  ///outline
                  unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Upcoming orders", style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Fulfilled orders", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),
                    ),

                  ],
                ),
              ),

              body: Container( color: Cont,
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
