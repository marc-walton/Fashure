import 'package:fashow/provider/image_upload_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:fashow/HomePage.dart';
import 'package:get/get.dart';



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