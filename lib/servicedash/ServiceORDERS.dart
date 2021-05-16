import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:fashow/servicedash/servicefulfill.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
class ServiceOrders extends StatefulWidget {
  @override
  _ServiceOrdersState createState() => _ServiceOrdersState();
}

class _ServiceOrdersState extends State<ServiceOrders> {
  df({
    String productname,
     String des,

    String usd,
    String inr,
    String cny,
    String eur,
    String gbp,
    String Fusd,
    String Finr,
    String Fcny,
    String Feur,
    String Fgbp,
    String orderId,
    String ownerId,}){

    if(currentUser.country=='India'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text(des, style: TextStyle(
                color: kText,
                fontSize: 15.0,
            ),),
            Text( "Advance payment:₹$inr",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            Text( "Due payment:₹$Finr",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),

            // GFButton(
            //   onPressed: () =>
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               ProductScreen(
            //                 prodId: prodId,
            //                 userId: ownerId,
            //               ),
            //         ),
            //       ),
            //   text: "More",
            //   icon: Icon(Icons.card_travel),
            //   shape: GFButtonShape.pills,
            //
            // ),
          ],
        );

    }
    else if(currentUser.country=='US'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text(des, style: TextStyle(
              color: kText,
              fontSize: 15.0,
            ),),
            Text( "Advance payment: \u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            Text( "Due payment: \u0024 $Fusd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),

            // GFButton(
            //   onPressed: () =>
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               ProductScreen(
            //                 prodId: prodId,
            //                 userId: ownerId,
            //               ),
            //         ),
            //       ),
            //   text: "More",
            //   icon: Icon(Icons.card_travel),
            //   shape: GFButtonShape.pills,
            //
            // ),
          ],
        );

    }
    else if (currentUser.country == 'China') {
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "Advance payment: ¥ $cny",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            Text( "Due payment: ¥ $Fcny",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),

            // GFButton(
            //   onPressed: () =>
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               ProductScreen(
            //                 prodId: prodId,
            //                 userId: ownerId,
            //               ),
            //         ),
            //       ),
            //   text: "More",
            //   icon: Icon(Icons.card_travel),
            //   shape: GFButtonShape.pills,
            //
            // ),
          ],
        );

    }
    else if (currentUser.country == 'Europe'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text(des, style: TextStyle(
              color: kText,
              fontSize: 15.0,
            ),),
            Text( "Advance payment: € $eur",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            Text( "Due payment: € $Feur",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),

            // GFButton(
            //   onPressed: () =>
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               ProductScreen(
            //                 prodId: prodId,
            //                 userId: ownerId,
            //               ),
            //         ),
            //       ),
            //   text: "More",
            //   icon: Icon(Icons.card_travel),
            //   shape: GFButtonShape.pills,
            //
            // ),
          ],
        );

    }
    else if (currentUser.country == 'UK'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text(des, style: TextStyle(
              color: kText,
              fontSize: 15.0,
            ),),
            Text( "Advance payment: £ $gbp ",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            Text( "Due payment: £ $Fgbp ",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),

            // GFButton(
            //   onPressed: () =>
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               ProductScreen(
            //                 prodId: prodId,
            //                 userId: ownerId,
            //               ),
            //         ),
            //       ),
            //   text: "More",
            //   icon: Icon(Icons.card_travel),
            //   shape: GFButtonShape.pills,
            //
            // ),
          ],
        );

    }
    else{
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text(des, style: TextStyle(
              color: kText,
              fontSize: 15.0,
            ),),
            Text( "Advance payment: \u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            Text( "Due payment: \u0024 $Fusd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),

            // GFButton(
            //   onPressed: () =>
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               ProductScreen(
            //                 prodId: prodId,
            //                 userId: ownerId,
            //               ),
            //         ),
            //       ),
            //   text: "More",
            //   icon: Icon(Icons.card_travel),
            //   shape: GFButtonShape.pills,
            //
            // ),
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

          String usd = documentSnapshot.data['usd'];
          String inr = documentSnapshot.data['inr'];
          String cny = documentSnapshot.data['cny'];
          String gbp = documentSnapshot.data['gbp'];
          String eur = documentSnapshot.data['eur'];
          String Fusd = documentSnapshot.data['Fusd'];
          String Finr = documentSnapshot.data['Finr'];
          String Fcny = documentSnapshot.data['Fcny'];
          String Fgbp = documentSnapshot.data['Fgbp'];
          String Feur = documentSnapshot.data['Feur'];

          String ownerId = documentSnapshot.data['ownerId'];
          String cusId = documentSnapshot.data['cusId'];
          String title = documentSnapshot.data['title'];
          String desciption = documentSnapshot.data['description'];
          String orderId = documentSnapshot.data['orderId'];
          String fulfilled = documentSnapshot.data['fulfilled'];
          String courierId = documentSnapshot.data['courierId'];
          String orderStatus = documentSnapshot.data['orderStatus'];
          String Address = documentSnapshot.data['Address'];

          return
            StreamBuilder(
              stream: usersRef.document(cusId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                return Expanded(
                  child: Column(
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
                      Divider(color: kGrey,),
                      ListTile(
                        leading: Text('Order Details',
                          style: TextStyle(color: kText),),
                      ),

                      df(productname:title,
                        des:desciption,
                        usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp,
                        Fusd:Fusd,Finr:Finr,Fcny:Fcny,Feur:Feur,Fgbp:Fgbp,

                        orderId:orderId, ownerId:ownerId,),

                      Text('Address:$Address',
                        style: TextStyle(color: kText),),
                      Text('orderStatus:$orderStatus',
                        style: TextStyle(color: kText),),
                      Center(child: RaisedButton(
                        color: kblue,
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>ServiceFulfill(ownerId: ownerId,orderId: orderId,)));},
                        child:  Text('Fulfill order',
                          style: TextStyle(color: kText),),)),
                      Divider(color: kGrey,),
                    ],

                  ),
                );

              },
            );
        },
        query:  Firestore.instance.collection('serviceSeller')
            .document(currentUser.id)
            .collection('sellerService').orderBy('timestamp',descending: true)
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

          // "usd": cnytousd,
          // "cny": advanceController.text,
          // "gbp": cnytogbp,
          // "eur": cnytoeur,
          // "inr": cnytoinr,
          // "Fusd": Fcnytousd,
          // "Fcny": totalController.text ?? "0",
          // "Fgbp": Fcnytogbp,
          // "Feur": Fcnytoeur,
          // "Finr": Fcnytoinr,
          // // 'advance':advanceController.text,
          // // 'final':totalController.text ?? "0",
          // 'title':titleController.text,
          // 'title':titleController.text,
          // 'description':detailsController.text,
          // 'advancepay':'false',
          // 'finalpay':'false',
          // 'Address':"",

          String usd = documentSnapshot.data['usd'];
          String inr = documentSnapshot.data['inr'];
          String cny = documentSnapshot.data['cny'];
          String gbp = documentSnapshot.data['gbp'];
          String eur = documentSnapshot.data['eur'];
         String Fusd = documentSnapshot.data['Fusd'];
          String Finr = documentSnapshot.data['Finr'];
          String Fcny = documentSnapshot.data['Fcny'];
          String Fgbp = documentSnapshot.data['Fgbp'];
          String Feur = documentSnapshot.data['Feur'];

          String orderId = documentSnapshot.data['orderId'];
           String ownerId = documentSnapshot.data['ownerId'];

           String cusId = documentSnapshot.data['cusId'];

          String fulfilled = documentSnapshot.data['fulfilled'];
          String courierId = documentSnapshot.data['courierId'];
          String orderStatus = documentSnapshot.data['orderStatus'];
          String title = documentSnapshot.data['size'];
          String Address = documentSnapshot.data['title'];
String description = documentSnapshot.data['description'];

          return
            StreamBuilder(
              stream: usersRef.document(cusId).snapshots(),
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
                    Divider(color: kGrey,),
                    ListTile(
                      leading: Text('Order Details',
                        style: TextStyle(color: kText),),
                    ),
                    Text('$title',
                      style: TextStyle(color: kText),),
                    Text('$description',
                      style: TextStyle(color: kText),),
                    df(productname:title,
                      usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp,
                      Fusd:Fusd,Finr:Finr,Fcny:Fcny,Feur:Feur,Fgbp:Fgbp,

                      orderId:orderId, ownerId:ownerId,),
                    Text('Address:$Address',
                      style: TextStyle(color: kText),),
                    Text('orderStatus:$orderStatus',
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
        query:  Firestore.instance.collection('serviceSeller')
            .document(currentUser.id)
            .collection('sellerService').orderBy('timestamp',descending: true)
            .where('fulfilled',isEqualTo: 'true')

    );
  }
  @override
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
                backgroundColor: kPrimaryColor,
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

                body: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children: <Widget>[
                        UpcomingOrders(),
                        OrdersFulfilled(),


                      ]),
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
    update();
  }
  update() async {

    QuerySnapshot snapshot = await  Firestore.instance.collection('serviceSeller')
        .document(currentUser.id)
        .collection('sellerService').getDocuments();
    snapshot.documents.forEach((doc) {
      doc.reference.updateData({'read':'true'});
    });
  }
}