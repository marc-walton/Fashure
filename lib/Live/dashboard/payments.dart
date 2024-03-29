import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/size_config.dart';
class AuctionPayments extends StatefulWidget {
  @override
  _AuctionPaymentsState createState() => _AuctionPaymentsState();
}

class _AuctionPaymentsState extends State<AuctionPayments> {

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
            String usd = documentSnapshot.data()['usd'];

            return
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                          color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),),                    ],
                  ),

                  Row(
                    children: [

                      Text( "${currentUser.currencysym}$inr",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),                    ],
                  ),


                ],
              );


          },
          query:  FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id)
              .collection('AuctionPayments')
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
            String usd = documentSnapshot.data()['usd'];
   String paymentG = documentSnapshot.data()['paymentGateway'];
  String TypeOfG = documentSnapshot.data()['TypeOfG'];

            return
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(productname, style: TextStyle(
                          color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),),                    ],
                  ),

                  Row(
                    children: [
                      Text( "Listed price:",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                      Text( "${currentUser.currencysym}$inr",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),                    ],
                  ),
   Row(
                    children: [
                      Text( "Payment gateway charges: - ",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                      Text( "${currentUser.currencysym}$paymentG($TypeOfG)",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),                    ],
                  ),

   Row(
                    children: [
                      Text( "Flat commission(2 %): - ",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                      Text( "${currentUser.currencysym}$paymentG",style: TextStyle(color: kText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),                    ],
                  ),


                ],
              );

          },
          query:   FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id)
              .collection('AuctionPayments')
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
        .collection('AuctionPayments').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }

}
