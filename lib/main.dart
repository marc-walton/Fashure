import 'package:fashow/provider/image_upload_provider.dart';
import 'package:translated_text/translated_text.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    User loggedInUser;
  dynamic user;

  @override
  void initState() {
    super.initState();

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
  auth() async {

    FirebaseAuth.instance
        .authStateChanges()
        .listen((Users) async => {
      if (Users == null)
        {
          setState(() {
            isAuth = false;
          }),
          // Navigator.pushReplacementNamed(context, "/login")
        }
      else
        {
          user= Users.uid,
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
          // Firestore.instance
          //     .collection("users")
          //     .document(currentUser.uid)
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

    return  FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('jvbvbvbjnm');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => ImageUploadProvider()),
                // ChangeNotifierProvider(create: (_) => UserProvider()),
              ],
              child: GetMaterialApp(
                home:
                // CustomSplash(
                //   imagePath: 'assets/img/loading-76.gif',
                //   backGroundColor: Colors.deepOrange,
                //   // backGroundColor: Color(0xfffc6042),
                //   animationEffect: 'zoom-in',
                //   logoSize: 200,
                //   home: Homepage(),
                //   customFunction: auth(),
                //   duration: 2500,
                //   type: CustomSplashType.StaticDuration,
                //   outputAndHome: op,
                // ),

                Homepage(
                  userid:user,
                  authis: isAuth,
                ),

              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return  SplashScreen(
            title: Text(   'FASHURE',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  fontSize: 40,
                  color: Colors.white),),

            seconds: 3,
            backgroundColor: Colors.black,
            image: Image.asset('assets/img/loading-76.gif'),
            useLoader: false,
            photoSize: 50.0,
            navigateAfterSeconds:    Homepage(
              userid:user,
              authis: isAuth,
            ),
          );
        }
    );
  }


}