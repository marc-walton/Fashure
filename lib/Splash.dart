import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fashow/methods/register.dart';
import 'package:fashow/methods/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/user.dart';
import 'package:badges/badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fashow/Shop.dart';
import 'package:fashow/Timeline.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'file:///C:/Users/marcw/StudioProjects/Fashow/lib/Live/Live.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Create_account.dart';
import 'package:fashow/Designer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/enum/user_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_svg/svg.dart';
final GoogleSignIn googleSignIn = GoogleSignIn();
final DateTime timestamp = DateTime.now();
Users currentUser;
final bankRef = FirebaseFirestore.instance.collection('Bank');

final followersRef = FirebaseFirestore.instance.collection('followers');
class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences myPrefs;
  String idd;
  String username;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool isAuth = false;
  bool h = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users loggedInUser;
  @override
  void initState() {
    super.initState();

    print("$isAuth");

    auth();


    // Detects when user signed in
    // googleSignIn.onCurrentUserChanged.listen((account) {
    //   handleSignIn(account);
    // }, onError: (err) {
    //   print('Error signing in: $err');
    // });
    // // Reauthenticate user when app is opened
    // googleSignIn.signInSilently(suppressErrors: false).then((account) {
    //   handleSignIn(account);
    // }).catchError((err) {
    //   print('Error signing in: $err');
    // });
    //
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  auth() async {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User) async => {
      if (User == null)
        {
          setState(() {
            isAuth = false;
          }),
          // Navigator.pushReplacementNamed(context, "/login")
        }
      else
        {
          loginuser(userid: User.uid),
          setState(() {
            isAuth = true;
            h = false;
          }),
          // FirebaseFirestore.instance
          //     .collection("users")
          //     .doc(currentUser.uid)
          //     .get()
          //     .then((DocumentSnapshot result) =>
          //     Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => HomePage(
          //               title: result["fname"] + "'s Tasks",
          //               uid: currentUser.uid,
          //             ))))
          //     .catchError((err) => print(err))
        }
    });
  }
  loginuser({userid})async{
    DocumentSnapshot doc = await usersRef.doc(userid).get();
    currentUser = Users.fromDocument(doc);
    myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString('id', currentUser.id);
    await myPrefs.setString('displayName', currentUser.displayName);
    await myPrefs.setString('photoUrl', currentUser.photoUrl);
    myPrefs = await SharedPreferences.getInstance();
    idd = myPrefs.getString('id') ?? '';
    print(',jbkbhn$idd');
    if (Platform.isIOS) getiOSPermission();

    _firebaseMessaging.getToken().then((token) {
      // print("Firebase Messaging Token: $token\n");
      usersRef
          .doc(userid)
          .update({"androidNotificationToken": token});
    });

    _firebaseMessaging.configure(
      // onLaunch: (Map<String, dynamic> message) async {},
      // onResume: (Map<String, dynamic> message) async {},
      onMessage: (Map<String, dynamic> message) async {
        // print("on message: $message\n");
        final String recipientId = message['data']['recipient'];
        final String body = message['notification']['body'];
        if (recipientId == userid) {
          // print("Notification shown!");
          SnackBar snackBar = SnackBar(
              content: Text(
                body,
                overflow: TextOverflow.ellipsis,
              ));
          _scaffoldKey.currentState.showSnackBar(snackBar);
        }
        // print("Notification NOT shown");
      },
    );

  }
  // void getUser()async {
  //   try{
  //     final user = await _auth.currentUser;
  //     if(user!=null){
  //       loggedInUser = user;
  //       print(loggedInUser.displayName);
  //     }
  //   }catch(e) {
  //     print(e);
  //   }
  // }

  handleSignIn(GoogleSignInAccount account) async {
    if (account != null) {
      await createUserInFirestore();
      setState(() {
        isAuth = true;
      });
      configurePushNotifications();
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }


  configurePushNotifications() {
    final GoogleSignInAccount user = googleSignIn.currentUser;
    if (Platform.isIOS) getiOSPermission();

    _firebaseMessaging.getToken().then((token) {
      // print("Firebase Messaging Token: $token\n");
      usersRef
          .doc(user.id)
          .update({"androidNotificationToken": token});
    });

    _firebaseMessaging.configure(
      // onLaunch: (Map<String, dynamic> message) async {},
      // onResume: (Map<String, dynamic> message) async {},
      onMessage: (Map<String, dynamic> message) async {
        // print("on message: $message\n");
        final String recipientId = message['data']['recipient'];
        final String body = message['notification']['body'];
        if (recipientId == user.id) {
          // print("Notification shown!");
          SnackBar snackBar = SnackBar(
              content: Text(
                body,
                overflow: TextOverflow.ellipsis,
              ));
          _scaffoldKey.currentState.showSnackBar(snackBar);
        }
        // print("Notification NOT shown");
      },
    );
  }

  getiOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(alert: true, badge: true, sound: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((settings) {
      // print("Settings registered: $settings");
    });
  }

  createUserInFirestore() async {
    // 1) check if user exists in users collection in database (according to their id)
    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    // 2) if the user doesn't exist, then we want to take them to the create account page
    if (!doc.exists) {
      final dropdownValue = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateAccount()));


      usersRef.doc(user.id).set({
        "id": user.id,
        "username" : dropdownValue,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "client": 0 ,
        "country":dropdownValue,
        "timestamp": timestamp,
        "ban":true
      });



      await  bankRef
          .doc(user.id)
          .set({

        "accno":"",
        "ifsc":"",

      });
      // make new user their own follower (to include their posts in their timeline)
      await followersRef
          .doc(user.id)
          .collection('userFollowers')
          .doc(user.id)
          .set({});



      doc = await usersRef.doc(user.id).get();
    }
    currentUser = Users.fromDocument(doc);

    myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString('id', currentUser.id);
    await myPrefs.setString('displayName', currentUser.displayName);
    await myPrefs.setString('photoUrl', currentUser.photoUrl);
    myPrefs = await SharedPreferences.getInstance();
    idd = myPrefs.getString('id') ?? '';
    print(idd);

  }



  login() {

    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
