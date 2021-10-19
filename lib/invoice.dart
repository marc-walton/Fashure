import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fashow/payments/Servicepayment.dart';
import 'package:fashow/user.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/progress.dart';
import 'package:photo_view/photo_view.dart';
import 'package:uuid/uuid.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class Invoice extends StatefulWidget {
  final String ownerId;
  final String username;
  final String photoUrl;

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
  var eur;
  var usd;
  var inr;
  var cny;
  var gbp;
  var Feur;
  var Fusd;
  var Finr;
  var Fcny;
  var Fgbp;

 final String country;
  final Users currentUser;
 final List images;

  Invoice({
    this.orderId,
    this.photoUrl,
this.username,
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
     this.images,
    this.currentUser,
  });

  factory Invoice.fromDocument(DocumentSnapshot doc) {
//    Map data = doc.data ;

    return Invoice(
      orderId: doc.data()['orderId'],
      ownerId: doc.data()['ownerId'],
      photoUrl: doc.data()['photoUrl'],
      username: doc.data()['username'],
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
 images: doc.data()['images'],

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
    photoUrl:  this.photoUrl,
    username:  this.username,

    Feur:  this.Feur,
    Fusd: this.Fusd,
    Finr:this.Finr,
    Fcny:this.Fcny,
    Fgbp: this.Fgbp,
images: this.images,

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
   final String photoUrl;
   final String username;


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
  var eur;
  var usd;
  String advaceprice;
   String totalprice;

 var inr;
   final String country;
final List images;

 var cny;
 var gbp;
 var Feur;
 var Fusd;
 var Finr;
 var Fcny;
 var Fgbp;
  String reviewId = Uuid().v4();
  TextEditingController reviewController = TextEditingController();
List<Widget>  listOfImages = <Widget>[];
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  var rating = 0.0;
// final String selectedSizes;

  _InvoiceState({
    this.orderId,
    this.photoUrl,
    this.username,
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
 this.images,

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

    super.initState();
  }


  currency(){
    return
      currentUser.currency == "INR"? Row(
        children: [

          Text('Advance payment:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(inr??0, CurrencyFormatter.inr)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),

          SizedBox( height: 8.0,),
          Text('Payment on delivery:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(Finr??0, CurrencyFormatter.inr)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
        ],
      ):
      currentUser.currency == "EUR"?Row(
        children: [
          Text('Advance payment:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(eur??0, CurrencyFormatter.eur)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),

          SizedBox( height: 8.0,),
          Text('Payment on delivery:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(Feur??0, CurrencyFormatter.eur)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
        ],
      ):
      currentUser.currency == "GBP"?Row(
        children: [
          Text('Advance payment:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(gbp??0, CurrencyFormatter.gbp)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),

          SizedBox( height: 8.0,),
          Text('Payment on delivery:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(Fgbp??0, CurrencyFormatter.gbp)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
        ],
      ):
      Row(
        children: [
          Text('Advance payment:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(usd??0, CurrencyFormatter.usd)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),

          SizedBox( height: 8.0,),
          Text('Payment on delivery:',
            style: TextStyle(color: kText),),Spacer(),
          Text(" ${cf.format(Fusd??0, CurrencyFormatter.usd)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              )),
        ],
      );
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
           child: ElevatedButton(
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
                 eur: eur,
                 gbp: gbp,
                 Feur: Feur,
                 Fgbp: Fgbp,

                 Fusd: Fusd,
               ));
             },
               style: ElevatedButton.styleFrom(
              elevation : 0.1,
              primary:  Colors.black, ),
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
        child: ElevatedButton(
          onPressed: (){

Get.to( PaymentSer(              title: widget.title,
  Amount:vString,OrderId: orderId,
  OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,Finr: Finr,
  usd:usd,
  inr:inr,
  Feur: Feur,
  Fgbp: Fgbp,
  eur: eur,
  gbp: gbp,
  Fusd:Fusd,
  ));
          },
            style: ElevatedButton.styleFrom(
              elevation : 0.1,
              primary:  Colors.black, ),
          child: Text('Pay Advance',style: TextStyle(
              color: Colors.white),),
        ),
      );
    }
    else if(widget.finalpay=='false')
    {
      return
        Center(
          child: ElevatedButton(
            onPressed: (){
              Get.to( PaymentSer(  title: widget.title,Amount:duee,OrderId: orderId,
                OwnerId: ownerId,profileimg: cusImg,username: cusName,advancepay: advancepay,finalpay: finalpay,Finr: Finr,
                usd:usd,
                inr:inr,
                Fusd:Fusd,
                Feur: Feur,
                Fgbp: Fgbp,
                eur: eur,
                gbp: gbp,
              ));

            },
              style: ElevatedButton.styleFrom(
              elevation : 0.1,
              primary:  Colors.black, ),
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
                        ElevatedButton(
                          onPressed: () {review();Get.back();},
                            style: ElevatedButton.styleFrom(
              elevation : 0.1,
              primary:  Colors.black, ),
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


  pics(){
    return
      FutureBuilder<QuerySnapshot> (
          future:     FirebaseFirestore.instance.collection('serviceSeller')
              .doc(widget.ownerId)
              .collection('sellerService')

              .where('orderId' ,isEqualTo: '$widget.orderId')
          // .where('ownerId' ,isEqualTo: '$ownerId')
              .get(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              return new Container( height:490,child:ListView.builder(

                  physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection:Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                    listOfImages = [];
                    for (int i = 0;
                    i <
                        snapshot.data.docs[index].data()['images']
                            .length;
                    i++) {
                      listOfImages.add(GestureDetector(
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            // useRootNavigator:true,

                            barrierDismissible: true,
                            // false = user must tap button, true = tap outside dialog
                            builder: (BuildContext dialogContext) {
                              return
                                Dialog(

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),
                                  child: Container(
                                    height: 400,
                                    child:PhotoView(imageProvider: CachedNetworkImageProvider
                                      (snapshot
                                        .data.docs[index].data()['images'][i])),),
                                );
                            },
                          );
                        },
                        child: Container(
                          height:490,
                          child: CachedImage(snapshot
                              .data.docs[index].data()['images'][i]),
                        ),
                      ));
                    }
                    return Column(
                      children: <Widget>[
                        Container(
                            height:490,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child:
                            CarouselSlider(

                                items: listOfImages,
                                options: CarouselOptions(
                                  height:500,
                                  pauseAutoPlayOnManualNavigate: true,
                                  pauseAutoPlayOnTouch: true,
                                  aspectRatio: 16/9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                )
                            )
                        ),

                      ],
                    );
                  }
              ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          });

  }

  postindia(parentContext){
    bool isPostOwner = currentUser.id == ownerId;
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => showProfile(context, profileId:ownerId),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(photoUrl),
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  username,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){},

              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only
                        (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                      child: Container(
                        //  height: MediaQuery.of(context).size.height * 0.65,

                          width:     MediaQuery.of(context).size.width,
                          child: pics())),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child:   ListTile(
                        leading:FloatingActionButton(
                          mini: true,
                          backgroundColor:Colors.white.withOpacity(0.5),
                          child:Icon(Icons.arrow_back_ios,color: Colors.white,),
                          onPressed:() { Navigator.pop(context);},
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _ccontroller.animateToPage(entry.key),
                  child: Container(
                    width: 6.0,
                    height: 6.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
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



          currency(),
            SizedBox(height:10.0),


            paymentbutton(
              title: widget.title,
              amount: widget.inr,due: widget.Finr,
              ownerId:widget.ownerId,
              cusName:widget.cusName,
              cusImg:widget.cusImg, ),
            SizedBox(height:10.0),

            !isPostOwner&& fulfilled=='true'?
            ElevatedButton(onPressed:()=>Rating(fulfill:fulfilled,parentContext: parentContext,OwnerId: ownerId),  style: ElevatedButton.styleFrom(
                        elevation : 0.1,
                        primary:  Colors.black, ),child: Text('Rate Order',style:TextStyle(color: Colors.white)),):
            Container()

          ],
        ),
      );
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( color:Cont,
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            postindia(context),

          ],
        ),
      ),
    );
  }
}