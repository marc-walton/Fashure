import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/methods/register.dart';
import 'package:fashow/methods/login.dart';
import 'package:translated_text/translated_text.dart';
import 'package:fashow/HomePage.dart';

class unAuth extends StatefulWidget {

  @override
  _unAuthState createState() => _unAuthState();
}

class _unAuthState extends State<unAuth> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      ///,sdgkb
      body: Container(

        child:
        CurvedSplashScreen(
          bottomSheetColor: kPrimaryColor,
          backText:"",
          skipText: "",
          screensLength: splashContent.length,
          screenBuilder: (index) {
            return SplashContent(
              title: splashContent[index]["title"],
              image: splashContent[index]["image"],
              text: splashContent[index]["text"],
            );
          },
          // onSkipButton: () {
          //   Navigator.push(
          //     parentContext,
          //     MaterialPageRoute(
          //         builder: (context) => LoginPage(
          //
          //         )),
          //   );
          // }),

          //       PageView(
          //         children:[
          //           Column (
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SvgPicture.network(
          //                 'http://www.w3.org/2000/svg',
          //                 height:orientation == Orientation.portrait ? 300.0 : 150.0,
          //               ),
          //               const Text(
          //                 "DESIGN",
          //                 style: TextStyle(fontFamily:'MajorMonoDisplay',fontSize: 24 ),
          //               )
          //
          //             ],
          //           ),
          //
          //
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SvgPicture.asset(
          //                 'assets/img/undraw_shopping_eii3.svg',
          //                 height:orientation == Orientation.portrait ? 300.0 : 150.0,
          //               ),
          //               const Text(
          //                 "SHOP",
          //                 style: TextStyle(fontFamily:'MajorMonoDisplay',fontSize: 24 ),
          //               )
          // ],
          //           ),
          //
          //           Column(mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               SvgPicture.asset(
          //                 'assets/img/undraw_adventure_map_hnin.svg',
          //                 height:orientation == Orientation.portrait ? 300.0 : 150.0,
          //               ),
          //               const Text(
          //                 "EXPLORE",
          //                 style: TextStyle(fontFamily:'MajorMonoDisplay',fontSize: 24 ),
          //               ),
          //            ]
          //           ),
          //           Column(mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Image.asset(
          //                   'assets/img/DrawKit-Fashion-Illustration-01.png',
          //                   height:orientation == Orientation.portrait ? 300.0 : 150.0,
          //                 ),
          //                 const Text(
          //                    "BLOG",
          //                   style: TextStyle(fontFamily:'MajorMonoDisplay',fontSize: 24 ),
          //                 ),
          //               ]
          //           ),
          //         ]
          //
          //       )
        ),),

//           Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               child: RotateAnimatedTextKit(text: ["Design","Showcase","influence","Buy","Sell","Blog","Freelance","Live Shows","Community","FASHURE"],
//               textStyle:  TextStyle(
//                 fontFamily: "MajorMonoDisplay",
//                 fontSize:  MediaQuery.of(context).size.width*0.1,
//                 color: Colors.white,),
//                 textAlign: TextAlign.center,
//                 // totalRepeatCount:
// repeatForever: true,
//               ),
//             ),
//             GoogleSignInButton(
//               onPressed: login,
//               darkMode: true, // default: false
//             ),
//
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: FlatButton.icon(
//                 onPressed: logout,
//                 icon: Icon(Icons.cancel, color: Colors.red),
//                 label: Text(
//                   "Logout",
//                   style: TextStyle(color: Colors.red, fontSize: 20.0),
//                 ),
//               ),
//             ),
//           ],
//         ),

      bottomNavigationBar: Container(
        color: kPrimaryColor,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [Container(
                width:150.0,
                child: FloatingActionButton.extended(
                  elevation: 10.0,

                  heroTag:'in',
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),

                  backgroundColor: kPrimaryColor,
                  onPressed: ()=>  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(

                        )),
                  ),
                  label:
                  TranslatedText('Sign in',to:'${currentUser.language}',
                      textStyle: TextStyle(
                      color: Colors.white
                  ),),

                ),
              ),

                Container(
                  width:150.0,

                  child: FloatingActionButton.extended(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    heroTag:'up',
                    backgroundColor: kPrimaryColor,
                    onPressed: ()=>Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage(
                          )),
                    ),
                    label: Text('Sign up',style:TextStyle(color: Colors.white) ,),
                  ),
                ),],
            ),
          ),
        ),
      ),
    );

  }
}



class SplashContent extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const SplashContent({
    Key key,
    @required this.title,
    @required this.text,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Container(
            height: 200,
            child: Image.asset(image),
          ),
          SizedBox(height: 60),
          Text(
            title,
            style: TextStyle(fontFamily: 'MajorMonoDisplay',
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
            ),
          )
        ],
      ),
    );
  }
}

final splashContent = [
  {
    "title": "DESIGN",
    "text":
    "We let you to post your design on our app",
    "image": "assets/img/design.png",
  },
  {
    "title": "CREATE CONTENT",
    "text": "Our app lets you to create a content and display it to the world",
    "image": "assets/img/create content.png",
  },
  {
    "title": "SELL",
    "text": "Sell your products and get full satisfaction from your customer",
    "image": "assets/img/sell.png"
  },
  {
    "title": "FASHION SHOW",
    "text": "Catch up with our live fashion show on LIVE TV",
    "image": "assets/img/fashion show.png"
  },

  {
    "title": "INFLUENCE",
    "text": "A fashion that does not reach the streets is not a fashion",
    "image": "assets/img/influence.png"
  },
  {
    "title": "SHOP",
    "text": "Our app connects worldwide designers just for you",
    "image": "assets/img/shop.png"
  },

];