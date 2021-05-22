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

class SellerOrders extends StatefulWidget {
  @override
  _SellerOrdersState createState() => _SellerOrdersState();
}

class _SellerOrdersState extends State<SellerOrders> {

  df({String productname,String usd,String inr,String cny,String eur,String gbp,String prodId,String ownerId,}){

    if(currentUser.country=='India'){
      return
        Column(
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( "₹$inr",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),


          ],
        );

    }
    else if(currentUser.country=='US'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( " \u0024 $usd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),



          ],
        );

    }

    else if (currentUser.country == 'Europe'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color:kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( " € $eur",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),



          ],
        );

    }
    else if (currentUser.country == 'UK'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( " £ $gbp",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),



          ],
        );

    }
    else{
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( " \u0024 $usd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),



          ],
        );

    }
  }
  UpcomingOrders(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
          String ownerId = documentSnapshot.data['ownerId'];
          String prodId = documentSnapshot.data['prodId'];
          String fulfilled = documentSnapshot.data['fulfilled'];
          String courierId = documentSnapshot.data['courierId'];
           String orderStatus = documentSnapshot.data['orderStatus'];
            String size = documentSnapshot.data['size'];
           String Address = documentSnapshot.data['Address'];
String orderId = documentSnapshot.data['orderId'];

          return
            StreamBuilder(
              stream: usersRef.document(ownerId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                User user = User.fromDocument(snapshot.data);
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
                        subtitle: Text(user.username,
                          style: TextStyle(color: kIcon),),),
                    ),
StreamBuilder(  stream: productsRef.document(ownerId).collection('userProducts').document(prodId).snapshots(),
    builder: (context, snapshot){
      DocumentSnapshot ds = snapshot.data;
      String shopmediaUrl= ds['shopmediaUrl'];
      String productname= ds['productname'];
      String usd= ds['usd'];
      String inr= ds['inr'];
      String eur= ds['eur'];
      String gbp= ds['gbp'];


  return
ListView(
  shrinkWrap: true,
  children: [
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
      borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
      ],),),
      df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

      ],
);
    }),
                    Text('size:$size',
                      style: TextStyle(color: kText),),
                     Text('Address:$Address',
                      style: TextStyle(color: kText),),
                     Text('orderStatus:$orderStatus',
                      style: TextStyle(color: kText),),
                    Center(child: RaisedButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>OrderFulfill(orderId:orderId ,ownerId: ownerId,)));},
                        child:  Text('Fulfill order',
                      style: TextStyle(color: kText),),)),
                    Divider(color: kGrey,),
                  ],

                );

              },
            );
        },
        query:  Firestore.instance.collection('ordersSeller')
      .document(currentUser.id)
      .collection('sellerOrder').orderBy('timestamp',descending: true)
            .where('fulfilled',isEqualTo: 'false')

    );
  }
  OrdersFulfilled(){
    return  PaginateFirestore(
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
          String ownerId = documentSnapshot.data['ownerId'];
          String prodId = documentSnapshot.data['prodId'];
          String fulfilled = documentSnapshot.data['fulfilled'];
          String courierId = documentSnapshot.data['courierId'];
          String orderStatus = documentSnapshot.data['orderStatus'];
          String size = documentSnapshot.data['size'];
          String Address = documentSnapshot.data['Address'];
          String orderId = documentSnapshot.data['orderId'];

          return
            StreamBuilder(
              stream: usersRef.document(ownerId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                User user = User.fromDocument(snapshot.data);
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
                        subtitle: Text(user.username,
                          style: TextStyle(color: kIcon),),),
                    ),
                    StreamBuilder(  stream: productsRef.document(ownerId).collection('userProducts').document(prodId).snapshots(),
                        builder: (context, snapshot){
                          DocumentSnapshot ds = snapshot.data;
                          String shopmediaUrl= ds['shopmediaUrl'];
                          String productname= ds['productname'];
                          String usd= ds['usd'];
                          String inr= ds['inr'];
                          String eur= ds['eur'];
                          String gbp= ds['gbp'];


                          return
                            ListView(
                              shrinkWrap: true,
                              children: [
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
                                          borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                                    ],),),
                                df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                              ],
                            );
                        }),
                    Text('size:$size',
                      style: TextStyle(color: kText),),
                    Text('Address:$Address',
                      style: TextStyle(color: kText),),
                    Text('orderStatus:$orderStatus',
                      style: TextStyle(color: kText),),
            Text('Shipment Id:$courierId',
                      style: TextStyle(color: kText),),

                  ],

                );

              },
            );
        },
        query:  Firestore.instance.collection('ordersSeller')
            .document(currentUser.id)
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

    QuerySnapshot snapshot = await Firestore.instance.collection('ordersSeller')
        .document(currentUser.id)
        .collection('sellerOrder').getDocuments();
    snapshot.documents.forEach((doc) {
    doc.reference.updateData({'read':'true'});
  });
        }

}
