import 'package:fashow/provider/image_upload_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:fashow/HomePage.dart';
import 'package:get/get.dart';

//void main() => runApp(MaterialApp(
//
//
//    home: BottomNavBar(
//
//    )
//
//),);
//
//class BottomNavBar extends StatefulWidget {
//  @override
//  _BottomNavBarState createState() => _BottomNavBarState();
//}
//class _BottomNavBarState extends State<BottomNavBar> {
//  int _pageIndex = 0;
//  GlobalKey _bottomNavigationKey = GlobalKey();
//
//
//  List pages = [
//
//    MyRoute(
//      iconData: Icons.weekend,
//      page: HomePage(),
//    ),
//    MyRoute(
//      iconData: Icons.store,
//      page: Shop(),
//    ),
//    MyRoute(
//      iconData: FontAwesomeIcons.swatchbook,
//      page: Designer(),
//    ),
//    MyRoute(
//      iconData: Icons.play_arrow,
//      page: Live(),
//    ),
//  MyRoute(
//      iconData: Icons.shopping_cart,
//      page: Cart(),
//  ),
//
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      appBar: AppBar(backgroundColor: kPrimaryColor,
//          title: Image.asset('assets/img/login_logo.png',
//            fit: BoxFit.cover,
//            width: 182.0,
//          ),
//          iconTheme: new IconThemeData(color: kSecondaryColor),
////            leading:IconButton(  icon: Icon(
////              Icons.menu,
////              color: Colors.blue,),
//          actions: <Widget>[
//
//            IconButton(
//              icon: Icon(
//                Icons.search,
////          color: Colors.blue,
//              ),
//              onPressed: () {
//                // do something
//              },
//            ),
//            IconButton(
//              icon: Icon(
//                Icons.inbox,
////                  color: Colors.blue,
//              ),
//              onPressed: () {
//                // do something
//              },
//            ),
//
//          ]
//      ),
//      drawer: Theme(
//
//        data: Theme.of(context).copyWith(
//          canvasColor: Color(0XFFFFFFFF).withOpacity(0.3),
//
//        ),
//
//        child:Drawer(
//          child: ListView(
//              padding: EdgeInsets.all(0),
//              children: [
//                UserAccountsDrawerHeader(
////    accountEmail: Text("marcwalton8@gmail.com"),
//                  accountName: Text("marc walton" ),
//                  decoration: BoxDecoration(
//                    color:  Colors.transparent,
//                  ),
//                  currentAccountPicture: CircleAvatar(
//                    backgroundColor: kPrimaryColor,
//                    child: Text("mw"),
//                  ),
//                ),
//
//
//                ListTile(
//                  leading:
//                  Icon(Foundation.shopping_bag,color: Colors.lightBlueAccent,),
//                  title: Text('Orders'),
//
//                  onTap: (){},
//                ),
//                ListTile(
//                  leading: Icon(Icons.favorite,color: Colors.lightBlueAccent,),
//                  title: Text('wishlist'),
//                  onTap: (){},
//                ),
//                ListTile(
//                  leading: Icon(Icons.translate, color: Colors.lightBlueAccent,),
//                  title: Text('Language'),
//                  onTap: (){},
//                ),
//                ListTile(
//                  leading: Icon(Icons.phonelink ,color: Colors.lightBlueAccent,),
//                  title: Text('Help'),
//                  onTap: (){},
//                ),
//                ListTile(
//                  leading: Icon(Icons.settings, color: Colors.lightBlueAccent,),
//                  title: Text('Settings'),
//                  onTap: (){},
//                ),
//
//              ]
//          ),
//        ),
//      ),
//      bottomNavigationBar: CurvedNavigationBar(
//
//
//        key: _bottomNavigationKey,
//        index: 0,
//        height: 50.0,
//        items: pages
//            .map((p) => Icon(
//          p.iconData,
//          color: Colors.white,
//          size: 30,
//        ))
//
//            .toList(),
//        color: kSecondaryColor,
//
//        buttonBackgroundColor: kPrimaryColor,
//        backgroundColor:kPrimaryColor,
//        animationCurve: Curves.elasticInOut,
//        animationDuration: Duration(milliseconds: 400),
//        onTap: (index) {
//          setState(() {
//            _pageIndex = index;
//          });
//        },
//      ),
//    backgroundColor: kPrimaryColor,
//      body: pages[_pageIndex].page,
//    );
//  }
//}
//
//class MyRoute {
//  final IconData iconData;
//  final Widget page;
//
//  MyRoute({this.iconData, this.page});
//}
// final GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();

void main() =>
// Firestore.instance.settings().then((_) {
//   print("Timestamps enabled in snapshots\n");
// }, onError: (_) {
//   print("Error enabling timestamps in snapshots\n");
// });
runApp(FaShow());

class FaShow extends StatefulWidget {
  @override
  _FaShowState createState() => _FaShowState();
}

class _FaShowState extends State<FaShow> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageUploadProvider()),
       // ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: GetMaterialApp(

        home:   Homepage(),

      ),
    );
  }


}