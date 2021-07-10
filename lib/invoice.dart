import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
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

 final String country;
  final Users currentUser;

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
 this.country,

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
      orderId: doc.data()['orderId'],
      ownerId: doc.data()['ownerId'],
      cusName: doc.data()['cusname'],
      cusid: doc.data()['cusId'],
      cusImg: doc.data()['cusProfileImg'],
      Address:doc.data()['Address'],
      finalpay:doc.data()['finalpay'],
      advancepay:doc.data()['advancepay'],
      fulfilled:doc.data()['fulfilled'],
      title:doc.data()['title'],
      description:doc.data()['description'],
      ordersstatus:doc.data()['orderStatus'],
      eur: doc.data()['eur'],
      usd: doc.data()['usd'],
      inr: doc.data()['inr'],
      cny: doc.data()['cny'],
      gbp: doc.data()['gbp'],
      Feur: doc.data()['Feur'],
      Fusd: doc.data()['Fusd'],
      Finr: doc.data()['Finr'],
      Fcny: doc.data()['Fcny'],
      Fgbp: doc.data()['Fgbp'],
 country: doc.data()['country'],

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
country: this.country,


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
  String usd;
  String advaceprice;
   String totalprice;

  final String inr;
   final String country;

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
 this.country,

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
print(finalpay);
print(advancepay);
    super.initState();
    conversion();
  }


  currency({String advance,String finalpay}){
    return
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[     Text('Advance payment: ${currentUser.currencysym}$advance',style: TextStyle(
          color: kText.withOpacity(0.5),
        )),
          SizedBox( height: 8.0,),
          Row(
            children: [
              Row(
                children: [
                  Text('Payment on delivery: ${currentUser.currencysym}$finalpay',style: TextStyle(
                    color: kText.withOpacity(0.5),

                  )),
                ],
              ),
            ],
          ),],
      );

  }
  conversion()async{
    var resultUSD = await Currency.getConversion(
        from: 'USD', to: '${currentUser.currencyISO}', amount: usd);
    var resultUSD11 = await Currency.getConversion(
        from: 'USD', to: '${currentUser.currencyISO}', amount: Fusd );
    var s;
    var u;
    var e;

    setState(() {


      e = resultUSD.rate;
      advaceprice =e.toStringAsFixed(2);

      s = resultUSD11.rate;
      totalprice =s.toStringAsFixed(2);
      u = double.tryParse(usd);
      u = u.toStringAsFixed(2);
      usd = u.toString();
    });

  }

  paymentbutton({
    String amount, String title,String due,String custId,String cusName,String cusImg,String ownerId,
  }){
    double vDouble = double.tryParse(amount) *100;
    String vString = vDouble.toInt().toString();
 double Double = double.tryParse(due) *100;
    String duee = vDouble.toInt().toString();

    //one-time payment
     if( due == "") {
       if (widget.advancepay == 'false') {
         return
         Center(
           child: RaisedButton(
             onPressed: () {
               Get.to(PaymentSer(title: widget.title,
                 Amount: vString,
                 OrderId: orderId,
                 OwnerId: ownerId,
                 profileimg: cusImg,
                 username: cusName,
                 advancepay: advancepay,
                 finalpay: finalpay,
                 Finr: Finr,

                 usd: usd,
                 inr: inr,

                 Fusd: Fusd,
               ));
             },
             color: kblue,
             child: Text('Pay Now', style: TextStyle(
                 color: Colors.white),),
           ),
         );
       }
       else{
         return Container();
       }
     }
    //installment
     else if(widget.advancepay == 'false') {
      return
      Center(
        child: RaisedButton(
          onPressed: (){

Get.to( PaymentSer(              title: widget.title,
  Amount:vString,OrderId: orderId,
  OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,Finr: Finr,
  usd:usd,
  inr:inr,

  Fusd:Fusd,
  ));
          },
          color: kblue,
          child: Text('Pay Advance',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    else if(widget.finalpay=='false')
    {
      return
        Center(
          child: RaisedButton(
            onPressed: (){
              Get.to( PaymentSer(  title: widget.title,Amount:duee,OrderId: orderId,
                OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,Finr: Finr,
                usd:usd,
                inr:inr,
                Fusd:Fusd,

              ));

            },
            color: kblue,
            child: Text('Pay Due',style: TextStyle(
                color: Colors.white),),
          ),
        );
    }


else{return Container();}

  }
  review(){
    FirebaseFirestore.instance.collection('Reviews')
        .doc(ownerId).collection('userReviews').doc(reviewId)
        .set({
      'userId': ownerId,
       'orderId': orderId,
'timestamp':timestamp,
      'rating': rating,
      'review':reviewController.text,
      'reviewId' : reviewId
    });
    FirebaseFirestore.instance.collection('feed')
        .doc(ownerId)
        .collection('feedItems')
        .doc(reviewId)
        .set({
      "type": "ReviewC",
      "username": currentUser.displayName,
      "userId": ownerId,
      "userProfileImg": currentUser.photoUrl,
      "postId": reviewId,
      // "mediaUrl": mediaUrl,
      "timestamp": timestamp,
      "read": 'false',
      'message':'You received a review!',
    });
  }
  Rating({String fulfill,String OwnerId,parentContext}){
    if(fulfill=='true') {
      return
        showModalBottomSheet(
            context: parentContext,
            builder: (BuildContext context) {
              return
                Container(

                  child:           Center(
                    child: Column(
                      children:[
                        Text('Please rate the order',style: TextStyle(
                            color: Colors.white),),
                        SmoothStarRating(
                          allowHalfRating: true,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
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
                        RaisedButton(
                          onPressed: () {review();Get.back();},
                          color: kblue,
                          child: Text('Save',style: TextStyle(color: Colors.white),),)
                      ],
                    ),
                  ),

                );

            }
        );


    }
    else{return
      Text('');}
  }



  postindia(parentContext){
    bool isPostOwner = currentUser.id == ownerId;
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: usersRef.doc(widget.ownerId).get(),
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
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],

                );

              },
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( widget.title   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( 'Description: ${widget.description}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),



            widget.Finr ==""?  Text('Payment: ₹${widget.inr}',style: TextStyle(
              color: kText.withOpacity(0.5),
            )):currency(advance: widget.inr,finalpay: widget.Finr),
            SizedBox(height:10.0),


            paymentbutton(
              title: widget.title,
              amount: widget.inr,due: widget.Finr,
              ownerId:widget.ownerId,
              cusName:widget.cusName,
              cusImg:widget.cusImg, ),
            SizedBox(height:10.0),

            !isPostOwner?   fulfilled=='true'?
            RaisedButton(onPressed:()=>Rating(fulfill:fulfilled,parentContext: parentContext,OwnerId: ownerId),color:kblue,child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
            Container(): Container()

          ],
        ),
      );
  }
  posteurope(parentContext){
    bool isPostOwner = currentUser.id == ownerId;

    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            FutureBuilder(
              future: usersRef.doc(widget.ownerId).get(),
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
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],

                );

              },
            ),
            SizedBox(height:10.0),
            Row(
              children: [
                Text( widget.title   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( 'Description: ${widget.description}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            widget.Finr =="" || currentUser.country != country?  Text('Payment:${currentUser.currencysym} ${advaceprice}',style: TextStyle(
              color: kText.withOpacity(0.5),
            )):
widget.Finr =="" || currentUser.country == country?  Text('Payment:${currentUser.currencysym} ${widget.usd}',style: TextStyle(
              color: kText.withOpacity(0.5),
            )):

          currentUser.country == country?   currency(advance: widget.inr,finalpay: widget.inr):currency(advance: advaceprice,finalpay: totalprice),
            SizedBox(height:10.0),


         currentUser.country == "India"?   paymentbutton(amount: advaceprice,due: totalprice,
              title: widget.title,

              ownerId:widget.ownerId,
              cusName:widget.cusName,
              cusImg:widget.cusImg, ):paymentbutton(amount: widget.usd,due: widget.Fusd,
              title: widget.title,

              ownerId:widget.ownerId,
              cusName:widget.cusName,
              cusImg:widget.cusImg, ),
            SizedBox(height:10.0),

            !isPostOwner?   fulfilled=='true'?
            RaisedButton(onPressed:()=>Rating(fulfill:fulfilled,parentContext: parentContext,OwnerId: ownerId),color:kblue,child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
            Container(): Container()

          ],
        ),
      );
  }
  postuk(parentContext){
    bool isPostOwner = currentUser.id == ownerId;

    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: usersRef.doc(widget.ownerId).get(),
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
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       ),
                    ),

                  ],

                );

              },
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( widget.title   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( 'Description: ${widget.description}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),


    widget.Finr ==""?  Text('Payment: £${widget.gbp}',style: TextStyle(
    color: kText.withOpacity(0.5),
    )):
            currency(advance: widget.gbp,finalpay: widget.Fgbp),
            SizedBox(height:10.0),


            paymentbutton(amount: widget.gbp,due: widget.Fgbp,
              ownerId:widget.ownerId,
              title: widget.title,

              cusName:widget.cusName,
              cusImg:widget.cusImg, ),
            SizedBox(height:10.0),

            !isPostOwner?   fulfilled=='true'?
            RaisedButton(onPressed:()=>Rating(fulfill:fulfilled,parentContext: parentContext,OwnerId: ownerId),color:kblue,child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
            Container(): Container()

          ],
        ),
      );
  }
  postusa(parentContext) {
    bool isPostOwner = currentUser.id == ownerId;

    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: usersRef.doc(widget.ownerId).get(),
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
                            color: kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       ),
                    ),

                  ],

                );

              },
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( widget.title   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text( 'Description: ${widget.description}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),

            Row(
              children: [
                Text('order Status: ${widget.ordersstatus}'   ,style: TextStyle(
                    color: kText),),
              ],
            ),
            SizedBox(height:10.0),


            widget.Finr ==""?  Text('Payment: \u0024${widget.usd}',style: TextStyle(
              color: kText.withOpacity(0.5),
            )):

            currency(advance: widget.usd,finalpay: widget.Fusd),
            SizedBox(height:10.0),

            paymentbutton(              title: widget.title,
              amount: widget.usd,due: widget.Fusd,
              ownerId:widget.ownerId,
              cusName:widget.cusName,
              cusImg:widget.cusImg, ),
            SizedBox(height:10.0),

            !isPostOwner?   fulfilled=='true'?
            RaisedButton(onPressed:()=>Rating(fulfill:fulfilled,parentContext: parentContext,OwnerId: ownerId),color:kblue,child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
            Container(): Container()

          ],
        ),
      );
  }
  buildPostHeader(parentContext) {
    if(currentUser.country=='India'){
      return
        postindia(parentContext);
    }
    else if (currentUser.country == 'Europe') {

      return posteurope(parentContext);

    }
    else if (currentUser.country == 'UK')  {
      return postuk(parentContext);
    }
    else if (currentUser.country == 'USA') {
      return postusa(parentContext);
    }
    else{
      return postusa(parentContext);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildPostHeader(context),

          ],
        ),
      ),
    );
  }
}