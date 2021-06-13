import 'package:fashow/orders.dart';
import 'package:fashow/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/edit_profile.dart';
import 'package:fashow/HomePage.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:translated_text/translated_text.dart';
class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  logout() async {
    // await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    // Get.offAll(Homepage());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(
authis: false,
            )),
            (_) => false );
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  _launchPP() async {
    const url = 'https://fashure.xyz/privacy-policy';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Could not launch $url';
  }
  }
  _launchTS() async {
    const url = 'https://fashure.xyz/terms-of-service';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Could not launch $url';
  }
  }
_launchRF() async {
    const url = 'https://fashure.xyz/refund-policy';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Could not launch $url';
  }
  }
_launchH() async {
    const url = 'https://fashure.xyz/help';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Could not launch $url';
  }
  }


  @override
  Widget build(BuildContext context) {
    return            Expanded(
      child: ListView(
        children: [
          GestureDetector(
            onTap:(){  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfile(currentUserId: currentUser.id)));} ,
            child: ListTile(
              leading :  TranslatedText("Edit Profile",to:'${currentUser.language}',
                textStyle: TextStyle(
                    fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
                ),
              // Text('', style: TextStyle(
                //
            ),

          Divider(color: Colors.black),
          GestureDetector(
            onTap:()async{  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Orders()));} ,
            child: ListTile(
              leading :  TranslatedText("My Orders",to:'${currentUser.language}',
    textStyle: TextStyle(
    fontFamily :"MajorMonoDisplay",
    fontSize:  15.0 ,
    color: kText
    ),),
                         ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: (){
              alert(
                context,
                // title: Text('Coming Soon'),
                content: TranslatedText("Coming Soon",to:'${currentUser.language}',
                  ),

                textOK: TranslatedText("OK",to:'${currentUser.language}',
                  ),
              );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => WalletPage()));
            },
            child: ListTile(
              leading :
              TranslatedText("Credits",to:'${currentUser.language}',
                textStyle: TextStyle(
                  fontSize:  15.0 ,
                  color: kText),)
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: (){
              alert(
                context,
                // title: Text('Coming Soon'),
                content:TranslatedText("Coming Soon",to:'${currentUser.language}',
                 ),

                textOK: TranslatedText("Ok",to:'${currentUser.language}',
                ),

              );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => WalletPage()));
            },
            child: ListTile(
              leading : TranslatedText("Gift Cards",to:'${currentUser.language}',
                textStyle: TextStyle(
                fontSize:  15.0 ,
                color: kText),),

            ),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading :  TranslatedText("More",to:'${currentUser.language}',
    textStyle: TextStyle(
    fontSize:  10.0 ,
    color: kText),
    ),),

          GestureDetector(
            onTap: ()=>logout(),
            child: ListTile(
              leading : TranslatedText("Log Out",to:'${currentUser.language}',
                        textStyle: TextStyle(
                        fontSize:  15.0 ,
                        color: kText),),
    ),),


          Divider(color: Colors.black),

         GestureDetector(
            onTap:  ()=>_launchTS(),

            child: ListTile(
              leading : TranslatedText("Terms of Service",to:'${currentUser.language}',
                         textStyle: TextStyle(
                         fontSize:  15.0 ,
                         color: kText),),
    ),),
              Text('', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",

            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: ()=> _launchPP(),

            child: ListTile(

              leading :
              TranslatedText("Privacy Policy",to:'${currentUser.language}',
                textStyle: TextStyle(
                  fontSize:  15.0 ,
                      color: kText),),

            ),
          ),  Divider(color: Colors.black),
          GestureDetector(
            onTap: ()=> _launchRF(),

            child: ListTile(

              leading :  TranslatedText("Refund Policy",to:'${currentUser.language}',
                textStyle: TextStyle(
                  fontSize:  15.0 ,
                  color: kText),)

              // Text('', style: TextStyle(
              //   // fontFamily :"MajorMonoDisplay",
              //     ,
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: ()=>_launchH(),

            child: ListTile(

              leading : TranslatedText("Help",to:'${currentUser.language}',
                textStyle: TextStyle(
                    fontSize:  15.0 ,
                    color: kText),)

            ),
          ),

          Divider(color: Colors.black),
          Container(
            child: ListTile(
              leading : TranslatedText("App Version",to:'${currentUser.language}',
                        textStyle: TextStyle(
                        fontSize:  15.0 ,
                        color: kText),),

              trailing :TranslatedText("0.0.1",to:'${currentUser.language}',
                textStyle: TextStyle(
                    fontSize:  15.0 ,
                    color: kText),)


            ),
          ),
        ],
      ),
    );

  }
}
