import 'package:fashow/orders.dart';
import 'package:fashow/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/edit_profile.dart';
import 'package:fashow/HomePage.dart';
import 'package:alert_dialog/alert_dialog.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  logout() async {
    await googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return            Container( decoration: BoxDecoration(
        gradient: fabGradient
    ) ,
      alignment: Alignment.center,
      child: Expanded(
        child: ListView(
          children: [
            GestureDetector(
              onTap:(){  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(currentUserId: currentUser.id)));} ,
              child: ListTile(
                leading :  Text('Edit Profile', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
              ),
            ),
            Divider(color: Colors.black),
            GestureDetector(
              onTap:()async{  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Orders()));} ,
              child: ListTile(
                leading :  Text('My Orders', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
              ),
            ),
            Divider(color: Colors.black),
            GestureDetector(
              onTap: (){
                alert(
                  context,
                  // title: Text('Coming Soon'),
                  content: Text('Coming Soon'),
                  textOK: Text('Ok'),
                );
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => WalletPage()));
              },
              child: ListTile(
                leading :  Text('Credits', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
              ),
            ),
            Divider(color: Colors.black),
            GestureDetector(
              onTap: (){
                alert(
                  context,
                  // title: Text('Coming Soon'),
                  content: Text('Coming Soon'),
                  textOK: Text('Ok'),
                );
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => WalletPage()));
              },
              child: ListTile(
                leading :  Text('Gift Cards', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
              ),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading :  Text('More', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                  fontSize:  10.0 ,
                  color: kText),),
            ),
            GestureDetector(
              onTap: ()=>logout(),
              child: ListTile(
                leading :  Text('Log Out', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
              ),
            ),
            Divider(color: Colors.black),

            ListTile(
              leading :  Text('Terms of Service', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                  fontSize:  15.0 ,
                  color: kText),),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading :  Text('Privacy Policy', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                  fontSize:  15.0 ,
                  color: kText),),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading :  Text('Help', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                  fontSize:  15.0 ,
                  color: kText),),
            ),

            Divider(color: Colors.black),
            Container(
              color: kSecondaryColor,
              child: ListTile(
                leading :  Text('App Version', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),
                trailing :  Text('0.0.1', style: TextStyle(
                  // fontFamily :"MajorMonoDisplay",
                    fontSize:  15.0 ,
                    color: kText),),

              ),
            ),
          ],
        ),
      ),
    );

  }
}
