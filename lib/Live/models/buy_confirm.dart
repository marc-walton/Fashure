import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/payments/Buynow.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashow/HomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
class BuyConfirm extends StatefulWidget {
  final String prodId;
  final  String ownerId;
  final  String total;
  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;


  final String mtoText;

  final String country;



  BuyConfirm({this.prodId,this.productname,
  this.mtoText,
  this.ownerId, this.total,this.profileimg,this.username,this.mediaUrl,


  this.country,
});
@override
_BuyConfirmState createState() => _BuyConfirmState(prodId: this.prodId,
  ownerId: this.ownerId,
  total: this.total,
);
}

class _BuyConfirmState extends State<BuyConfirm> {
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
  String totalU;

  // var total = 0;
  SharedPreferences adPrefs;

  _BuyConfirmState({this.prodId, this.ownerId, this.total, this.userSize});
  @override
  void initState() {
    super.initState();
    GetAddress();
    totta();
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
    SizeConfig().init(context);

    return
      Card(
        margin: EdgeInsets.all(3.0),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Expanded(
          child:  new  Column(children: <Widget>[

            Row(
              children: [
                Text("Delivery Address",style:TextStyle(color:kText,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Row(

                children: [

                  Text("$Type",style:TextStyle(color:kText,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.bold,
                  )),

                ],

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('$Addresss,',style:TextStyle(color:kText,            fontSize: SizeConfig.safeBlockHorizontal * 4,
                      )),
                      Text('$City,',style:TextStyle(color:kText,            fontSize: SizeConfig.safeBlockHorizontal * 4,
                      )),
                      Text('$State,',style:TextStyle(color:kText,            fontSize: SizeConfig.safeBlockHorizontal * 4,
                      )),
                      Text('$Country',style:TextStyle(color:kText,            fontSize: SizeConfig.safeBlockHorizontal * 4,
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

  }
  totta() async {
    var resultUSD = await Currency.getConversion(
        from: 'USD', to: '${currentUser.currencyISO}', amount: total);
    var usd;
    String USD;
    setState(() {
      usd = resultUSD.rate;
      USD = usd.toStringAsFixed(2);
    });
    var paytotal;
 var paytotalU;

    paytotal =   double.tryParse(widget.total?? "0.0")??0.0;
    total = paytotal.toStringAsFixed(2);
     paytotalU =   double.tryParse(USD?? "0.0")??0.0;
    totalU = paytotalU.toStringAsFixed(2);


  }

  eur(){
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          child: Column(children: [
            ListTile(

              leading:   CircleAvatar(backgroundImage: NetworkImage(widget.profileimg),),

              title:  Text(widget.username,style: TextStyle(color: kText)),

            ),
            Container(
              height: SizeConfig.safeBlockHorizontal * 75,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),child:CachedNetworkImage(imageUrl: widget.mediaUrl,)),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FittedBox(
                    child: Text(widget.productname,style: TextStyle(color: kText,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                    ),overflow: TextOverflow.fade,),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [



                  currentUser.country == "India"?  Text(
                    "Subtotal ${currentUser.currencysym} ${totalU}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ):
                  Text(
                    "\u0024 ${total}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ) ,

            st(),

          ],),
        ),
      ]
      ),
    )));

  }

  @override
  Widget build(BuildContext context) {

    double vDouble = currentUser.country == "India" ?double.tryParse(totalU) *100:double.tryParse(total) *100;
    String vString = vDouble.toInt().toString();

    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,
        title: FittedBox(fit: BoxFit.contain,
          child: Text('Order Summary',style: TextStyle(
            // fontFamily :"MajorMonoDisplay",
              color: Colors.white),),
        ),),
      body: SingleChildScrollView(
        // color: Colors.white,

        child: Column(
          children: [
            eur(),
            BottomAppBar(
              color: Colors.transparent,
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>BuyNow(buynowamount:vString,
                        prodId: widget.prodId,
                        ownerId: widget.ownerId,
                        profileimg: widget.profileimg ,
                        username: widget.username,
                        mediaUrl: widget.mediaUrl,

                        productname:widget.productname,

                        mtoText: widget.mtoText,

                      )));

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
