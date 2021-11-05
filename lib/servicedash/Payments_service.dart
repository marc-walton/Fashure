import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/size_config.dart';
class ServicePayments extends StatefulWidget {
  @override
  _ServicePaymentsState createState() => _ServicePaymentsState();
}

class _ServicePaymentsState extends State<ServicePayments> {
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
            String title = documentSnapshot.data()['title'];
            String description = documentSnapshot.data()['description'];
            var eur = documentSnapshot.data()['eur'];
            var usd =documentSnapshot.data()['usd'];
            var inr =documentSnapshot.data()['inr'];
            var gbp = documentSnapshot.data()['gbp'];
             var Feur = documentSnapshot.data()['Feur'];
            var Fusd =documentSnapshot.data()['Fusd'];
            var Finr =documentSnapshot.data()['Finr'];
            var Fgbp = documentSnapshot.data()['Fgbp'];


            return
              Column(
                children: <Widget>[
                  ListTile(
                    title:RichText(
                      maxLines: 1,softWrap:false,overflow:TextOverflow.fade,
                      text: TextSpan(
                          style:TextStyle(
                              color:kText,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),

                          ]),
                    ),
                    subtitle:  ExpandableText(
                        description
                    ),

                  ),
                  currentUser.currency == "INR"? Row(
                    children: [
                      Text("Advance payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(inr??0, CurrencyFormatter.inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "EUR"?Row(
                    children: [
                      Text("Advance payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(eur??0, CurrencyFormatter.eur)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),                      ],
                  ):
                  currentUser.currency == "GBP"?Row(
                    children: [
                      Text("Advance payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(gbp??0, CurrencyFormatter.gbp)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),                       ],
                  ):
                  Row(
                    children: [
                      Text("Advance payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(usd??0, CurrencyFormatter.usd)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),                       ],
                  ),

                  currentUser.currency == "INR"? Row(
                    children: [
                      Text("Final Payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(Finr??0, CurrencyFormatter.inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "EUR"?Row(
                    children: [
                      Text("Final Payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(Feur??0, CurrencyFormatter.eur)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),                      ],
                  ):
                  currentUser.currency == "GBP"?Row(
                    children: [
                      Text("Final Payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(Fgbp??0, CurrencyFormatter.gbp)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),                       ],
                  ):
                  Row(
                    children: [
                      Text("Final Payment:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                      Spacer(),
                      Text("${cf.format(Fusd??0, CurrencyFormatter.usd)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),                       ],
                  ),


                ],
              );

          },
          query:  FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id)
              .collection('ServicePayments')
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
            var commission = documentSnapshot.data()['commission'];
            var payment = documentSnapshot.data()['payment'];
            var paymentGateway = documentSnapshot.data()['paymentGateway'];

            var conversion = documentSnapshot.data()['conversion'];
            var commissionPercent = documentSnapshot.data()['commissionPercent'];

            var paymentPercent = documentSnapshot.data()['paymentPercent'];
            var conversionPercent = documentSnapshot.data()['conversionPercent'];
            var total = documentSnapshot.data()['total'];
            String title = documentSnapshot.data()['title'];
            String description = documentSnapshot.data()['description'];
            return
              Column(
                children: <Widget>[
                  ListTile(
                    title:RichText(
                      maxLines: 1,softWrap:false,overflow:TextOverflow.fade,
                      text: TextSpan(
                          style:TextStyle(
                              color:kText,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),

                          ]),
                    ),
                    subtitle:  ExpandableText(
                        description
                    ),

                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    currentUser.currency == "INR"? Row(
                      children: [
                        Text('commission($commissionPercent%):',
                          style: TextStyle(color: kText),),Spacer(),
                        Text("${cf.format(commission, CurrencyFormatter.inr)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    currentUser.currency == "EUR"?Row(
                      children: [
                        Text('commission($commissionPercent%):',
                          style: TextStyle(color: kText),),Spacer(),
                        Text("${cf.format(commission, CurrencyFormatter.eur)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    currentUser.currency == "GBP"?Row(
                      children: [
                        Text('commission($commissionPercent%):',
                          style: TextStyle(color: kText),),Spacer(),
                        Text("${cf.format(commission, CurrencyFormatter.gbp)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    Row(
                      children: [
                        Text('commission($commissionPercent%):',
                          style: TextStyle(color: kText),),Spacer(),
                        Text("${cf.format(commission, CurrencyFormatter.gbp)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        currentUser.currency == "INR"? Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('payment gateway charges:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('$paymentGateway-$paymentPercent%',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),

                              ],
                            ),Spacer(),
                            Text("${cf.format(payment, CurrencyFormatter.inr)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "EUR"?Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('payment gateway charges:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('$paymentGateway-$paymentPercent%',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),

                              ],
                            ),Spacer(),
                            Text("${cf.format(payment, CurrencyFormatter.eur)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "GBP"?Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('payment gateway charges:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('$paymentGateway-$paymentPercent%',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),

                              ],
                            ),Spacer(),
                            Text("${cf.format(payment, CurrencyFormatter.gbp)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('payment gateway charges:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('$paymentGateway-$paymentPercent%',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),

                              ],
                            ),Spacer(),
                            Text("${cf.format(payment, CurrencyFormatter.usd)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        currentUser.currency == "INR"? Row(
                          children: [
                            Row(
                              children: [
                                Text('conversion($conversionPercent%):',
                                  style: TextStyle(color: kText),),
                              ],
                            ),Spacer(),
                            Text("${cf.format(conversion, CurrencyFormatter.inr)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "EUR"?Row(
                          children: [
                            Row(
                              children: [
                                Text('conversion($conversionPercent%):',
                                  style: TextStyle(color: kText),),
                              ],
                            ),Spacer(),
                            Text("${cf.format(conversion, CurrencyFormatter.eur)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        currentUser.currency == "GBP"?Row(
                          children: [
                            Row(
                              children: [
                                Text('conversion($conversionPercent%):',
                                  style: TextStyle(color: kText),),
                              ],
                            ),Spacer(),
                            Text("${cf.format(conversion, CurrencyFormatter.gbp)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ):
                        Row(
                          children: [
                            Row(
                              children: [
                                Text('conversion($conversionPercent%):',
                                  style: TextStyle(color: kText),),
                              ],
                            ),Spacer(),
                            Text("${cf.format(conversion, CurrencyFormatter.usd)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),

                      ],
                    ),
                  ),
                  total == 0? Container():  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Total:',
                          style: TextStyle(color: kText),),
                        Spacer(),
                        currentUser.currency == "INR"? Text("${cf.format(total, CurrencyFormatter.inr)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )):
                        currentUser.currency == "EUR"?Text("${cf.format(total, CurrencyFormatter.eur)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )):
                        currentUser.currency == "GBP"?Text("${cf.format(total, CurrencyFormatter.gbp)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )):
                        Text("${cf.format(total, CurrencyFormatter.usd)}",
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

          },
          query:   FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id)
              .collection('ServicePayments')
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
                        child: Text("Upcoming Payments", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Fulfilled Payments", style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 5),),
                      ),

                    ],
                  ),
                ),

                body: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children: <Widget>[
                        upcoming(),
                        fulfilled(),


                      ]),
                ),
              )
          ),
        ),
      );


  }
  update() async {

    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Payments')
        .doc(currentUser.id)
        .collection('ServicePayments').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }

}
