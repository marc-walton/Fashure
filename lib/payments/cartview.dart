import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/payments/payment.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashow/HomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  var total = 0;
  SharedPreferences adPrefs;
  GetAddress() async{
    adPrefs = await SharedPreferences.getInstance();
    String Fullname = adPrefs.getString('fullname') ?? '';
    String Type = adPrefs.getString('type') ?? '';
    String Addresss = adPrefs.getString('address') ?? '';
    String City = adPrefs.getString('city') ?? '';
    String State = adPrefs.getString('state') ?? '';
    String Zip = adPrefs.getString('zip') ?? '';
    String Phone = adPrefs.getString('phone') ?? '';
    String Country = adPrefs.getString('countr') ?? '';
    String Code = adPrefs.getString('code') ?? '';
    return
      ListView(children: [
        Card(
          child: Expanded(
            child:  new  Column(children: <Widget>[
              Text(Type),
              Text(Fullname),
              Text(Addresss),
              Text(City),
              Text(State),
              Text(Country),
              Text(Zip),
              Row(
                children: [
                  Text(Code),
                  Text(Phone),

                ],
              ),

              Divider(color: kGrey,),
            ],

            ),
          ),
        )

    ],
      );
  }
  GetTotal()async {
    if(currentUser.country=='Europe') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += int.parse(doc.data['eur']);
        });
      });
      return total.toString();
    }
    else  if(currentUser.country=='India') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += int.parse(doc.data['inr']);
        });
      });
      return total.toString();
    }
    else  if(currentUser.country=='UK') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState((){
          total += int.parse(doc.data['gbp']);

        });
      });
      return total.toString();
    }
    else if(currentUser.country=='China') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += int.parse(doc.data['cny']);
        });
      });
      return total.toString();
    }
    else if(currentUser.country=='USA') {
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += int.parse(doc.data['usd']);
        });
      });
      return total.toString();
    }
    else{
      QuerySnapshot snapshot = await Firestore.instance.collection('cart')
          .document(currentUser.id)
          .collection('userCart')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      snapshot.documents.forEach((doc) {
        setState(() {
          total += int.parse(doc.data['usd']);
        });
      });
      return total.toString();
    }
  }
    ProdTile(){
      if(currentUser.country=='Europe'){
        StreamBuilder(
          stream: cartRef.document(currentUser.id)
              .collection('userCart')
              .orderBy('timestamp', descending:true)
              .snapshots(),
          // ignore: missing_return
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return  Center(child: Text('',style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  fontSize:  35.0 ,
                  color: Colors.white),));
            } else  {
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return new  Card(
                      child: Expanded(
                        child: Column(children: [
                          Text(ds['productname'],style: TextStyle(color: kText)),
                          Row(
                            children: [
                              CircleAvatar(backgroundImage: ds['photoUrl'],),
                              Text(ds['username'],style: TextStyle(color: kText)),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              height:  MediaQuery.of(context).size.height * 0.20,
                              child: ListTile(
                                leading:ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: ds['shopmediaUrl'],)),

                                trailing: Column(
                                  children: [

                                    Row(
                                      children: [
                                        Text('Size:', style: TextStyle(color: kText,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold)),
                                        Text(ds['userSize'], style: TextStyle(color: kText,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text( ds['eur']),

                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],),
                      ),
                      // count: snapshot.data.documents.length,
                      // shopmediaUrl: ds['shopmediaUrl'],
                      // productname: ds['productname'],
                      // eur: ds['eur'],
                      // usd : ds['usd'],
                      // inr: ds['inr'],
                      // cny: ds['cny'],
                      // gbp: ds['gbp'],
                      // photoUrl: ds['photoUrl'],
                      // username: ds['username'],
                      // prodId: ds['prodId'],
                      // userId: ds['userId'],
                      // ownerId: ds['ownerId'],
                      // userSize: ds['userSize'],

                    );
                  }
              );
              // ignore: unnecessary_statements
            }
          }
      );}
      else if (currentUser.country == 'India'){
        StreamBuilder(
            stream: cartRef.document(currentUser.id)
                .collection('userCart')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return  Center(child: Text('text',style: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  35.0 ,
                    color: Colors.white),));
              } else  {
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new  Card(
                        child: Expanded(
                          child: Column(children: [
                            Text(ds['productname'],style: TextStyle(color: kText)),
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: ds['photoUrl'],),
                                Text(ds['username'],style: TextStyle(color: kText)),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height:  MediaQuery.of(context).size.height * 0.20,
                                child: ListTile(
                                  leading:ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: ds['shopmediaUrl'],)),

                                  trailing: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Text('Size:', style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                          Text(ds['userSize'], style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text( ds['inr']),

                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],),
                        ),
                        // count: snapshot.data.documents.length,
                        // shopmediaUrl: ds['shopmediaUrl'],
                        // productname: ds['productname'],
                        // eur: ds['eur'],
                        // usd : ds['usd'],
                        // inr: ds['inr'],
                        // cny: ds['cny'],
                        // gbp: ds['gbp'],
                        // photoUrl: ds['photoUrl'],
                        // username: ds['username'],
                        // prodId: ds['prodId'],
                        // userId: ds['userId'],
                        // ownerId: ds['ownerId'],
                        // userSize: ds['userSize'],

                      );
                    }
                );
                // ignore: unnecessary_statements
              }
            }
        );
      }
      else if (currentUser.country == 'UK'){
        StreamBuilder(
            stream: cartRef.document(currentUser.id)
                .collection('userCart')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return  Center(child: Text('text',style: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  35.0 ,
                    color: Colors.white),));
              } else  {
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new  Card(
                        child: Expanded(
                          child: Column(children: [
                            Text(ds['productname'],style: TextStyle(color: kText)),
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: ds['photoUrl'],),
                                Text(ds['username'],style: TextStyle(color: kText)),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height:  MediaQuery.of(context).size.height * 0.20,
                                child: ListTile(
                                  leading:ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: ds['shopmediaUrl'],)),

                                  trailing: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Text('Size:', style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                          Text(ds['userSize'], style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text( ds['gbp']),

                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],),
                        ),
                        // count: snapshot.data.documents.length,
                        // shopmediaUrl: ds['shopmediaUrl'],
                        // productname: ds['productname'],
                        // eur: ds['eur'],
                        // usd : ds['usd'],
                        // inr: ds['inr'],
                        // cny: ds['cny'],
                        // gbp: ds['gbp'],
                        // photoUrl: ds['photoUrl'],
                        // username: ds['username'],
                        // prodId: ds['prodId'],
                        // userId: ds['userId'],
                        // ownerId: ds['ownerId'],
                        // userSize: ds['userSize'],

                      );
                    }
                );
                // ignore: unnecessary_statements
              }
            }
        );
      }
      else if (currentUser.country == 'China'){
        StreamBuilder(
            stream: cartRef.document(currentUser.id)
                .collection('userCart')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return  Center(child: Text('text',style: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  35.0 ,
                    color: Colors.white),));
              } else  {
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new  Card(
                        child: Expanded(
                          child: Column(children: [
                            Text(ds['productname'],style: TextStyle(color: kText)),
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: ds['photoUrl'],),
                                Text(ds['username'],style: TextStyle(color: kText)),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height:  MediaQuery.of(context).size.height * 0.20,
                                child: ListTile(
                                  leading:ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: ds['shopmediaUrl'],)),

                                  trailing: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Text('Size:', style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                          Text(ds['userSize'], style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text( ds['cny']),

                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],),
                        ),
                        // count: snapshot.data.documents.length,
                        // shopmediaUrl: ds['shopmediaUrl'],
                        // productname: ds['productname'],
                        // eur: ds['eur'],
                        // usd : ds['usd'],
                        // inr: ds['inr'],
                        // cny: ds['cny'],
                        // gbp: ds['gbp'],
                        // photoUrl: ds['photoUrl'],
                        // username: ds['username'],
                        // prodId: ds['prodId'],
                        // userId: ds['userId'],
                        // ownerId: ds['ownerId'],
                        // userSize: ds['userSize'],

                      );
                    }
                );
                // ignore: unnecessary_statements
              }
            }
        );
      }
      else if (currentUser.country == 'USA'){
        StreamBuilder(
            stream: cartRef.document(currentUser.id)
                .collection('userCart')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return  Center(child: Text('text',style: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  35.0 ,
                    color: Colors.white),));
              } else  {
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new  Card(
                        child: Expanded(
                          child: Column(children: [
                            Text(ds['productname'],style: TextStyle(color: kText)),
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: ds['photoUrl'],),
                                Text(ds['username'],style: TextStyle(color: kText)),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height:  MediaQuery.of(context).size.height * 0.20,
                                child: ListTile(
                                  leading:ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: ds['shopmediaUrl'],)),

                                  trailing: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Text('Size:', style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                          Text(ds['userSize'], style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text( ds['usd']),

                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],),
                        ),
                        // count: snapshot.data.documents.length,
                        // shopmediaUrl: ds['shopmediaUrl'],
                        // productname: ds['productname'],
                        // eur: ds['eur'],
                        // usd : ds['usd'],
                        // inr: ds['inr'],
                        // cny: ds['cny'],
                        // gbp: ds['gbp'],
                        // photoUrl: ds['photoUrl'],
                        // username: ds['username'],
                        // prodId: ds['prodId'],
                        // userId: ds['userId'],
                        // ownerId: ds['ownerId'],
                        // userSize: ds['userSize'],

                      );
                    }
                );
                // ignore: unnecessary_statements
              }
            }
        );
      }
      else{
        StreamBuilder(
            stream: cartRef.document(currentUser.id)
                .collection('userCart')
                .orderBy('timestamp', descending:true)
                .snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return  Center(child: Text('text',style: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  35.0 ,
                    color: Colors.white),));
              } else  {
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new  Card(
                        child: Expanded(
                          child: Column(children: [
                            Text(ds['productname'],style: TextStyle(color: kText)),
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: ds['photoUrl'],),
                                Text(ds['username'],style: TextStyle(color: kText)),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height:  MediaQuery.of(context).size.height * 0.20,
                                child: ListTile(
                                  leading:ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: ds['shopmediaUrl'],)),

                                  trailing: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Text('Size:', style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                          Text(ds['userSize'], style: TextStyle(color: kText,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text( ds['usd']),

                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],),
                        ),
                        // count: snapshot.data.documents.length,
                        // shopmediaUrl: ds['shopmediaUrl'],
                        // productname: ds['productname'],
                        // eur: ds['eur'],
                        // usd : ds['usd'],
                        // inr: ds['inr'],
                        // cny: ds['cny'],
                        // gbp: ds['gbp'],
                        // photoUrl: ds['photoUrl'],
                        // username: ds['username'],
                        // prodId: ds['prodId'],
                        // userId: ds['userId'],
                        // ownerId: ds['ownerId'],
                        // userSize: ds['userSize'],

                      );
                    }
                );
                // ignore: unnecessary_statements
              }
            }
        );
      }

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(backgroundColor: kSecondaryColor,
        title: FittedBox(fit: BoxFit.contain,
        child: Text('Order Summary',style: TextStyle(
            // fontFamily :"MajorMonoDisplay",
            color: Colors.white),),
      ),),
      body: ListView(
        children: [
          GetAddress(),
          ProdTile(),
          Card(child: Column(
            children: [
              Text('Total Amount',style:TextStyle(
            // fontFamily :"MajorMonoDisplay",
              color: Colors.white),),
           Text('$total',style:TextStyle(
            // fontFamily :"MajorMonoDisplay",
             fontWeight: FontWeight.bold,
              color: Colors.white),),
            BottomAppBar(
              color: Colors.transparent,
              child: Row(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Payment()));

                    },
                    color: kblue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    child: Text('PROCEED TO PAY', style: TextStyle(color: kText),),
                  ),
                ],
              ),
            ),
              ],
          ),)
        ],
      ),
    );
  }
}
