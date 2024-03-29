import 'package:fashow/orders.dart';
import 'package:fashow/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/edit_profile.dart';
import 'package:fashow/HomePage.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
              auth: false,
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
              leading :  Text("Edit Profile",
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/21 ,
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
              leading :  Text("My Orders",
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/21 ,
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
                content: Text("Coming Soon",
                ),

                textOK: Text("OK",
                ),
              );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => WalletPage()));
            },
            child: ListTile(
                leading :
                Text("Credits",
                  style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.width/21 ,
                      color: kText),)
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: (){
              alert(
                context,
                // title: Text('Coming Soon'),
                content:Text("Coming Soon",
                ),

                textOK: Text("Ok",
                ),

              );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => WalletPage()));
            },
            child: ListTile(
              leading : Text("Gift Cards",
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/21 ,
                    color: kText),),

            ),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading :  Text("More",
              style: TextStyle(
                  fontSize:  MediaQuery.of(context).size.width/27 ,
                  color: kText),
            ),),

          GestureDetector(
            onTap: ()=>logout(),
            child: ListTile(
              leading : Text("Log Out",
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/21 ,
                    color: kText),),
            ),),


          Divider(color: Colors.black),

          GestureDetector(
            onTap:  ()=>_launchTS(),

            child: ListTile(
              leading : Text("Terms of Service",
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/21 ,
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
              Text("Privacy Policy",
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width/21 ,
                    color: kText),),

            ),
          ),  Divider(color: Colors.black),
          GestureDetector(
            onTap: ()=> _launchRF(),

            child: ListTile(

                leading :  Text("Refund Policy",
                  style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.width/21 ,
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

                leading : Text("Help",
                  style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.width/21 ,
                      color: kText),)

            ),
          ),

          Divider(color: Colors.black),
          Container(
            child: ListTile(
                leading : Text("App Version",
                  style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.width/21 ,
                      color: kText),),

                trailing :Text("0.0.1",
                  style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.width/21 ,
                      color: kText),)


            ),
          ),
        ],
      ),
    );

  }
}
