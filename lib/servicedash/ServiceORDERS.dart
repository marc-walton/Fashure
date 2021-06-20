import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:fashow/servicedash/servicefulfill.dart';
import 'package:flutter/material.dart';

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
    String eur,
    String gbp,
    String Fusd,
    String Finr,
    String Feur,
    String Fgbp,
    String adavance,
    String finalp,
    String orderId,
    String ownerId,}){

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
              title:            Text(des, style: TextStyle(
                color: kText,
                fontSize: 15.0,
              ),),

            ),
            ListTile(
              title:            Text( "Advance payment:₹$inr",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
    subtitle:  adavance == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
    fontSize: 20.0,
    fontWeight: FontWeight.bold)): Text('Payment pending'),

            ),
            ListTile(
              title:             Text( "Due payment:₹$Finr",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

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
              title:            Text(des, style: TextStyle(
                color:  kText,
                fontSize: 15.0,
              ),),

            ),
            ListTile(
              title:            Text( "Advance payment: \u0024 $usd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
subtitle:  adavance == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
    fontSize: 20.0,
    fontWeight: FontWeight.bold)): Text('Payment pending'),
          ),
            ListTile(
              title:             Text( "Due payment: \u0024 $Fusd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

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
              title:            Text(des, style: TextStyle(
                color: kText,
                fontSize: 15.0,
              ),),

            ),
            ListTile(
              title:            Text( "Advance payment:  € $eur",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

            ),
            ListTile(
              title:             Text( "Due payment: € $Feur",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

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
              title:            Text(des, style: TextStyle(
                color: kText,
                fontSize: 15.0,
              ),),

            ),
            ListTile(
              title:            Text( "Advance payment: £ $gbp",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

            ),
            ListTile(
              title:             Text( "Due payment: £ $Fgbp",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

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
              title:            Text(des, style: TextStyle(
                color:  kText,
                fontSize: 15.0,
              ),),

            ),
            ListTile(
              title:            Text( "Advance payment: \u0024 $usd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

            ),
            ListTile(
              title:             Text( "Due payment: \u0024 $Fusd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)): Text('Payment pending'),

            ),


          ],
        );

    }
  }
  UpcomingOrders(){
    return  Container( decoration: BoxDecoration(
        gradient: fabGradient
    ) ,
      alignment: Alignment.center,
      child: PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];

            String usd = documentSnapshot.data()['usd'];
            String inr = documentSnapshot.data()['inr'];
            String gbp = documentSnapshot.data()['gbp'];
            String eur = documentSnapshot.data()['eur'];
            String Fusd = documentSnapshot.data()['Fusd'];
            String Finr = documentSnapshot.data()['Finr'];
            String Fgbp = documentSnapshot.data()['Fgbp'];
            String Feur = documentSnapshot.data()['Feur'];

            String ownerId = documentSnapshot.data()['ownerId'];
            String cusId = documentSnapshot.data()['cusId'];
            String title = documentSnapshot.data()['title'];
            String desciption = documentSnapshot.data()['description'];
            String orderId = documentSnapshot.data()['orderId'];
            String advancepay = documentSnapshot.data()['advancepay'];
            String finalpay = documentSnapshot.data()['finalpay'];
            String orderStatus = documentSnapshot.data()['orderStatus'];
            String Address = documentSnapshot.data()['Address'];
 String fulfilled = documentSnapshot.data()['fulfilled'];

            return
              StreamBuilder(
                stream: usersRef.doc(cusId).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return circularProgress();
                  }
                  Users user = Users.fromDocument(snapshot.data);
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
                                color:kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                        ),
                        Divider(color: kGrey,),
                        ListTile(
                          leading: Text('Order Details',
                            style: TextStyle(color: kText),),
                        ),

                        df(productname:title,
                          des:desciption,
                          usd:usd,inr:inr,eur:eur,gbp:gbp,
                          Fusd:Fusd,Finr:Finr,Feur:Feur,Fgbp:Fgbp,
adavance: advancepay,finalp: finalpay,
                          orderId:orderId, ownerId:ownerId,),
                        ListTile(
                         title:                       Text('orderStatus:$orderStatus',
                           style: TextStyle(color: kText),),

                        ),

                        fulfilled=='false'  ?Center(child: RaisedButton(
                          color: kblue,
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>ServiceFulfill(ownerId: ownerId,orderId: orderId,cusId:cusId)));},
                          child:  Text('Fulfill order',
                            style: TextStyle(color: Colors.white),),)):Container(),
                        Divider(color: kGrey,),
                      ],

                    ),
                  );

                },
              );
          },
          query:  FirebaseFirestore.instance.collection('serviceSeller')
              .doc(currentUser.id)
              .collection('sellerService').orderBy('timestamp',descending: true)
              .where('fulfilled',isEqualTo: 'false')

      ),
    );
  }
  OrdersFulfilled(){
    return  Container( decoration: BoxDecoration(
        gradient: fabGradient
    ) ,
      alignment: Alignment.center,
      child: PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {


            String usd = documentSnapshot.data()['usd'];
            String inr = documentSnapshot.data()['inr'];
            String gbp = documentSnapshot.data()['gbp'];
            String eur = documentSnapshot.data()['eur'];
           String Fusd = documentSnapshot.data()['Fusd'];
            String Finr = documentSnapshot.data()['Finr'];
            String Fgbp = documentSnapshot.data()['Fgbp'];
            String Feur = documentSnapshot.data()['Feur'];

            String orderId = documentSnapshot.data()['orderId'];
             String ownerId = documentSnapshot.data()['ownerId'];

             String cusId = documentSnapshot.data()['cusId'];

            String advancepay = documentSnapshot.data()['advancepay'];
            String finalpay = documentSnapshot.data()['finalpay'];
            String orderStatus = documentSnapshot.data()['orderStatus'];
            String title = documentSnapshot.data()['title'];
String description = documentSnapshot.data()['description'];

            return
              StreamBuilder(
                stream: usersRef.doc(cusId).snapshots(),
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
                              color:kText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Divider(color: kGrey,),
                      ListTile(
                        leading: Text('Order Details',
                          style: TextStyle(color: kText),),
                      ),

                      df(productname:title,
                        des:description,
                        usd:usd,inr:inr,eur:eur,gbp:gbp,
                        Fusd:Fusd,Finr:Finr,Feur:Feur,Fgbp:Fgbp,
adavance: advancepay, finalp: finalpay,
                        orderId:orderId, ownerId:ownerId,),
                      ListTile(
                        title:                       Text('orderStatus:$orderStatus',
                          style: TextStyle(color: kText),),

                      ),




                    ],

                  );

                },
              );
          },
          query:  FirebaseFirestore.instance.collection('serviceSeller')
              .doc(currentUser.id)
              .collection('sellerService').orderBy('timestamp',descending: true)
              .where('fulfilled',isEqualTo: 'true')

      ),
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
      Container(   decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: RotatedBox(
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

    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('serviceSeller')
        .doc(currentUser.id)
        .collection('sellerService').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }
}
