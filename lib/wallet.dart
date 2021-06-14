//import 'package:ecommerce_int2/api_service.dart';
//import 'package:ecommerce_int2/app_properties.dart';
//import 'package:ecommerce_int2/models/user.dart';
//import 'package:ecommerce_int2/screens/payment_history_page.dart';
//import 'package:ecommerce_int2/screens/request_money/request_amount_page.dart';
//import 'package:ecommerce_int2/screens/request_money/request_page.dart';
//import 'package:ecommerce_int2/screens/send_money/send_page.dart';
//import 'custom_image.dart';
//import 'package:fashow/Constants.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart'
import 'package:fashow/Constants.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translated_text/translated_text.dart';
import 'package:fashow/HomePage.dart';
class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  AnimationController animController;
  Animation<double> openOptions;

//  List<User> users = [];
//
//  getUsers() async {
//    var temp = await ApiService.getUsers(nrUsers: 5);
//    setState(() {
//      users = temp;
//    });
//  }

  @override
  void initState() {
    animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    openOptions = Tween(begin: 0.0, end: 300.0).animate(animController);
//    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryColor,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (builder, constraints) => SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                        alignment: Alignment(1, 0),
                        child: SizedBox(
                          height: 40,
                          child: IconButton(
                            icon: Icon(Icons.history),
                            onPressed: (){},
//                            =>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>PaymentHistoryPage())),
//                            icon:  SvgPicture.asset('assets/icons/reload_icon.svg', color: Colors.red,),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      TranslatedText('Wallet',to:'${currentUser.language}',
                      textStyle: TextStyle( color: kGrey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                          ),),


                        CloseButton()
                      ],
                    ),
                  ),
                  Text('Current account balance',   style: TextStyle(
                    color: kGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),                                         ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\₹',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text('0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.bold)),
                       IconButton(

                            onPressed: () {},
                            icon: Container(

                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kSecondaryColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))),

                              child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: openOptions.value,
                            height: 80,
                            padding:
                            const EdgeInsets.symmetric(horizontal: 32),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(45)),
                                border:
                                Border.all(color: kSecondaryColor, width: 1.5)),
                            child: openOptions.value < 300
                                ? Container()
                                : Align(
                              alignment: Alignment(0, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {},
//                                          Navigator.of(context).push(
//                                              MaterialPageRoute(
//                                                  builder: (_) =>
//                                                      SendPage())),
                                      child: Text('Pay',style: TextStyle(color: kText),)),
                                  InkWell(
                                      onTap: () {},
//                                          Navigator.of(context).push(
//                                              MaterialPageRoute(
//                                                  builder: (_) =>
//                                                      RequestPage())),
                                      child: Text('Request',style: TextStyle(color: kText))),
                                ],
                              ),
                            ),
                          ),

                        ),
                        Center(
                            child: CustomPaint(
                                painter: YellowDollarButton(),
                                child: GestureDetector(
                                  onTap: () {
                                    animController.addListener(() {
                                      setState(() {});
                                    });
                                    if (openOptions.value == 300)
                                      animController.reverse();
                                    else
                                      animController.forward();
                                  },
                                  child: Container(
                                      width: 110,
                                      height: 110,
                                      child: Center(
                                          child: Text('\₹',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.5),
                                                  fontSize: 32)))),
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        openOptions.value > 0 ? '' : 'Tap to pay / request',
                        style: TextStyle(fontSize: 12)),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text('Quick Money Request'),
//                  ),
                  Flexible(
                      child: Center(
                        child: Container(
                          color: kPrimaryColor,
                          height: 130,
                          padding:
                          const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListView(
//                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding:  const EdgeInsets.symmetric(
                                      horizontal: 185.0),
                                  child: Text(
                                      'Points',
                                      style: TextStyle(fontSize: 18)),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                        Text(
//                          '\₹',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 24,
//                          ),
//                        ),
//                        SizedBox(width: 8.0),
                        Text('0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.bold)),
                                ],),
                                ),
//                                 Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          '\₹',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 24,
//                          ),
//                        ),
//                        SizedBox(width: 8.0),
//                        Text('0',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 48,
//                                fontWeight: FontWeight.bold)),
//                                ...users
//                                    .map((user) => InkWell(
//                                  onTap: (){},
////                                  => Navigator.of(context).push(
////                                      MaterialPageRoute(
////                                          builder: (_) => RequestAmountPage(user))),
//                                  child: Container(
//                                      width: 100,
//                                      height: 200,
//                                      margin: const EdgeInsets.only(
//                                          left: 8.0, right: 8.0),
//                                      decoration: BoxDecoration(
//                                          color: Colors.white,
//                                          borderRadius:
//                                          BorderRadius.all(
//                                              Radius.circular(5))),
//                                      child: Column(
//                                        mainAxisSize: MainAxisSize.min,
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          CircleAvatar(
//                                            maxRadius: 24,
//                                            backgroundImage:
//                                            CachedNetworkImageProvider(user.photoUrl),
//                                          ),
//                                          Padding(
//                                            padding: const EdgeInsets
//                                                .fromLTRB(
//                                                4.0, 16.0, 4.0, 0.0),
//                                            child: Text(
//                                                user.username,
//                                                textAlign:
//                                                TextAlign.center,
//                                                style: TextStyle(
//                                                  fontSize: 14.0,
//                                                )),
//                                          ),
//                                          Padding(
//                                            padding:
//                                            const EdgeInsets.only(
//                                                top: 8.0),
//                                            child: Text(
//                                              user.phone,
//                                              textAlign:
//                                              TextAlign.center,
//                                              style: TextStyle(
//                                                  fontSize: 10),
//                                            ),
//                                          ),
//                                        ],
//                                      )),
//                                ))
//                                    .toList(),
                              ]),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Reedem points',style: TextStyle(color: kText),),
                  ),
                  Flexible(
                    child: Container(color:kSecondaryColor,
                      height: 232,
//                      color: Color(0xffFAF1E2),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          padding: const EdgeInsets.all(16.0),
                          width: 140,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom:16.0),
                                child: Row(
                                  children:<Widget>[
                                     Icon(Icons.tab),
                                    Text('0.0'),
                                  ]
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Text('Dicount Voucher',
                                    style: TextStyle(
                                        color: kGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Text('10% off on any shoes',style: TextStyle(
                                  color: kGrey,
                                  fontSize: 10.0,)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class YellowDollarButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    canvas.drawCircle(Offset(width / 2, height / 2), height / 2,
        Paint()..color = Color.fromRGBO(253, 184, 70, 0.2));
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2 - 4,
        Paint()..color = Color.fromRGBO(253, 184, 70, 0.5));
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2 - 12,
        Paint()..color = Color.fromRGBO(253, 184, 70, 1));
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2 - 16,
        Paint()..color = Color.fromRGBO(255, 255, 255, 0.1));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}