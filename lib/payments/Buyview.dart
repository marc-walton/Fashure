import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/payments/Buynow.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashow/HomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_formatter/currency_formatter.dart';
class BuyView extends StatefulWidget {
  final String prodId;
    final  String ownerId;
final  String total;
final String userSize;
  final  String profileimg;
  final    String username;
  final  String mediaUrl;
  final  String productname;
  var eur;
 var usd;
 var inr;
  var gbp;
  final String displaysize;

  final String colorText;
  final String mtoText;
  var shipcost;
  var custompriceusd;
  var custompriceinr;
  var shipcostusd;
  var shipcostuser;
  var customusd;
  var custominr;
  var price;
  var customprice;
  final String country;
  final String color;
final bool freeship;
final bool freeworldship;
  final String customIndex;
  final String userCustom;
  var userVariationQuantity;
  var userSizeQuantity;
  var userColorQuantity;

  final String  userVariationImg ;
  BuyView({this.prodId,this.productname,

   this.usd,
    this.displaysize,
 this.customIndex,
 this.userCustom,
   this.eur,
   this.inr,
   this.gbp,
 this.colorText, this.mtoText,
   this.ownerId, this.total, this.userSize,this.profileimg,this.username,this.mediaUrl, this.shipcost, this.custompriceusd,
    this.custompriceinr, this.shipcostusd, this.shipcostuser, this.customusd, this.custominr, this.price, this.customprice,
    this.country, this.color, this.freeship, this.freeworldship, this.userVariationImg,
    this.userVariationQuantity,
    this.userSizeQuantity, this.userColorQuantity});
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
   String totalU;

  // var total = 0;
  SharedPreferences adPrefs;

  _BuyViewState({this.prodId, this.ownerId, this.total, this.userSize});
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
Widget address()
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
            Text("Shipping to:",style:TextStyle(color:kGrey,

            )),
            Expanded(
              child: Text("$Type,$Addresss,$City$State,$Country,$Zip",
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(color:kText,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
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
                  Text('Estimated Delivery:',style:TextStyle(color:kGrey,
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
totta(){
    // print(widget.shipcostuser);
    // print(widget.custompriceusd);
    // print(widget.custompriceinr);
    // print(widget.price);
    //  print(widget.customprice);
    //
    // print(widget.inr);
    // print(widget.usd);

 var usertotal = widget.price + widget.customprice + widget.shipcostuser;
// var sametotal =  widget.inr + widget.custompriceinr + widget.shipcost;
totalU =
 usertotal.toString();
}

eur(){
  SizeConfig().init(context);

  return SingleChildScrollView(
    child: Expanded(
      child: Container(
        child: Column(children: [
SizedBox(height: 8,),
          address(),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: CachedImage(widget.mediaUrl,height:SizeConfig.safeBlockVertical*25,width:SizeConfig.safeBlockVertical*20, )),
                        VerticalDivider(color: Colors.grey,),
                        RichText(
                          maxLines: 1,softWrap:false,overflow:TextOverflow.fade,
                          text: TextSpan(
                              style:TextStyle(
                                  color:kText,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: widget.productname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.black),
                                ),

                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
  Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [



                      Row(

                        children: [
                          Text(
                            'Size:',
                            style:
                            TextStyle(color:kGrey, ),
                          ),
                          Spacer(),

                          Text(
                            '${widget.displaysize}',
                            style:
                            TextStyle(color:kText, ),
                          ),
                        ],
                      ),
                      Row(

                        children: [
                          Text('Color:',style: TextStyle(color: kGrey,)),
                          Spacer(),

                          Text('${widget.colorText}',style: TextStyle(color: kText,

                          )),
                        ],
                      ),
                  widget.mtoText==""?Container():Row(

                        children: [
                          Text('Made-to-order:',style: TextStyle(color: kGrey,)),

                          Expanded(
                            child: Text('${widget.mtoText}',style: TextStyle(color: kText,

                            )),
                          ),
                        ],
                      ),
                  widget.userCustom ==""?Container():Row(

                    children: [
                      Text(
                        'Customization:',
                        style:
                        TextStyle(color:kGrey, ),
                      ),
                      Spacer(),

                      Text(
                        '${widget.userCustom}',
                        style:
                        TextStyle(color:kText, ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        Card(child:Column(children: [
 Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text("price:",style: TextStyle(color: kGrey,)),
                    Spacer(),
                    currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.price, CurrencyFormatter.inr)}", ):
                    currentUser.currency == "EUR"?Text("+  ${cf.format(widget.price, CurrencyFormatter.eur)}", ):
                    currentUser.currency == "GBP"?Text("+  ${cf.format(widget.price, CurrencyFormatter.gbp)}", ):
                    Text(
                      "+  ${cf.format(widget.price, CurrencyFormatter.usd)}",      )

                  ],
                ),

                widget.customprice == 0 ?Container():Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text("customization:",style: TextStyle(color: kGrey,)),
                    Spacer(),
     currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.customprice, CurrencyFormatter.inr)}", ):
     currentUser.currency == "EUR"?Text("+  ${cf.format(widget.customprice, CurrencyFormatter.eur)}", ):
     currentUser.currency == "GBP"?Text("+  ${cf.format(widget.customprice, CurrencyFormatter.gbp)}", ):
     Text(
       "+  ${cf.format(widget.customprice, CurrencyFormatter.usd)}",      )

                  ],
                ) ,
                shipping(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text('Total:',style: TextStyle(color: kGrey,)),
                    Spacer(),
                    currentUser.currency == "INR"?  Text( "+  ${cf.format(totalU, CurrencyFormatter.inr)}", ):
                    currentUser.currency == "EUR"?Text("+ ${cf.format(totalU, CurrencyFormatter.eur)}", ):
                    currentUser.currency == "GBP"?Text("+  ${cf.format(totalU, CurrencyFormatter.gbp)}", ):
                    Text(
                      "+  ${cf.format(totalU, CurrencyFormatter.usd)}",      )
                  ],
                )
              ],
            ),
          ),
        ],)),

        ],),
      ),
    ),
  );

}
shipping(){
  if(  currentUser.country == widget.country){
    return
    widget.freeship?Row(
    mainAxisAlignment: MainAxisAlignment.end,

    children: [
      Text('Shipping:',style: TextStyle(color: kGrey,)),
      Spacer(),
      Container(
          color:Colors.grey.withOpacity(0.1),
          child:   Text(
            "FREE SHIPPING",
            style: TextStyle(

            ),
          )
      ),
    ],
  ) :
  Row(
    mainAxisAlignment: MainAxisAlignment.end,

    children: [
      Text('Shipping:',style: TextStyle(color: kGrey,)),
      Spacer(),

      currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.inr)}", ):
      currentUser.currency == "EUR"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.eur)}", ):
      currentUser.currency == "GBP"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.gbp)}", ):
     Text(
        "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.usd)}",      )
    ],
  );}
  else{return
    widget.freeworldship?Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Text('Shipping:',style: TextStyle(color: kGrey,)),
        Spacer(),
        Container(
            color:Colors.grey.withOpacity(0.2),
            child:   Text(
              "FREE SHIPPING",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            )
        ),
      ],
    ) :Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Text('shipping:',style: TextStyle(color: kGrey,)),
        Spacer(),
        currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.inr)}", ):
        currentUser.currency == "EUR"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.eur)}", ):
        currentUser.currency == "GBP"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.gbp)}", ):
        Text(
          "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.usd)}",      )
      ],
    );
}
}
  @override
  Widget build(BuildContext context) {

    double vDouble = double.tryParse(totalU) *100;
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(

                      primary:   Colors.black, // foreground
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>BuyNow(buynowamount:vString,
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
                        size:widget.userSize,
                        usersize:widget.displaysize,
                        userVariationQuantity:widget.userVariationQuantity,
                        userSizeQuantity: widget.userSizeQuantity,
                        userColorQuantity:widget.userColorQuantity,

                        userVariationImg:    widget.userVariationImg ?? "" ,

                        mtoText: widget.mtoText,
                        colorText: widget.colorText,
                      )));

                    },

                    child: Text('Pay and Place Your Order', style: TextStyle(color: Colors.white),),
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
