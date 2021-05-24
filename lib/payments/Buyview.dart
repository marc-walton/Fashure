import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/payments/Buynow.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashow/HomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
class BuyView extends StatefulWidget {
  final String prodId;
    final  String ownerId;
final  String total;
final String userSize;
  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;
  final String eur;
  final String usd;
  final String inr;
  final String gbp;
    // BuyView({Key key, this.prodId, this.ownerId, this.total, this.userSize,}) : super(key: key);

 BuyView({this.prodId,this.productname,
   this.usd,
   this.eur,
   this.inr,
   this.gbp,
   this.ownerId, this.total, this.userSize,this.profileimg,this.username,this.mediaUrl});
@override
  _BuyViewState createState() => _BuyViewState(prodId: this.prodId,
  ownerId: this.ownerId,
  total: this.total,
  userSize: this.userSize);
}

class _BuyViewState extends State<BuyView> {
  String prodId;
  String ownerId;
  String total;
  String userSize;
  String Fullname ;
  String Type;
  String Addresss;
  String City;
  String State;
  String Zip;
  String Phone;
  String Country;
  String Code;
  // var total = 0;
  SharedPreferences adPrefs;

  _BuyViewState({this.prodId, this.ownerId, this.total, this.userSize});
  @override
  void initState() {
    super.initState();
    GetAddress();
    print(widget.prodId);
     print(widget.ownerId);
     print(widget.total);
     print(widget.userSize);
    print(Code);
    print(Fullname);
    print(Addresss);
    print(Type);
    print(City);
    print(State);
    print(Zip);
    print(Phone);
    print(Country);
  }
  GetAddress() async{
    adPrefs = await SharedPreferences.getInstance();
    adPrefs = await SharedPreferences.getInstance();
    setState(() {
      Fullname = adPrefs.getString('fullname') ?? '';
      Type = adPrefs.getString('type') ?? '';
      Addresss = adPrefs.getString('address') ?? '';
      City = adPrefs.getString('city') ?? '';
      State = adPrefs.getString('state') ?? '';
      Zip = adPrefs.getString('zip') ?? '';
      Phone = adPrefs.getString('phone') ?? '';
      Country = adPrefs.getString('country') ?? '';
      Code = adPrefs.getString('code') ?? '';

    });
    print(Code);
    print(Fullname);
    print(Addresss);
    print(Type);
    print(City);
    print(State);
    print(Zip);
    print(Phone);
    print(Country);

  }
Widget st()
{
  return
  Card(
    margin: EdgeInsets.all(3.0),
    shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(10),
    ),
    color: Color(0XFFb3b3ff).withOpacity(0.3),
    child: Expanded(
      child:  new  Column(children: <Widget>[

        Row(
          children: [
            Text("Delivery Address",style:TextStyle(color:kText,              fontSize: 20.0,
            )),
          ],
        ),
Row(
  children: [
        Text("$Type",style:TextStyle(color:kText)),
  ],
),

        Row(
          children: [
            Text('$Addresss,$City,$State,$Country',style:TextStyle(color:kText)),
          ],
        ),


      ],

      ),
    ),
  );

}
uk(){
  return Expanded(
    child: Container(
      child: Column(children: [
        ListTile(

          leading:   CircleAvatar(backgroundImage: NetworkImage(widget.profileimg),),

          title:  Text(widget.username,style: TextStyle(color: kText)),

        ),
        Row(
          children: [
            Text(widget.productname,style: TextStyle(color: kText,
              fontSize: 25.0,
            )),
          ],
        ),
        Expanded(
          child: Container(
            height:  MediaQuery.of(context).size.height * 0.20,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: widget.mediaUrl,)),

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Size:  ${widget.userSize}', style: TextStyle(color: kText,
                fontWeight: FontWeight.bold)),
            Text('£  ${widget.total}',style: TextStyle(color: kText,
              fontSize: 20.0,
            )),
          ],
        ),
        st(),

      ],),
    ),
  );
}
ind(){
  return Expanded(
    child: Container(
      child: Column(children: [
        ListTile(

         leading:   CircleAvatar(backgroundImage: NetworkImage(widget.profileimg),),

          title:  Text(widget.username,style: TextStyle(color: kText)),

        ),
        Row(
          children: [
            Text(widget.productname,style: TextStyle(color: kText,
              fontSize: 25.0,
            )),
          ],
        ),
        Expanded(
          child: Container(
            height:  MediaQuery.of(context).size.height * 0.20,
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: widget.mediaUrl,)),

            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Size:  ${widget.userSize}', style: TextStyle(color: kText,
                fontWeight: FontWeight.bold)),
            Text('₹  ${widget.total}',style: TextStyle(color: kText,
              fontSize: 20.0,
            )),
          ],
        ),
        st(),

      ],),
    ),
  );

}
eur(){
  return Expanded(
    child: Container(
      child: Column(children: [
        ListTile(

         leading:   CircleAvatar(backgroundImage: NetworkImage(widget.profileimg),),

          title:  Text(widget.username,style: TextStyle(color: kText)),

        ),
        Row(
          children: [
            Text(widget.productname,style: TextStyle(color: kText,
              fontSize: 25.0,
            )),
          ],
        ),
        Expanded(
          child: Container(
            height:  MediaQuery.of(context).size.height * 0.20,
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: widget.mediaUrl,)),

            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Size:  ${widget.userSize}', style: TextStyle(color: kText,
                fontWeight: FontWeight.bold)),
            Text('€  ${widget.total}',style: TextStyle(color: kText,
              fontSize: 20.0,
            )),
          ],
        ),
        st(),

      ],),
    ),
  );

}
us(){
  return Expanded(
    child: Container(
      child: Column(children: [
        ListTile(

         leading:   CircleAvatar(backgroundImage: NetworkImage(widget.profileimg),),

          title:  Text(widget.username,style: TextStyle(color: kText)),

        ),
        Row(
          children: [
            Text(widget.productname,style: TextStyle(color: kText,
              fontSize: 25.0,
            )),
          ],
        ),
        Expanded(
          child: Container(
            height:  MediaQuery.of(context).size.height * 0.20,
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: widget.mediaUrl,)),

            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Size:  ${widget.userSize}', style: TextStyle(color: kText,
                fontWeight: FontWeight.bold)),
            Text('\u0024  ${widget.total}',style: TextStyle(color: kText,
              fontSize: 20.0,
            )),
          ],
        ),
        st(),

      ],),
    ),
  );

}

  Widget ProdTile(){
    if(currentUser.country=='Europe'){
     return
       eur();}
    else if (currentUser.country == 'India'){
      return
    ind();}
    else if (currentUser.country == 'UK'){
return uk();
    }
    else if (currentUser.country == 'USA'){
      return
        us();}
else {
      return
        us();}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,
        title: FittedBox(fit: BoxFit.contain,
          child: Text('Order Summary',style: TextStyle(
            // fontFamily :"MajorMonoDisplay",
              color: Colors.white),),
        ),),
      body: Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Column(
          children: [
            ProdTile(),
            BottomAppBar(
              color: Colors.transparent,
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>BuyNow(buynowamount:widget.total,
                      prodId: widget.prodId,
                          ownerId: widget.ownerId,
                          profileimg: widget.profileimg ,
                      username: widget.username,
                      mediaUrl: widget.mediaUrl,
                          eur:widget.eur,
                          usd:widget.usd,
                          inr:widget.inr,
                          gbp:widget.gbp,
                          productname:widget.productname,
                          size:widget.userSize)));

                    },
                    color: kblue,

                    child: Text('PROCEED TO PAY', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
