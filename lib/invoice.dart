import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/model/address.dart';
import 'package:fashow/model/adressservice.dart';
import 'package:fashow/payments/Servicepayment.dart';
import 'package:fashow/user.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/progress.dart';
import 'package:uuid/uuid.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class Invoice extends StatefulWidget {
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
  final String cusName;
  final String cusImg;
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
  final String Feur;
  final String Fusd;
  final String Finr;
  final String Fcny;
  final String Fgbp;
// final String selectedSizes;
  final User currentUser;

  Invoice({
    this.orderId,
    this.ownerId,
    this.cusName,
    this.cusImg,
    this.cusid,
    this.Address,
    this.finalpay,
    this.advancepay,
    this.fulfilled,
    this.title,
    this.description,
    this.ordersstatus,

    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
    this.Feur,
    this.Fusd,
    this.Finr,
    this.Fcny,
    this.Fgbp,
    // this.selectedSizes,
    this.currentUser,
  });

  factory Invoice.fromDocument(DocumentSnapshot doc) {
//    Map data = doc.data ;

    return Invoice(
      orderId: doc['orderId'],
      ownerId: doc['ownerId'],
      cusName: doc['cusname'],
      cusid: doc['cusId'],
      cusImg: doc['cusProfileImg'],
      Address:doc['Address'],
      finalpay:doc['finalpay'],
      advancepay:doc['advancepay'],
      fulfilled:doc['fulfilled'],
      title:doc['title'],
      description:doc['description'],
      ordersstatus:doc['orderStatus'],
      eur: doc['eur'],
      usd: doc['usd'],
      inr: doc['inr'],
      cny: doc['cny'],
      gbp: doc['gbp'],
      Feur: doc['Feur'],
      Fusd: doc['Fusd'],
      Finr: doc['Finr'],
      Fcny: doc['Fcny'],
      Fgbp: doc['Fgbp'],

    );
  }


  @override
  _InvoiceState createState() => _InvoiceState(
    orderId:  this.orderId,
    ownerId:  this.ownerId,
    cusName:  this.cusName,
    cusImg: this.cusImg,
    cusid: this.cusid,
    Address: this.Address,
    finalpay: this.finalpay,
    advancepay: this.advancepay,
    fulfilled:  this.fulfilled,
    title:  this.title,
    description: this.description,
    ordersstatus:  this.ordersstatus,

    Feur:  this.Feur,
    Fusd: this.Fusd,
    Finr:this.Finr,
    Fcny:this.Fcny,
    Fgbp: this.Fgbp,

    eur:this.eur,
    usd:this.usd,
    inr:this.inr,
    cny: this.cny,
    gbp: this.gbp,


  );
}

class _InvoiceState extends State<Invoice> {
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
  final String cusName;
  final String cusImg;
  final String eur;
  final String usd;
  final String inr;
  final String cny;
  final String gbp;
  final String Feur;
  final String Fusd;
  final String Finr;
  final String Fcny;
  final String Fgbp;
  String reviewId = Uuid().v4();
  TextEditingController reviewController = TextEditingController();

  var rating = 0.0;
// final String selectedSizes;

  _InvoiceState({
    this.orderId,
    this.ownerId,
    this.cusName,
    this.cusImg,
    this.cusid,
    this.Address,
    this.finalpay,
    this.advancepay,
    this.fulfilled,
    this.title,
    this.description,
    this.ordersstatus,

    this.eur,
    this.usd,
    this.inr,
    this.cny,
    this.gbp,
    this.Feur,
    this.Fusd,
    this.Finr,
    this.Fcny,
    this.Fgbp,
    // this.selectedSizes,
  });


  void initState() {
    // initialize controller
    // parse();

    super.initState();
  }


  currency({String advance,String finalpay}){
    if(currentUser.country == 'India'){
      return
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[     Text('Advance payment: ₹$advance'),
      SizedBox( height: 8.0,),
      Text('Payment on delivery: ₹$finalpay'),],
      );

    }
    else if (currentUser.country == 'China'){
      Text('Advance payment: ¥$advance');

      SizedBox( height: 8.0,);
      Text('Payment on delivery: ¥$finalpay');
    }
    else if(currentUser.country=='US'){
      return
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[  Text('Advance payment: \u0024$advance'),
      SizedBox( height: 8.0,),
      Text('Payment on delivery: \u0024$advance'),],
        );

    }
    else if(currentUser.country=='Europe'){
      return
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[ Text('Advance payment: €$advance'),
      SizedBox( height: 8.0,),
      Text('Payment on delivery: €$finalpay'),
    ],
        );

    }
    else if(currentUser.country=='UK'){
      return
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[ Text('Advance payment: £$advance'),
      SizedBox( height: 8.0,),
      Text('Payment on delivery: £$finalpay'),],
        );

    }
    else{
      return
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[  Text('Advance payment: \u0024$advance'),
            SizedBox( height: 8.0,),
            Text('Payment on delivery: \u0024$advance'),],
        );

    }
  }
  paymentbutton({
    String amount,String due,String custId,String cusName,String cusImg,String ownerId,
  }){
    //installment
    if(advancepay == 'false'||finalpay == 'false') {
      return
      Center(
        child: RaisedButton(
          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AddressSer(Amount:amount,OwnerId:orderId,
            //   OrderId: orderId,
            //   cusId: custId,
            //   username: cusName,
            //   profileimg: cusImg,)));
Get.to( PaymentSer(Amount:amount,OrderId: orderId,
  OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,Finr: Finr,
  eur:eur,
  usd:usd,
  inr:inr,
  gbp:gbp,
  Feur:Feur,
  Fusd:Fusd,
  Fgbp:Fgbp,));
          },
          color: kblue,
          child: Text('Pay Advance',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    //one-time payment
    if( due == "") {
    return
      Center(
        child: RaisedButton(
          onPressed: (){
            Get.to( PaymentSer(Amount:amount,OrderId: orderId,
              OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,
              Finr: Finr,
              eur:eur,
              usd:usd,
              inr:inr,
              gbp:gbp,
              Feur:Feur,
              Fusd:Fusd,
              Fgbp:Fgbp,
            ));

          },
          color: kblue,
          child: Text('Pay Now',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    if(widget.advancepay == 'true'||widget.finalpay == 'false')
    {
      return
      Center(
        child: RaisedButton(
          onPressed: (){
            Get.to( PaymentSer(Amount:amount,OrderId: orderId,
              OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,Finr: Finr,
              eur:eur,
              usd:usd,
              inr:inr,
              gbp:gbp,
              Feur:Feur,
              Fusd:Fusd,
              Fgbp:Fgbp,));

          },
          color: kblue,
          child: Text('Pay Due',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }


  }
  review(){
    Firestore.instance.collection('Reviews')
        .document(ownerId).collection('userReviews').document(reviewId)
        .setData({
      'userId': ownerId,
      'rating': rating,
      'review':reviewController.text,
      'reviewId' : reviewId
    });
    Firestore.instance.collection('feed')
        .document(ownerId)
        .collection('feedItems')
        .document(reviewId)
        .setData({
      "type": "ReviewC",
      "username": currentUser.username,
      "userId": ownerId,
      "userProfileImg": currentUser.photoUrl,
      "postId": reviewId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'You received an order!',
    });
  }
  Rating({String fulfill,String OwnerId}){
    if(fulfilled =='true') {
      Center(
        child: Column(
          children:[
            ListTileTheme(
              tileColor:kPrimaryColor,
              child: ExpansionTile(
                backgroundColor:kSecondaryColor,
                title:  Text(
                  "Please rate the order",
                  style: TextStyle(
                    color: kText.withOpacity(0.5),
                    fontWeight: FontWeight.bold,fontSize: 20,
                  ),),
                trailing:Icon(Icons.expand_more,color: kText,),
                maintainState: true,
                children: [

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

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
                        ),
            Center(
            child: RaisedButton(
            onPressed: (){
              Firestore.instance.collection('Reviews')
                  .document(ownerId).collection('userReviews').document(reviewId)
                  .setData({
                'userId': ownerId,
                'rating': rating,
                'review':reviewController.text,
                'reviewId' : reviewId
              });
              Firestore.instance.collection('feed')
                  .document(ownerId)
                  .collection('feedItems')
                  .document(reviewId)
                  .setData({
                "type": "ReviewC",
                "username": currentUser.username,
                "userId": ownerId,
                "userProfileImg": currentUser.photoUrl,
                "postId": reviewId,
                // "mediaUrl": mediaUrl,
                "timestamp": timestamp,
                "read": 'false',
                'message':'You received an order!',
              });
            },
    color: kblue,
    child: Text('Pay Advance',style: TextStyle(
    color: Colors.white),),
    ),
    ),

    ],
                    ),
                  ),                ],
              ),
            ),


          ],
        ),
      );

    }
    else{return
      Text('');}
  }


//   reviews() {
//     showModalBottomSheet(
//         backgroundColor: kSecondaryColor,
//         context: context,
//         builder: (BuildContext context) {
//
//           return  PaginateFirestore(
// //    itemsPerPage: 2,
//               itemBuilderType:
//               PaginateBuilderType.listView,
//               itemBuilder: (index, context, documentSnapshot)   {
// //        DocumentSnapshot ds = snapshot.data.documents[index];
//                 String ownerId = documentSnapshot.data['userId'];
//                 var rating =   documentSnapshot.data['rating'];
//                 String review  = documentSnapshot.data['review'];
//
//                 return
//                   FutureBuilder(
//                     future: usersRef.document(ownerId).get(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return circularProgress();
//                       }
//                       User user = User.fromDocument(snapshot.data);
// //          bool isPostOwner = currentUserId == ownerId;
//                       return Column(
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () => showProfile(context, profileId: user.id),
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundImage: CachedNetworkImageProvider(user.photoUrl),
//                                 backgroundColor: Colors.grey,
//                               ),
//                               title: Text(
//                                 user.displayName,
//                                 style: TextStyle(
//                                   color: kText,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               subtitle: Text(user.username,
//                                 style: TextStyle(color: kIcon),),),
//                           ),
//                           SmoothStarRating(
//                             isReadOnly: true,
//                             filledIconData: Icons.blur_off,
//                             halfFilledIconData: Icons.blur_on,
//                             rating: rating,
//                             size: 35,
//                             starCount: 5,
//
//                           ),
//                           SizedBox(height: 8.0,),
//                           Text(review,style: TextStyle(color: Colors.white),),
//                           Divider(color: kGrey,),
//                         ],
//
//                       );
//
//                     },
//                   );
//               },
//               query: Firestore.instance.collection('Reviews').document(prodId)
//                   .collection('prodReviews').orderBy('timestamp',descending: true)
//
//
//           );
//
//         });
//   }
  postindia(){
    return
      Column(
        children: <Widget>[
          Rating(OwnerId: widget.ownerId,fulfill: widget.fulfilled),
          FutureBuilder(
            future: usersRef.document(widget.ownerId).get(),
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
                ],

              );

            },
          ),
          Text( widget.title   ,style: TextStyle(
              color: Colors.white),),
          Text( 'Description: ${widget.description}'   ,style: TextStyle(
              color: Colors.white),),
          Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
              color: Colors.white),),
          Text('Address: ${widget.Address}',style: TextStyle(
              color: Colors.white),),

          currency(advance: widget.inr,finalpay: widget.Finr),
          Text('Total: ₹ ${ int.tryParse(widget.inr) + int.tryParse(widget.Finr,)}'  ,style: TextStyle(
              color: Colors.white),),
          paymentbutton(amount: widget.inr,due: widget.Finr,
            ownerId:widget.ownerId,
            cusName:widget.cusName,
            cusImg:widget.cusImg, ),


        ],
      );
  }
  posteurope(){
    return
      Column(
        children: <Widget>[
          Rating(OwnerId: widget.ownerId,fulfill: widget.fulfilled),
          FutureBuilder(
            future: usersRef.document(widget.ownerId).get(),
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
                ],

              );

            },
          ),
          Text( widget.title   ,style: TextStyle(
              color: Colors.white),),
          Text( 'Description: ${widget.description}'   ,style: TextStyle(
              color: Colors.white),),
          Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
              color: Colors.white),),
          Text('Address: ${widget.Address}',style: TextStyle(
              color: Colors.white),),

          currency(advance: widget.eur,finalpay: widget.Feur),
          Text('Total: € ${ int.parse(widget.eur) + int.parse(widget.Feur,)}'  ,style: TextStyle(
              color: Colors.white),),
          paymentbutton(amount: widget.eur,due: widget.Feur,
            ownerId:widget.ownerId,
            cusName:widget.cusName,
            cusImg:widget.cusImg, ),
          // 'ownerId':widget.reciever,
          // 'orderId':orderId,
          // 'fulfilled':'false',
          // 'orderStatus':'Processing',
          // 'advance':advanceController.text,
          // 'final':totalController.text ?? "",
          // 'description':detailsController.text,
          // 'advancepay':'false',
          // 'finalpay':'false',

        ],
      );
  }
  postuk(){
    return
      Column(
        children: <Widget>[
          Rating(OwnerId: widget.ownerId,fulfill: widget.fulfilled),
          FutureBuilder(
            future: usersRef.document(widget.ownerId).get(),
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
                ],

              );

            },
          ),
          Text( widget.title   ,style: TextStyle(
              color: Colors.white),),
          Text( 'Description: ${widget.description}'   ,style: TextStyle(
              color: Colors.white),),
          Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
              color: Colors.white),),
          Text('Address: ${widget.Address}',style: TextStyle(
              color: Colors.white),),

          currency(advance: widget.gbp,finalpay: widget.Fgbp),
          Text('Total: £ ${ int.parse(widget.gbp) + int.parse(widget.Fgbp,)}'  ,style: TextStyle(
              color: Colors.white),),
          paymentbutton(amount: widget.gbp,due: widget.Fgbp,
            ownerId:widget.ownerId,
            cusName:widget.cusName,
            cusImg:widget.cusImg, ),
          // 'ownerId':widget.reciever,
          // 'orderId':orderId,
          // 'fulfilled':'false',
          // 'orderStatus':'Processing',
          // 'advance':advanceController.text,
          // 'final':totalController.text ?? "",
          // 'description':detailsController.text,
          // 'advancepay':'false',
          // 'finalpay':'false',

        ],
      );
  }
  postusa() {
    return
      Column(
        children: <Widget>[
          Rating(OwnerId: widget.ownerId,fulfill: widget.fulfilled),
          FutureBuilder(
            future: usersRef.document(widget.ownerId).get(),
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
                ],

              );

            },
          ),
          Text( widget.title   ,style: TextStyle(
              color: Colors.white),),
          Text( 'Description: ${widget.description}'   ,style: TextStyle(
              color: Colors.white),),
          Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
              color: Colors.white),),
          Text('Address: ${widget.Address}',style: TextStyle(
              color: Colors.white),),

          currency(advance: widget.usd,finalpay: widget.Fusd),
          Text('Total: \u0024 ${ int.parse(widget.usd) + int.parse(widget.Fusd,)}'  ,style: TextStyle(
              color: Colors.white),),
          paymentbutton(amount: widget.usd,due: widget.Fusd,
            ownerId:widget.ownerId,
            cusName:widget.cusName,
            cusImg:widget.cusImg, ),
          // 'ownerId':widget.reciever,
          // 'orderId':orderId,
          // 'fulfilled':'false',
          // 'orderStatus':'Processing',
          // 'advance':advanceController.text,
          // 'final':totalController.text ?? "",
          // 'description':detailsController.text,
          // 'advancepay':'false',
          // 'finalpay':'false',

        ],
      );
  }
  buildPostHeader() {
    if(currentUser.country=='India'){
      return
        postindia();
    }
    else if (currentUser.country == 'Europe') {

      return posteurope();

    }
    else if (currentUser.country == 'UK')  {
      return postuk();
    }
    else if (currentUser.country == 'USA') {
      return postusa();
    }
    else{
      return postusa();
    }

  }



  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
//        buildPostImage(),
//        buildPostFooter(),
      ],
    );
  }
}