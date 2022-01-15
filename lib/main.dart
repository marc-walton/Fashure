import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/provider/image_upload_provider.dart';
import 'package:fashow/user.dart';
import 'package:neon/neon.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FaShow());
}
class FaShow extends StatefulWidget {
  @override
  _FaShowState createState() => _FaShowState();
}

class _FaShowState extends State<FaShow> {
  bool isAuth = false;
  DocumentSnapshot doc;
  dynamic user;
dynamic photo;

  @override
  void initState() {
    super.initState();

    auth();

  }

  auth() async {

    FirebaseAuth.instance
        .userChanges()
        .listen((users) async => {
      if (users == null)
        {
          setState(() {
            isAuth = false;
          }),
          // Navigator.pushReplacementNamed(context, "/login")
        }
      else
        {
          user= users.uid,
          photo= users.photoURL,
         doc = await usersRef.doc(users.uid).get(),
    currentUser = Users.fromDocument(doc),
          setState(() {
            isAuth = true;

          }),
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Homepage(
          //           userid: User.uid,
          //           authis: isAuth,
          //         )))
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

  // Map<bool, Widget> op = {isAuth: Homepage(), 2: unAuth()};
  @override
  Widget build(BuildContext context) {

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ImageUploadProvider()),
        // ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        AnimatedSplashScreen(

            duration: 2000,
            splash:

            Text('FASHURE',
              style: TextStyle(
                  fontFamily: "Neoneon",
                  fontSize: 50,
                  color: Colors.white),),

            nextScreen: Homepage(userid: user,photo: photo,auth: isAuth,),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.black
        ),
      ),
    );

  }


}

