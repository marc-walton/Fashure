import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/size_config.dart';
class CommissionPayments extends StatefulWidget {
  @override
  _CommissionPaymentsState createState() => _CommissionPaymentsState();
}

class _CommissionPaymentsState extends State<CommissionPayments> {
  upcoming(){
    return
      PaginateFirestore(
          isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
            var amount = documentSnapshot.data()['amount'];

            return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Row(
                        children: [
                          Text('Amount:',
                            style: TextStyle(color: kText),),
                          currentUser.currency == "INR"? Row(
                            children: [
                              Text("${cf.format(amount, CurrencyFormatter.inr)}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                            ],
                          ):
                          currentUser.currency == "EUR"?Row(
                            children: [
                              Text("${cf.format(amount, CurrencyFormatter.eur)}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                            ],
                          ):
                          currentUser.currency == "GBP"?Row(
                            children: [
                              Text("${cf.format(amount, CurrencyFormatter.gbp)}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                            ],
                          ):
                          Row(
                            children: [
                              Text("${cf.format(amount, CurrencyFormatter.usd)}",
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


                  ],
                )),
              );

          },
          query: FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id,)
              .collection('CommissionPayments')
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
            String amount = documentSnapshot.data()['amount'];

            var commission = documentSnapshot.data()['commission'];
            var payment = documentSnapshot.data()['payment'];
            var paymentGateway = documentSnapshot.data()['paymentGateway'];

            var conversion = documentSnapshot.data()['conversion'];
            var commissionPercent = documentSnapshot.data()['commissionPercent'];

            var paymentPercent = documentSnapshot.data()['paymentPercent'];
            var conversionPercent = documentSnapshot.data()['conversionPercent'];
            var totalC = documentSnapshot.data()['totalC'];

            var total = documentSnapshot.data()['total'];

            return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Row(
                          children: [
                            Text('Amount:',
                              style: TextStyle(color: kText),),
                            currentUser.currency == "INR"? Row(
                              children: [
                                Text("${cf.format(amount, CurrencyFormatter.inr)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            currentUser.currency == "EUR"?Row(
                              children: [
                                Text("${cf.format(amount, CurrencyFormatter.eur)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            currentUser.currency == "GBP"?Row(
                              children: [
                                Text("${cf.format(amount, CurrencyFormatter.gbp)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            Row(
                              children: [
                                Text("${cf.format(amount, CurrencyFormatter.usd)}",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            currentUser.currency == "INR"? Row(
                              children: [
                                Row(
                                  children: [
                                    Text('subtotal:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),Spacer(),
                                Text("${cf.format(totalC, CurrencyFormatter.inr)}",
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
                                    Text('subtotal:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),Spacer(),
                                Text("${cf.format(totalC, CurrencyFormatter.eur)}",
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
                                    Text('subtotal:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),Spacer(),
                                Text("${cf.format(totalC, CurrencyFormatter.gbp)}",
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
                                    Text('subtotal:',
                                      style: TextStyle(color: kText),),
                                  ],
                                ),Spacer(),
                                Text("${cf.format(totalC, CurrencyFormatter.usd)}",
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
                    ],
                  ),
                ),
              );

          },
          query: FirebaseFirestore.instance.collection('Payments')
              .doc(currentUser.id,)
              .collection('CommissionPayments')
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
        .collection('CommissionPayments').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }

}
