import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Resale/payment.dart';
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
import 'package:collection/collection.dart';
class ResaleView extends StatefulWidget {
  List<String> OwnerId ;
  List<String> Amount ;
  List<String> resaleId ;
  List<String> profileimg ;
  List<String> username ;
  List<String> images ;
  List<String> title ;
  List<String>  country;
  List<String>  size;
  List  shipcost;
  List  color;

  List  usd;
  List  eur;
  List  gbp;
  List  inr;
  List<bool>  ship;
  ResaleView({
    this.OwnerId,
    this.Amount,
    this.resaleId,
    this.profileimg,
    this.username,
    this.images,
    this.title,
    this. country,
    this.size,
    this. shipcost,
    this. inr,
    this. eur,
    this. gbp,
    this. usd,
    this. ship,
 this. color,


  });
  @override
  _ResaleViewState createState() => _ResaleViewState();
}

class _ResaleViewState extends State<ResaleView> {

  String Fullname ;
  String Type;
  String Addresss;
  String City;
  String State;
  String Zip;
  String Phone;
  String Country;
  String Code;
  var totalU;
 var price;
 var shippping;

  // var total = 0;
  SharedPreferences adPrefs;

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
 // if(currentUser.currency =="INR"){
 //   price = widget.inr.reduce((a, b) => a + b);
 // }
 // else if(currentUser.currency =="EUR"){ price = widget.eur.reduce((a, b) => a + b);}
 // else if( currentUser.currency =="GBP" ){price = widget.gbp.reduce((a, b) => a + b);}
 // else{}
    print("wdvwdfvewfvewvwefvf${widget.OwnerId}");
    currentUser.currency =="INR" ?
    price = widget.inr.reduce((a, b) => a + b):
    currentUser.currency =="EUR" ?
    price = widget.eur.fold(0, (p, c) => p + c):
    currentUser.currency =="GBP" ?
    price = widget.gbp.reduce((a, b) => a + b):
    price = widget.usd.reduce((a, b) => a + b);
    shippping = widget.shipcost.fold(0, (p, c) => p + c);

    totalU =
       price + shippping;
  }

  eur(){
    SizeConfig().init(context);

      return Container(height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.OwnerId.length,
        itemBuilder: (context, index) {
       return   Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => showProfile(context, profileId: widget.OwnerId[index]),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(widget.profileimg[index]),
                              backgroundColor: Colors.grey,
                            ),
                            title: Text(
                              widget.username[index],
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                          ),
                        ),

                        IntrinsicHeight(
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: CachedImage(widget.images[index],height:SizeConfig.safeBlockVertical*25,width:SizeConfig.safeBlockVertical*20, )),
                              VerticalDivider(color: Colors.grey,),
                              Expanded(
                                child: RichText(
                                  maxLines: 1,softWrap:false,overflow:TextOverflow.fade,
                                  text: TextSpan(
                                      style:TextStyle(
                                          color:kText,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: widget.title[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, color: Colors.black),
                                        ),

                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(

                          children: [
                            Text(
                              'Size:',
                              style:
                              TextStyle(color:kGrey, ),
                            ),
                            Spacer(),

                            Text(
                              '${widget.size[index]}',
                              style:
                              TextStyle(color:kText, ),
                            ),
                          ],
                        ),
                         Row(

                          children: [
                            Text(
                              'Color:',
                              style:
                              TextStyle(color:kGrey, ),
                            ),
                            Spacer(),

                            Text(
                              '${widget.color[index]}',
                              style:
                              TextStyle(color:kText, ),
                            ),
                          ],
                        ),

                        Row(

                          children: [
                            Text('price:',style: TextStyle(color: kGrey,)),
                            Spacer(),

                            currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.inr[index], CurrencyFormatter.inr)}", ):
                            currentUser.currency == "EUR"?Text("+  ${cf.format(widget.eur[index], CurrencyFormatter.eur)}", ):
                            currentUser.currency == "GBP"?Text("+  ${cf.format(widget.gbp[index], CurrencyFormatter.gbp)}", ):
                            Text(
                              "+  ${cf.format(widget.usd[index], CurrencyFormatter.usd)}",      )
                          ],
                        ),

widget.ship[index]?           Row(
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
):
                Row(

                        children: [
                          Text('Shipping:',style: TextStyle(color: kGrey,)),
                          Spacer(),

                          currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.shipcost[index], CurrencyFormatter.inr)}", ):
                          currentUser.currency == "EUR"?Text("+  ${cf.format(widget.shipcost[index], CurrencyFormatter.eur)}", ):
                          currentUser.currency == "GBP"?Text("+  ${cf.format(widget.shipcost[index], CurrencyFormatter.gbp)}", ):
                          Text(
                            "+  ${cf.format(widget.shipcost[index], CurrencyFormatter.usd)}",      )
                        ],
                      ),
                      ],
                    ),
                  ),
                ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Card(
               child: Column(
                 children: [
                   // Row(
                   //   mainAxisAlignment: MainAxisAlignment.end,
                   //
                   //   children: [
                   //     Text('Total price:',style: TextStyle(color: kGrey,)),
                   //     Spacer(),
                   //     currentUser.currency == "INR"?  Text( "+  ${cf.format(price, CurrencyFormatter.inr)}", ):
                   //     currentUser.currency == "EUR"?Text("+  ${cf.format(price, CurrencyFormatter.eur)}", ):
                   //     currentUser.currency == "GBP"?Text("+  ${cf.format(price, CurrencyFormatter.gbp)}", ):
                   //     Text("+  ${cf.format(price, CurrencyFormatter.usd)}",)
                   //   ],
                   // ),
                   // Row(
                   //   mainAxisAlignment: MainAxisAlignment.end,
                   //
                   //   children: [
                   //     Text('Total shipping:',style: TextStyle(color: kGrey,)),
                   //     Spacer(),
                   //
                   //     currentUser.currency == "INR"?  Text( "+  ${cf.format(shippping, CurrencyFormatter.inr)}", ):
                   //     currentUser.currency == "EUR"?Text("+  ${cf.format(shippping, CurrencyFormatter.eur)}", ):
                   //     currentUser.currency == "GBP"?Text("+  ${cf.format(shippping, CurrencyFormatter.gbp)}", ):
                   //     Text(
                   //       "+  ${cf.format(shippping, CurrencyFormatter.usd)}", )
                   //   ],
                   // ),
                   Row(

                     children: [
                       Text('Subtotal:',style: TextStyle(color: kGrey,)),
                       Spacer(),

                       currentUser.currency == "INR"?  Text( "+  ${cf.format(totalU, CurrencyFormatter.inr)}", ):
                       currentUser.currency == "EUR"?Text("+  ${cf.format(totalU, CurrencyFormatter.eur)}", ):
                       currentUser.currency == "GBP"?Text("+  ${cf.format(totalU, CurrencyFormatter.gbp)}", ):
                       Text("+  ${cf.format(totalU, CurrencyFormatter.usd)}",)
                     ],
                   ),
                 ],
               ),
             ),
           ),

         ],
       );

        },
      ),
      );

  }
  // shipping(){
  //   if(  currentUser.country == widget.country){
  //     return
  //       widget.freeship?Row(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //
  //         children: [
  //           Text('Shipping:',style: TextStyle(color: kGrey,)),
  //           Spacer(),
  //           Container(
  //               color:Colors.grey.withOpacity(0.1),
  //               child:   Text(
  //                 "FREE SHIPPING",
  //                 style: TextStyle(
  //
  //                 ),
  //               )
  //           ),
  //         ],
  //       ) :
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //
  //         children: [
  //           Text('Shipping:',style: TextStyle(color: kGrey,)),
  //           Spacer(),
  //
  //           currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.inr)}", ):
  //           currentUser.currency == "EUR"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.eur)}", ):
  //           currentUser.currency == "GBP"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.gbp)}", ):
  //           Text(
  //             "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.usd)}",      )
  //         ],
  //       );}
  //   else{return
  //     widget.freeworldship?Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //
  //       children: [
  //         Text('Shipping:',style: TextStyle(color: kGrey,)),
  //         Spacer(),
  //         Container(
  //             color:Colors.grey.withOpacity(0.2),
  //             child:   Text(
  //               "FREE SHIPPING",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 14.0,
  //               ),
  //             )
  //         ),
  //       ],
  //     ) :Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //
  //       children: [
  //         Text('shipping:',style: TextStyle(color: kGrey,)),
  //         Spacer(),
  //         currentUser.currency == "INR"?  Text( "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.inr)}", ):
  //         currentUser.currency == "EUR"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.eur)}", ):
  //         currentUser.currency == "GBP"?Text("+  ${cf.format(widget.shipcostuser, CurrencyFormatter.gbp)}", ):
  //         Text(
  //           "+  ${cf.format(widget.shipcostuser, CurrencyFormatter.usd)}",      )
  //       ],
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {

    double vDouble = double.tryParse(totalU.toString()) *100;
    String vString = vDouble.toInt().toString();

    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,
        title: FittedBox(fit: BoxFit.contain,
          child: Text('Order Summary',style: TextStyle(
            // fontFamily :"MajorMonoDisplay",
              color: Colors.white),),
        ),),
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height/1.2,
              child: SingleChildScrollView(
            // color: Colors.white,

            child: Column(
              children: [
                eur(),

              ],
            ),
          )),
          Container(
            height: MediaQuery.of(context).size.height/15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                primary:   Colors.black, // foreground
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Payment(
                  Amount:vString,
                  resaleId: widget.resaleId,
                  OwnerId: widget.OwnerId,
                  profileimg: widget.profileimg ,
                  username: widget.username,
                  images: widget.images,
                  eur:widget.eur,
                  usd:widget.usd,
                  inr:widget.inr,
                  gbp:widget.gbp,
                  title:widget.title,
                  size:widget.size,
                  color: widget.color,
                    shipcost: widget.shipcost,
                    country: widget.country,

                )));

              },

              child: Text('Pay and Place Your Order', style: TextStyle(color: Colors.white),),
            ),
          ),

        ],
      ),

    );
  }
}