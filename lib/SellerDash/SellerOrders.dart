import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/size_config.dart';
import 'package:translated_text/translated_text.dart';

class SellerOrders extends StatefulWidget {
  @override
  _SellerOrdersState createState() => _SellerOrdersState();
}

class _SellerOrdersState extends State<SellerOrders> {

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
          String courierId = documentSnapshot.data()['courierId'];
           String orderStatus = documentSnapshot.data()['orderStatus'];
            String size = documentSnapshot.data()['size'];
           String Address = documentSnapshot.data()['Address'];
String orderId = documentSnapshot.data()['orderId'];
String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
String cusId = documentSnapshot.data()['cusId'];
String productname = documentSnapshot.data()['productname'];

          return
            StreamBuilder(
              stream: usersRef.doc(ownerId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.start,
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
FutureBuilder(  future: productsRef.doc(ownerId).collection('userProducts').doc(prodId).get(),
    builder: (context, snapshot){
      DocumentSnapshot ds = snapshot.data;
      String usd= ds['usd'];
      String inr= ds['inr'];
      String eur= ds['eur'];
      String gbp= ds['gbp'];
if(snapshot.data != null||snapshot.hasData){
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
            borderRadius: BorderRadius.circular(20.0),child: Container(child: cachedNetworkImage(shopmediaUrl))),),
      subtitle: currentUser.country=='India'? Text( "₹$inr",style: TextStyle(color: kText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold)):
      currentUser.country=='USA'? Text( " \u0024 $usd",style: TextStyle(color:  kText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold)):
      currentUser.country == 'Europe'?    Text( " € $eur",style: TextStyle(color: kText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold)):
      currentUser.country == 'UK'? Text( " £ $gbp",style: TextStyle(color: kText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold)): Text( " \u0024 $usd",style: TextStyle(color:  kText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold)),
      title:Text(productname, style: TextStyle(
          color:kText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold),),


    );}
else {return Center(child: CircularProgressIndicator(),);}

    }),

                      Row(
                        children: [
                          TranslatedText('Size:  $size',to:'${currentUser.language}',textStyle:
                        TextStyle(color: kText),),

                        ],
                      ),
                       SizedBox(height:10.0),
                       Row(
                         children: [
                           TranslatedText('Address: $Address',to:'${currentUser.language}',textStyle:
                           TextStyle(color: kText),),
                         ],
                       ),
                      fulfilled=='false'?   Center(child: RaisedButton(
                        color: kblue,
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>OrderFulfill(orderId:orderId ,ownerId: ownerId,shopmediaUrl:shopmediaUrl,prodId:prodId,cusId:cusId)));},
                          child:
                          TranslatedText('Fulfill order',to:'${currentUser.language}',textStyle:
                          TextStyle(color:Colors.white),),
                      ),):Container(),
                      Divider(color: kGrey,),
                    ],

                  ),
                );

              },
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
            String courier = documentSnapshot.data()['courier'];

          String orderStatus = documentSnapshot.data()['orderStatus'];
          String size = documentSnapshot.data()['size'];
          String Address = documentSnapshot.data()['Address'];
          String orderId = documentSnapshot.data()['orderId'];
          String shopmediaUrl = documentSnapshot.data()['shopmediaUrl'];
          String cusId = documentSnapshot.data()['cusId'];
          String productname = documentSnapshot.data()['productname'];
          return
            StreamBuilder(
              stream: usersRef.doc(ownerId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                Users user = Users.fromDocument(snapshot.data);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.start,

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
                      StreamBuilder(  stream: productsRef.doc(ownerId).collection('userProducts').doc(prodId).snapshots(),
                          builder: (context, snapshot){
                            DocumentSnapshot ds = snapshot.data;

                            String usd= ds['usd'];
                            String inr= ds['inr'];
                            String eur= ds['eur'];
                            String gbp= ds['gbp'];


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
                                      borderRadius: BorderRadius.circular(20.0),child: Container(child: cachedNetworkImage(shopmediaUrl))),),
                                subtitle: currentUser.country=='India'? Text( "₹$inr",style: TextStyle(color: kText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)):
                                currentUser.country=='USA'? Text( " \u0024 $usd",style: TextStyle(color:  kText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)):
                                currentUser.country == 'Europe'?    Text( " € $eur",style: TextStyle(color: kText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)):
                                currentUser.country == 'UK'? Text( " £ $gbp",style: TextStyle(color: kText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)): Text( " \u0024 $usd",style: TextStyle(color:  kText,
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
                          TranslatedText('Size:  $size',to:'${currentUser.language}',textStyle:
                          TextStyle(color: kText),),

                        ],
                      ),
                      SizedBox(height:10.0),
                      Row(
                        children: [
                          TranslatedText('Address: $Address',to:'${currentUser.language}',textStyle:
                          TextStyle(color: kText),),
                          ],
                      ),
                      SizedBox(height:10.0),

                      Row(
                        children: [
                          TranslatedText('orderStatus:  $orderStatus',to:'${currentUser.language}',textStyle:
                          TextStyle(color: kText),),
                           ],
                      ),
                      SizedBox(height:10.0),

                      Row(
                        children: [
                          TranslatedText('Shipment Service:  $courierId',to:'${currentUser.language}',textStyle:
                          TextStyle(color: kText),),
                             ],
                      ),Row(
                        children: [
                          TranslatedText('Shipment Id:  $courierId',to:'${currentUser.language}',textStyle:
                          TextStyle(color: kText),),
                        ],
                      ),

                    ],

                  ),
                );

              },
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
                    TranslatedText('Upcoming orders',to:'${currentUser.language}',textStyle:
                    TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                        ),),
                    TranslatedText('Fulfilled orders',to:'${currentUser.language}',textStyle:
                    TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                    ),),

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
          title:  TranslatedText('Upcoming orders',to:'${currentUser.language}'
         ),
          maintainState:true,
          children: [
            UpcomingOrders()
          ],
        ),
        ExpansionTile (
          title:  TranslatedText('Orders Fulfilled',to:'${currentUser.language}'
          ),
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
