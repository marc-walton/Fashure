import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/size_config.dart';
class SellerPayments extends StatefulWidget {
  @override
  _SellerPaymentsState createState() => _SellerPaymentsState();
}

class _SellerPaymentsState extends State<SellerPayments> {
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
  upcoming(){
    return
      PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
            String ownerId = documentSnapshot.data()['ownerId'];
            String orderId = documentSnapshot.data()['orderId'];
            String prodId = documentSnapshot.data()['prodId'];

            String fulfilled = documentSnapshot.data()['fulfilled'];
            String productname = documentSnapshot.data()['productname'];
            String inr = documentSnapshot.data()['inr'];
            String cny = documentSnapshot.data()['cny'];
            String usd = documentSnapshot.data()['usd'];
            String eur = documentSnapshot.data()['eur'];
            String gbp = documentSnapshot.data()['gbp'];
            return
                Column(

                  children: [
                    df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                  ],
                );

          },
          query: FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id,)
              .collection('SellerPayments')
              .orderBy('timestamp',descending: true)
              .where('fulfilled',isEqualTo: 'false')

      );

  }
  fulfilled(){
    return
      PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
            String ownerId = documentSnapshot.data()['ownerId'];
            String orderId = documentSnapshot.data()['orderId'];
            String prodId = documentSnapshot.data()['prodId'];

            String fulfilled = documentSnapshot.data()['fulfilled'];
            String productname = documentSnapshot.data()['productname'];
            String inr = documentSnapshot.data()['inr'];
            String cny = documentSnapshot.data()['cny'];
            String usd = documentSnapshot.data()['usd'];
            String eur = documentSnapshot.data()['eur'];
            String gbp = documentSnapshot.data()['gbp'];
            return
              Column(

                children: [
                  df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

                ],
              );

          },
          query: FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id,)
              .collection('SellerPayments')
              .orderBy('timestamp',descending: true)
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
                      Text("Upcoming Payments", style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Fulfilled Payments", style: TextStyle(
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
                          upcoming(),
                         fulfilled(),


                        ]),
                  ),
                ),
              )
          ),
        ),
      );


  }
  update() async {

    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Payments')
        .doc(currentUser.id,)
        .collection('SellerPayments').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }

}
