import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/OrderView.dart';
import 'package:fashow/invoiceview.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  shopOrders(){
return

    StreamBuilder(
        stream: Firestore.instance.collection('ordersCustomer')
            .document(currentUser.id)
            .collection('userOrder')
            .snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {

          if (!snapshot.hasData||snapshot.data == null) {
            return  Center(child: Text('No Orders',
              // style: TextStyle(
              //   fontFamily :"MajorMonoDisplay",
              //   fontSize:  35.0 ,
              //   color: Colors.white),
            )
            );
          } else  {
            return PaginateFirestore(
//    itemsPerPage: 2,
                itemBuilderType:
                PaginateBuilderType.listView,
                itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
                  String ownerId = documentSnapshot.data['ownerId'];
                  String prodId = documentSnapshot.data['prodId'];
                  String orderStatus = documentSnapshot.data['orderStatus'];
                  String size = documentSnapshot.data['size'];
                  String Address = documentSnapshot.data['Address'];
                  String orderId = documentSnapshot.data['orderId'];
                  String fulfilled = documentSnapshot.data['fulfilled'];

                  return
                    StreamBuilder(
                        stream: productsRef.document(ownerId).collection('userProducts').document(prodId).snapshots(),
                        // ignore: missing_return
                        builder: (context, snapshot) {

                          if (!snapshot.hasData|| snapshot.data == null) {
                            return  Center(child: Text('No Orders',
                              style: TextStyle(
                                  fontFamily :"MajorMonoDisplay",
                                  fontSize:  35.0 ,
                                  color: Colors.white),
                            )
                            );
                          } else  {
                            return new Expanded(child:ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot ds = snapshot.data.documents[index];
                                  return
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>  OrderView(orderId:orderId)));
                                          },
                                          child: ListTile(
                                            leading:CachedNetworkImage(imageUrl: ds['shopmediUrl'],),
                                            title: Text(ds['productname']),
                                            subtitle: Text(orderStatus),
                                          ),
                                        )
                                      ],
                                    );
                                }
                            ));
                            // ignore: unnecessary_statements
                          }
                        }
                    );

                },
                query:  Firestore.instance.collection('ordersCustomer')
                    .document(currentUser.id)
                    .collection('userOrder')
                    .orderBy('timestamp',descending: true)


            );
          }
        }
    );

  }
  jobOrders(){
  return  PaginateFirestore(
//    itemsPerPage: 2,
        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];
//
//           'advancepay':'false',
//           'finalpay':'false',
//           if(documentSnapshot.data['final']=="") {
//             return
//
//           }
          String ownerId = documentSnapshot.data['ownerId'];
          String prodId = documentSnapshot.data['prodId'];
          String orderStatus = documentSnapshot.data['orderStatus'];
          String size = documentSnapshot.data['size'];
          String Address = documentSnapshot.data['Address'];
          String orderId = documentSnapshot.data['orderId'];
           // String wnerId = documentSnapshot.data['ownerId'];

          String fulfilled = documentSnapshot.data['fulfilled'];
String advance = documentSnapshot.data['advance'];
String finall = documentSnapshot.data['final'];
String title = documentSnapshot.data['title'];
          if (!documentSnapshot.exists) {
            return  Center(child: Text('No Orders',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  fontSize:  35.0 ,
                  color: Colors.white),
            )
            );
          }else{
return  Column(
  children: [
    GestureDetector(
      onTap: () {print(orderId);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InvoiceView(orderId:orderId)));
        },
      child: ListTile(
        // leading:CachedNetworkImage(imageUrl: ds['shopmediUrl'],),
        title: Text(title),
        subtitle: Text(orderStatus),
      ),
    )
  ],
);}
            // StreamBuilder(
            //     stream: productsRef.document(ownerId).collection('userProducts').document(prodId).snapshots(),
            //     // ignore: missing_return
            //     builder: (context, snapshot) {
            //
            //       if (!snapshot.hasData) {
            //         return  Center(child: Text('',
            //           // style: TextStyle(
            //           //   fontFamily :"MajorMonoDisplay",
            //           //   fontSize:  35.0 ,
            //           //   color: Colors.white),
            //         )
            //         );
            //       } else  {
            //         return new ListView.builder(
            //             itemCount: snapshot.data.documents.length,
            //             itemBuilder: (context, index) {
            //               DocumentSnapshot ds = snapshot.data.documents[index];
            //               return
            //                 Column(
            //                   children: [
            //                     GestureDetector(
            //                       onTap:(){},
            //                       child: ListTile(
            //                         leading:CachedNetworkImage(imageUrl: ds['shopmediUrl'],),
            //                         title: Text(ds['productname']),
            //                         subtitle: Text(orderStatus),
            //                       ),
            //                     )
            //                   ],
            //                 );
            //             }
            //         );
            //         // ignore: unnecessary_statements
            //       }
            //     }
            // );

        },
        query:   Firestore.instance.collection('serviceCustomer')
        .document(currentUser.id)
        .collection('customerService')
            .orderBy('timestamp',descending: true)


    );
    // StreamBuilder(
    //     stream: Firestore.instance.collection('ordersCustomer')
    //         .document(currentUser.id)
    //         .collection('userOrder')
    //         .snapshots(),
    //     // ignore: missing_return
    //     builder: (context, snapshot) {
    //
    //       if (!snapshot.hasData) {
    //         return  Center(child: Text('',
    //           // style: TextStyle(
    //           //   fontFamily :"MajorMonoDisplay",
    //           //   fontSize:  35.0 ,
    //           //   color: Colors.white),
    //         )
    //         );
    //       } else  {
    //         return new ListView.builder(
    //             itemCount: snapshot.data.documents.length,
    //             itemBuilder: (context, index) {
    //               DocumentSnapshot ds = snapshot.data.documents[index];
    //               return
    //
    //             }
    //         );
    //         // ignore: unnecessary_statements
    //       }
    //     }
    // ),

  }
  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar:  AppBar(backgroundColor: kSecondaryColor,
        title: Text('My Orders',
          style: TextStyle(
              fontFamily :"MajorMonoDisplay",
              fontSize:  35.0 ,
              color: Colors.white),),
        iconTheme: new IconThemeData(color: kIcon),
      ),
      backgroundColor: kPrimaryColor,

      body:
      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: ContainedTabBarView(
          tabs: [
            Text('Shop',style:TextStyle(color:kText)),
            Text('Services',style:TextStyle(color:kText)),
          ],
          views: [
            shopOrders(),
            jobOrders(),
          ],

          // child: Column(
          //   children: <Widget>[shopOrders(),
          //   ],
          // ),
        ),
      ),
);
  }
}
