import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fashow/methods/register.dart';
import 'package:fashow/methods/login.dart';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
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

final GoogleSignIn googleSignIn = GoogleSignIn();

final StorageReference storageRef = FirebaseStorage.instance.ref();
final usersRef = Firestore.instance.collection('users');
final shopRef = Firestore.instance.collectionGroup('userProducts');
final postsRef = Firestore.instance.collection('posts');
final videoRef = Firestore.instance.collection('videos');

final commentsRef = Firestore.instance.collection('comments');
final videocommentsRef = Firestore.instance.collection('comments');

final cartRef = Firestore.instance.collection('cart');
final favRef = Firestore.instance.collection('favorites');
final productcommentsRef = Firestore.instance.collection('productcomments');
final blogcommentsRef = Firestore.instance.collection('blogcomments');
final collcommentsRef = Firestore.instance.collection('collcomments');
final addressRef = Firestore.instance.collection('Address');
final bankRef = Firestore.instance.collection('Bank');
final CollectionReference _messageCollection =
Firestore.instance.collection(MESSAGES_COLLECTION);

final activityFeedRef = Firestore.instance.collection('feed');
final followersRef = Firestore.instance.collection('followers');
final followingRef = Firestore.instance.collection('following');
final timelineRef = Firestore.instance.collection('timeline');
final productsRef = Firestore.instance.collection('products');
final blogRef = Firestore.instance.collection("blogs");
final collRef = Firestore.instance.collection("collections");
final tagsRef = Firestore.instance.collection("tags");

final DateTime timestamp = DateTime.now();
User currentUser;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();


}

class _HomepageState extends State<Homepage> with WidgetsBindingObserver  {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  // String dropdownValue ;
  String _country;
  int data;
  int serdata;
  String reviewId = Uuid().v4();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  int followers ;
  SharedPreferences myPrefs;
String idd;
String username;
//  UserProvider userProvider;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      // initialPage: 2
    );
    String dropdownValue = '';
    String _country = '';
    // auth();
    getFollowers();


    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Reauthenticate user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('Error signing in: $err');
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
auth() async {
    FirebaseAuth.instance
        .currentUser()
        .then((User) async => {
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
    }),
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
  loginuser({userid})async{
    DocumentSnapshot doc = await usersRef.document(userid).get();
    currentUser = User.fromDocument(doc);
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
          .document(userid)
          .updateData({"androidNotificationToken": token});
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
  void getUser()async {
    try{
      final user = await _auth.currentUser();
      if(user!=null){
        loggedInUser = user;
print(loggedInUser.displayName);
      }
    }catch(e) {
      print(e);
    }
  }
  //     _saveForm() {
  //
  //
  //       usersRef.document(currentUser.id).updateData({
  //         'country':dropdownValue,
  //       });
  //
  //
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
          .document(user.id)
          .updateData({"androidNotificationToken": token});
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
    DocumentSnapshot doc = await usersRef.document(user.id).get();
    // 2) if the user doesn't exist, then we want to take them to the create account page
    if (!doc.exists) {
      final dropdownValue = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateAccount()));


      usersRef.document(user.id).setData({
        "id": user.id,
        "coverPhoto":"assets/img/cover.jpg",
        "username" : dropdownValue,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "client": 0 ,
       "country":dropdownValue,
        "timestamp": timestamp
      });



    await  bankRef
          .document(user.id)
          .setData({

        "accno":"",
        "ifsc":"",

      });
      // make new user their own follower (to include their posts in their timeline)
      await followersRef
          .document(user.id)
          .collection('userFollowers')
          .document(user.id)
          .setData({});



      doc = await usersRef.document(user.id).get();
    }
    currentUser = User.fromDocument(doc);

    myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString('id', currentUser.id);
    await myPrefs.setString('displayName', currentUser.displayName);
    await myPrefs.setString('photoUrl', currentUser.photoUrl);
    myPrefs = await SharedPreferences.getInstance();
    idd = myPrefs.getString('id') ?? '';
    print(idd);
    badgescount();

  }

  @override
  void dispose() {
    pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 001),
      curve: Curves.easeInOut,
    );
  }
  getFollowers() async {
    QuerySnapshot snapshot = await followersRef
        .document(currentUser.id)
        .collection('userFollowers')
        .getDocuments();
    setState(() {
      followers = snapshot.documents.length;
//      usersRef.document(currentUser.id).updateData({
//        "followers":snapshot.documents.length,
      });


  }
  badgescount()  {
    return
      StreamBuilder(
        stream:  activityFeedRef
            .document(currentUser.id)
            .collection('feedItems')
            .where('read',isEqualTo: 'false').snapshots(),
        builder: (context,snapshot){
          int data =  snapshot.data.documents.length;
          return
            Badge(

              shape: BadgeShape.circle,
              padding: EdgeInsets.all(2),
              badgeContent: Text('$data',style: TextStyle(color: kText),),
            );

        },
      );

  }
  badgescountmessage()  {
    return
      StreamBuilder(
        stream: _messageCollection
            .document(currentUser.id)

            .snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){return Container();}else{ int data;
          String messages = snapshot.data['read'];
          if(messages == 'false');
          {
            setState(() {
              data  = messages.length;
            });
            return

              Badge(
                shape: BadgeShape.circle,
                padding: EdgeInsets.all(7),
                badgeContent: Text('$data',style: TextStyle(color: kText),),
              );
          }

          }


        },
      );

  }
  dashbadge(){

    if(serdata == null||data == null) {
      return Container();
    }else{
      var sum = serdata + data;
      return
        Badge(
          shape: BadgeShape.circle,
          padding: EdgeInsets.all(7),
          badgeContent: Text('$sum', style: TextStyle(color: kText),),
        );
    }
  }
  orderbadge(){
    return
      StreamBuilder(
        stream:  Firestore.instance.collection('ordersSeller')
            .document(currentUser.id)
            .collection('sellerOrder')
            .where('read',isEqualTo: 'false').snapshots(),
        builder: (context,snapshot){
          setState(() {
            data =  snapshot.data.documents.length;
          });

          return
            StreamBuilder(
              stream:   Firestore.instance.collection('Payments')
                  .document(currentUser.id,)
                  .collection('SellerPayments')
                  .where('fulfilled',isEqualTo: 'true')
                  .where('read',isEqualTo: 'false').snapshots(),
              builder: (context,snapshot){

                setState(() {
                  data +=  snapshot.data.documents.length;
                });
                return
                  Badge(
                    shape: BadgeShape.circle,
                    padding: EdgeInsets.all(7),
                    badgeContent: Text('$data ',style: TextStyle(color: kText),),
                  );

              },
            );


        },
      );
  }
  servicebadge(){
    return
      StreamBuilder(
        stream:     Firestore.instance.collection('serviceSeller')
            .document(currentUser.id)
            .collection('sellerService')
            .where('read',isEqualTo: 'false').snapshots(),
        builder: (context,snapshot){
          setState(() {
            serdata =  snapshot.data.documents.length;
          });

          return
            StreamBuilder(
              stream:   Firestore.instance.collection('Payments')
                  .document(currentUser.id)
                  .collection('ServicePayments')
                  .where('fulfilled',isEqualTo: 'true')
                  .where('read',isEqualTo: 'false').snapshots(),
              builder: (context,snapshot){
                setState(() {
                  serdata +=  snapshot.data.documents.length;
                });
                return
                  Badge(
                    shape: BadgeShape.circle,
                    padding: EdgeInsets.all(7),
                    badgeContent: Text('$serdata ',style: TextStyle(color: kText),),
                  );

              },
            );


        },
      );
  }
  Scaffold buildAuthScreen() {


    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: fabGradient
          // LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors:[ kPrimaryColor,
          //     kSecondaryColor
          //
          //   ],
          // ),
        ) ,
        alignment: Alignment.center,
        child: PageView(
          children: <Widget>[
//          RaisedButton(
//      child: Text('Log out'),
//      onPressed: logout,
//   ),
            Timeline(),
          Shop(currentUser: currentUser),
            Designer(),
            LiveTv(),
          ActivityFeed(),
//          Upload(currentUser,: currentUser),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
            physics: NeverScrollableScrollPhysics(),
        ),
      ),
    bottomNavigationBar: CurvedNavigationBar(

//    currentIndex : pageIndex,
    onTap: onTap,
      color: kPrimaryColor,
    buttonBackgroundColor: Colors.transparent,
    backgroundColor:Colors.black38,
    animationCurve: Curves.elasticInOut,
    animationDuration: Duration(milliseconds: 001),
      height: 50.0,
    items: <Widget>[

      Icon(Icons.weekend, size: 30, color: kIcon,),
      Icon(Icons.store, size: 30,color: kIcon,),
      Icon(FontAwesomeIcons.swatchbook, size: 30,color: kIcon,),
      Icon(Icons.play_arrow, size: 30,color: kIcon,),
      Stack(children:[ Icon(Icons.inbox, size: 30,color: kIcon,),
        Positioned(
          top: 1.0,
          right:1.0,
          child:  badgescount(),),

      ]),

    ],

    ),

    );
//    return RaisedButton(
//      child: Text('Log out'),
//      onPressed: logout,
//    );
  }

  Scaffold  buildUnAuthScreen(parentContext) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:[ kPrimaryColor,
              kSecondaryColor

            ],
          ),
        ) ,
          alignment: Alignment.center,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RotateAnimatedTextKit(text: ["Design","Showcase","influence","Buy","Sell","Blog","Freelance","Live Shows","Community","FASHURE"],
              textStyle:  TextStyle(
                fontFamily: "MajorMonoDisplay",
                fontSize:  MediaQuery.of(context).size.width*0.1,
                color: Colors.white,),
                textAlign: TextAlign.center,
                // totalRepeatCount:
repeatForever: true,
              ),
            ),
            GoogleSignInButton(
              onPressed: login,
              darkMode: true, // default: false
            ),

//            InkWell(
//              onTap: login,
//             highlightColor: Colors.deepPurple,
//             splashColor: Colors.deepPurple,
//
//             child: Container(
//               width: 260.0,
//                 height: 60.0,
// decoration: BoxDecoration(
//   image: DecorationImage(
//     image: AssetImage(
//       'assets/img/google.png'),
//     fit: BoxFit.cover,
//   )
// ),
//
//),
//
//            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: FlatButton.icon(
                onPressed: logout,
                icon: Icon(Icons.cancel, color: Colors.red),
                label: Text(
                  "Logout",
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [FloatingActionButton.extended(
              heroTag:'in',

              backgroundColor: kblue,
              onPressed: ()=>  Navigator.push(
                parentContext,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(

                      )),
              ),
              label: Text('Sign in',style:TextStyle(color: kText) ,),
            ),
              FloatingActionButton.extended(
                heroTag:'up',
                backgroundColor: kblue,
                onPressed: ()=>Navigator.push(
                  parentContext,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage(

                      )),
                ),
                label: Text('Sign up',style:TextStyle(color: kText) ,),
              ),],
          ),
        ),
      );


  }

  @override
  Widget build(BuildContext context) {
       return isAuth? buildAuthScreen() : buildUnAuthScreen(context);





  }
}
class button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoogleSignInButton(
      // onPressed: login,
      darkMode: true, // default: false
    );
  }
}

//this
//
//class Cart extends StatefulWidget {
//  @override
//  _CartState createState() => _CartState();
//}
//
//class _CartState extends State<Cart> {
//  Icon cusIcon = Icon(Icons.search);
//  Widget cusSearch = Text(   'Notification',
//    style: TextStyle(
//        fontFamily :"MajorMonoDisplay",
//        fontSize:  35.0 ,
//        color: Colors.white),);
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(backgroundColor: kPrimaryColor,
//          title: cusSearch,
//          iconTheme: new IconThemeData(color: kSecondaryColor),
////            leading:IconButton(  icon: Icon(
////              Icons.menu,
////              color: Colors.blue,),
//          actions: <Widget>[
//
//            IconButton(              onPressed: () {
//              setState(() {
//                if (this.cusIcon.icon == Icons.search){
//                  this.cusIcon = Icon(Icons.clear);
//                  this.cusSearch = TextField(
//                    textInputAction: TextInputAction.go,
//                    decoration: InputDecoration(
//                      border:InputBorder.none,
//                      hintText: "Search",
//                    ),
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 16.0,
//                    ),
//                  );
//                }
//                else{
//                  this.cusIcon = Icon(Icons.search);
//                  this.cusSearch = Text(   'Notification',
//                    style: TextStyle(
//                        fontFamily :"MajorMonoDisplay",
//                        fontSize:  35.0 ,
//                        color: Colors.white),);
//                }
//              });
//              // do something
//            },
//              icon: cusIcon,
//            ),
//IconButton(
//  icon: Icon(Icons.account_box),
//  onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));
//
//  },
//
//)
//          ]
//      ),
//      backgroundColor: kSecondaryColor,
//      body:Center(
//        child: Text('cart'),
//      ),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Colors.transparent,
//        onPressed: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context) =>Upload( currentUser : currentUser)));
//
//          // Add your onPressed code here!
//        },
//        child: Icon(Icons.mail),
//      ),
//    );
//
//  }
//}
