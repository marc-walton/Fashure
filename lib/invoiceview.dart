import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/model/address.dart';
import 'package:fashow/model/adressservice.dart';
import 'package:fashow/payments/Servicepayment.dart';
import 'package:fashow/user.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/progress.dart';
import 'package:uuid/uuid.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter/cupertino.dart';
import 'package:fashow/invoice.dart';

// class InvoiceView extends StatefulWidget {
//   final String orderId;
//
//   const InvoiceView({Key key, this.orderId}) : super(key: key);
//
//   @override
//   _InvoiceViewState createState() => _InvoiceViewState();
// }
//
// class _InvoiceViewState extends State<InvoiceView> {
//   String advancebool;
//   String finalbool;
//   String address;
// String advance;
// String due;
//   String reviewId = Uuid().v4();
//   TextEditingController reviewController = TextEditingController();
//
//   var rating = 0.0;
//   currency({String advance,String finalpay}){
//     if(currentUser.country == 'India'){
//       Text('Advance payment: ₹$advance');
//       SizedBox( height: 8.0,);
//       Text('Payment on delivery: ₹$finalpay');
//     }
//     else if (currentUser.country == 'China'){
//       Text('Advance payment: ¥$advance');
//
//       SizedBox( height: 8.0,);
//       Text('Payment on delivery: ¥$finalpay');
//     }
//     else if(currentUser.country=='US'){
//
//     Text('Advance payment: \u0024$advance');
//      SizedBox( height: 8.0,);
//     Text('Payment on delivery: \u0024$advance');
//     }
//     else if(currentUser.country=='Europe'){
//       Text('Advance payment: €$advance');
//       SizedBox( height: 8.0,);
//       Text('Payment on delivery: €$finalpay');
//
//     }
//     else if(currentUser.country=='UK'){
//     Text('Advance payment: £$advance');
//     SizedBox( height: 8.0,);
//     Text('Payment on delivery: £$finalpay');
//     }
//     else{
//
//       Text('Advance payment: \u0024$advance');
//       SizedBox( height: 8.0,);
//       Text('Payment on delivery: \u0024$advance');
//     }
//   }
// paymentbutton({String amount,String due,String custId,String cusName,String cusImg,String ownerId,String orderId}){
//     //installment
//     if(advancebool == 'false'||finalbool == 'false'|| address == "") {
//       Center(
//         child: RaisedButton(
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
//               OrderId: orderId,
//               cusId: custId,
//               username: cusName,
//               profileimg: cusImg,)));
//
//           },
//           color: kblue,
//           child: Text('Pay Advance',style: TextStyle(
//               color: Colors.white),),
//         ),
//       );
//     }
//     //one-time payment
//     if(advancebool == 'false'||finalbool == 'true'|| address == "") {
//       Center(
//         child: RaisedButton(
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
//             OrderId: orderId,
//               cusId: custId,
//               username: cusName,
//               profileimg: cusImg,
//             )));
//
//           },
//           color: kblue,
//           child: Text('Pay Now',style: TextStyle(
//               color: Colors.white),),
//         ),
//       );
//     }
//     if(advancebool == 'true'||finalbool == 'false')
//     {
//       Center(
//         child: RaisedButton(
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSer(Amount:due,OrderId: orderId,
//             OwnerId: ownerId,profileimg: cusImg,username: cusName,)));
//
//           },
//           color: kblue,
//           child: Text('Pay Due',style: TextStyle(
//               color: Colors.white),),
//         ),
//       );
//     }
//
//
// }
//   Rating({String fulfill,String OwnerId}){
//     if(fulfill=='true') {
//       Center(
//         child: Column(
//           children:[
//             Text('Please rate the order',style: TextStyle(
//                 color: Colors.white),),
//             SmoothStarRating(
//               allowHalfRating: true,
//               filledIconData: Icons.blur_off,
//               halfFilledIconData: Icons.blur_on,
//               rating: rating,
//               size: 35,
//               starCount: 5,
//               onRated: (value) {
//                 setState(() {
//                   rating = value;
//                 });
//               },
//             ),
//
//             TextField(
//               controller: reviewController,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                 labelText: 'Review',labelStyle: TextStyle(color: kText),
//                 hintText: 'Review',
//               ),
//               textAlign: TextAlign.start,
//             )
//           ],
//         ),
//       );
//       Firestore.instance.collection('Reviews')
//           .document(OwnerId).collection('userReviews').document(reviewId)
//           .setData({
//         'userId': OwnerId,
//         'rating': rating,
//         'review':reviewController.text,
//         'reviewId' : reviewId
//       });
//       Firestore.instance.collection('feed')
//           .document(OwnerId)
//           .collection('feedItems')
//           .document(reviewId)
//           .setData({
//         "type": "ReviewC",
//         "username": currentUser.username,
//         "userId": OwnerId,
//         "userProfileImg": currentUser.photoUrl,
//         "postId": reviewId,
//         // "mediaUrl": mediaUrl,
//         "timestamp": timestamp,
//         "read": 'false',
//         'message':'You received an order!',
//       });
//     }
//     else{return
//       Text('');}
//   }
// // views(){
// //     return
// //   PaginateFirestore(
// // //    itemsPerPage: 2,
// //       itemBuilderType:
// //       PaginateBuilderType.listView,
// //       itemBuilder: (index, context, documentSnapshot)   {
// // //        DocumentSnapshot ds = snapshot.data.documents[index];
// //         String ownerId = documentSnapshot.data['ownerId'];
// //         String prodId = documentSnapshot.data['prodId'];
// //         String shopmediaUrl = documentSnapshot.data['shopmediaUrl'];
// //         String productname = documentSnapshot.data['productname'];
// //         String inr = documentSnapshot.data['inr'];
// //         String cny = documentSnapshot.data['cny'];
// //         String usd = documentSnapshot.data['usd'];
// //         String eur = documentSnapshot.data['eur'];
// //         String gbp = documentSnapshot.data['gbp'];
// //         return
// //           FutureBuilder(
// //             future: usersRef.document(ownerId).get(),
// //             builder: (context, snapshot) {
// //               if (!snapshot.hasData) {
// //                 return circularProgress();
// //               }
// //               User user = User.fromDocument(snapshot.data);
// // //          bool isPostOwner = currentUserId == ownerId;
// //               return Column(
// //                 children: <Widget>[
// //                   GestureDetector(
// //                     onTap: () => showProfile(context, profileId: user.id),
// //                     child: ListTile(
// //                       leading: CircleAvatar(
// //                         backgroundImage: CachedNetworkImageProvider(user.photoUrl),
// //                         backgroundColor: Colors.grey,
// //                       ),
// //                       title: Text(
// //                         user.displayName,
// //                         style: TextStyle(
// //                           color: kText,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       subtitle: Text(user.username,
// //                         style: TextStyle(color: kIcon),),),
// //                   ),
// //
// //                   GestureDetector(
// //                     onTap: () => Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => ProductScreen(
// //                           prodId: prodId,
// //                           userId: ownerId,
// //                         ),
// //                       ),
// //                     ),
// //                     child: Stack(
// //                       alignment: Alignment.center,
// //                       children: <Widget>[
// //                         ClipRRect(
// //                             borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
// //                       ],),),
// //                   df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
// //
// //                   Divider(color: kGrey,),
// //                 ],
// //
// //               );
// //
// //             },
// //           );
// //       },
// //       query: Firestore.instance.collection('serviceCustomer')
// //           .document(currentUser.id)
// //           .collection('customerService')
// //           .document(widget.orderId).orderBy('timestamp',descending: true)
// //
// //   );
// // }
//   invoicefire(){
//     return
//       StreamBuilder(
//         stream: Firestore.instance.collection('serviceCustomer')
//             .document(currentUser.id)
//             .collection('customerService')
//         .document(widget.orderId)
//             .snapshots(),
//         builder: (context, snapshot) {
//
//           if (!snapshot.hasData) {
//             return circularProgress();
//           }
//           else if(currentUser.country == 'India'){
//             return
//             ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (context, index) {
//                   DocumentSnapshot ds = snapshot.data.documents[index];
//                   return new View(
//                    title: ds['title'],
//                    description:ds['description'],
//                    cusid:ds['cusId'],
//                    Address:ds['Address'],
//                    advancepay:ds['advancepay'],
//                    finalpay:ds['finalpay'],
//                    fulfilled:ds['fulfilled'],
//                    ordersstatus:ds['orderStatus'],
//                     orderId: ds['orderId'],
//                     advance:ds['inr'],
//                     due:ds['Finr'],
//                     ownerId: ds['ownerId'],
//                      cusName: ds['cusName'],
//                      cusImg: ds['cusImg'],
//
//                   );
//                 }
//             );
//
//           }
//           else if(currentUser.country == 'Europe'){
//             return
//               ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.documents[index];
//                     return new View(
//                       title: ds['title'],
//                       description:ds['description'],
//                       cusid:ds['cusId'],
//                       Address:ds['Address'],
//                       advancepay:ds['advancepay'],
//                       finalpay:ds['finalpay'],
//                       fulfilled:ds['fulfilled'],
//                       ordersstatus:ds['orderStatus'],
//                       orderId: ds['orderId'],
//                       advance:ds['eur'],
//                       due:ds['Feur'],
//                       ownerId: ds['ownerId'],
//                       cusName: ds['cusName'],
//                       cusImg: ds['cusImg'],
//
//                     );
//                   }
//               );
//
//           }
//           else if(currentUser.country == 'UK'){
//             return
//               ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.documents[index];
//                     return new View(
//                       title: ds['title'],
//                       description:ds['description'],
//                       cusid:ds['cusId'],
//                       Address:ds['Address'],
//                       advancepay:ds['advancepay'],
//                       finalpay:ds['finalpay'],
//                       fulfilled:ds['fulfilled'],
//                       ordersstatus:ds['orderStatus'],
//                       orderId: ds['orderId'],
//                       advance:ds['gbp'],
//                       due:ds['Fgbp'],
//                       ownerId: ds['ownerId'],
//                       cusName: ds['cusName'],
//                       cusImg: ds['cusImg'],
//
//                     );
//                   }
//               );
//
//           }
//           // ignore: missing_return
//           else if(currentUser.country == 'USA'){
//             return
//               ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.documents[index];
//                     return new View(
//                       title: ds['title'],
//                       description:ds['description'],
//                       cusid:ds['cusId'],
//                       Address:ds['Address'],
//                       advancepay:ds['advancepay'],
//                       finalpay:ds['finalpay'],
//                       fulfilled:ds['fulfilled'],
//                       ordersstatus:ds['orderStatus'],
//                       orderId: ds['orderId'],
//                       advance:ds['usd'],
//                       due:ds['Fusd'],
//                       ownerId: ds['ownerId'],
//                       cusName: ds['cusName'],
//                       cusImg: ds['cusImg'],
//
//                     );
//                   }
//               );
//
//           }
//           else {
//             return
//               ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.documents[index];
//                     return new View(
//                       title: ds['title'],
//                       description:ds['description'],
//                       cusid:ds['cusId'],
//                       Address:ds['Address'],
//                       advancepay:ds['advancepay'],
//                       finalpay:ds['finalpay'],
//                       fulfilled:ds['fulfilled'],
//                       ordersstatus:ds['orderStatus'],
//                       orderId: ds['orderId'],
//                       advance:ds['usd'],
//                       due:ds['Fusd'],
//                       ownerId: ds['ownerId'],
//                       cusName: ds['cusName'],
//                       cusImg: ds['cusImg'],
//
//                     );
//                   }
//               );
//
//           }
//
//           // DocumentSnapshot ds = snapshot.data.documents[index];
// //           return new ListView.builder(
// //               itemCount: 1,
// //               itemBuilder: (context, index) {
// //                 DocumentSnapshot ds = snapshot.data.documents[index];
// //                 setState(() {
// //                   advancebool = ds['advancepay'];
// //                   finalbool = ds['finalpay'];
// //                   address = ds['Address'];
// //                   if(currentUser.country == 'India'){
// //                     if(ds['Finr'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['inr'];
// //                       due = ds['Finr'];
// //                     });
// //                   }
// //                    if(currentUser.country == 'UK'){
// //                     if(ds['Fgbp'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['gbp'];
// //                       due = ds['Fgbp'];
// //                     });
// //                   }
// //                    if(currentUser.country == 'USA'){
// //                     if(ds['Fusd'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['usd'];
// //                       due = ds['Fusd'];
// //                     });
// //                   }
// // if(currentUser.country == 'Europe'){
// //                     if(ds['Feur'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['eur'];
// //                       due = ds['Feur'];
// //                     });
// //                   }
// // if(currentUser.country == 'China'){
// //                     if(ds['Fcny'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['cny'];
// //                       due = ds['Fcny'];
// //                     });
// //                   }
// // else {
// //   if(ds['Fusd'] == '0'){
// //     Firestore.instance.collection('serviceCustomer')
// //         .document(ds['ownerId'])
// //         .collection('customerService')
// //         .document(ds['orderId'])
// //         .updateData({
// //       'finalpay':'true',
// //     });
// //     Firestore.instance.collection('serviceSeller')
// //         .document(currentUser.id)
// //         .collection('sellerService')
// //         .document(ds['orderId'])
// //         .updateData({
// //       'finalpay':'true',
// //     });
// //   }
// //   setState(() {
// //     advance = ds['usd'];
// //     due = ds['Fusd'];
// //   });
// // }
// //
// //                   // if(ds['final'] == '0'){
// //                   //   Firestore.instance.collection('serviceCustomer')
// //                   //       .document(ds['ownerId'])
// //                   //       .collection('customerService')
// //                   //       .document(ds['orderId'])
// //                   //       .updateData({
// //                   //     'finalpay':'true',
// //                   //   });
// //                   //   Firestore.instance.collection('serviceSeller')
// //                   //       .document(currentUser.id)
// //                   //       .collection('sellerService')
// //                   //       .document(ds['orderId'])
// //                   //       .setData({
// //                   //     'finalpay':'true',
// //                   //   });
// //                   // }
// //
// //                 });
// //              return
// //                Column(
// //                  children: <Widget>[
// //                    Rating(OwnerId: ds['ownerId'],fulfill: ds['fulfilled']),
// //                 FutureBuilder(
// //                 future: usersRef.document(ds['ownerId']).get(),
// //                 builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                 return circularProgress();
// //                 }
// //                 User user = User.fromDocument(snapshot.data);
// // //          bool isPostOwner = currentUserId == ownerId;
// //                 return Column(
// //                 children: <Widget>[
// //                 GestureDetector(
// //                 onTap: () => showProfile(context, profileId: user.id),
// //                 child: ListTile(
// //                 leading: CircleAvatar(
// //                 backgroundImage: CachedNetworkImageProvider(user.photoUrl),
// //                 backgroundColor: Colors.grey,
// //                 ),
// //                 title: Text(
// //                 user.displayName,
// //                 style: TextStyle(
// //                 color: kText,
// //                 fontWeight: FontWeight.bold,
// //                 ),
// //                 ),
// //                 subtitle: Text(user.username,
// //                 style: TextStyle(color: kIcon),),),
// //                 ),
// //
// //                 Divider(color: kGrey,),
// //                 ],
// //
// //                 );
// //
// //                 },
// //                 ),
// //                    Text( ds['title']   ,style: TextStyle(
// //                        color: Colors.white),),
// //                       Text( 'Description: ${ds['description']}'   ,style: TextStyle(
// //                        color: Colors.white),),
// //                         Text('order Status: ${ds['orderStatus']}'   ,style: TextStyle(
// //                        color: Colors.white),),
// //                       Text('Address: ${ds['Address']}',style: TextStyle(
// //                        color: Colors.white),),
// //
// //                      currency(advance: advance,finalpay: due),
// //                    Text('Total:${ int.parse(advance) + int.parse(due)}'  ,style: TextStyle(
// //                        color: Colors.white),),
// //                    paymentbutton(amount: advance,due: due,
// //                        ownerId:ds['ownerId'],
// //                        cusName:ds['username'] ,
// //                    cusImg:ds['photoUrl'] ),
// //                      // 'ownerId':widget.reciever,
// //                      // 'orderId':orderId,
// //                      // 'fulfilled':'false',
// //                      // 'orderStatus':'Processing',
// //                      // 'advance':advanceController.text,
// //                      // 'final':totalController.text ?? "",
// //                      // 'description':detailsController.text,
// //                      // 'advancepay':'false',
// //                      // 'finalpay':'false',
// //
// //                  ],
// //                );
// //               }
// //           );
//           });
//
//         }
//
//   @override
//   Widget build(BuildContext context) {
//     return       Scaffold(
//       appBar:  AppBar(backgroundColor: kSecondaryColor,
//         title: FittedBox(
//         child: Text('Customer invoice',
//             style: TextStyle(
//                 fontFamily :"MajorMonoDisplay",
//                 color: Colors.white),
//           ),
//         ),
//         iconTheme: new IconThemeData(color: kIcon),
//       ),
//       backgroundColor: kPrimaryColor,
//
//       body:
//       // ListView(
//       //   children: [
//       //   ],
//       // ),
//       StreamBuilder(
//           stream: Firestore.instance.collection('serviceCustomer')
//               .document(currentUser.id)
//               .collection('customerService')
//               .document(widget.orderId)
//               .snapshots(),
//           builder: (context, snapshot) {
//
//             if (!snapshot.hasData) {
//               return circularProgress();
//             }
//             else if(currentUser.country == 'India'){
//               return
//                 ListView.builder(
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot ds = snapshot.data.documents[index];
//                       return new View(
//                         title: ds['title'],
//                         description:ds['description'],
//                         cusid:ds['cusId'],
//                         Address:ds['Address'],
//                         advancepay:ds['advancepay'],
//                         finalpay:ds['finalpay'],
//                         fulfilled:ds['fulfilled'],
//                         ordersstatus:ds['orderStatus'],
//                         orderId: ds['orderId'],
//                         advance:ds['inr'],
//                         due:ds['Finr'],
//                         ownerId: ds['ownerId'],
//                         cusName: ds['cusName'],
//                         cusImg: ds['cusImg'],
//
//                       );
//                     }
//                 );
//
//             }
//             else if(currentUser.country == 'Europe'){
//               return
//                 ListView.builder(
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot ds = snapshot.data.documents[index];
//                       return new View(
//                         title: ds['title'],
//                         description:ds['description'],
//                         cusid:ds['cusId'],
//                         Address:ds['Address'],
//                         advancepay:ds['advancepay'],
//                         finalpay:ds['finalpay'],
//                         fulfilled:ds['fulfilled'],
//                         ordersstatus:ds['orderStatus'],
//                         orderId: ds['orderId'],
//                         advance:ds['eur'],
//                         due:ds['Feur'],
//                         ownerId: ds['ownerId'],
//                         cusName: ds['cusName'],
//                         cusImg: ds['cusImg'],
//
//                       );
//                     }
//                 );
//
//             }
//             else if(currentUser.country == 'UK'){
//               return
//                 ListView.builder(
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot ds = snapshot.data.documents[index];
//                       return new View(
//                         title: ds['title'],
//                         description:ds['description'],
//                         cusid:ds['cusId'],
//                         Address:ds['Address'],
//                         advancepay:ds['advancepay'],
//                         finalpay:ds['finalpay'],
//                         fulfilled:ds['fulfilled'],
//                         ordersstatus:ds['orderStatus'],
//                         orderId: ds['orderId'],
//                         advance:ds['gbp'],
//                         due:ds['Fgbp'],
//                         ownerId: ds['ownerId'],
//                         cusName: ds['cusName'],
//                         cusImg: ds['cusImg'],
//
//                       );
//                     }
//                 );
//
//             }
//             // ignore: missing_return
//             else if(currentUser.country == 'USA'){
//               return new View(
//                 title: snapshot.data['title'],
//                 description:snapshot.data['description'],
//                 cusid:snapshot.data['cusId'],
//                 Address:snapshot.data['Address'],
//                 advancepay:snapshot.data['advancepay'],
//                 finalpay:snapshot.data['finalpay'],
//                 fulfilled:snapshot.data['fulfilled'],
//                 ordersstatus:snapshot.data['orderStatus'],
//                 orderId: snapshot.data['orderId'],
//                 advance:snapshot.data['usd'],
//                 due:snapshot.data['Fusd'],
//                 ownerId: snapshot.data['ownerId'],
//                 cusName: snapshot.data['cusName'],
//                 cusImg: snapshot.data['cusImg'],
//
//               );
//             }
//             else {
//               return
//                 ListView.builder(
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot ds = snapshot.data.documents[index];
//                       return new View(
//                         title: ds['title'],
//                         description:ds['description'],
//                         cusid:ds['cusId'],
//                         Address:ds['Address'],
//                         advancepay:ds['advancepay'],
//                         finalpay:ds['finalpay'],
//                         fulfilled:ds['fulfilled'],
//                         ordersstatus:ds['orderStatus'],
//                         orderId: ds['orderId'],
//                         advance:ds['usd'],
//                         due:ds['Fusd'],
//                         ownerId: ds['ownerId'],
//                         cusName: ds['cusName'],
//                         cusImg: ds['cusImg'],
//
//                       );
//                     }
//                 );
//
//             }
//
//             // DocumentSnapshot ds = snapshot.data.documents[index];
// //           return new ListView.builder(
// //               itemCount: 1,
// //               itemBuilder: (context, index) {
// //                 DocumentSnapshot ds = snapshot.data.documents[index];
// //                 setState(() {
// //                   advancebool = ds['advancepay'];
// //                   finalbool = ds['finalpay'];
// //                   address = ds['Address'];
// //                   if(currentUser.country == 'India'){
// //                     if(ds['Finr'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['inr'];
// //                       due = ds['Finr'];
// //                     });
// //                   }
// //                    if(currentUser.country == 'UK'){
// //                     if(ds['Fgbp'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['gbp'];
// //                       due = ds['Fgbp'];
// //                     });
// //                   }
// //                    if(currentUser.country == 'USA'){
// //                     if(ds['Fusd'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['usd'];
// //                       due = ds['Fusd'];
// //                     });
// //                   }
// // if(currentUser.country == 'Europe'){
// //                     if(ds['Feur'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['eur'];
// //                       due = ds['Feur'];
// //                     });
// //                   }
// // if(currentUser.country == 'China'){
// //                     if(ds['Fcny'] == '0'){
// //                       Firestore.instance.collection('serviceCustomer')
// //                           .document(ds['ownerId'])
// //                           .collection('customerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                       Firestore.instance.collection('serviceSeller')
// //                           .document(currentUser.id)
// //                           .collection('sellerService')
// //                           .document(ds['orderId'])
// //                           .updateData({
// //                         'finalpay':'true',
// //                       });
// //                     }
// //                     setState(() {
// //                       advance = ds['cny'];
// //                       due = ds['Fcny'];
// //                     });
// //                   }
// // else {
// //   if(ds['Fusd'] == '0'){
// //     Firestore.instance.collection('serviceCustomer')
// //         .document(ds['ownerId'])
// //         .collection('customerService')
// //         .document(ds['orderId'])
// //         .updateData({
// //       'finalpay':'true',
// //     });
// //     Firestore.instance.collection('serviceSeller')
// //         .document(currentUser.id)
// //         .collection('sellerService')
// //         .document(ds['orderId'])
// //         .updateData({
// //       'finalpay':'true',
// //     });
// //   }
// //   setState(() {
// //     advance = ds['usd'];
// //     due = ds['Fusd'];
// //   });
// // }
// //
// //                   // if(ds['final'] == '0'){
// //                   //   Firestore.instance.collection('serviceCustomer')
// //                   //       .document(ds['ownerId'])
// //                   //       .collection('customerService')
// //                   //       .document(ds['orderId'])
// //                   //       .updateData({
// //                   //     'finalpay':'true',
// //                   //   });
// //                   //   Firestore.instance.collection('serviceSeller')
// //                   //       .document(currentUser.id)
// //                   //       .collection('sellerService')
// //                   //       .document(ds['orderId'])
// //                   //       .setData({
// //                   //     'finalpay':'true',
// //                   //   });
// //                   // }
// //
// //                 });
// //              return
// //                Column(
// //                  children: <Widget>[
// //                    Rating(OwnerId: ds['ownerId'],fulfill: ds['fulfilled']),
// //                 FutureBuilder(
// //                 future: usersRef.document(ds['ownerId']).get(),
// //                 builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                 return circularProgress();
// //                 }
// //                 User user = User.fromDocument(snapshot.data);
// // //          bool isPostOwner = currentUserId == ownerId;
// //                 return Column(
// //                 children: <Widget>[
// //                 GestureDetector(
// //                 onTap: () => showProfile(context, profileId: user.id),
// //                 child: ListTile(
// //                 leading: CircleAvatar(
// //                 backgroundImage: CachedNetworkImageProvider(user.photoUrl),
// //                 backgroundColor: Colors.grey,
// //                 ),
// //                 title: Text(
// //                 user.displayName,
// //                 style: TextStyle(
// //                 color: kText,
// //                 fontWeight: FontWeight.bold,
// //                 ),
// //                 ),
// //                 subtitle: Text(user.username,
// //                 style: TextStyle(color: kIcon),),),
// //                 ),
// //
// //                 Divider(color: kGrey,),
// //                 ],
// //
// //                 );
// //
// //                 },
// //                 ),
// //                    Text( ds['title']   ,style: TextStyle(
// //                        color: Colors.white),),
// //                       Text( 'Description: ${ds['description']}'   ,style: TextStyle(
// //                        color: Colors.white),),
// //                         Text('order Status: ${ds['orderStatus']}'   ,style: TextStyle(
// //                        color: Colors.white),),
// //                       Text('Address: ${ds['Address']}',style: TextStyle(
// //                        color: Colors.white),),
// //
// //                      currency(advance: advance,finalpay: due),
// //                    Text('Total:${ int.parse(advance) + int.parse(due)}'  ,style: TextStyle(
// //                        color: Colors.white),),
// //                    paymentbutton(amount: advance,due: due,
// //                        ownerId:ds['ownerId'],
// //                        cusName:ds['username'] ,
// //                    cusImg:ds['photoUrl'] ),
// //                      // 'ownerId':widget.reciever,
// //                      // 'orderId':orderId,
// //                      // 'fulfilled':'false',
// //                      // 'orderStatus':'Processing',
// //                      // 'advance':advanceController.text,
// //                      // 'final':totalController.text ?? "",
// //                      // 'description':detailsController.text,
// //                      // 'advancepay':'false',
// //                      // 'finalpay':'false',
// //
// //                  ],
// //                );
// //               }
// //           );
//           }),
//
//     );
//   }
// }
class InvoiceView extends StatefulWidget {
  final String ownerId;
  final String title;
  final String description;
  final String cusid;
  final String Address;
  final String advancepay;
  final String finalpay;
  final String fulfilled;
  final String orderId;
  final String ordersstatus;
final String advance;
final String due;
final String cusName;
final String cusImg;

  const InvoiceView({Key key, this.cusName, this.cusImg, this.advance, this.due, this.ownerId, this.title, this.description, this.cusid, this.Address, this.advancepay, this.finalpay, this.fulfilled, this.orderId, this.ordersstatus}) : super(key: key);

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  String reviewId = Uuid().v4();
  TextEditingController reviewController = TextEditingController();

  var rating = 0.0;
  currency({String advance,String finalpay}){
    if(currentUser.country == 'India'){
      Text('Advance payment: ₹$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: ₹$finalpay');
    }
    else if (currentUser.country == 'China'){
      Text('Advance payment: ¥$advance');

      SizedBox( height: 8.0,);
      Text('Payment on delivery: ¥$finalpay');
    }
    else if(currentUser.country=='US'){

      Text('Advance payment: \u0024$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: \u0024$advance');
    }
    else if(currentUser.country=='Europe'){
      Text('Advance payment: €$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: €$finalpay');

    }
    else if(currentUser.country=='UK'){
      Text('Advance payment: £$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: £$finalpay');
    }
    else{

      Text('Advance payment: \u0024$advance');
      SizedBox( height: 8.0,);
      Text('Payment on delivery: \u0024$advance');
    }
  }
  paymentbutton({String amount,String due,String custId,String cusName,String cusImg,String ownerId,String orderId}){
    //installment
    if(widget.advancepay == 'false'||widget.finalpay == 'false'|| widget.Address == "") {
      Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
              OrderId: orderId,
              cusId: custId,
              username: cusName,
              profileimg: cusImg,)));

          },
          color: kblue,
          child: Text('Pay Advance',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    //one-time payment
    if(widget.advancepay == 'false'||widget.finalpay == 'true'|| widget.Address == "") {
      Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
              OrderId: orderId,
              cusId: custId,
              username: cusName,
              profileimg: cusImg,
            )));

          },
          color: kblue,
          child: Text('Pay Now',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    if(widget.advancepay == 'true'||widget.finalpay == 'false')
    {
      Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSer(Amount:due,OrderId: orderId,
              OwnerId: ownerId,profileimg: cusImg,username: cusName,)));

          },
          color: kblue,
          child: Text('Pay Due',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }


  }
  Rating({String fulfill,String OwnerId}){
    if(fulfill=='true') {
      Center(
        child: Column(
          children:[
            Text('Please rate the order',style: TextStyle(
                color: Colors.white),),
            SmoothStarRating(
              allowHalfRating: true,
              filledIconData: Icons.blur_off,
              halfFilledIconData: Icons.blur_on,
              rating: rating,
              size: 35,
              starCount: 5,
              onRated: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            TextField(
              controller: reviewController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                labelText: 'Review',labelStyle: TextStyle(color: kText),
                hintText: 'Review',
              ),
              textAlign: TextAlign.start,
            )
          ],
        ),
      );
      Firestore.instance.collection('Reviews')
          .document(OwnerId).collection('userReviews').document(reviewId)
          .setData({
        'userId': OwnerId,
        'rating': rating,
        'review':reviewController.text,
        'reviewId' : reviewId
      });
      Firestore.instance.collection('feed')
          .document(OwnerId)
          .collection('feedItems')
          .document(reviewId)
          .setData({
        "type": "ReviewC",
        "username": currentUser.username,
        "userId": OwnerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": reviewId,
        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'You received an order!',
      });
    }
    else{return
      Text('');}
  }
  @override
  Widget build(BuildContext context) {
//     return
//       Column(
//         children: <Widget>[
//           // Rating(OwnerId: widget.ownerId,fulfill: widget.fulfilled),
//           FutureBuilder(
//             future: usersRef.document(widget.ownerId).get(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return circularProgress();
//               }
//               User user = User.fromDocument(snapshot.data);
// //          bool isPostOwner = currentUserId == ownerId;
//               return Column(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () => showProfile(context, profileId: user.id),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: CachedNetworkImageProvider(user.photoUrl),
//                         backgroundColor: Colors.grey,
//                       ),
//                       title: Text(
//                         user.displayName,
//                         style: TextStyle(
//                           color: kText,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(user.username,
//                         style: TextStyle(color: kIcon),),),
//                   ),
//
//                   Divider(color: kGrey,),
//                 ],
//
//               );
//
//             },
//           ),
//           Text( widget.title   ,style: TextStyle(
//               color: Colors.white),),
//           Text( 'Description: ${widget.description}'   ,style: TextStyle(
//               color: Colors.white),),
//           Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
//               color: Colors.white),),
//           Text('Address: ${widget.Address}',style: TextStyle(
//               color: Colors.white),),
//
//           currency(advance: widget.advance,finalpay: widget.due),
//           Text('Total:${ int.parse(widget.advance) + int.parse(widget.due,)}'  ,style: TextStyle(
//               color: Colors.white),),
//           paymentbutton(amount: widget.advance,due: widget.due,
//               ownerId:widget.ownerId,
//               cusName:widget.cusName,
//               cusImg:widget.cusImg, ),
//           // 'ownerId':widget.reciever,
//           // 'orderId':orderId,
//           // 'fulfilled':'false',
//           // 'orderStatus':'Processing',
//           // 'advance':advanceController.text,
//           // 'final':totalController.text ?? "",
//           // 'description':detailsController.text,
//           // 'advancepay':'false',
//           // 'finalpay':'false',
//
//         ],
//       );
    return StreamBuilder(
        stream: Firestore.instance.collection('serviceCustomer')
            .document(currentUser.id)
            .collection('customerService')
        .document(widget.orderId)
            .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        Invoice invoice = Invoice.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(
            backgroundColor: kSecondaryColor,

            appBar: AppBar(
              backgroundColor: kPrimaryColor,

              title: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Invoice',
                  style: TextStyle(                  fontFamily :"MajorMonoDisplay",
                      color: Colors.white),
                ),
              ),),
            body: ListView(
              children: <Widget>[
                Container(
                  color: kPrimaryColor,
                  child: invoice,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
