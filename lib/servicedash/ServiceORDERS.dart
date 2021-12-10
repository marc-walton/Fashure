import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/SellerDash/orderFulfill.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/invoiceview.dart';
import 'package:fashow/servicedash/servicefulfill.dart';
import 'package:flutter/material.dart';

import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
class ServiceOrders extends StatefulWidget {
  @override
  _ServiceOrdersState createState() => _ServiceOrdersState();
}

class _ServiceOrdersState extends State<ServiceOrders> {
  df({
    String productname,
     String des,
    var usd,
    var inr,
    var eur,
    var gbp,
    var Fusd,
    var Finr,
    var Feur,
    var Fgbp,
    String adavance,
    String finalp,
    String orderId,
    String ownerId,String image,}){
    return
    Column(
      children: <Widget>[
        ListTile(

          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InvoiceView(
                    orderId: orderId,
                    ownerId: ownerId,
                  ),
                ),
              ),
              child: Container(child: CachedImage(image,width: 60,)),
            ),
          ),          title:RichText(
            maxLines: 1,softWrap:false,overflow:TextOverflow.fade,
            text: TextSpan(
                style:TextStyle(
                    color:kText,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: productname,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),

                ]),
          ),
          subtitle:  ExpandableText(
              text:des,color:Colors.black,size:15.0        ),

        ),

        ListTile(
          title:
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

          subtitle:  adavance == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)): Text('Payment pending'),
        ),
        ListTile(
          title:
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
          subtitle:  finalp == "true"? Text( "(Paid)",style: TextStyle(color:  kText,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)): Text('Payment pending'),

        ),


      ],
    );

  }
  UpcomingOrders(){
    return  Container( color:Cont,
      child: PaginateFirestore(
isLive: true,
          key: ValueKey<String>(full),
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];

            var usd = documentSnapshot.data()['usd'];
            var inr = documentSnapshot.data()['inr'];
            var gbp = documentSnapshot.data()['gbp'];
            var eur = documentSnapshot.data()['eur'];
            var Fusd = documentSnapshot.data()['Fusd'];
            var Finr = documentSnapshot.data()['Finr'];
            var Fgbp = documentSnapshot.data()['Fgbp'];
            var Feur = documentSnapshot.data()['Feur'];

            String ownerId = documentSnapshot.data()['ownerId'];
            String cusId = documentSnapshot.data()['cusId'];
            String cusname = documentSnapshot.data()['cusname'];
            String cusProfileImg = documentSnapshot.data()['cusProfileImg'];
  List images = documentSnapshot.data()['images'];

            String title = documentSnapshot.data()['title'];
            String desciption = documentSnapshot.data()['description'];
            String orderId = documentSnapshot.data()['orderId'];
            String advancepay = documentSnapshot.data()['advancepay'];
            String finalpay = documentSnapshot.data()['finalpay'];
            String orderStatus = documentSnapshot.data()['orderStatus'];
            String Address = documentSnapshot.data()['Address'];
 String fulfilled = documentSnapshot.data()['fulfilled'];

            return Expanded(
              child: Card(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => showProfile(context, profileId: cusId),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(cusProfileImg),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          cusname,
                          style: TextStyle(
                            color:kText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    df(productname:title,
                      des:desciption,image: images.first,
                      usd:usd,inr:inr,
                      gbp:gbp,eur:eur,
                      Fusd:Fusd,Finr:Finr,Feur:Feur,Fgbp:Fgbp,
                      adavance: advancepay,finalp: finalpay,
                      orderId:orderId, ownerId:ownerId,),
                    ListTile(
                      title:Text('orderStatus:$orderStatus',
                        style: TextStyle(color: kText),),

                    ),

                    fulfilled=='false'  ?Center(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation : 0.1,
                        primary:  Colors.black, ),
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>ServiceFulfill(ownerId: ownerId,orderId: orderId,cusId:cusId)));},
                      child:  Text('Fulfill Order',
                        style: TextStyle(color: Colors.white),),)):Container(),
                  ],

                ),
              ),
            );
          },
          query:  FirebaseFirestore.instance.collection('serviceSeller')
              .doc(currentUser.id)
              .collection('sellerService').orderBy('timestamp',descending: true)
              .where('fulfilled',isEqualTo: 'false')

      ),
    );
  }
  OrdersFulfilled(){
    return  Container( color:Cont,
      child: PaginateFirestore(
isLive: true,
//    itemsPerPage: 2,
          itemBuilderType:
          PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot)   {


            var usd = documentSnapshot.data()['usd'];
            var inr = documentSnapshot.data()['inr'];
            var gbp = documentSnapshot.data()['gbp'];
            var eur = documentSnapshot.data()['eur'];
            var Fusd = documentSnapshot.data()['Fusd'];
            var Finr = documentSnapshot.data()['Finr'];
            var Fgbp = documentSnapshot.data()['Fgbp'];
            var Feur = documentSnapshot.data()['Feur'];
            List images = documentSnapshot.data()['images'];

            String ownerId = documentSnapshot.data()['ownerId'];
            String cusId = documentSnapshot.data()['cusId'];
            String cusname = documentSnapshot.data()['cusname'];
            String cusProfileImg = documentSnapshot.data()['cusProfileImg'];

            String orderId = documentSnapshot.data()['orderId'];
            String advancepay = documentSnapshot.data()['advancepay'];
            String finalpay = documentSnapshot.data()['finalpay'];
            String orderStatus = documentSnapshot.data()['orderStatus'];
            String title = documentSnapshot.data()['title'];
String description = documentSnapshot.data()['description'];
            return Card(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showProfile(context, profileId: cusId),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(cusProfileImg),
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        cusname,
                        style: TextStyle(
                          color:kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  df(productname:title,
                    des:description,
                    usd:usd,inr:inr,
                     gbp:gbp,eur:eur,
image:images.first,
                    Fusd:Fusd,Finr:Finr,Feur:Feur,Fgbp:Fgbp,
                    adavance: advancepay, finalp: finalpay,
                    orderId:orderId, ownerId:ownerId,),
                  ListTile(
                    title:Text('orderStatus:$orderStatus',
                      style: TextStyle(color: kText),),

                  ),




                ],

              ),
            );

          },
          query:  FirebaseFirestore.instance.collection('serviceSeller')
              .doc(currentUser.id)
              .collection('sellerService').orderBy('timestamp',descending: true)
              .where('fulfilled',isEqualTo: 'true')

      ),
    );
  }
  @override
  void initState() {
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
      Container(   decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: RotatedBox(
          quarterTurns: 3,
          child: Expanded(
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: kPrimaryColor,
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
                          child: Text("Upcoming orders", style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Fulfilled orders", style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5),),
                        ),

                      ],
                    ),
                  ),

                  body: RotatedBox(
                    quarterTurns: 1,
                    child: TabBarView(
                        children: <Widget>[
                          UpcomingOrders(),
                          OrdersFulfilled(),


                        ]),
                  ),
                )
            ),
          ),
        ),
      );
  }
  main(){
    Column(
      children: [
        ExpansionTile (
          title: Text('Upcoming Orders'),
          maintainState:true,
          children: [
            UpcomingOrders()
          ],
        ),
        ExpansionTile (
          title: Text('Orders Fulfilled'),
          maintainState:true,
          children: [
            OrdersFulfilled()
          ],
        ),

      ],
    );
    update();
  }
  update() async {

    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('serviceSeller')
        .doc(currentUser.id)
        .collection('sellerService').get();
    snapshot.docs.forEach((doc) {
      doc.reference.update({'read':'true'});
    });
  }
}
