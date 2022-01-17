import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/model/tags.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:fashow/methods/register.dart';
import 'package:fashow/methods/login.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:bottom_bar/bottom_bar.dart';

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


final Reference storageRef = FirebaseStorage.instance.ref();
final usersRef = FirebaseFirestore.instance.collection('users');
final shopRef = FirebaseFirestore.instance.collectionGroup('userProducts');
final postsRef = FirebaseFirestore.instance.collection('posts');
final bidsRef = FirebaseFirestore.instance.collection('bids');

final videoRef = FirebaseFirestore.instance.collection('videos');

final commentsRef = FirebaseFirestore.instance.collection('comments');
final videocommentsRef = FirebaseFirestore.instance.collection('videoComments');
final resalecommentsRef = FirebaseFirestore.instance.collection('resaleComments');
final communitycommentsRef = FirebaseFirestore.instance.collection('communityComments');

final cartRef = FirebaseFirestore.instance.collection('cart');
final favRef = FirebaseFirestore.instance.collection('favorites');
final wishRef = FirebaseFirestore.instance.collection('auctionWish');

final productcommentsRef = FirebaseFirestore.instance.collection('productcomments');
final blogcommentsRef = FirebaseFirestore.instance.collection('blogcomments');
final collcommentsRef = FirebaseFirestore.instance.collection('collcomments');
final addressRef = FirebaseFirestore.instance.collection('Address');
final sellerAddressRef = FirebaseFirestore.instance.collection('sellerAddress');

final CollectionReference _messageCollection =
FirebaseFirestore.instance.collection(MESSAGES_COLLECTION);

final activityFeedRef = FirebaseFirestore.instance.collection('feed');
final bankRef = FirebaseFirestore.instance.collection('Bank');

final followersRef = FirebaseFirestore.instance.collection('followers');
final followingRef = FirebaseFirestore.instance.collection('following');
final timelineRef = FirebaseFirestore.instance.collection('timeline');
final productsRef = FirebaseFirestore.instance.collection('products');
final blogRef = FirebaseFirestore.instance.collection("blogs");
final collRef = FirebaseFirestore.instance.collection("collections");
final tagsRef = FirebaseFirestore.instance.collection("tags");

final DateTime timestamp = DateTime.now().toUtc();
Users currentUser;
List<Tag_Model>tags = <Tag_Model>[];

class Homepage extends StatefulWidget {
  final userid;
  final photo;

  final bool auth;

  const Homepage({Key key, this.userid, this.photo,this.auth}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();


}

class _HomepageState extends State<Homepage> with WidgetsBindingObserver {
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  Timer _timerLink;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int data;
  int serdata;
   String s;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool isAuth ;
  bool h = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User loggedInUser;
List hashTagList;
  PageController pageController;
  int pageIndex = 0;
  SharedPreferences myPrefs;
  String idd;
  String username;
void handleLink()async {
  print("qwqwqwqwqwqwqw");

  FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData dynamicLink) async {
        print("succes");
        await _handleDeepLink(dynamicLink);
      });

  final PendingDynamicLinkData data =
  await FirebaseDynamicLinks.instance.getInitialLink();
   _handleDeepLink(data);

}
  _handleDeepLink(PendingDynamicLinkData data)async{
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      String Link = deepLink.queryParameters['type'];
      print("$Link");

      String type = Link.split("/").first;
      print("$type");

      String postIdpart = Link.split("=").last;
      print("$postIdpart");

      String postId = postIdpart.split("|").first;
      print("$postId");
      String ownerId = Link.split("|").last;
      print("$ownerId");

      print("type$type");

      print("postId$postId");

      print("ownerud$ownerId");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductScreen(
            prodId: postId,
            userId: ownerId,
          )));    }

  }
  @override
  void initState() {
    super.initState();
    print(">>>>>>>>>>>>>>>>>>>>sdcsdvwsvcwdvcsdscsdcscsdcdc");
     print(widget.userid);

    pageController = PageController();
    loginuser();
    print("initState");
    handleLink();
    getInitialHashTags();
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
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    if (state == AppLifecycleState.resumed) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<resumed>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      _dynamicLinkService.retrieveDynamicLink(context);
    }
    else if (state == AppLifecycleState.detached) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<detacg>>>>>>>>>>>>>>>>>>");
      _dynamicLinkService.retrieveDynamicLink(context);
    }else if (state == AppLifecycleState.paused) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<paused>>>>>>>>>>>>>>>>>>");
      _dynamicLinkService.retrieveDynamicLink(context);
    }

  }

  @override
getLink(){
    _timerLink = new Timer(
      const Duration(milliseconds: 1000),
          () {
        _dynamicLinkService.retrieveDynamicLink(context);
      },
    );
  }
getInitialHashTags() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users')
      .doc(widget.userid)
      .collection('hashTags')
  .orderBy('timestamp',descending: true)
  .limit(10)
      .get();
  setState(() {
    hashTagList = snapshot.docs.map((doc) => doc.id).toList();
  });
  getHashTagData();
}
getHashTagData()async{

  for(int i =0;i<hashTagList.length;i++)
  {
    QuerySnapshot snapshot = await postsRef
      .doc(widget.userid)
      .collection('userPosts')
    .where("hashTags",arrayContains: hashTagList[i])
      .orderBy('timestamp',descending: true)
      .limit(30)
      .get();

  setState(() {
    snapshot.docs.forEach((doc) {
      Tag_Model   assign = Tag_Model(type: "post",
      ownerId:doc.data()["ownerId"],
      postId:doc.data()["postId"],
      imgUrl:doc.data()["mediaUrl"],
    );
    tags.add(assign);
    });

  });
  }
for(int i =0;i<hashTagList.length;i++)
  {
    QuerySnapshot snapshot = await productsRef
      .doc(widget.userid)
      .collection('userProducts')
        .where("hashTags",arrayContains: hashTagList[i])
        .orderBy('timestamp',descending: true)
      .limit(30)
      .get();
  setState(() {
    snapshot.docs.forEach((doc){
Tag_Model assign = Tag_Model(type: "shop",
ownerId:doc.data()["ownerId"],
  postId:doc.data()["prodId"],
  imgUrl:doc.data()["shopmediaUrl"],
);
tags.add(assign);
    });
  });
  }
for(int i =0;i<hashTagList.length;i++)
  {
    QuerySnapshot snapshot = await blogRef
      .doc(widget.userid)
      .collection('userBlog')
        .where("hashTags",arrayContains: hashTagList[i])
        .orderBy('timestamp',descending: true)
      .limit(30)
      .get();

  setState(() {
    snapshot.docs.forEach((doc){
Tag_Model assign = Tag_Model(type: "editorial",
ownerId:doc.data()["ownerId"],
  postId:doc.data()["blogId"],
  imgUrl:doc.data()["blogmediaUrl"],
);
tags.add(assign);
    });
  });
  }
for(int i =0;i<hashTagList.length;i++)
  {
    QuerySnapshot snapshot = await collRef
      .doc(widget.userid)
      .collection('userCollections')
        .where("hashTags",arrayContains: hashTagList[i])
        .orderBy('timestamp',descending: true)
      .limit(30)
      .get();

  setState(() {
    snapshot.docs.forEach((doc){
Tag_Model assign = Tag_Model(type: "collection",
ownerId:doc.data()["ownerId"],
  postId:doc.data()["collId"],
  imgUrl:doc.data()["collmediaUrl"],
);
tags.add(assign);
    });
  });
  }
for(int i =0;i<hashTagList.length;i++)
  {
    QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Resale')
      .doc(widget.userid)
      .collection('userResale')
        .where("hashTags",arrayContains: hashTagList[i])
        .orderBy('timestamp',descending: true)
      .limit(30)
      .get();

  setState(() {
    snapshot.docs.forEach((doc){
Tag_Model assign = Tag_Model(type: "resale",
ownerId:doc.data()["ownerId"],
  postId:doc.data()["resaleId"],
  imgUrl:doc.data()["images"],
);
tags.add(assign);
    });
  });
  }

}
  logO() async {
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
    Fluttertoast.showToast(
        msg: "You have been banned. Contact us at fashure.business@gmail.com ", timeInSecForIos: 4);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  loginuser()async{

    if(currentUser.ban == true){
      logO();
    }
    else {
      // myPrefs = await SharedPreferences.getInstance();
      // await myPrefs.setString('id', currentUser.id);
      // await myPrefs.setString('displayName', currentUser.displayName);
      // await myPrefs.setString('photoUrl', currentUser.photoUrl);
      // myPrefs = await SharedPreferences.getInstance();
      // idd = myPrefs.getString('id') ?? '';
      // print(',jbkbhn$idd');
      if (Platform.isIOS) getiOSPermission();

      _firebaseMessaging.getToken().then((token) {
        print("Firebase Messaging Token: $token\n");
        usersRef
            .doc(widget.userid)
            .update({"androidNotificationToken": token});
      });

      _firebaseMessaging.configure(
        // onLaunch: (Map<String, dynamic> message) async {},
        // onResume: (Map<String, dynamic> message) async {},
        onMessage: (Map<String, dynamic> message) async {
          // print("on message: $message\n");
          final String recipientId = message['data']['recipient'];
          final String body = message['notification']['body'];
          if (recipientId == widget.userid) {
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
      WidgetsBinding.instance.addObserver(this);

              badgescountmessage();
              badgescount();


    }
  }

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
      print("Firebase Messaging Token: $token\n");
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

  @override
  void dispose() {
    pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    if (_timerLink != null) {
      _timerLink.cancel();
    }    super.dispose();
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
  badgescount()  {

    return
      StreamBuilder<QuerySnapshot>(
        stream:  activityFeedRef
            .doc(currentUser.id)
            .collection('feedItems')
            .where('read',isEqualTo: 'false')
            .snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            if(snapshot.data.docs.length == 0||snapshot.data.docs.isEmpty){
              return Container();

            }
            else {
              data +=  snapshot.data.docs.length;

              return
                Badge(

                  shape: BadgeShape.circle,
                  padding: EdgeInsets.all(2),
                  badgeContent: Text('$data',style: TextStyle(color: Colors.white),),
                );

            }

          }
          else{
            return Container();
          }

        },
      );

  }
  badgescountmessage()  {
    return
      StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('feed')
            .doc(currentUser.id)
            .collection('feedItems')
            .where('type',isEqualTo: 'Chat')
        .where('read',isEqualTo: 'false')

            .snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            if(snapshot.data.docs.length == 0||snapshot.data.docs.isEmpty){
              return Container();

            }
            else {
              data +=  snapshot.data.docs.length;

              return
                Badge(

                  shape: BadgeShape.circle,
                  padding: EdgeInsets.all(2),
                  badgeContent: Text('$data',style: TextStyle(color: Colors.white),),
                );

            }

          }
          else{
            return Container();
          }



        },
      );

  }

   buildAuthScreen() {

    return Scaffold(
      key: _scaffoldKey,

      body: Container(

        child: PageView(
          children: <Widget>[

            Timeline(currentUser: currentUser,userid:widget.userid,photo:widget.photo),
            Shop(currentUser: currentUser),
            Designer(),
            LiveTv(),
            ActivityFeed(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: pageIndex,
        selectedItemColor: Colors.black,
        selectedLabelStyle:TextStyle(color:Colors.black),
        onTap: (int index) {
          pageController.jumpToPage(index);
          setState(() => pageIndex = index);
        },
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.weekend,color: Colors.grey,),
            label: 'Home',
            activeIcon:Icon(Icons.weekend,color: Colors.black,),
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon:    Icon(Icons.store,color: Colors.grey,),
            label: 'Shop',
            activeIcon:Icon(Icons.store,color: Colors.black,),
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.swatchbook,color: Colors.grey,),
            label: 'Freelancers',
            activeIcon:Icon(FontAwesomeIcons.swatchbook,color: Colors.black,),
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.play_arrow,color: Colors.grey,),
            label: 'FashureTV',
            activeIcon:Icon(Icons.play_arrow,color: Colors.black,),
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Row(
              children: [
                Icon(Icons.inbox,color: Colors.grey,),
                currentUser == null?  Container():badgescount(),

              ],
            ),
            label: 'Settings',
activeIcon:Icon(Icons.inbox,color: Colors.black,),
            backgroundColor: Colors.white,


          ),
        ],
      ),
//       CurvedNavigationBar(
//
// //    currentIndex : pageIndex,
//         onTap: onTap,
//         color: kPrimaryColor,
//         buttonBackgroundColor: Colors.transparent,
//         backgroundColor:kblue,
//         animationCurve: Curves.elasticInOut,
//         animationDuration: Duration(milliseconds: 001),
//         height: 50.0,
//         items: <Widget>[
//
//           Icon(Icons.weekend, size: 30, color: Colors.white,),
//           Icon(Icons.store, size: 30,color: Colors.white,),
//           Icon(FontAwesomeIcons.swatchbook, size: 30,color: Colors.white,),
//           Icon(Icons.play_arrow, size: 30,color: Colors.white,),
//           Row(
//             children: [
//
//              currentUser == null?  Badge(
//       shape: BadgeShape.circle,
//       padding: EdgeInsets.all(7),
//       badgeContent: Text('0',style: TextStyle(color: Colors.white),),
//     ):badgescount(),
//               Icon(Icons.inbox, size: 30,color: Colors.white,),
//             ],
//           ),
//
//         ],
//
//       ),

    );
//    return RaisedButton(
//      child: Text('Log out'),
//      onPressed: logout,
//    );
  }

  Scaffold  buildUnAuthScreen(parentContext) {
    final Orientation orientation = MediaQuery.of(context).orientation;


    return Scaffold(
      backgroundColor: Colors.white,
      ///,sdgkb
      body: Container(

        // decoration: BoxDecoration(
        //
        //     gradient: fabGradient
        // ) ,
        // alignment: Alignment.center,
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
        ),),


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
                    parentContext,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(

                        )),
                  ),
                  label: Text('Sign in',style:TextStyle(color: Colors.white) ,),
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
                      parentContext,
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
  @override
  Widget build(BuildContext context) {
    return widget.auth? buildAuthScreen() : buildUnAuthScreen(context);





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
    "text": "We let you to post your design on our app",
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