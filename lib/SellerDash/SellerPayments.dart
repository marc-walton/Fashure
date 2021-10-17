import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/size_config.dart';
class SellerPayments extends StatefulWidget {
  @override
  _SellerPaymentsState createState() => _SellerPaymentsState();
}

class _SellerPaymentsState extends State<SellerPayments> {
  df({String productname,var usd,var inr,var cny,var eur,var gbp,String prodId,String ownerId,}){
    return
      Column(
        children: <Widget>[
          ListTile(
            title: Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
          ),
          currentUser.currency == "INR"? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${cf.format(inr, CurrencyFormatter.inr)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
              ],
            ),
          ):
          currentUser.currency == "EUR"?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${cf.format(eur, CurrencyFormatter.eur)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
              ],
            ),
          ):
          currentUser.currency == "GBP"?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
              ],
            ),
          ):
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${cf.format(usd, CurrencyFormatter.usd)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
              ],
            ),
          ),


        ],
      );
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
            var eur = documentSnapshot.data()['eur'];
            var usd =documentSnapshot.data()['usd'];
            var inr =documentSnapshot.data()['inr'];
            var gbp = documentSnapshot.data()['gbp'];
            String size = documentSnapshot.data()['size'];

            String mtoText = documentSnapshot.data()['mtoText'];
            String color = documentSnapshot.data()['color'];
            String variation = documentSnapshot.data()['variation'];
            String orderStatus = documentSnapshot.data()['orderStatus'];
            return
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(child: Column(

                    children: [
                      df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
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
                    ],
                  )),
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
            String size = documentSnapshot.data()['size'];

            String mtoText = documentSnapshot.data()['mtoText'];
            String color = documentSnapshot.data()['color'];
            String variation = documentSnapshot.data()['variation'];
            String orderStatus = documentSnapshot.data()['orderStatus'];
            String fulfilled = documentSnapshot.data()['fulfilled'];
            String productname = documentSnapshot.data()['productname'];
            var eur = documentSnapshot.data()['eur'];
            var usd =documentSnapshot.data()['usd'];
            var inr =documentSnapshot.data()['inr'];
            var gbp = documentSnapshot.data()['gbp'];
            var commission = documentSnapshot.data()['commission'];
            var payment = documentSnapshot.data()['payment'];
            var paymentGateway = documentSnapshot.data()['paymentGateway'];

            var conversion = documentSnapshot.data()['conversion'];
            var commissionPercent = documentSnapshot.data()['commissionPercent'];

            var paymentPercent = documentSnapshot.data()['paymentPercent'];
            var conversionPercent = documentSnapshot.data()['conversionPercent'];
            var total = documentSnapshot.data()['total'];

            return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(

                    children: [
                      df(productname:productname, usd:usd,inr:inr,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('commission($commissionPercent%):  -$commission',
                            style: TextStyle(color: kText),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('payment gateway charges($paymentGateway-$paymentPercent%):  -$payment',
                            style: TextStyle(color: kText),),
                        ],
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('conversion($conversionPercent%):  -$conversion',
                            style: TextStyle(color: kText),),
                        ],
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('total: -$total',
                            style: TextStyle(color: kText),),
                        ],
                      ),
                    ),


            ],
                  ),
                ),
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

                body: Container( color: Cont,
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
