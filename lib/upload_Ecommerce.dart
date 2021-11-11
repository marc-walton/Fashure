import 'dart:io';
import 'dart:async';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Categories/BboyEcomUp.dart';
import 'package:fashow/Categories/BgirlEcomUp.dart';
import 'package:fashow/Categories/KboyEcomUp.dart';
import 'package:fashow/Categories/KgirlEcomUp.dart';
import 'package:fashow/Categories/MenEcomUp.dart';
import 'package:fashow/Categories/WomenEcomUp.dart';
import 'package:fashow/Categories/TboyEcomUp.dart';
import 'package:fashow/Categories/TgirlEcomUp.dart';
import 'package:fashow/enum/Variables.dart';

import 'package:fashow/Products.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fashow/user.dart';
import 'package:fashow/methods/country.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'package:back_pressed/back_pressed.dart';
import 'package:fashow/size_config.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Uploadecom extends StatefulWidget {
  final Users currentUser;


  Uploadecom({this.currentUser});
  @override
  _UploadecomState createState() => _UploadecomState();
}

class _UploadecomState extends State<Uploadecom>
    with AutomaticKeepAliveClientMixin<Uploadecom> {
  String prodId = Uuid().v4();


  List<Asset> images = <Asset>[];
  PageController pageController = PageController();

  List<String> imageUrls = <String>[];


  bool isUploading = false;
  List<String> selectedSizes = <String>[];

  String dropdownValue = 'Women';


  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
   final _formKey1 = GlobalKey<FormState>();
   final _formKey2 = GlobalKey<FormState>();

  bool _inProcess = false;
var userPrice;
var userPrice1;
var userPrice2;
var userPrice3;
var userPrice4;
var userPrice5;
var userPrice6;
var userPrice7;
var userPrice8;
var userPrice9;
var userPrice10;
var userPrice11;
var userPrice12;


var INR;
var INR1;
var INR2;
var INR3;
var INR4;
var INR5;
var INR6;
var INR7;
var INR8;
var INR9;
var INR10;
var INR11;
var INR12;

var USD;
var USD1;
var USD2;
var USD3;
var USD4;
var USD5;
var USD6;
var USD7;
var USD8;
var USD9;
var USD10;
var USD11;
var USD12;

var EUR;
var EUR1;
var EUR2;
var EUR3;
var EUR4;
var EUR5;
var EUR6;
var EUR7;
var EUR8;
var EUR9;
var EUR10;
var EUR11;
var EUR12;

var GBP;
var GBP1;
var GBP2;
var GBP3;
var GBP4;
var GBP5;
var GBP6;
var GBP7;
var GBP8;
var GBP9;
var GBP10;
var GBP11;
var GBP12;

int pageChanged  = 0;
  @override
  void initState() {
    // _controller = ScrollController();
    // _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
    // _tabController = TabController(length: 2,vsync: this);
    productsRef
        .doc(widget.currentUser.id)
        .collection("userProducts")
        .doc(prodId)
        .set({});
  }


  Widget getImageWidget() {
    if (file != null) {
      return InkWell(
        onTap:()=>getImage(),
        child: Image.file(
          file,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage(),
        child: Column(
          children: [
            Icon(
            Icons.add,
              size:50,
            ),
            Text("Add image")
          ],
        ),
      );
    }
  }

  getImage() async {
    Get.back();
    this.setState(() {
      _inProcess = true;
    });
    PickedFile pickedFile = await  ImagePicker().getImage(source: ImageSource.gallery);
    File image  = File(pickedFile.path);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file = cropped;
        _inProcess = true;
        custom();
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
  Widget getImageWidget1() {
    if (file1 != null) {
      return InkWell(
        onTap:()=>getImage1(),
        child: Image.file(
          file1,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage1(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
             Text("Add image")

           ],
         ));
    }
  }

  getImage1() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file1 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
  Widget getImageWidget2() {
    if (file2 != null) {
      return InkWell(
        onTap:()=>getImage2(),
        child: Image.file(
          file2,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage2(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
             Text("Add image")

           ],
         ));
    }
  }

  getImage2() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file2 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  Widget getImageWidget3() {
    if (file3 != null) {
      return InkWell(
        onTap:()=>getImage3(),
        child: Image.file(
          file3,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage3(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
                    Text("Add image")

           ],
         ));
    }
  }

  getImage3() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file3 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
Widget getImageWidget4() {
    if (file4 != null) {
      return InkWell(
        onTap:()=>getImage4(),
        child: Image.file(
          file4,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage4(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
                    Text("Add image")

           ],
         ));
    }
  }

  getImage4() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file4 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
Widget getImageWidget5() {
    if (file5 != null) {
      return InkWell(
        onTap:()=>getImage5(),
        child: Image.file(
          file5,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage5(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
             Text("Add image")

           ],
         ));
    }
  }

  getImage5() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file5 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

Widget getImageWidget6() {
    if (file6 != null) {
      return InkWell(
        onTap:()=>getImage6(),
        child: Image.file(
          file6,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage6(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
             Text("Add image")

           ],
         ));
    }
  }

  getImage6() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file6 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
Widget getImageWidget7() {
    if (file7 != null) {
      return InkWell(
        onTap:()=>getImage7(),
        child: Image.file(
          file7,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage7(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
                    Text("Add image")

           ],
         ));
    }
  }

  getImage7() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file7 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
Widget getImageWidget8() {
    if (file8 != null) {
      return InkWell(
        onTap:()=>getImage8(),
        child: Image.file(
          file8,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage8(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
             Text("Add image")

           ],
         ));
    }
  }

  getImage8() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file8 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
Widget getImageWidget9() {
    if (file9 != null) {
      return InkWell(
        onTap:()=>getImage9(),
        child: Image.file(
          file9,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage9(),
         child: Column(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
                    Text("Add image")

           ],
         ));
    }
  }

  getImage9() async {
    Get.back();

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file9 = cropped;
        _inProcess = true;
        custom();

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  Widget getImageWidget01() {
    if (customImg1 != null) {
      return InkWell(
        onTap:()=>getImage01(),
        child:
        Row(
          children: [
            Image.file(
              customImg1,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width:4),
            Text("Add Size Guide") ,
Spacer(),
            TextButton(
//                 style: ElevatedButton.styleFrom(
// textStyle                ),
                onPressed: ()=>sizeGuide(),

                child:Text("Default size chart")
            )
          ],
        )

      );
    } else {
      return InkWell(
        onTap:()=>getImage01(),
         child: Row(
           children: [
             Icon(
      Icons.add,
        size:50,
      ),
             Text("Add Size Guide"),
             Spacer(),
             TextButton(
//                 style: ElevatedButton.styleFrom(
// textStyle                ),
                 onPressed: ()=>sizeGuide(),

                 child:Text("Default size chart")
             )
           ],
         ));
    }
  }
  getImage01() async {

    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );
      if (!mounted) {
        return;
      }
      setState(() {
        customImg1 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 //    Widget getImageWidget02() {
 //    if (customImg2 != null) {
 //      return InkWell(
 //        onTap:()=>getImage02(),
 //        child: Image.file(
 //          customImg2,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage02(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage02() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg2 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //    Widget getImageWidget03() {
 //    if (customImg3 != null) {
 //      return InkWell(
 //        onTap:()=>getImage03(),
 //        child: Image.file(
 //          customImg3,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage03(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage03() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg3 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //    Widget getImageWidget04() {
 //    if (customImg4 != null) {
 //      return InkWell(
 //        onTap:()=>getImage04(),
 //        child: Image.file(
 //          customImg4,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage04(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage04() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg4 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //   Widget getImageWidget05() {
 //    if (customImg5 != null) {
 //      return InkWell(
 //        onTap:()=>getImage05(),
 //        child: Image.file(
 //          customImg5,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage05(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage05() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg5 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //   Widget getImageWidget06() {
 //    if (customImg6 != null) {
 //      return InkWell(
 //        onTap:()=>getImage06(),
 //        child: Image.file(
 //          customImg6,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage06(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage06() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg6 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //   Widget getImageWidget07() {
 //    if (customImg7 != null) {
 //      return InkWell(
 //        onTap:()=>getImage07(),
 //        child: Image.file(
 //          customImg7,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage07(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage07() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg7 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //    Widget getImageWidget08() {
 //    if (customImg8 != null) {
 //      return InkWell(
 //        onTap:()=>getImage08(),
 //        child: Image.file(
 //          customImg8,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage08(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage08() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg8 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //   Widget getImageWidget09() {
 //    if (customImg9 != null) {
 //      return InkWell(
 //        onTap:()=>getImage09(),
 //        child: Image.file(
 //          customImg9,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage09(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage09() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg9 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //   Widget getImageWidget010() {
 //    if (customImg10 != null) {
 //      return InkWell(
 //        onTap:()=>getImage010(),
 //        child: Image.file(
 //          customImg10,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage010(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage010() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg10 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //    Widget getImageWidget011() {
 //    if (customImg11 != null) {
 //      return InkWell(
 //        onTap:()=>getImage011(),
 //        child: Image.file(
 //          customImg11,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage011(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage011() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg11 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //   Widget getImageWidget012() {
 //    if (customImg12 != null) {
 //      return InkWell(
 //        onTap:()=>getImage012(),
 //        child: Image.file(
 //          customImg12,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage012(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage012() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg12 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //  Widget getImageWidget013() {
 //    if (customImg13 != null) {
 //      return InkWell(
 //        onTap:()=>getImage013(),
 //        child: Image.file(
 //          customImg13,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage013(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage013() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg13 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget014() {
 //    if (customImg14 != null) {
 //      return InkWell(
 //        onTap:()=>getImage014(),
 //        child: Image.file(
 //          customImg14,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage014(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage014() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg14 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget015() {
 //    if (customImg15 != null) {
 //      return InkWell(
 //        onTap:()=>getImage015(),
 //        child: Image.file(
 //          customImg15,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage015(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage015() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg15 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget016() {
 //    if (customImg16 != null) {
 //      return InkWell(
 //        onTap:()=>getImage016(),
 //        child: Image.file(
 //          customImg16,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage016(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage016() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg16 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget017() {
 //    if (customImg17 != null) {
 //      return InkWell(
 //        onTap:()=>getImage017(),
 //        child: Image.file(
 //          customImg17,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage017(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage017() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg17 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget018() {
 //    if (customImg18 != null) {
 //      return InkWell(
 //        onTap:()=>getImage018(),
 //        child: Image.file(
 //          customImg18,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage018(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage018() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg18 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget019() {
 //    if (customImg19 != null) {
 //      return InkWell(
 //        onTap:()=>getImage019(),
 //        child: Image.file(
 //          customImg19,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage019(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage019() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg19 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget020() {
 //    if (customImg20 != null) {
 //      return InkWell(
 //        onTap:()=>getImage020(),
 //        child: Image.file(
 //          customImg20,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage020(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage020() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg20 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget021() {
 //    if (customImg21 != null) {
 //      return InkWell(
 //        onTap:()=>getImage021(),
 //        child: Image.file(
 //          customImg21,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage021(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage021() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg21 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget022() {
 //    if (customImg22 != null) {
 //      return InkWell(
 //        onTap:()=>getImage022(),
 //        child: Image.file(
 //          customImg22,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage022(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage022() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg22 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget023() {
 //    if (customImg23 != null) {
 //      return InkWell(
 //        onTap:()=>getImage023(),
 //        child: Image.file(
 //          customImg23,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage023(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage023() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg23 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget024() {
 //    if (customImg24 != null) {
 //      return InkWell(
 //        onTap:()=>getImage024(),
 //        child: Image.file(
 //          customImg24,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage024(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage024() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg24 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget025() {
 //    if (customImg25 != null) {
 //      return InkWell(
 //        onTap:()=>getImage025(),
 //        child: Image.file(
 //          customImg25,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage025(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage025() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg25 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget026() {
 //    if (customImg26 != null) {
 //      return InkWell(
 //        onTap:()=>getImage026(),
 //        child: Image.file(
 //          customImg26,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage026(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage026() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg26 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget027() {
 //    if (customImg27 != null) {
 //      return InkWell(
 //        onTap:()=>getImage027(),
 //        child: Image.file(
 //          customImg27,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage027(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage027() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg27 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget028() {
 //    if (customImg28 != null) {
 //      return InkWell(
 //        onTap:()=>getImage028(),
 //        child: Image.file(
 //          customImg28,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage028(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage028() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg28 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget029() {
 //    if (customImg29 != null) {
 //      return InkWell(
 //        onTap:()=>getImage029(),
 //        child: Image.file(
 //          customImg29,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage029(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage029() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg29 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget030() {
 //    if (customImg30 != null) {
 //      return InkWell(
 //        onTap:()=>getImage030(),
 //        child: Image.file(
 //          customImg30,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage030(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage030() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg30 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget031() {
 //    if (customImg31 != null) {
 //      return InkWell(
 //        onTap:()=>getImage031(),
 //        child: Image.file(
 //          customImg31,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage031(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage031() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg31 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget032() {
 //    if (customImg32 != null) {
 //      return InkWell(
 //        onTap:()=>getImage032(),
 //        child: Image.file(
 //          customImg32,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage032(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage032() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg32 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget033() {
 //    if (customImg33 != null) {
 //      return InkWell(
 //        onTap:()=>getImage033(),
 //        child: Image.file(
 //          customImg33,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage033(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage033() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg33 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget034() {
 //    if (customImg34 != null) {
 //      return InkWell(
 //        onTap:()=>getImage034(),
 //        child: Image.file(
 //          customImg34,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage034(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage034() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg34 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget035() {
 //    if (customImg35 != null) {
 //      return InkWell(
 //        onTap:()=>getImage035(),
 //        child: Image.file(
 //          customImg35,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage035(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage035() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg35 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget036() {
 //    if (customImg36 != null) {
 //      return InkWell(
 //        onTap:()=>getImage036(),
 //        child: Image.file(
 //          customImg36,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage036(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage036() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg36 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget037() {
 //    if (customImg37 != null) {
 //      return InkWell(
 //        onTap:()=>getImage037(),
 //        child: Image.file(
 //          customImg37,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage037(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage037() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg37 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget038() {
 //    if (customImg38 != null) {
 //      return InkWell(
 //        onTap:()=>getImage038(),
 //        child: Image.file(
 //          customImg38,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage038(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage038() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg38 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget039() {
 //    if (customImg39 != null) {
 //      return InkWell(
 //        onTap:()=>getImage039(),
 //        child: Image.file(
 //          customImg39,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage039(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage039() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg39 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget040() {
 //    if (customImg40 != null) {
 //      return InkWell(
 //        onTap:()=>getImage040(),
 //        child: Image.file(
 //          customImg40,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage040(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage040() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg40 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget041() {
 //    if (customImg41 != null) {
 //      return InkWell(
 //        onTap:()=>getImage041(),
 //        child: Image.file(
 //          customImg41,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage041(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage041() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg41 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget042() {
 //    if (customImg42 != null) {
 //      return InkWell(
 //        onTap:()=>getImage042(),
 //        child: Image.file(
 //          customImg42,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage042(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage042() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg42 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget043() {
 //    if (customImg43 != null) {
 //      return InkWell(
 //        onTap:()=>getImage043(),
 //        child: Image.file(
 //          customImg43,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage043(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage043() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg43 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget044() {
 //    if (customImg44 != null) {
 //      return InkWell(
 //        onTap:()=>getImage044(),
 //        child: Image.file(
 //          customImg44,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage044(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage044() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg44 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget045() {
 //    if (customImg45 != null) {
 //      return InkWell(
 //        onTap:()=>getImage045(),
 //        child: Image.file(
 //          customImg45,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage045(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage045() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg45 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget046() {
 //    if (customImg46 != null) {
 //      return InkWell(
 //        onTap:()=>getImage046(),
 //        child: Image.file(
 //          customImg46,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage046(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage046() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg46 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget047() {
 //    if (customImg47 != null) {
 //      return InkWell(
 //        onTap:()=>getImage047(),
 //        child: Image.file(
 //          customImg47,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage047(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage047() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg47 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget048() {
 //    if (customImg48 != null) {
 //      return InkWell(
 //        onTap:()=>getImage048(),
 //        child: Image.file(
 //          customImg48,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage048(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage048() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg48 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget049() {
 //    if (customImg49 != null) {
 //      return InkWell(
 //        onTap:()=>getImage049(),
 //        child: Image.file(
 //          customImg49,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage049(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage049() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg49 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 // Widget getImageWidget050() {
 //    if (customImg50 != null) {
 //      return InkWell(
 //        onTap:()=>getImage050(),
 //        child: Image.file(
 //          customImg50,
 //          width: 150,
 //          height: 150,
 //          fit: BoxFit.cover,
 //        ),
 //      );
 //    } else {
 //      return InkWell(
 //        onTap:()=>getImage050(),
 //         child: Column(
 //           children: [
 //             Icon(
 //      Icons.add,
 //        size:50,
 //      ),
 //                    Text("Add image")
 //
 //           ],
 //         ));
 //    }
 //  }
 //  getImage050() async {
 //
 //
 //    this.setState(() {
 //      _inProcess = true;
 //    });
 //    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
 //
 //    if (image != null) {
 //      File cropped = await ImageCropper.cropImage(
 //          sourcePath: image.path,
 //          aspectRatio: CropAspectRatio(
 //              ratioX: 1, ratioY: 1),
 //          compressQuality: 100,
 //          maxWidth: 700,
 //          maxHeight: 700,
 //          compressFormat: ImageCompressFormat.jpg,
 //          androidUiSettings: AndroidUiSettings(
 //            toolbarColor: Colors.deepOrange,
 //            toolbarTitle: "RPS Cropper",
 //            statusBarColor: Colors.deepOrange.shade900,
 //            backgroundColor: Colors.white,
 //          )
 //      );
 //
 //      this.setState(() {
 //        customImg50 = cropped;
 //        _inProcess = true;
 //
 //      });
 //    } else {
 //      this.setState(() {
 //        _inProcess = false;
 //      });
 //    }
 //  }
 //
 //
  selectImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed: () {
                getImage();
                Navigator.pop(context);
              }),
              SimpleDialogOption(
                  child: Text("Image from Gallery"),
                  onPressed: () {
                    getImage();
                    Navigator.pop(context);
                  }
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }


   buildSplashScreen() {
    return
      ModalProgressHUD(
      inAsyncCall: _inProcess,
          child: Scaffold(
            body: Container(
alignment:Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//          SvgPicture.asset('assets/images/upload.svg', height: 260.0),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "Select Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.deepOrange,
                        onPressed: ()  =>loadAssets(),
                      // selectImage(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  clearImage() {
    setState(() {
      file = null;
      file1 = null;
      file2 = null;
      file3 = null;
      file4 = null;
      file5 = null;
      file6 = null;
      file7 = null;
      file8 = null;
      file9 = null;

    });
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file = compressedImageFile;
    });
  }
  compressImage1() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file1.readAsBytesSync());
    final compressedImageFile = File('$path/img1_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file1 = compressedImageFile;
    });
  }
compressImage2() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file2.readAsBytesSync());
    final compressedImageFile = File('$path/img2_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file2 = compressedImageFile;
    });
  }
compressImage3() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file3.readAsBytesSync());
    final compressedImageFile = File('$path/img3_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file3 = compressedImageFile;
    });
  }
compressImage4() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file4.readAsBytesSync());
    final compressedImageFile = File('$path/img4_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file4 = compressedImageFile;
    });
  }
compressImage5() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file5.readAsBytesSync());
    final compressedImageFile = File('$path/img5_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file5 = compressedImageFile;
    });
  }
compressImage6() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file6.readAsBytesSync());
    final compressedImageFile = File('$path/img6_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file6 = compressedImageFile;
    });
  }
compressImage7() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file7.readAsBytesSync());
    final compressedImageFile = File('$path/img7_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file7 = compressedImageFile;
    });
  }
compressImage8() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file8.readAsBytesSync());
    final compressedImageFile = File('$path/img8_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file8 = compressedImageFile;
    });
  }
compressImage9() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file9.readAsBytesSync());
    final compressedImageFile = File('$path/img9_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file9 = compressedImageFile;
    });
  }
compressImage01() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg1.readAsBytesSync());
    final compressedImageFile = File('$path/img01_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg1 = compressedImageFile;
    });
  }
// compressImage02() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg2.readAsBytesSync());
//     final compressedImageFile = File('$path/img02_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg2 = compressedImageFile;
//     });
//   }
// compressImage03() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg3.readAsBytesSync());
//     final compressedImageFile = File('$path/img03_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg3 = compressedImageFile;
//     });
//   }
// compressImage04() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg4.readAsBytesSync());
//     final compressedImageFile = File('$path/img04_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg4 = compressedImageFile;
//     });
//   }
// compressImage05() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg5.readAsBytesSync());
//     final compressedImageFile = File('$path/img05_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg5 = compressedImageFile;
//     });
//   }
// compressImage06() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg6.readAsBytesSync());
//     final compressedImageFile = File('$path/img06_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg6 = compressedImageFile;
//     });
//   }
// compressImage07() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg7.readAsBytesSync());
//     final compressedImageFile = File('$path/img07_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg7 = compressedImageFile;
//     });
//   }
// compressImage08() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg8.readAsBytesSync());
//     final compressedImageFile = File('$path/img08_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg8 = compressedImageFile;
//     });
//   }
// compressImage09() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg9.readAsBytesSync());
//     final compressedImageFile = File('$path/img09_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg9 = compressedImageFile;
//     });
//   }
// compressImage010() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg10.readAsBytesSync());
//     final compressedImageFile = File('$path/img010_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg10 = compressedImageFile;
//     });
//   }
// compressImage011() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg11.readAsBytesSync());
//     final compressedImageFile = File('$path/img011_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg11 = compressedImageFile;
//     });
//   }
// compressImage012() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg12.readAsBytesSync());
//     final compressedImageFile = File('$path/img012_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg12 = compressedImageFile;
//     });
//   }
// compressImage013() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg13.readAsBytesSync());
//     final compressedImageFile = File('$path/img013_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg13 = compressedImageFile;
//     });
//   }
// compressImage014() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg14.readAsBytesSync());
//     final compressedImageFile = File('$path/img014_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg14 = compressedImageFile;
//     });
//   }
// compressImage015() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg15.readAsBytesSync());
//     final compressedImageFile = File('$path/img015_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg15 = compressedImageFile;
//     });
//   }
// compressImage016() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg16.readAsBytesSync());
//     final compressedImageFile = File('$path/img016_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg16 = compressedImageFile;
//     });
//   }
// compressImage017() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg17.readAsBytesSync());
//     final compressedImageFile = File('$path/img017_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg17 = compressedImageFile;
//     });
//   }
// compressImage018() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg18.readAsBytesSync());
//     final compressedImageFile = File('$path/img018_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg18 = compressedImageFile;
//     });
//   }
// compressImage019() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg19.readAsBytesSync());
//     final compressedImageFile = File('$path/img019_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg19 = compressedImageFile;
//     });
//   }
// compressImage020() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg20.readAsBytesSync());
//     final compressedImageFile = File('$path/img020_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg20 = compressedImageFile;
//     });
//   }
// compressImage021() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg21.readAsBytesSync());
//     final compressedImageFile = File('$path/img021_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg21 = compressedImageFile;
//     });
//   }
// compressImage022() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg22.readAsBytesSync());
//     final compressedImageFile = File('$path/img022_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg22 = compressedImageFile;
//     });
//   }
// compressImage023() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg23.readAsBytesSync());
//     final compressedImageFile = File('$path/img023_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg23 = compressedImageFile;
//     });
//   }
// compressImage024() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg24.readAsBytesSync());
//     final compressedImageFile = File('$path/img024_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg24 = compressedImageFile;
//     });
//   }
// compressImage025() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg25.readAsBytesSync());
//     final compressedImageFile = File('$path/img025_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg25 = compressedImageFile;
//     });
//   }
// compressImage026() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg26.readAsBytesSync());
//     final compressedImageFile = File('$path/img026_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg26 = compressedImageFile;
//     });
//   }
// compressImage027() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg27.readAsBytesSync());
//     final compressedImageFile = File('$path/img027_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg27 = compressedImageFile;
//     });
//   }
// compressImage028() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg28.readAsBytesSync());
//     final compressedImageFile = File('$path/img028_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg28 = compressedImageFile;
//     });
//   }
// compressImage029() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg29.readAsBytesSync());
//     final compressedImageFile = File('$path/img029_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg29 = compressedImageFile;
//     });
//   }
// compressImage030() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg30.readAsBytesSync());
//     final compressedImageFile = File('$path/img030_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg30 = compressedImageFile;
//     });
//   }
// compressImage031() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg31.readAsBytesSync());
//     final compressedImageFile = File('$path/img031_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg31 = compressedImageFile;
//     });
//   }
// compressImage032() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg32.readAsBytesSync());
//     final compressedImageFile = File('$path/img032_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg32 = compressedImageFile;
//     });
//   }
// compressImage033() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg33.readAsBytesSync());
//     final compressedImageFile = File('$path/img033_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg33 = compressedImageFile;
//     });
//   }
// compressImage034() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg34.readAsBytesSync());
//     final compressedImageFile = File('$path/img034_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg34 = compressedImageFile;
//     });
//   }
// compressImage035() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg35.readAsBytesSync());
//     final compressedImageFile = File('$path/img035_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg35 = compressedImageFile;
//     });
//   }
// compressImage036() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg36.readAsBytesSync());
//     final compressedImageFile = File('$path/img036_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg36 = compressedImageFile;
//     });
//   }
// compressImage037() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg37.readAsBytesSync());
//     final compressedImageFile = File('$path/img037_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg37 = compressedImageFile;
//     });
//   }
// compressImage038() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg38.readAsBytesSync());
//     final compressedImageFile = File('$path/img038_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg38 = compressedImageFile;
//     });
//   }
// compressImage039() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg39.readAsBytesSync());
//     final compressedImageFile = File('$path/img039_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg39 = compressedImageFile;
//     });
//   }
// compressImage040() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg40.readAsBytesSync());
//     final compressedImageFile = File('$path/img040_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg40 = compressedImageFile;
//     });
//   }
// compressImage041() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg41.readAsBytesSync());
//     final compressedImageFile = File('$path/img041_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg41 = compressedImageFile;
//     });
//   }
// compressImage042() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg42.readAsBytesSync());
//     final compressedImageFile = File('$path/img042_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg42 = compressedImageFile;
//     });
//   }
// compressImage043() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg43.readAsBytesSync());
//     final compressedImageFile = File('$path/img043_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg43 = compressedImageFile;
//     });
//   }
// compressImage044() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg44.readAsBytesSync());
//     final compressedImageFile = File('$path/img044_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg44 = compressedImageFile;
//     });
//   }
// compressImage045() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg45.readAsBytesSync());
//     final compressedImageFile = File('$path/img045_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg45 = compressedImageFile;
//     });
//   }
// compressImage046() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg46.readAsBytesSync());
//     final compressedImageFile = File('$path/img046_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg46 = compressedImageFile;
//     });
//   }
// compressImage047() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg47.readAsBytesSync());
//     final compressedImageFile = File('$path/img047_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg47 = compressedImageFile;
//     });
//   }
// compressImage048() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg48.readAsBytesSync());
//     final compressedImageFile = File('$path/img048_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg48 = compressedImageFile;
//     });
//   }
// compressImage049() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg49.readAsBytesSync());
//     final compressedImageFile = File('$path/img049_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg49 = compressedImageFile;
//     });
//   }
// compressImage050() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image imageFile = Im.decodeImage(customImg50.readAsBytesSync());
//     final compressedImageFile = File('$path/img050_$prodId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
//     if (!mounted) return; setState(() {
//       customImg50 = compressedImageFile;
//     });
//   }

  Future<String> uploadImage(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;


  }
  Future<String> uploadImage1(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage2(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage3(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage4(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage5(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage6(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage7(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage8(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage9(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage01(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    sizeChart = true;
    return downloadUrl;
  }
  // Future<String> uploadImage02(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage03(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage04(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage05(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage06(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage07(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage08(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage09(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage010(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage011(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage012(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage013(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage014(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage015(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage016(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage017(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage018(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage019(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage020(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage021(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage022(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage023(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage024(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage025(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage026(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage027(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage028(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage029(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage030(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage031(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage032(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage033(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage034(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage035(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage036(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage037(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage038(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage039(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage040(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage041(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage042(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage043(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage044(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage045(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage046(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage047(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage048(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage049(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }
  // Future<String> uploadImage050(imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
  //   UploadTask uploadTask = reference.putFile(imageFile);
  //
  //   TaskSnapshot storageSnap = await uploadTask;
  //   String downloadUrl = await storageSnap.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }



  Future<bool> _onBackPressed() {
    return showDialog(
      context : context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit without uploading?'),
        actions: <Widget>[
          new TextButton(

            onPressed: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new TextButton(
              child: Text("YES"),

            onPressed: ()
            {
                        Navigator.of(context).maybePop(true);
                      }
    ),
        ],
      ),
    ) ??
        false;
  }
  Widget MenCategory(){
    return
    Expanded(
      child: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('Accessories'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(

                  title: 'Hats',
                  value: value,
                  choiceItems: Hats,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Scarves',
                  value: value,
                  choiceItems: Scarves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Belts',
                  value: value,
                  choiceItems: Belts,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Braces and Suspenders',
                  value: value,
                  choiceItems: Braces,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Ties & Bow Ties',
                  value: value,
                  choiceItems: Ties,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Glasses & Frames',
                  value: value,
                  choiceItems: Glasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Sunglasses',
                  value: value,
                  choiceItems: Sunglasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Gloves',
                  value: value,
                  choiceItems: Gloves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Socks',
                  value: value,
                  choiceItems: Socks,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Pocket Square',
                  value: value,
                  choiceItems: PocketSquare,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Wallets',
                  value: value,
                  choiceItems: Wallets,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Umbrellas & Travel',
                  value: value,
                  choiceItems: Umbrellas,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Phone cases',
                  value: value,
                  choiceItems: Phone,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bags'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Bags',
                  value: value,
                  choiceItems: Bags,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Activewear'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Activewear',
                  value: value,
                  choiceItems: Activewear,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Beach & Swimwear'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Beach & Swimwear',
                  value: value,
                  choiceItems: Beach,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Denim'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Denim',
                  value: value,
                  choiceItems: Denim,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Grooming'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Grooming',
                  value: value,
                  choiceItems: Grooming,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Indian Ethnic'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Indian Ethnic',
                  value: value,
                  choiceItems: Indian,
                  onChange: (state) => setState(() { value = state.value; })
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Jackets'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jackets',
                  value: value,
                  choiceItems: Jackets,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Coats'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Coats',
                value: value,
                choiceItems: Coats,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Jewellery'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                title: 'Jewellery',
                value: value,
                choiceItems: Jewellery,
                onChange: (state) => setState(() => value = state.value)
            ),

            ],
          ),
          ExpansionTile(
            title: Text('Shirts'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                title: 'Shirts',
                value: value,
                choiceItems: Shirts,
                onChange: (state) => setState(() => value = state.value)
            ),

            ],
          ),
          ExpansionTile(
            title: Text('Shorts'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Shorts',
                  value: value,
                  choiceItems: Shorts,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Suits'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Suits',
                  value: value,
                  choiceItems: Suits,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Sweatshirts & Sweaters'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Sweatshirts & Sweaters',
                  value: value,
                  choiceItems: Sweatshirts,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Trousers'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Trousers',
                  value: value,
                  choiceItems: Trousers,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Casual Tops'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Casual Tops',
                  value: value,
                  choiceItems: Tops,
                  onChange: (state) => setState(() => value = state.value)

              ),
            ],
          ),
          ExpansionTile(
            title: Text('Watches'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Watches',
                  value: value,
                  choiceItems: Watches,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Shoes'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Shoes',
                  value: value,
                  choiceItems: Shoes,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Sneakers'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Sneakers',
                  value: value,
                  choiceItems: Sneakers,
                  onChange: (state) => setState(() => value = state.value)
              ),


            ],
          ),

        ],
      ),
    );
  }
 Widget WomenCategory(){
   return

     Expanded(
     child: ListView(
          children: [

         ExpansionTile(
           title: Text('Accessories'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Bridal & Wedding',
                 value: value,
                 choiceItems: Bridal,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Belts',
                 value: value,
                 choiceItems: WBelts,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Braces',
                 value: value,
                 choiceItems: WBraces,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Glasses & Frames',
                 value: value,
                 choiceItems: WGlasses,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Sunglasses',
                 value: value,
                 choiceItems: WSunglasses,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Hair Accessories',
                 value: value,
                 choiceItems: WHair,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Hats',
                 value: value,
                 choiceItems: WHats,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Ties & Collars',
                 value: value,
                 choiceItems: WTies,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Gloves',
                 value: value,
                 choiceItems: WGloves,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Socks',
                 value: value,
                 choiceItems: WSocks,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Scarves',
                 value: value,
                 choiceItems: WScarves,
                 onChange: (state) => setState(() => value = state.value)
             ),

  SmartSelect<String>.single(
                 title: 'Umbrellas & Travel',
                 value: value,
                 choiceItems: WUmbrellas,
                 onChange: (state) => setState(() => value = state.value)
             ),
SmartSelect<String>.single(
                 title: 'Phone cases',
                 value: value,
                 choiceItems: WPhone,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Indian Ethnic'),
           maintainState:true,
           children: [
SmartSelect<String>.single(
                 title: 'Indian Ethnic',
                 value: value,
                 choiceItems: WEthnic,
                 onChange: (state) => setState(() { value = state.value; })
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Bags'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Bags',
                 value: value,
                 choiceItems: WBags,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Bridal Wear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Bridal Wear',
                 value: value,
                 choiceItems: WBridal,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),

         ExpansionTile(
           title: Text('Activewear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Activewear',
                 value: value,
                 choiceItems: WActivewear,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Beach & Swimwear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Beach & Swimwear',
                 value: value,
                 choiceItems: WBeach,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Coats'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
               title: 'Coats',
               value: value,
               choiceItems: WCoats,
               onChange: (state) => setState(() => value = state.value)
           ),
           ],
         ),
         ExpansionTile(
           title: Text('Jackets'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Jackets',
                 value: value,
                 choiceItems: WJackets,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Denim'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Denim',
                 value: value,
                 choiceItems: WDenim,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Dresses'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Dresses',
                 value: value,
                 choiceItems: WDresses,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Jumpsuits & Playsuits'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Jumpsuits & Playsuits',
                 value: value,
                 choiceItems: WJumpsuits,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Jewellery'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Jewellery',
                 value: value,
                 choiceItems: WJewellery,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Knitwear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Knitwear',
                 value: value,
                 choiceItems: WKnitwear,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Tops'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Tops',
                 value: value,
                 choiceItems: WTops,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('WTrouser'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'WTrouserops',
                 value: value,
                 choiceItems: WTrouser,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Skirts'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Skirts',
                 value: value,
                 choiceItems: WSkirts,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Shorts'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Shorts',
                 value: value,
                 choiceItems: WShorts,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Shoes'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Shoes',
                 value: value,
                 choiceItems: WShoes,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Sneakers'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Sneakers',
                 value: value,
                 choiceItems: WSneakers,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Watches'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Watches',
                 value: value,
                 choiceItems: WWatches,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),

       ],
     ),
   );
  }
Widget BabyBCategory(){
    return

      Expanded(
          child: ListView(
            children: [
              ExpansionTile(
                title: Text('Accessories'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Hats',
                      value: value,
                      choiceItems: BBHats,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Scarves',
                      value: value,
                      choiceItems: BBScarves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Ties & Bow Ties',
                      value: value,
                      choiceItems: BBTies,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Gloves',
                      value: value,
                      choiceItems: BBGloves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Socks',
                      value: value,
                      choiceItems: BBSocks,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                   SmartSelect<String>.single(
                      title: 'Travel',
                      value: value,
                      choiceItems: BBTravel,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Indian Ethnic'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Indian Ethnic',
                      value: value,
                      choiceItems: BBEthnic,
                      onChange: (state) => setState((){ value = state.value; })
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Coats & Jackets'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Coats & Jackets',
                    value: value,
                    choiceItems: BBCoats,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
               ExpansionTile(
                title: Text('Babysuits'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Babysuits',
                    value: value,
                    choiceItems: BBBabysuits,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Knitwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Knitwear',
                    value: value,
                    choiceItems: BBKnitwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
 ExpansionTile(
                title: Text('Shoes'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shoes',
                    value: value,
                    choiceItems: BBShoes,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
 ExpansionTile(
                title: Text('Shorts'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shorts',
                    value: value,
                    choiceItems: BBShorts,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Swimwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Swimwear',
                    value: value,
                    choiceItems: BBSwimwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Tops'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tops',
                    value: value,
                    choiceItems: BBTops,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Tracks'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tracks',
                    value: value,
                    choiceItems: BBTracks,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Trousers'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Trousers',
                    value: value,
                    choiceItems: BBTrousers,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),

            ],
          ),
        );

}
Widget BabyGCategory() {
  return
  Expanded(
    child: ListView(
      children: [
        ExpansionTile(
          title: Text('Accessories'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Hats',
                value: value,
                choiceItems: GGHats,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Scarves',
                value: value,
                choiceItems: GGScarves,
                onChange: (state) => setState(() => value = state.value)
            ),

            SmartSelect<String>.single(
                title: 'Gloves',
                value: value,
                choiceItems: GGGloves,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Socks',
                value: value,
                choiceItems: GGSocks,
                onChange: (state) => setState(() => value = state.value)
            ),
              SmartSelect<String>.single(
                title: 'Travel',
                value: value,
                choiceItems: GGTravel,
                onChange: (state) => setState(() => value = state.value)
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Indian Ethnic'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Indian Ethnic',
                value: value,
                choiceItems: GGEthnic,
                onChange: (state) => setState(() { value = state.value; })
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Coats & Jackets'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Coats & Jackets',
              value: value,
              choiceItems: GGCoats,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Dresses'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Dresses',
              value: value,
              choiceItems: GGDresses,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Babysuits'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Babysuits',
              value: value,
              choiceItems: GGBabysuits,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Knitwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Knitwear',
              value: value,
              choiceItems: GGKnitwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Shoes'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shoes',
              value: value,
              choiceItems: GGShoes,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Shorts'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shorts',
              value: value,
              choiceItems: GGShorts,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Skirts'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Skirts',
              value: value,
              choiceItems: GGSkirts,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),

        ExpansionTile(
          title: Text('Swimwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Swimwear',
              value: value,
              choiceItems: GGSwimwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tops'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tops',
              value: value,
              choiceItems: GGTops,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tracks'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tracks',
              value: value,
              choiceItems: GGTracks,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Trousers'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Trousers',
              value: value,
              choiceItems: GGTrousers,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),

      ],
    ),
  );
}
Widget KidBCategory(){
    return
      Expanded(
          child: ListView(
            children: [
              ExpansionTile(
                title: Text('Accessories'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Hats',
                      value: value,
                      choiceItems: KBHats,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Scarves',
                      value: value,
                      choiceItems: KBScarves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Belts & Braces ',
                      value: value,
                      choiceItems: KBBelts,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Ties & Bow Ties',
                      value: value,
                      choiceItems: KBTies,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Eyewear',
                      value: value,
                      choiceItems: KBGlasses,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Gloves',
                      value: value,
                      choiceItems: KBGloves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Socks',
                      value: value,
                      choiceItems: KBSocks,
                      onChange: (state) => setState(() => value = state.value)
                  ),
   SmartSelect<String>.single(
                      title: 'Travel',
                      value: value,
                      choiceItems: KBSocks,
                      onChange: (state) => setState(() => value = state.value)
                  ),


                ],
              ),
              ExpansionTile(
                title: Text('Indian Ethnic'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Indian Ethnic',
                      value: value,
                      choiceItems: KBEthnic,
                      onChange: (state) => setState(() { value = state.value; })
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Bags'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Bags',
                      value: value,
                      choiceItems: KBBags,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),
               ExpansionTile(
                title: Text('Denim'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Denim',
                      value: value,
                      choiceItems: KBDenim,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Coats & Jackets'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Coats & Jackets',
                      value: value,
                      choiceItems: KBCoats,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),

              ExpansionTile(
                title: Text('Shoes'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shoes',
                    value: value,
                    choiceItems: KBShoes,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Shorts'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shorts',
                    value: value,
                    choiceItems: KBShorts,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Swimwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Swimwear',
                    value: value,
                    choiceItems: KBSwimwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Knitwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Knitwear',
                    value: value,
                    choiceItems: KBKnitwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Tops'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tops',
                    value: value,
                    choiceItems: KBTops,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Tracks'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tracks',
                    value: value,
                    choiceItems: KBTracks,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Trousers'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Trousers',
                    value: value,
                    choiceItems: KBTrousers,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
            ],
          ),
        );
}
Widget KidGCategory(){
return

  Expanded(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('Accessories'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Hats',
                  value: value,
                  choiceItems: KGHats,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Scarves',
                  value: value,
                  choiceItems: KGScarves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Belts',
                  value: value,
                  choiceItems: KGBelts,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Hair Accessories',
                  value: value,
                  choiceItems: KGHair,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Eyewear',
                  value: value,
                  choiceItems: KGGlasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Gloves',
                  value: value,
                  choiceItems: KGGloves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Socks',
                  value: value,
                  choiceItems: KGSocks,
                  onChange: (state) => setState(() => value = state.value)
              ),
 SmartSelect<String>.single(
                  title: 'Jewellery',
                  value: value,
                  choiceItems: KGJewellery,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Indian Ethnic'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Indian Ethnic',
                  value: value,
                  choiceItems: KGEthnic,
                  onChange: (state) => setState(() { value = state.value; })
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Bags'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Bags',
                  value: value,
                  choiceItems: KGBags,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Denim'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Denim',
                  value: value,
                  choiceItems: KGDenim,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
         ExpansionTile(
            title: Text('Dresses'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Dresses',
                  value: value,
                  choiceItems: KGDresses,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Jumpsuits & Playsuits'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jumpsuits & Playsuits',
                  value: value,
                  choiceItems: KGJumpsuit,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
 ExpansionTile(
            title: Text('Coats'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Coats',
                  value: value,
                  choiceItems: KGCoats,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
 ExpansionTile(
            title: Text('Jackets'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jackets',
                  value: value,
                  choiceItems: KGJackets,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),

          ExpansionTile(
            title: Text('Shoes'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shoes',
                value: value,
                choiceItems: KGShoes,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Shorts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shorts',
                value: value,
                choiceItems: KGShorts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Skirts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Skirts',
                value: value,
                choiceItems: KGSkirts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Swimwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Swimwear',
                value: value,
                choiceItems: KGSwimwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Knitwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Knitwear',
                value: value,
                choiceItems: KGKnitwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tops'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tops',
                value: value,
                choiceItems: KGTops,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tracks'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tracks',
                value: value,
                choiceItems: KGTracks,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Trousers'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Trousers',
                value: value,
                choiceItems: KGTrousers,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
        ],
      ),
    );
}
Widget TeenBCategory(){
    return

      Expanded(
    child: ListView(
      children: [
        ExpansionTile(
          title: Text('Accessories'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Hats',
                value: value,
                choiceItems: TBHats,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Scarves',
                value: value,
                choiceItems: TBScarves,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Belts & Braces ',
                value: value,
                choiceItems: TBBelts,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Ties & Bow Ties',
                value: value,
                choiceItems: TBTies,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Eyewear',
                value: value,
                choiceItems: TBGlasses,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Gloves',
                value: value,
                choiceItems: TBGloves,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Socks',
                value: value,
                choiceItems: TBSocks,
                onChange: (state) => setState(() => value = state.value)
            ),
 SmartSelect<String>.single(
                title: 'Travel',
                value: value,
                choiceItems: TBTravel,
                onChange: (state) => setState(() => value = state.value)
            ),


          ],
        ),
        ExpansionTile(
          title: Text('Indian Ethnic'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Indian Ethnic',
                value: value,
                choiceItems: TBEthnic,
                onChange: (state) => setState((){ value = state.value; })
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Bags'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Bags',
                value: value,
                choiceItems: TBBags,
                onChange: (state) => setState(() => value = state.value)
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Denim'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Denim',
                value: value,
                choiceItems: TBDenim,
                onChange: (state) => setState(() => value = state.value)
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Shoes'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shoes',
              value: value,
              choiceItems: TBShoes,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Shorts'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shorts',
              value: value,
              choiceItems: TBShorts,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Swimwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Swimwear',
              value: value,
              choiceItems: TBSwimwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Knitwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Knitwear',
              value: value,
              choiceItems: TBKnitwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tops'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tops',
              value: value,
              choiceItems: TBTops,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tracks'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tracks',
              value: value,
              choiceItems: TBTracks,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Trousers'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Trousers',
              value: value,
              choiceItems: TBTrousers,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
      ],
    ),
  );
}
Widget TeenGCategory(){
  return
  
    Expanded(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('Accessories'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Hats',
                  value: value,
                  choiceItems: TGHats,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Scarves',
                  value: value,
                  choiceItems: TGScarves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Belts',
                  value: value,
                  choiceItems: TGBelts,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Hair Accessories',
                  value: value,
                  choiceItems: TGHair,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Eyewear',
                  value: value,
                  choiceItems: TGGlasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Gloves',
                  value: value,
                  choiceItems: TGGloves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Socks',
                  value: value,
                  choiceItems: TGSocks,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Jewellery',
                  value: value,
                  choiceItems: TGJewellery,
                  onChange: (state) => setState(() => value = state.value)
              ),
                SmartSelect<String>.single(
                  title: 'Travel',
                  value: value,
                  choiceItems: TGTravel,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Indian Ethnic'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Indian Ethnic',
                  value: value,
                  choiceItems: TGEthnic,
                  onChange: (state) => setState((){ value = state.value; })
              ),

            ],
          ),

          ExpansionTile(
            title: Text('Bags'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Bags',
                  value: value,
                  choiceItems: TGBags,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Denim'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Denim',
                  value: value,
                  choiceItems: TGDenim,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Dresses'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Dresses',
                  value: value,
                  choiceItems: TGDresses,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Jumpsuit'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jumpsuit',
                  value: value,
                  choiceItems: TGJumpsuit,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),

          ExpansionTile(
            title: Text('Shoes'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shoes',
                value: value,
                choiceItems: TGShoes,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Shorts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shorts',
                value: value,
                choiceItems: TGShorts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Skirts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Skirts',
                value: value,
                choiceItems: TGSkirts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Swimwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Swimwear',
                value: value,
                choiceItems: TGSwimwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Knitwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Knitwear',
                value: value,
                choiceItems: TGKnitwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tops'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tops',
                value: value,
                choiceItems: TGTops,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tracks'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tracks',
                value: value,
                choiceItems: TGTracks,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Trousers'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Trousers',
                value: value,
                choiceItems: TGTrousers,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
        ],
      ),
    );
}
Widget sizeGuide(){

  if(dropdownValue=='Men'){
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
        child:
        Center(
          child: Container(
            child: ContainedTabBarView(
              tabs: [
                ...[1, 2]
                    .map(
                      (e) => Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ],
              tabBarProperties: TabBarProperties(
                width: 64,
                height: 32,
                position: TabBarPosition.bottom,
                indicator: ContainerTabIndicator(
                  width: 16.0,
                  height: 16.0,
                  radius: BorderRadius.circular(4.0),
                  color: Colors.blue,
                ),
              ),
              views: [
                Container(
                  child:PhotoView(imageProvider: AssetImage
                    ('assets/img/MenClothingsize.jpg')),),
                Container(
                  child:PhotoView(imageProvider: AssetImage
                    ('assets/img/RING.jpg')),)  ,

              ],
              onChange: (index) => print(index),
            ),
          ),
        ),

          );
      },
    );
  }
    else if(dropdownValue=='Women'){
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child:
            Center(
              child: Container(
                child: ContainedTabBarView(
                  tabs: [
                    ...[1, 2]
                        .map(
                          (e) => Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey[600]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ],
                  tabBarProperties: TabBarProperties(
                    width: 64,
                    height: 32,
                    position: TabBarPosition.bottom,
                    indicator: ContainerTabIndicator(
                      width: 16.0,
                      height: 16.0,
                      radius: BorderRadius.circular(4.0),
                      color: Colors.blue,
                    ),
                  ),
                  views: [
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/WomanClothingsize.jpg'),
                      ),),
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/RING.jpg')),)  ,

                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),


          );
      },
    );
  }
  else  if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child:
            Center(
              child: Container(
                child: ContainedTabBarView(
                  tabs: [
                    ...[1, 2]
                        .map(
                          (e) => Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey[600]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ],
                  tabBarProperties: TabBarProperties(
                    width: 64,
                    height: 32,
                    position: TabBarPosition.bottom,
                    indicator: ContainerTabIndicator(
                      width: 16.0,
                      height: 16.0,
                      radius: BorderRadius.circular(4.0),
                      color: Colors.blue,
                    ),
                  ),
                  views: [
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/babysizecloth.jpg')),),
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/RING.jpg')),)  ,

                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),

          );
      },
    );
    }
  else if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls') {
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child:
            Center(
              child: Container(
                child: ContainedTabBarView(
                  tabs: [
                    ...[1, 2]
                        .map(
                          (e) => Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey[600]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ],
                  tabBarProperties: TabBarProperties(
                    width: 64,
                    height: 32,
                    position: TabBarPosition.bottom,
                    indicator: ContainerTabIndicator(
                      width: 16.0,
                      height: 16.0,
                      radius: BorderRadius.circular(4.0),
                      color: Colors.blue,
                    ),
                  ),
                  views: [
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/kisclothsize.jpg')),)  ,
                     Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/RING.jpg')),)  ,

                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),



          );
      },
    );
 }
  else if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child:
            Center(
              child: Container(
                child: ContainedTabBarView(
                  tabs: [
                    ...[1, 2]
                        .map(
                          (e) => Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey[600]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ],
                  tabBarProperties: TabBarProperties(
                    width: 64,
                    height: 32,
                    position: TabBarPosition.bottom,
                    indicator: ContainerTabIndicator(
                      width: 16.0,
                      height: 16.0,
                      radius: BorderRadius.circular(4.0),
                      color: Colors.blue,
                    ),
                  ),
                  views: [
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/teenclothing.jpg')),),
                    Container(
                      child:PhotoView(imageProvider: AssetImage
                        ('assets/img/RING.jpg')),)  ,

                  ],
                  onChange: (index) => print(index),
                ),
              ),
            ),

          );
      },
    );
   }

}
  AddSize(){
    if(dropdownValue=='Men') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            SizeConfig().init(context);

            return
              Container(
                height: MediaQuery.of(context).size.height * 0.75,

                child: DefaultTabController(

                    length:5,
                    child: Scaffold(
                      resizeToAvoidBottomInset:true,
                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(
                        height: MediaQuery.of(context).size.height * 0.75,

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [



                                  ExpansionTile(
                                    title: Text('XXXS'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XXS'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XS'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('S'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: scontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('M'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('L'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: lcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XXL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XXXL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: fourxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: fivexlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: sixxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: sevenxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: eightxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                  // ConstrainedBox(
                                  //   constraints: new BoxConstraints(
                                  //     minHeight: 5.0,
                                  //     maxHeight: 40.0,
                                  //   ),
                                  //   child: Expanded(
                                  //     child: ListView(
                                  //         shrinkWrap: true,
                                  //         // scrollDirection: Axis.vertical,
                                  //         children:[
                                  //         ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Made-to-order'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mtocontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Free size'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: freesizecontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring11controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring13controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring15controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring17controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring19controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring21controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('15'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring23controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),

                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('3 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe11controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe12controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe13controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe14controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe15controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe16controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe17controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe18controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe19controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe20controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe21controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),

                            ]),
                      ),
                    )
                ),
              );      },
        );
    }
    else if(dropdownValue=='Women') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            SizeConfig().init(context);

            return
              Expanded(
                child: DefaultTabController(

                    length:5,
                    child: Scaffold(

                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('XXXS'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XXS'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XS'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('S'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: scontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('M'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('L'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: lcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XXL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('XXXL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: fourxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: fivexlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: sixxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: sevenxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8XL'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: eightxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kSubtitle)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Made-to-order'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mtocontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Free size'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: freesizecontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring11controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring13controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring15controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring17controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring19controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring21controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('15'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring23controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe11controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe12controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe13controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe14controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe15controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('15 ½'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe16controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),



                                ],
                              ),
                            ]),
                      ),
                    )
                ),
              );      },
        );
    }
    else if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            SizeConfig().init(context);

            return
              Expanded(
                child: DefaultTabController(

                    length:5,
                    child: Scaffold(

                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('0-3 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('3-6 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6-9 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9-12 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: scontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12-18 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('18-24 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: lcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Made-to-order'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mtocontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Free size'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: freesizecontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('0-3 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('3-6 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9-12 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12-18 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('18-24 mth'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),




                                ],
                              ),

                            ]),
                      ),
                    )
                ),
              );      },
        );
    }
    else  if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            SizeConfig().init(context);

            return
              Expanded(
                child: DefaultTabController(

                    length:6,
                    child: Scaffold(

                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [

                                  ExpansionTile(
                                    title: Text('2 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('3-4 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4-5 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5-6 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: scontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6-7 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7-8 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: lcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8-9 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9-10 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10-11 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11-12 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: fourxlcontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Made-to-order'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mtocontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Free size'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: freesizecontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('2 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('2 ½ Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('3 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('3 ½ Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe11controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe12controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe13controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe14controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),




                                ],
                              ),

                            ]),
                      ),
                    )
                ),
              );      },
        );
    }
    else  if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
      return
        showMaterialModalBottomSheet(
          expand: true,
          context: context,
          builder: (BuildContext context) {
            SizeConfig().init(context);

            return
              Expanded(
                child: DefaultTabController(

                    length:5,
                    child: Scaffold(

                      appBar:AppBar(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        bottom: TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: kIcon,


                          tabs:[
                            Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                            Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Ring(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                            Text("Shoes(US)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                          ],
                        ),
                      ),

                      body: Container(

                        child: TabBarView(
                            children:<Widget> [
                              ListView(


                                children: [

                                  ExpansionTile(
                                    title: Text('13 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xxscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('15 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: xscontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('16 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: scontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Made-to-order'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: mtocontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(


                                children: [


                                  ExpansionTile(
                                    title: Text('Free size'),
                                    maintainState: true,
                                    children: [

                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: freesizecontroller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('4'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('4.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('5.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring5controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('6.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring6controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring7controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('7.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring8controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring9controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('8.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring10controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring11controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('9.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring12controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring13controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('10.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring14controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring15controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('11.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring16controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring17controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('12.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring18controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring19controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('13.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring20controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring21controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14.5'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring22controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('15'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Ring23controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              ListView(
                                children: [
                                  ExpansionTile(
                                    title: Text('13 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe1controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('14 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe2controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('15 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe3controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text('16 Y'),
                                    maintainState: true,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                        child: TextField(

                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          controller: Shoe4controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: kGrey)),
                                              labelText: 'Quantity in inventory',
                                              hintText: '0'
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),






                                ],
                              ),
                            ]),
                      ),
                    )
                ),
              );      },
        );
    }



  }

custom(){
    return
      showMaterialModalBottomSheet(
        context: context,
        builder: (BuildContext context)
    {
      SizeConfig().init(context);

      return
       Builder(builder: (BuildContext context) {
         return StatefulBuilder(builder: (BuildContext context, State) {
          return
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.75,

              child: ListView(


                children: [


                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile = val;
                      });
                    },
                    initiallyExpanded:tile,
                    title: Text('Custom size 1'),
                    maintainState: true,
                    children: [
                      getImageWidget(),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController11,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                  onExpansionChanged: (val){
                    State((){
                      tile1 = val;
                    });
                  },
           initiallyExpanded:tile1,
                    title: Text('Custom size 2'),
                    maintainState: true,
                    children: [
                      getImageWidget1(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController21,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile2 = val;
                      });
                    },
                    initiallyExpanded:tile2,
                    title: Text('Custom size 3'),
                    maintainState: true,
                    children: [
                      getImageWidget2(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController31,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile3 = val;
                      });
                    },
                    initiallyExpanded:tile3,
                    title: Text('Custom size 4'),
                    maintainState: true,
                    children: [
                      getImageWidget3(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController41,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile4 = val;
                      });
                    },
                    initiallyExpanded:tile4,
                    title: Text('Custom size 5'),
                    maintainState: true,
                    children: [
                      getImageWidget4(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController51,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile5 = val;
                      });
                    },
                    initiallyExpanded:tile5,
                    title: Text('Custom size 6'),
                    maintainState: true,
                    children: [
                      getImageWidget5(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController6,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController61,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity6,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile6 = val;
                      });
                    },
                    initiallyExpanded:tile6,
                    title: Text('Custom size 7'),
                    maintainState: true,
                    children: [
                      getImageWidget6(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController7,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController71,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity7,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile7 = val;
                      });
                    },
                    initiallyExpanded:tile7,
                    title: Text('Custom size 8'),
                    maintainState: true,
                    children: [
                      getImageWidget7(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController8,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController81,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity8,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile8 = val;
                      });
                    },
                    initiallyExpanded:tile8,
                    title: Text('Custom size 9'),
                    maintainState: true,
                    children: [
                      getImageWidget8(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController9,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController91,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity9,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    onExpansionChanged: (val){
                      State((){
                        tile9 = val;
                      });
                    },
                    initiallyExpanded:tile9,
                    title: Text('Custom size 10'),
                    maintainState: true,
                    children: [
                      getImageWidget9(),

                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          maxLines: 1,
                          controller: customController10,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Title',
                              hintText: '117 cm'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customController101,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: kGrey)),
                            labelText: 'Additional price(optional)',
                            hintText: " ${currentUser.currencysym}0",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        child: TextField(

                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: customControllerQuantity10,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kGrey)),
                              labelText: 'Quantity in inventory',
                              hintText: '0'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),


                ],
              ),

            );
        }
        );
    }
      );
          },
      );

}
tag(){
    return
      showMaterialModalBottomSheet(
        expand:true,
        context: context,
        builder: (BuildContext context)
    {
      SizeConfig().init(context);

      return
       Builder(builder: (BuildContext context) {
         return StatefulBuilder(builder: (BuildContext context, State) {
          return
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.75,

              child: SearchTag(prodId:prodId),

            );
        }
        );
    }
      );
          },
      );

}
color(){
  return
    showMaterialModalBottomSheet(
      expand: true,
      context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
          Container(
            height: MediaQuery.of(context).size.height * 0.75,

            child: DefaultTabController(

                length:1,
                child: Scaffold(
                  resizeToAvoidBottomInset:true,
                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Add Colors",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),


                      ],
                    ),
                  ),

                  body: Container(
                    height: MediaQuery.of(context).size.height * 0.75,

                    child: TabBarView(
                        children:<Widget> [

                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Color 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextFormField(

                                      maxLines: 1,
                                      controller: colorController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                      validator: (text) {
                                        if ( text.isEmpty) {
                                          return 'Color is empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),

                        ]),
                  ),
                )
            ),
          );      },
    );
}
  builduploadForm() {
    return  WillPopScope(
      onWillPop:()=> _onBackPressed(),
      child: ModalProgressHUD(

        progressIndicator:Column(mainAxisAlignment:MainAxisAlignment.center,
            children:[
        Text("$loading",style:TextStyle(color:Colors.blue,fontSize:15,decoration:TextDecoration.none)),
              CircularProgressIndicator(),
        ]),
        inAsyncCall: isUploading,
        child: Scaffold(
         // key:  scaffoldKey,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kSecondaryColor),
                onPressed:(){
                  return showDialog(
                      context : context,
                      builder: (context) => new AlertDialog(
                          title: new Text('Are you sure?'),
                          content: new Text('Do you want to exit without uploading?'),
                          actions: <Widget>[
                      new TextButton(

                      onPressed: () => Navigator.of(context).pop(false),
                  child: Text("NO"),
                  ),
                  SizedBox(height: 16),
                  new TextButton(

                  onPressed: ()
                  {
                    Get.back();
                   Get.back();

                  },
                  child: Text("YES"),
                  ),
                  ],
                  ),
                  );
                }),
            title: Text(
              "Upload to Shop",
              style: TextStyle(color: Colors.white),
            ),

          ),
          body: PageView(
            physics:new NeverScrollableScrollPhysics(),
          pageSnapping: true,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              pageChanged = index;
            });
            print(pageChanged);
          },
          children: [
            Container(
              child: page0(),
            ),
            // Container(
            //   child: page4(),
            // ),

            Container(
              child: page3(),
            ),
            Container(
              child: page1(),
            ),
            Container(
              child: page2(),
            ),

          ],
          ),
        ),
      ),
    );
  }

  tagView(){
    return
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products")
            .doc(currentUser.id).collection("userProducts").doc(prodId)
            .collection("tags")
            .orderBy('timestamp',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.isEmpty){
            return
              Container();
          } else {
            return new ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return TagItem(
                    Id: ds['prodId'],
                   ownerId: ds['ownerId'],
                   name: ds['name'],
                   usd: ds['usd'],
                    inr: ds['inr'],
                    eur: ds['eur'],
                    gbp: ds['gbp'],

                    image: ds['image'],
                    prodId: prodId,

                  );
                }
            );
          }
        },
      );

  }
page0(){
    SizeConfig().init(context);
    return
      Form(
        key: _formKey,
        child:
        Column(
          children: <Widget>[
            isUploading ? linearProgress() : Text(""),

            carousel(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),
                    Text('Select Gender',style:TextStyle(color: kText,fontSize:SizeConfig.safeBlockHorizontal *4) ,),
                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                        iconSize: SizeConfig.safeBlockHorizontal *4,
                        elevation: 4,
                        style: TextStyle(color: kText,fontSize:SizeConfig.safeBlockHorizontal *4.5),

                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Women', 'Men', 'Baby-Boys', 'Baby-Girls', 'Kids-Boys', 'Kids-Girls', 'Teen-Boys', 'Teen-Girls']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),

                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                      child: GestureDetector(


                        child: ListTile(title: Text('$value',style:TextStyle(color: Colors.black) ,),
                            trailing:Icon(Icons.arrow_forward_ios_rounded)
                        ),
                        onTap: (){
                          showModalBottomSheet(context: context, builder:(BuildContext context){


                            if(dropdownValue=='Women')
                            {
                              return
                                WomenCategory();
                            }
                            else if(dropdownValue=='Men')
                            {
                              return
                                MenCategory();
                            }
                            else if(dropdownValue=='Baby-Boys')
                            {
                              return
                                BabyBCategory();
                            }
                            else if(dropdownValue== 'Baby-Girls'){
                              return
                                BabyGCategory();
                            }
                            else if(dropdownValue=='Kids-Boys'){
                              return
                                KidBCategory();
                            }
                            else if(dropdownValue=='Kids-Girls'){
                              return
                                KidGCategory();
                            }
                            else if(dropdownValue== 'Teen-Boys'){
                              return
                                TeenBCategory();
                            }
                            else if(dropdownValue=='Teen-Girls'){
                              return
                                TeenGCategory();
                            }
                            else{
                              return
                                Text('text');
                            }
                          },
                          );
                        }
                        ,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),

                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                      child:   GestureDetector(


                        onTap: ()=>color(),



                        child: ListTile(title: Text('Add colors',style:TextStyle(color: Colors.black) ,),
                            trailing:Icon(Icons.arrow_forward_ios_rounded)
                        ),

                      ),
                    ),


                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                      child:   GestureDetector(

                        onTap: ()=>AddSize(),
                        child: ListTile(title: Text('Specify Quantity',style:TextStyle(color: Colors.black) ,),
                            trailing:Icon(Icons.arrow_forward_ios_rounded)
                        ),
                      ),
                    ),
 Container(
                      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                      child:   GestureDetector(

                        onTap: ()=>AddSize(),
                        child: getImageWidget01()
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                      child:   GestureDetector(

                        onTap: ()=>custom(),
                        child: ListTile(title: Text('Variations (optional)',style:TextStyle(color: Colors.black) ,),
                            trailing:Icon(Icons.arrow_forward_ios_rounded)
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),

                    //Customised


                  ],
                ),
              ),
            ),
            Container(
                height:SizeConfig.screenHeight*0.05,
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        value == 'Select Category' ?
 alert(
                        context,
                        // title: Text('Coming Soon'),
                        content:Text("Select a category",
                        ),

                        textOK: Text("Ok",
                        ),

                        ):
                        pageController.animateToPage(++pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

                      },
                      child: FittedBox(
                        fit:  BoxFit.fitHeight,
                        child: Container(
                          alignment:Alignment.center,
                          height:SizeConfig.screenHeight*0.05,
                          width:SizeConfig.blockSizeHorizontal*50,

                          //icon: Icon(Icons.drag_handle),
                          child:Text("Next",style:TextStyle(color: Colors.black)),

                        ),
                      ),
                    ),


                  ],
                )),


          ],
        ),
      );
}
page1(){
    return
      Form(
        key: _formKey1,
        child:
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              isUploading ? linearProgress() : Text(""),



                      Text("Processing time",  style:TextStyle(color: kText,fontSize:20.0)),
                      SizedBox(height: 8.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style:TextStyle(color: kText),
                                keyboardType: TextInputType.number,

                                controller: durationfromp,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Business days',labelStyle: TextStyle(color: kText),
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Processing time is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Text("-",  style:TextStyle(color: kText)),

                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style:TextStyle(color: kText),
                                keyboardType: TextInputType.number,

                                controller: durationtop,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Processing time is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 8.0,),

                      ListTile(
                        leading: Icon(
                          Icons.local_shipping,
                          color: Colors.orange,
                          size: 35.0,
                        ),
                        title:Text("Shipping duration to ${currentUser.country}",  style:TextStyle(color: kText)),

                      ),
                      SizedBox(height: 8.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style:TextStyle(color: kText),
                                keyboardType: TextInputType.number,

                                controller: durationfrom,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  // labelText: 'Between',labelStyle: TextStyle(color: kText),
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Shipping duration is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Text("-",  style:TextStyle(color: kText)),

                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style:TextStyle(color: kText),
                                keyboardType: TextInputType.number,

                                controller: durationto,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Shipping duration is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox( height: 8.0,),
                      Text('Free shipping',style:TextStyle(color: kText)) ,
                      SizedBox( height: 8.0,),

                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('No'),
                          SizedBox( width: 8.0,),

                          Switch(
                            value: freeship,
                            onChanged: (value){setState(() {
                              freeship = value;
                            });},
                            activeColor: Colors.blue,
                            activeTrackColor: kPrimaryColor,
                          ),
                          SizedBox( width: 8.0,),

                          Text('Yes')
                        ],
                      ),

                      SizedBox( height: 8.0,),

                      !freeship?  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style:TextStyle(color: kText),
                          keyboardType: TextInputType.number,

                          controller: shipcost,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            hintText:
                            currentUser.currency == "INR"?'₹':
                            currentUser.currency == "EUR"?'€':
                            currentUser.currency == "GBP"?'£':'\u0024',
                            labelText: 'Shipping cost',labelStyle: TextStyle(color: kText),

                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if ( freeship==false || text.isEmpty ) {
                              return 'Shipping cost is empty';
                            }
                            return null;
                          },
                        ),
                      ):Container(),

                      SizedBox( height: 8.0,),
                      Text('Worldwide shipping',style:TextStyle(color: kText)) ,
                      SizedBox( height: 8.0,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('No'),
                          SizedBox( width: 8.0,),

                          Switch(
                            value: worldship,
                            onChanged: (value){setState(() {
                              worldship = value;
                            });},
                            activeColor: Colors.blue,
                            activeTrackColor:kPrimaryColor,
                          ),
                          SizedBox( width: 8.0,),

                          Text('Yes')
                        ],
                      ),
                      SizedBox(height: 8.0,),

                      worldship ?     Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.local_shipping,
                            color: Colors.orange,
                            size: 35.0,
                          ),
                          title:Text("Shipping duration to worldwide",  style:TextStyle(color: kText)),

                        ),
                      ):Container(),
                      SizedBox(height: 8.0,),

                      worldship ?   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: TextFormField(
                                style:TextStyle(color: kText),
                                keyboardType: TextInputType.number,

                                controller: durationfromw,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

// labelText: 'Between',labelStyle: TextStyle(color: kText),
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if (worldship==true && text.isEmpty) {
                                    return 'Shipping duration is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Text("-",  style:TextStyle(color: kText)),

                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style:TextStyle(color: kText),
                                keyboardType: TextInputType.number,
                                controller: durationtow,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if (worldship==true && text.isEmpty) {
                                    return 'Shipping duration is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                        ],
                      ):Container(),
                      SizedBox( height: 8.0,),
              Text('Free worldwide shipping',style:TextStyle(color: kText)) ,

                      SizedBox( height: 8.0,),

                      worldship ? Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('No'),
                          SizedBox( width: 8.0,),

                          Switch(
                            value: freeworldship,
                            onChanged: (value){setState(() {
                              freeworldship = value;
                            });},
                            activeColor: Colors.blue,
                            activeTrackColor:kPrimaryColor,
                          ),
                          SizedBox( width: 8.0,),

                          Text('Yes')
                        ],
                      ):Container(),

                      worldship && freeworldship == false ?   Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style:TextStyle(color: kText),
                          keyboardType: TextInputType.number,

                          controller: shipcostintern,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            hintText:
                            currentUser.currency == "INR"?'₹':
                            currentUser.currency == "EUR"?'€':
                            currentUser.currency == "GBP"?'£':'\u0024',

                            labelText: 'Shipping cost',labelStyle: TextStyle(color: kText),
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if ( freeworldship==false && text.isEmpty ) {
                              return 'Shipping cost is empty';
                            }
                            return null;
                          },
                        ),
                      ):Container(),
              Container(
                  height:SizeConfig.screenHeight*0.05,
                  child:Row(
                    children: [
                      InkWell(
                        onTap: (){
                          pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                        },
                        child: FittedBox(
                          fit:  BoxFit.fitHeight,
                          child: Container(
                            alignment:Alignment.center,
                            width:SizeConfig.blockSizeHorizontal*50,
                            height:SizeConfig.screenHeight*0.05,

                            //icon: Icon(Icons.drag_handle),
                            child:Text("Previous",style:TextStyle(color: Colors.black)),

                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          if(_formKey1.currentState.validate()) {
                            pageController.animateToPage(++pageChanged,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.bounceInOut);
                          }
                          else{
                            return
                            alert(
                              context,
                              // title: Text('Coming Soon'),
                              content:Text("Fill the required the fields",
                              ),

                              textOK: Text("Ok",
                              ),

                            );
                          }
                        },
                        child: FittedBox(
                          fit:  BoxFit.fitHeight,
                          child: Container(
                            alignment:Alignment.center,
                            height:SizeConfig.screenHeight*0.05,

                            width:SizeConfig.blockSizeHorizontal*50,

                            //icon: Icon(Icons.drag_handle),
                            child:Text("Next",style:TextStyle(color: Colors.black)),

                          ),
                        ),
                      ),


                    ],
                  )),




            ],
                  ),
        ),
              );

}
page3(){
    SizeConfig().init(context);
    return
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            isUploading ? linearProgress() : Text(""),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
              child:   GestureDetector(

                onTap: ()=>tag(),
                child: ListTile(title: Text('Tag other products (optional)',style:TextStyle(color: Colors.black) ,),
                    trailing:Icon(Icons.arrow_forward_ios_rounded)
                ),
              ),
            ),
            Container(
              height:SizeConfig.screenHeight*0.75,
              child: tagView(),
            ),
            Container(
                height:SizeConfig.screenHeight*0.05,
                child:Row(
                  children: [
                    InkWell(
                      onTap: (){
                        pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                      },
                      child: FittedBox(
                        fit:  BoxFit.fitHeight,
                        child: Container(
                          alignment:Alignment.center,
                          width:SizeConfig.blockSizeHorizontal*50,
                          height:SizeConfig.screenHeight*0.05,

                          //icon: Icon(Icons.drag_handle),
                          child:Text("Previous",style:TextStyle(color: Colors.black)),

                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        pageController.animateToPage(++pageChanged,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.bounceInOut);
                      },
                      child: FittedBox(
                        fit:  BoxFit.fitHeight,
                        child: Container(
                          alignment:Alignment.center,
                          height:SizeConfig.screenHeight*0.05,

                          width:SizeConfig.blockSizeHorizontal*50,

                          //icon: Icon(Icons.drag_handle),
                          child:Text("Next",style:TextStyle(color: Colors.black)),

                        ),
                      ),
                    ),


                  ],
                )),




          ],
                ),
      );

}
// page4(){
//     SizeConfig().init(context);
//     return
//       SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height:SizeConfig.screenHeight*0.85,
//
//             child: ListView(
//         children: <Widget>[
//
//         ExpansionTile(
//                   title: title1Controller.text == ""?
//                   Text("Title",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold))
//
//                   :Text("${title1Controller.text}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold)),
//                   children: [
//           // SingleChildScrollView(child: Column(children:[])),
//                       SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           controller: title1Controller,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'title',labelStyle: TextStyle(color: kText),
//                             hintText:"Ex:Collar",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget01(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName1,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//
//                     Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom1,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget02(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName2,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//
//                     Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom2,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget03(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName3,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                          Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom3,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget04(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName4,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom4,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget05(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName5,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom5,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget06(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName6,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom6,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget07(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName7,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom7,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget08(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName8,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom8,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget09(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName9,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom9,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget010(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName10,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom10,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                    ]
//               ),
//         ExpansionTile(
//                   title: title2Controller.text == ""?
//                   Text("Title",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold))
//
//                   :Text("${title2Controller.text}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold)),
//                   children: [
//                       SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           controller: title2Controller,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'title',labelStyle: TextStyle(color: kText),
//                             hintText:"Ex:Collar",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget011(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName11,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom11,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget012(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName12,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(120.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom12,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget013(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName13,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom13,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget014(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName14,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom14,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget015(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName15,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom15,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget016(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName16,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom16,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget017(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName17,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom17,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget018(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName18,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom18,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget019(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName19,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom19,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget020(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName20,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom20,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                    ]
//               ),
//         ExpansionTile(
//                   title: title3Controller.text == ""?
//                   Text("Title",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold))
//
//                   :Text("${title3Controller.text}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold)),
//                   children: [
//                       SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           controller: title3Controller,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'title',labelStyle: TextStyle(color: kText),
//                             hintText:"Ex:Collar",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget021(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName21,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom21,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget022(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName22,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom22,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget023(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName23,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom23,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget024(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName24,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom24,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget025(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName25,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom25,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget026(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName26,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom26,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget027(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName27,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom27,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget028(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName28,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom28,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget029(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName29,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom29,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget030(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName30,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom30,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                    ]
//               ),
//         ExpansionTile(
//                   title: title4Controller.text == ""?
//                   Text("Title",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold))
//
//                   :Text("${title4Controller.text}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold)),
//                   children: [
//                       SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           controller: title4Controller,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'title',labelStyle: TextStyle(color: kText),
//                             hintText:"Ex:Collar",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget031(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName31,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom31,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget032(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName32,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom32,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget033(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName33,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom33,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget034(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName34,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom34,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget035(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName35,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom35,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget036(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName36,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom36,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget037(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName37,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom37,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget038(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName38,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom38,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget039(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName39,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom39,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget040(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName40,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom40,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                    ]
//               ),
//         ExpansionTile(
//                   title: title5Controller.text == ""?
//                   Text("Title",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold))
//
//                   :Text("${title5Controller.text}",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold)),
//                   children: [
//                       SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           controller: title5Controller,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'title',labelStyle: TextStyle(color: kText),
//                             hintText:"Ex:Collar",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget041(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName41,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom41,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget042(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName42,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom42,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget043(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName43,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom43,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget044(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName44,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom44,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget045(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName45,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom45,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget046(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName46,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom46,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget047(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName47,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom47,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget048(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName48,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom48,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget049(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName49,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom49,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                       getImageWidget050(),
//                       SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         controller: customName50,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Title',labelStyle: TextStyle(color: kText),
//                           hintText:"Title",
//                         ),
//                         textAlign: TextAlign.center,
//
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                         child: TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: custom50,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Quantity',labelStyle: TextStyle(color: kText),
//                             hintText:"Quantity in Inventory",
//                           ),
//                           textAlign: TextAlign.center,
//
//                         ),
//                       ),
//
//                    ]
//               ),
//
//
//         ])
//             ),
//             Container(
//                 height:SizeConfig.screenHeight*0.05,
//                 child:Row(
//                   children: [
//                     InkWell(
//                       onTap: (){
//                         pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
//                       },
//                       child: FittedBox(
//                         fit:  BoxFit.fitHeight,
//                         child: Container(
//                           alignment:Alignment.center,
//                           width:SizeConfig.blockSizeHorizontal*50,
//                           height:SizeConfig.screenHeight*0.05,
//
//                           //icon: Icon(Icons.drag_handle),
//                           child:Text("Previous",style:TextStyle(color: Colors.black)),
//
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         pageController.animateToPage(++pageChanged,
//                             duration: Duration(milliseconds: 250),
//                             curve: Curves.bounceInOut);
//                       },
//                       child: FittedBox(
//                         fit:  BoxFit.fitHeight,
//                         child: Container(
//                           alignment:Alignment.center,
//                           height:SizeConfig.screenHeight*0.05,
//
//                           width:SizeConfig.blockSizeHorizontal*50,
//
//                           //icon: Icon(Icons.drag_handle),
//                           child:Text("Next",style:TextStyle(color: Colors.black)),
//
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 )),
//
//
//
//
//           ],
//                 ),
//       );
//
// }

page2(){
    return
  Form(
    key: _formKey2,
    child:
    SingleChildScrollView(
      child: Column(
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
Container(              height:SizeConfig.screenHeight*0.83,

  child:Column(children:[
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: ListTile(
      leading: Icon(
        EvilIcons.eye,
        color: Colors.orange,
        size: 35.0,
      ),
      title:  TextFormField(
        style:TextStyle(color: kText),
        controller: productnameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

          labelText: 'Product Name',labelStyle: TextStyle(color: kText),
          hintText: 'Product Name',
        ),
        textAlign: TextAlign.center,
        validator: (text) {
          if ( text.isEmpty) {
            return 'Product Name is empty';
          }
          return null;
        },
      ),
    ),
  ),
  SizedBox(height: 8.0,),
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: ListTile(
      leading: Icon(
        EvilIcons.tag,
        color: Colors.orange,
        size: 35.0,
      ),
      title:TextFormField(
        style:TextStyle(color: kText),
        keyboardType:TextInputType.number,
        controller: priceController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

          labelText: 'Price',labelStyle: TextStyle(color: kText),
          hintText:
          currentUser.currency == "INR"?'₹':
          currentUser.currency == "EUR"?'€':
          currentUser.currency == "GBP"?'£':'\u0024',
        ),
        textAlign: TextAlign.center,
        validator: (text) {
          if (text.isEmpty) {
            return 'Price is empty';
          }
          return null;
        },
      ),
    ),
  ),

  SizedBox( height: 8.0,),
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: TextFormField(
      style:TextStyle(color: kText),

      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: detailsController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

        labelText: 'Product description',labelStyle: TextStyle(color: kText),
        hintText: 'Product description',
      ),
      textAlign: TextAlign.center,
      validator: (text) {
        if ( text.isEmpty) {
          return 'Description is empty';
        }
        return null;
      },
    ),
  ),
  SizedBox( height: 8.0,),
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: TextFormField(
      style:TextStyle(color: kText),

      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: compositionController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

        labelText: 'Fabric description',labelStyle: TextStyle(color: kText),
        hintText: 'ex.Cotton: 100%' ,
      ),
      textAlign: TextAlign.center,
      validator: (text) {
        if ( text.isEmpty) {
          return 'Fabric description is empty';
        }
        return null;
      },
    ),
  ),
  SizedBox( height: 8.0,),
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: TextFormField(
      style:TextStyle(color: kText),

      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: washandcareController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

        labelText: 'Wash & Care',labelStyle: TextStyle(color: kText),
        hintText: 'Wash & Care instructions',
      ),
      textAlign: TextAlign.center,
      validator: (text) {
        if ( text.isEmpty) {
          return 'Wash & Care instructions is empty';
        }
        return null;
      },
    ),
  ),
  SizedBox( height: 8.0,),
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: TextFormField(
      style:TextStyle(color: kText),

      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: sizeandfitController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

        labelText: 'Size & Fit recommendations',labelStyle: TextStyle(color: kText),
        hintText: 'ex.Cut for slim fit,take your normal size',
      ),
      textAlign: TextAlign.center,
      validator: (text) {
        if ( text.isEmpty) {
          return ' Size & Fit recommendations is empty';
        }
        return null;
      },
    ),
  ),

  SizedBox( height: 8.0,),
  Container(
    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
    child: TextFormField(
      style:TextStyle(color: kText),

      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: shipcontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

        labelText: 'Shipping & returns',labelStyle: TextStyle(color: kText),
        hintText: 'countries served & return policy',
      ),
      textAlign: TextAlign.center,
      validator: (text) {
        if ( text.isEmpty) {
          return 'Shipping & returns';
        }
        return null;
      },
    ),
  ),
]),),

          Container(
              height:SizeConfig.screenHeight*0.05,
              child:Row(
                children: [
                  InkWell(
                    onTap: (){
                      pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                    },
                    child: FittedBox(
                      fit:  BoxFit.fitHeight,
                      child: Container(
                        alignment:Alignment.center,
                        width:SizeConfig.blockSizeHorizontal*50,
                        height:SizeConfig.screenHeight*0.05,

                        //icon: Icon(Icons.drag_handle),
                        child:Text("Previous",style:TextStyle(color: Colors.black)),

                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if(_formKey2.currentState.validate()) {
                        await INRUSD();

                        handleSubmit();
                        Get.back();
                      }
                      else{
                        return
                          alert(
                            context,
                            // title: Text('Coming Soon'),
                            content:Text("Fill the required the fields",
                            ),

                            textOK: Text("Ok",
                            ),

                          );
                      }
                    },
                    child: FittedBox(
                      fit:  BoxFit.fitHeight,
                      child: Container(
                        alignment:Alignment.center,
                        height:SizeConfig.screenHeight*0.05,

                        width:SizeConfig.blockSizeHorizontal*50,
                         color: kButton,
                        //icon: Icon(Icons.drag_handle),
                        child:Text("Post",style:TextStyle(color: Colors.black)),

                      ),
                    ),
                  ),


                ],
              )),

        ],
      ),
    ),
  );
}

  Future<void> loadAssets() async {

    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';
//    ByteData byteData = await asset.getByteData(quality: 80);
    try {
      setState(() {
        _inProcess = true;

      });
      resultList = await MultiImagePicker.pickImages(

        maxImages: 100,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "Images"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Upload Image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",

        ),
      );


    } on Exception catch (e) {
      error = e.toString();
      setState(() {
        _inProcess = false;

      });
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {

      images = resultList;
    });

  }
  void INRUSD() async {
    var I;
    var I1;
    var I2;
    var I3;
    var I4;
    var I5;
    var I6;
    var I7;
    var I8;
    var I9;
    var I10;
    var I11;
    var I12;
    var G;
    var G1;
    var G2;
    var G3;
    var G4;
    var G5;
    var G6;
    var G7;
    var G8;
    var G9;
    var G10;
    var G11;
    var G12;
    var E;
    var E1;
    var E2;
    var E3;
    var E4;
    var E5;
    var E6;
    var E7;
    var E8;
    var E9;
    var E10;
    var E11;
    var E12;
    var U;
    var U1;
    var U2;
    var U3;
    var U4;
    var U5;
    var U6;
    var U7;
    var U8;
    var U9;
    var U10;
    var U11;
    var U12;

    setState(() {
      isUploading = true;
      userPrice = double.tryParse(priceController.text ?? "0.001");
      userPrice1 = double.tryParse(customController11.text ?? "0.001");
      userPrice2 = double.tryParse(customController21.text ?? "0.001");
      userPrice3 = double.tryParse(customController31.text ?? "0.001");
      userPrice4 = double.tryParse(customController41.text ?? "0.001");
      userPrice5 = double.tryParse(customController51.text ?? "0.001");
      userPrice6 = double.tryParse(customController61.text ?? "0.001");
      userPrice7 = double.tryParse(customController71.text ?? "0.001");
      userPrice8 = double.tryParse(customController81.text ?? "0.001");
      userPrice9 = double.tryParse(customController91.text ?? "0.001");
      userPrice10 = double.tryParse(customController101.text ?? "0.001");
      userPrice11 = double.tryParse(shipcost.text ?? "0.01");
      userPrice12 = double.tryParse(shipcostintern.text ?? "0.01");
    });
    if(currentUser.currency == "INR"){
      var resultUSD = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: priceController.text);
    var resultUSD1 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController11.text ??  0);
    var resultUSD2 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController21.text ??  0);
    var resultUSD3 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController31.text ??  0);
    var resultUSD4 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController41.text ??  0);
    var resultUSD5 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController51.text ??  0);
    var resultUSD6 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController61.text ??  0);
    var resultUSD7 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController71.text ??  0);
    var resultUSD8 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController81.text ??  0);
    var resultUSD9 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController91.text ??  0);
    var resultUSD10 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: customController101.text ??  0);
    var resultUSD11 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: shipcost.text ??  0);
    var resultUSD12 = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: shipcostintern.text ??  0);
       var resultEUR = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: priceController.text);
    var resultEUR1 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController11.text ??  0);
    var resultEUR2 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController21.text ??  0);
    var resultEUR3 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController31.text ??  0);
    var resultEUR4 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController41.text ??  0);
    var resultEUR5 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController51.text ??  0);
    var resultEUR6 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController61.text ??  0);
    var resultEUR7 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController71.text ??  0);
    var resultEUR8 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController81.text ??  0);
    var resultEUR9 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController91.text ??  0);
    var resultEUR10 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController101.text ??  0);
    var resultEUR11 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: shipcost.text ??  0);
    var resultEUR12 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: shipcostintern.text ??  0);
   var resultGBP = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: priceController.text);
    var resultGBP1 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController11.text ??  0);
    var resultGBP2 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController21.text ??  0);
    var resultGBP3 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController31.text ??  0);
    var resultGBP4 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController41.text ??  0);
    var resultGBP5 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController51.text ??  0);
    var resultGBP6 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController61.text ??  0);
    var resultGBP7 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController71.text ??  0);
    var resultGBP8 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController81.text ??  0);
    var resultGBP9 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController91.text ??  0);
    var resultGBP10 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController101.text ??  0);
    var resultGBP11 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: shipcost.text ??  0);
    var resultGBP12 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: shipcostintern.text ??  0);

    // String date = result.date; // Returns the last updated date
    setState(() {


      INR = userPrice?? 0.001;
      INR1 = userPrice1?? 0.001;
      INR2 = userPrice2?? 0.001;
      INR3 = userPrice3?? 0.001;
      INR4 = userPrice4?? 0.001;
      INR5 = userPrice5?? 0.001;
      INR6 = userPrice6?? 0.001;
      INR7 = userPrice7?? 0.001;
      INR8 = userPrice8?? 0.001;
      INR9 = userPrice9?? 0.001;
      INR10 = userPrice10?? 0.001;
      INR11 = userPrice11?? 0.01;
      INR12 = userPrice12?? 0.01;

       I = INR.toStringAsFixed(2);
       INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
       INR1 = double.tryParse(I1);
        I2 = INR2.toStringAsFixed(2);
       INR2 = double.tryParse(I2);
        I3 = INR3.toStringAsFixed(2);
       INR3 = double.tryParse(I3);
        I4 = INR4.toStringAsFixed(2);
       INR4 = double.tryParse(I4);
        I5 = INR5.toStringAsFixed(2);
       INR5 = double.tryParse(I5);
        I6 = INR6.toStringAsFixed(2);
       INR6 = double.tryParse(I6);
        I7 = INR7.toStringAsFixed(2);
       INR7 = double.tryParse(I7);
        I8 = INR8.toStringAsFixed(2);
       INR8 = double.tryParse(I8);
        I9 = INR9.toStringAsFixed(2);
       INR9 = double.tryParse(I9);
        I10 = INR10.toStringAsFixed(2);
       INR10 = double.tryParse(I10);
        I11 = INR11.toStringAsFixed(2);
       INR11 = double.tryParse(I11);
        I12 = INR12.toStringAsFixed(2);
       INR12 = double.tryParse(I12);


       USD = resultUSD.rate?? 0.001;
      USD1 = resultUSD1.rate?? 0.001;
      USD2 = resultUSD2.rate?? 0.001;
      USD3 = resultUSD3.rate?? 0.001;
      USD4 = resultUSD4.rate?? 0.001;
      USD5 = resultUSD5.rate?? 0.001;
      USD6 = resultUSD6.rate?? 0.001;
      USD7 = resultUSD7.rate?? 0.001;
      USD8 = resultUSD8.rate?? 0.001;
      USD9 = resultUSD9.rate?? 0.001;
      USD10 = resultUSD10.rate?? 0.001;
      USD11 = resultUSD11.rate?? 0.01;
      USD12 = resultUSD12.rate?? 0.01;
      U = USD.toStringAsFixed(2);
      USD = double.tryParse(U);
      U1 = USD1.toStringAsFixed(2);
      USD1 = double.tryParse(U1);
      U2 = USD2.toStringAsFixed(2);
      USD2 = double.tryParse(U2);
      U3 = USD3.toStringAsFixed(2);
      USD3 = double.tryParse(U3);
      U4 = USD4.toStringAsFixed(2);
      USD4 = double.tryParse(U4);
      U5 = USD5.toStringAsFixed(2);
      USD5 = double.tryParse(U5);
      U6 = USD6.toStringAsFixed(2);
      USD6 = double.tryParse(U6);
      U7 = USD7.toStringAsFixed(2);
      USD7 = double.tryParse(U7);
      U8 = USD8.toStringAsFixed(2);
      USD8 = double.tryParse(U8);
      U9 = USD9.toStringAsFixed(2);
      USD9 = double.tryParse(U9);
      U10 = USD10.toStringAsFixed(2);
      USD10 = double.tryParse(U10);
      U11 = USD11.toStringAsFixed(2);
      USD11 = double.tryParse(U11);
      U12 = USD12.toStringAsFixed(2);
      USD12 = double.tryParse(U12);

      EUR = resultEUR.rate?? 0.001;
      EUR1 = resultEUR1.rate?? 0.001;
      EUR2 = resultEUR2.rate?? 0.001;
      EUR3 = resultEUR3.rate?? 0.001;
      EUR4 = resultEUR4.rate?? 0.001;
      EUR5 = resultEUR5.rate?? 0.001;
      EUR6 = resultEUR6.rate?? 0.001;
      EUR7 = resultEUR7.rate?? 0.001;
      EUR8 = resultEUR8.rate?? 0.001;
      EUR9 = resultEUR9.rate?? 0.001;
      EUR10 = resultEUR10.rate?? 0.001;
      EUR11 = resultEUR11.rate?? 0.01;
      EUR12 = resultEUR12.rate?? 0.01;
      E = EUR.toStringAsFixed(2);
      EUR = double.tryParse(E);
      E1 = EUR1.toStringAsFixed(2);
      EUR1 = double.tryParse(E1);
      E2 = EUR2.toStringAsFixed(2);
      EUR2 = double.tryParse(E2);
      E3 = EUR3.toStringAsFixed(2);
      EUR3 = double.tryParse(E3);
      E4 = EUR4.toStringAsFixed(2);
      EUR4 = double.tryParse(E4);
      E5 = EUR5.toStringAsFixed(2);
      EUR5 = double.tryParse(E5);
      E6 = EUR6.toStringAsFixed(2);
      EUR6 = double.tryParse(E6);
      E7 = EUR7.toStringAsFixed(2);
      EUR7 = double.tryParse(E7);
      E8 = EUR8.toStringAsFixed(2);
      EUR8 = double.tryParse(E8);
      E9 = EUR9.toStringAsFixed(2);
      EUR9 = double.tryParse(E9);
      E10 = EUR10.toStringAsFixed(2);
      EUR10 = double.tryParse(E10);
      E11 = EUR11.toStringAsFixed(2);
      EUR11 = double.tryParse(E11);
      E12 = EUR12.toStringAsFixed(2);
      EUR12 = double.tryParse(E12);

      GBP = resultGBP.rate?? 0.001;
      GBP1 = resultGBP1.rate?? 0.001;
      GBP2 = resultGBP2.rate?? 0.001;
      GBP3 = resultGBP3.rate?? 0.001;
      GBP4 = resultGBP4.rate?? 0.001;
      GBP5 = resultGBP5.rate?? 0.001;
      GBP6 = resultGBP6.rate?? 0.001;
      GBP7 = resultGBP7.rate?? 0.001;
      GBP8 = resultGBP8.rate?? 0.001;
      GBP9 = resultGBP9.rate?? 0.001;
      GBP10 = resultGBP10.rate?? 0.001;
      GBP11 = resultGBP11.rate?? 0.01;
      GBP12 = resultGBP12.rate?? 0.01;
      G = GBP.toStringAsFixed(2);
      GBP = double.tryParse(G);
      G1 = GBP1.toStringAsFixed(2);
      GBP1 = double.tryParse(G1);
      G2 = GBP2.toStringAsFixed(2);
      GBP2 = double.tryParse(G2);
      G3 = GBP3.toStringAsFixed(2);
      GBP3 = double.tryParse(G3);
      G4 = GBP4.toStringAsFixed(2);
      GBP4 = double.tryParse(G4);
      G5 = GBP5.toStringAsFixed(2);
      GBP5 = double.tryParse(G5);
      G6 = GBP6.toStringAsFixed(2);
      GBP6 = double.tryParse(G6);
      G7 = GBP7.toStringAsFixed(2);
      GBP7 = double.tryParse(G7);
      G8 = GBP8.toStringAsFixed(2);
      GBP8 = double.tryParse(G8);
      G9 = GBP9.toStringAsFixed(2);
      GBP9 = double.tryParse(G9);
      G10 = GBP10.toStringAsFixed(2);
      GBP10 = double.tryParse(G10);
      G11 = GBP11.toStringAsFixed(2);
      GBP11 = double.tryParse(G11);
      G12 = GBP12.toStringAsFixed(2);
      GBP12 = double.tryParse(G12);


    });
    }
    else if(currentUser.currency == "EUR"){
      var resultUSD = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: priceController.text);
    var resultUSD1 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController11.text ??  0);
    var resultUSD2 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController21.text ??  0);
    var resultUSD3 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController31.text ??  0);
    var resultUSD4 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController41.text ??  0);
    var resultUSD5 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController51.text ??  0);
    var resultUSD6 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController61.text ??  0);
    var resultUSD7 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController71.text ??  0);
    var resultUSD8 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController81.text ??  0);
    var resultUSD9 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController91.text ??  0);
    var resultUSD10 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController101.text ??  0);
    var resultUSD11 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: shipcost.text ??  0);
     var resultUSD12 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: shipcostintern.text ??  0);

    var resultINR = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: priceController.text);
    var resultINR1 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController11.text ??  0);
    var resultINR2 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController21.text ??  0);
    var resultINR3 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController31.text ??  0);
    var resultINR4 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController41.text ??  0);
    var resultINR5 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController51.text ??  0);
    var resultINR6 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController61.text ??  0);
    var resultINR7 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController71.text ??  0);
    var resultINR8 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController81.text ??  0);
    var resultINR9 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController91.text ??  0);
    var resultINR10 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController101.text ??  0);
    var resultINR11 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: shipcost.text ??  0);
    var resultINR12 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: shipcostintern.text ??  0);
     var resultGBP = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: priceController.text);
    var resultGBP1 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController11.text ??  0);
    var resultGBP2 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController21.text ??  0);
    var resultGBP3 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController31.text ??  0);
    var resultGBP4 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController41.text ??  0);
    var resultGBP5 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController51.text ??  0);
    var resultGBP6 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController61.text ??  0);
    var resultGBP7 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController71.text ??  0);
    var resultGBP8 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController81.text ??  0);
    var resultGBP9 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController91.text ??  0);
    var resultGBP10 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController101.text ??  0);
    var resultGBP11 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: shipcost.text ??  0);
    var resultGBP12 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: shipcostintern.text ??  0);

    // String date = result.date; // Returns the last updated date
    setState(() {
      EUR = userPrice?? 0.001;
      EUR1 = userPrice1?? 0.001;
      EUR2 = userPrice2?? 0.001;
      EUR3 = userPrice3?? 0.001;
      EUR4 = userPrice4?? 0.001;
      EUR5 = userPrice5?? 0.001;
      EUR6 = userPrice6?? 0.001;
      EUR7 = userPrice7?? 0.001;
      EUR8 = userPrice8?? 0.001;
      EUR9 = userPrice9?? 0.001;
      EUR10 = userPrice10?? 0.001;
      EUR11 = userPrice11?? 0.01;
      EUR12 = userPrice12?? 0.01;
      E = EUR.toStringAsFixed(2);
      EUR = double.tryParse(E);
      E1 = EUR1.toStringAsFixed(2);
      EUR1 = double.tryParse(E1);
      E2 = EUR2.toStringAsFixed(2);
      EUR2 = double.tryParse(E2);
      E3 = EUR3.toStringAsFixed(2);
      EUR3 = double.tryParse(E3);
      E4 = EUR4.toStringAsFixed(2);
      EUR4 = double.tryParse(E4);
      E5 = EUR5.toStringAsFixed(2);
      EUR5 = double.tryParse(E5);
      E6 = EUR6.toStringAsFixed(2);
      EUR6 = double.tryParse(E6);
      E7 = EUR7.toStringAsFixed(2);
      EUR7 = double.tryParse(E7);
      E8 = EUR8.toStringAsFixed(2);
      EUR8 = double.tryParse(E8);
      E9 = EUR9.toStringAsFixed(2);
      EUR9 = double.tryParse(E9);
      E10 = EUR10.toStringAsFixed(2);
      EUR10 = double.tryParse(E10);
      E11 = EUR11.toStringAsFixed(2);
      EUR11 = double.tryParse(E11);
      E12 = EUR12.toStringAsFixed(2);
      EUR12 = double.tryParse(E12);

      USD = resultUSD.rate?? 0.001;
      USD1 = resultUSD1.rate?? 0.001;
      USD2 = resultUSD2.rate?? 0.001;
      USD3 = resultUSD3.rate?? 0.001;
      USD4 = resultUSD4.rate?? 0.001;
      USD5 = resultUSD5.rate?? 0.001;
      USD6 = resultUSD6.rate?? 0.001;
      USD7 = resultUSD7.rate?? 0.001;
      USD8 = resultUSD8.rate?? 0.001;
      USD9 = resultUSD9.rate?? 0.001;
      USD10 = resultUSD10.rate?? 0.001;
      USD11 = resultUSD11.rate?? 0.01;
      USD12 = resultUSD12.rate?? 0.01;
      U = USD.toStringAsFixed(2);
      USD = double.tryParse(U);
      U1 = USD1.toStringAsFixed(2);
      USD1 = double.tryParse(U1);
      U2 = USD2.toStringAsFixed(2);
      USD2 = double.tryParse(U2);
      U3 = USD3.toStringAsFixed(2);
      USD3 = double.tryParse(U3);
      U4 = USD4.toStringAsFixed(2);
      USD4 = double.tryParse(U4);
      U5 = USD5.toStringAsFixed(2);
      USD5 = double.tryParse(U5);
      U6 = USD6.toStringAsFixed(2);
      USD6 = double.tryParse(U6);
      U7 = USD7.toStringAsFixed(2);
      USD7 = double.tryParse(U7);
      U8 = USD8.toStringAsFixed(2);
      USD8 = double.tryParse(U8);
      U9 = USD9.toStringAsFixed(2);
      USD9 = double.tryParse(U9);
      U10 = USD10.toStringAsFixed(2);
      USD10 = double.tryParse(U10);
      U11 = USD11.toStringAsFixed(2);
      USD11 = double.tryParse(U11);
      U12 = USD12.toStringAsFixed(2);
      USD12 = double.tryParse(U12);

      INR = resultINR.rate?? 0.001;
      INR1 = resultINR1.rate?? 0.001;
      INR2 = resultINR2.rate?? 0.001;
      INR3 = resultINR3.rate?? 0.001;
      INR4 = resultINR4.rate?? 0.001;
      INR5 = resultINR5.rate?? 0.001;
      INR6 = resultINR6.rate?? 0.001;
      INR7 = resultINR7.rate?? 0.001;
      INR8 = resultINR8.rate?? 0.001;
      INR9 = resultINR9.rate?? 0.001;
      INR10 = resultINR10.rate?? 0.001;
      INR11 = resultINR11.rate?? 0.01;
      INR12 = resultINR12.rate?? 0.01;
      I = INR.toStringAsFixed(2);
      INR = double.tryParse(I);
      I1 = INR1.toStringAsFixed(2);
      INR1 = double.tryParse(I1);
      I2 = INR2.toStringAsFixed(2);
      INR2 = double.tryParse(I2);
      I3 = INR3.toStringAsFixed(2);
      INR3 = double.tryParse(I3);
      I4 = INR4.toStringAsFixed(2);
      INR4 = double.tryParse(I4);
      I5 = INR5.toStringAsFixed(2);
      INR5 = double.tryParse(I5);
      I6 = INR6.toStringAsFixed(2);
      INR6 = double.tryParse(I6);
      I7 = INR7.toStringAsFixed(2);
      INR7 = double.tryParse(I7);
      I8 = INR8.toStringAsFixed(2);
      INR8 = double.tryParse(I8);
      I9 = INR9.toStringAsFixed(2);
      INR9 = double.tryParse(I9);
      I10 = INR10.toStringAsFixed(2);
      INR10 = double.tryParse(I10);
      I11 = INR11.toStringAsFixed(2);
      INR11 = double.tryParse(I11);
      I12 = INR12.toStringAsFixed(2);
      INR12 = double.tryParse(I12);

      GBP = resultGBP.rate?? 0.001;
      GBP1 = resultGBP1.rate?? 0.001;
      GBP2 = resultGBP2.rate?? 0.001;
      GBP3 = resultGBP3.rate?? 0.001;
      GBP4 = resultGBP4.rate?? 0.001;
      GBP5 = resultGBP5.rate?? 0.001;
      GBP6 = resultGBP6.rate?? 0.001;
      GBP7 = resultGBP7.rate?? 0.001;
      GBP8 = resultGBP8.rate?? 0.001;
      GBP9 = resultGBP9.rate?? 0.001;
      GBP10 = resultGBP10.rate?? 0.001;
      GBP11 = resultGBP11.rate?? 0.01;
      GBP12 = resultGBP12.rate?? 0.01;
      G = GBP.toStringAsFixed(2);
      GBP = double.tryParse(G);
      G1 = GBP1.toStringAsFixed(2);
      GBP1 = double.tryParse(G1);
      G2 = GBP2.toStringAsFixed(2);
      GBP2 = double.tryParse(G2);
      G3 = GBP3.toStringAsFixed(2);
      GBP3 = double.tryParse(G3);
      G4 = GBP4.toStringAsFixed(2);
      GBP4 = double.tryParse(G4);
      G5 = GBP5.toStringAsFixed(2);
      GBP5 = double.tryParse(G5);
      G6 = GBP6.toStringAsFixed(2);
      GBP6 = double.tryParse(G6);
      G7 = GBP7.toStringAsFixed(2);
      GBP7 = double.tryParse(G7);
      G8 = GBP8.toStringAsFixed(2);
      GBP8 = double.tryParse(G8);
      G9 = GBP9.toStringAsFixed(2);
      GBP9 = double.tryParse(G9);
      G10 = GBP10.toStringAsFixed(2);
      GBP10 = double.tryParse(G10);
      G11 = GBP11.toStringAsFixed(2);
      GBP11 = double.tryParse(G11);
      G12 = GBP12.toStringAsFixed(2);
      GBP12 = double.tryParse(G12);


    });
    }
    else if(currentUser.currency == "GBP"){
      var resultUSD = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: priceController.text);
      var resultUSD1 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController11.text ??  0);
      var resultUSD2 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController21.text ??  0);
      var resultUSD3 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController31.text ??  0);
      var resultUSD4 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController41.text ??  0);
      var resultUSD5 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController51.text ??  0);
      var resultUSD6 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController61.text ??  0);
      var resultUSD7 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController71.text ??  0);
      var resultUSD8 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController81.text ??  0);
      var resultUSD9 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController91.text ??  0);
      var resultUSD10 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: customController101.text ??  0);
      var resultUSD11 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: shipcost.text ??  0);
      var resultUSD12 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: shipcostintern.text ??  0);
           var resultEUR = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: priceController.text);
      var resultEUR1 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController11.text ??  0);
      var resultEUR2 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController21.text ??  0);
      var resultEUR3 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController31.text ??  0);
      var resultEUR4 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController41.text ??  0);
      var resultEUR5 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController51.text ??  0);
      var resultEUR6 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController61.text ??  0);
      var resultEUR7 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController71.text ??  0);
      var resultEUR8 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController81.text ??  0);
      var resultEUR9 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController91.text ??  0);
      var resultEUR10 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: customController101.text ??  0);
      var resultEUR11 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: shipcost.text ??  0);
      var resultEUR12 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: shipcostintern.text ??  0);
       var resultINR = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: priceController.text);
      var resultINR1 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController11.text ??  0);
      var resultINR2 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController21.text ??  0);
      var resultINR3 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController31.text ??  0);
      var resultINR4 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController41.text ??  0);
      var resultINR5 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController51.text ??  0);
      var resultINR6 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController61.text ??  0);
      var resultINR7 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController71.text ??  0);
      var resultINR8 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController81.text ??  0);
      var resultINR9 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController91.text ??  0);
      var resultINR10 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: customController101.text ??  0);
      var resultINR11 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: shipcost.text ??  0);
      var resultINR12 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: shipcostintern.text ??  0);

      // String date = result.date; // Returns the last updated date
      setState(() {
        GBP = userPrice?? 0.001;
        GBP1 = userPrice1?? 0.001;
        GBP2 = userPrice2?? 0.001;
        GBP3 = userPrice3?? 0.001;
        GBP4 = userPrice4?? 0.001;
        GBP5 = userPrice5?? 0.001;
        GBP6 = userPrice6?? 0.001;
        GBP7 = userPrice7?? 0.001;
        GBP8 = userPrice8?? 0.001;
        GBP9 = userPrice9?? 0.001;
        GBP10 = userPrice10?? 0.001;
        GBP11 = userPrice11?? 0.01;
        GBP12 = userPrice12?? 0.01;
        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        G1 = GBP1.toStringAsFixed(2);
        GBP1 = double.tryParse(G1);
        G2 = GBP2.toStringAsFixed(2);
        GBP2 = double.tryParse(G2);
        G3 = GBP3.toStringAsFixed(2);
        GBP3 = double.tryParse(G3);
        G4 = GBP4.toStringAsFixed(2);
        GBP4 = double.tryParse(G4);
        G5 = GBP5.toStringAsFixed(2);
        GBP5 = double.tryParse(G5);
        G6 = GBP6.toStringAsFixed(2);
        GBP6 = double.tryParse(G6);
        G7 = GBP7.toStringAsFixed(2);
        GBP7 = double.tryParse(G7);
        G8 = GBP8.toStringAsFixed(2);
        GBP8 = double.tryParse(G8);
        G9 = GBP9.toStringAsFixed(2);
        GBP9 = double.tryParse(G9);
        G10 = GBP10.toStringAsFixed(2);
        GBP10 = double.tryParse(G10);
        G11 = GBP11.toStringAsFixed(2);
        GBP11 = double.tryParse(G11);
        G12 = GBP12.toStringAsFixed(2);
        GBP12 = double.tryParse(G12);

        USD = resultUSD.rate?? 0.001;
        USD1 = resultUSD1.rate?? 0.001;
        USD2 = resultUSD2.rate?? 0.001;
        USD3 = resultUSD3.rate?? 0.001;
        USD4 = resultUSD4.rate?? 0.001;
        USD5 = resultUSD5.rate?? 0.001;
        USD6 = resultUSD6.rate?? 0.001;
        USD7 = resultUSD7.rate?? 0.001;
        USD8 = resultUSD8.rate?? 0.001;
        USD9 = resultUSD9.rate?? 0.001;
        USD10 = resultUSD10.rate?? 0.001;
        USD11 = resultUSD11.rate?? 0.01;
      USD12 = resultUSD12.rate?? 0.01;
        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
        U1 = USD1.toStringAsFixed(2);
        USD1 = double.tryParse(U1);
        U2 = USD2.toStringAsFixed(2);
        USD2 = double.tryParse(U2);
        U3 = USD3.toStringAsFixed(2);
        USD3 = double.tryParse(U3);
        U4 = USD4.toStringAsFixed(2);
        USD4 = double.tryParse(U4);
        U5 = USD5.toStringAsFixed(2);
        USD5 = double.tryParse(U5);
        U6 = USD6.toStringAsFixed(2);
        USD6 = double.tryParse(U6);
        U7 = USD7.toStringAsFixed(2);
        USD7 = double.tryParse(U7);
        U8 = USD8.toStringAsFixed(2);
        USD8 = double.tryParse(U8);
        U9 = USD9.toStringAsFixed(2);
        USD9 = double.tryParse(U9);
        U10 = USD10.toStringAsFixed(2);
        USD10 = double.tryParse(U10);
        U11 = USD11.toStringAsFixed(2);
        USD11 = double.tryParse(U11);
        U12 = USD12.toStringAsFixed(2);
        USD12 = double.tryParse(U12);

        INR = resultINR.rate?? 0.001;
        INR1 = resultINR1.rate?? 0.001;
        INR2 = resultINR2.rate?? 0.001;
        INR3 = resultINR3.rate?? 0.001;
        INR4 = resultINR4.rate?? 0.001;
        INR5 = resultINR5.rate?? 0.001;
        INR6 = resultINR6.rate?? 0.001;
        INR7 = resultINR7.rate?? 0.001;
        INR8 = resultINR8.rate?? 0.001;
        INR9 = resultINR9.rate?? 0.001;
        INR10 = resultINR10.rate?? 0.001;
        INR11 = resultINR11.rate?? 0.01;
      INR12 = resultINR12.rate?? 0.01;
        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
        INR1 = double.tryParse(I1);
        I2 = INR2.toStringAsFixed(2);
        INR2 = double.tryParse(I2);
        I3 = INR3.toStringAsFixed(2);
        INR3 = double.tryParse(I3);
        I4 = INR4.toStringAsFixed(2);
        INR4 = double.tryParse(I4);
        I5 = INR5.toStringAsFixed(2);
        INR5 = double.tryParse(I5);
        I6 = INR6.toStringAsFixed(2);
        INR6 = double.tryParse(I6);
        I7 = INR7.toStringAsFixed(2);
        INR7 = double.tryParse(I7);
        I8 = INR8.toStringAsFixed(2);
        INR8 = double.tryParse(I8);
        I9 = INR9.toStringAsFixed(2);
        INR9 = double.tryParse(I9);
        I10 = INR10.toStringAsFixed(2);
        INR10 = double.tryParse(I10);
        I11 = INR11.toStringAsFixed(2);
        INR11 = double.tryParse(I11);
        I12 = INR12.toStringAsFixed(2);
        INR12 = double.tryParse(I12);

        EUR = resultEUR.rate?? 0.001;
        EUR1 = resultEUR1.rate?? 0.001;
        EUR2 = resultEUR2.rate?? 0.001;
        EUR3 = resultEUR3.rate?? 0.001;
        EUR4 = resultEUR4.rate?? 0.001;
        EUR5 = resultEUR5.rate?? 0.001;
        EUR6 = resultEUR6.rate?? 0.001;
        EUR7 = resultEUR7.rate?? 0.001;
        EUR8 = resultEUR8.rate?? 0.001;
        EUR9 = resultEUR9.rate?? 0.001;
        EUR10 = resultEUR10.rate?? 0.001;
        EUR11 = resultEUR11.rate?? 0.01;
      EUR12 = resultEUR12.rate?? 0.01;

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        E1 = EUR1.toStringAsFixed(2);
        EUR1 = double.tryParse(E1);
        E2 = EUR2.toStringAsFixed(2);
        EUR2 = double.tryParse(E2);
        E3 = EUR3.toStringAsFixed(2);
        EUR3 = double.tryParse(E3);
        E4 = EUR4.toStringAsFixed(2);
        EUR4 = double.tryParse(E4);
        E5 = EUR5.toStringAsFixed(2);
        EUR5 = double.tryParse(E5);
        E6 = EUR6.toStringAsFixed(2);
        EUR6 = double.tryParse(E6);
        E7 = EUR7.toStringAsFixed(2);
        EUR7 = double.tryParse(E7);
        E8 = EUR8.toStringAsFixed(2);
        EUR8 = double.tryParse(E8);
        E9 = EUR9.toStringAsFixed(2);
        EUR9 = double.tryParse(E9);
        E10 = EUR10.toStringAsFixed(2);
        EUR10 = double.tryParse(E10);
        E11 = EUR11.toStringAsFixed(2);
        EUR11 = double.tryParse(E11);
        E12 = EUR12.toStringAsFixed(2);
        EUR12 = double.tryParse(E12);

      });
    }
    else{
      var resultINR = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: priceController.text);
      var resultINR1 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController11.text ??  0);
      var resultINR2 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController21.text ??  0);
      var resultINR3 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController31.text ??  0);
      var resultINR4 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController41.text ??  0);
      var resultINR5 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController51.text ??  0);
      var resultINR6 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController61.text ??  0);
      var resultINR7 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController71.text ??  0);
      var resultINR8 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController81.text ??  0);
      var resultINR9 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController91.text ??  0);
      var resultINR10 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: customController101.text ??  0);
      var resultINR11 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: shipcost.text ??  0);
      var resultINR12 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: shipcostintern.text ??  0);
var resultEUR = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: priceController.text);
      var resultEUR1 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController11.text ??  0);
      var resultEUR2 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController21.text ??  0);
      var resultEUR3 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController31.text ??  0);
      var resultEUR4 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController41.text ??  0);
      var resultEUR5 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController51.text ??  0);
      var resultEUR6 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController61.text ??  0);
      var resultEUR7 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController71.text ??  0);
      var resultEUR8 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController81.text ??  0);
      var resultEUR9 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController91.text ??  0);
      var resultEUR10 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: customController101.text ??  0);
      var resultEUR11 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: shipcost.text ??  0);
      var resultEUR12 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: shipcostintern.text ??  0);
var resultGBP = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: priceController.text);
      var resultGBP1 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController11.text ??  0);
      var resultGBP2 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController21.text ??  0);
      var resultGBP3 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController31.text ??  0);
      var resultGBP4 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController41.text ??  0);
      var resultGBP5 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController51.text ??  0);
      var resultGBP6 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController61.text ??  0);
      var resultGBP7 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController71.text ??  0);
      var resultGBP8 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController81.text ??  0);
      var resultGBP9 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController91.text ??  0);
      var resultGBP10 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: customController101.text ??  0);
      var resultGBP11 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: shipcost.text ??  0);
      var resultGBP12 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: shipcostintern.text ??  0);

      // String date = result.date; // Returns the last updated date
      setState(() {
        USD = userPrice?? 0.001;
        USD1 = userPrice1?? 0.001;
        USD2 = userPrice2?? 0.001;
        USD3 = userPrice3?? 0.001;
        USD4 = userPrice4?? 0.001;
        USD5 = userPrice5?? 0.001;
        USD6 = userPrice6?? 0.001;
        USD7 = userPrice7?? 0.001;
        USD8 = userPrice8?? 0.001;
        USD9 = userPrice9?? 0.001;
        USD10 = userPrice10?? 0.001;
        USD11 = userPrice11?? 0.001;
        USD12 = userPrice12?? 0.001;
        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
        U1 = USD1.toStringAsFixed(2);
        USD1 = double.tryParse(U1);
        U2 = USD2.toStringAsFixed(2);
        USD2 = double.tryParse(U2);
        U3 = USD3.toStringAsFixed(2);
        USD3 = double.tryParse(U3);
        U4 = USD4.toStringAsFixed(2);
        USD4 = double.tryParse(U4);
        U5 = USD5.toStringAsFixed(2);
        USD5 = double.tryParse(U5);
        U6 = USD6.toStringAsFixed(2);
        USD6 = double.tryParse(U6);
        U7 = USD7.toStringAsFixed(2);
        USD7 = double.tryParse(U7);
        U8 = USD8.toStringAsFixed(2);
        USD8 = double.tryParse(U8);
        U9 = USD9.toStringAsFixed(2);
        USD9 = double.tryParse(U9);
        U10 = USD10.toStringAsFixed(2);
        USD10 = double.tryParse(U10);
        U11 = USD11.toStringAsFixed(2);
        USD11 = double.tryParse(U11);
        U12 = USD12.toStringAsFixed(2);
        USD12 = double.tryParse(U12);

        INR = resultINR.rate?? 0.001;
        INR1 = resultINR1.rate?? 0.001;
        INR2 = resultINR2.rate?? 0.001;
        INR3 = resultINR3.rate?? 0.001;
        INR4 = resultINR4.rate?? 0.001;
        INR5 = resultINR5.rate?? 0.001;
        INR6 = resultINR6.rate?? 0.001;
        INR7 = resultINR7.rate?? 0.001;
        INR8 = resultINR8.rate?? 0.001;
        INR9 = resultINR9.rate?? 0.001;
        INR10 = resultINR10.rate?? 0.001;
        INR11 = resultINR11.rate?? 0.01;
      INR12 = resultINR12.rate?? 0.01;
        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
        INR1 = double.tryParse(I1);
        I2 = INR2.toStringAsFixed(2);
        INR2 = double.tryParse(I2);
        I3 = INR3.toStringAsFixed(2);
        INR3 = double.tryParse(I3);
        I4 = INR4.toStringAsFixed(2);
        INR4 = double.tryParse(I4);
        I5 = INR5.toStringAsFixed(2);
        INR5 = double.tryParse(I5);
        I6 = INR6.toStringAsFixed(2);
        INR6 = double.tryParse(I6);
        I7 = INR7.toStringAsFixed(2);
        INR7 = double.tryParse(I7);
        I8 = INR8.toStringAsFixed(2);
        INR8 = double.tryParse(I8);
        I9 = INR9.toStringAsFixed(2);
        INR9 = double.tryParse(I9);
        I10 = INR10.toStringAsFixed(2);
        INR10 = double.tryParse(I10);
        I11 = INR11.toStringAsFixed(2);
        INR11 = double.tryParse(I11);
        I12 = INR12.toStringAsFixed(2);
        INR12 = double.tryParse(I12);

        EUR = resultEUR.rate?? 0.001;
        EUR1 = resultEUR1.rate?? 0.001;
        EUR2 = resultEUR2.rate?? 0.001;
        EUR3 = resultEUR3.rate?? 0.001;
        EUR4 = resultEUR4.rate?? 0.001;
        EUR5 = resultEUR5.rate?? 0.001;
        EUR6 = resultEUR6.rate?? 0.001;
        EUR7 = resultEUR7.rate?? 0.001;
        EUR8 = resultEUR8.rate?? 0.001;
        EUR9 = resultEUR9.rate?? 0.001;
        EUR10 = resultEUR10.rate?? 0.001;
        EUR11 = resultEUR11.rate?? 0.01;
      EUR12 = resultEUR12.rate?? 0.01;
        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        E1 = EUR1.toStringAsFixed(2);
        EUR1 = double.tryParse(E1);
        E2 = EUR2.toStringAsFixed(2);
        EUR2 = double.tryParse(E2);
        E3 = EUR3.toStringAsFixed(2);
        EUR3 = double.tryParse(E3);
        E4 = EUR4.toStringAsFixed(2);
        EUR4 = double.tryParse(E4);
        E5 = EUR5.toStringAsFixed(2);
        EUR5 = double.tryParse(E5);
        E6 = EUR6.toStringAsFixed(2);
        EUR6 = double.tryParse(E6);
        E7 = EUR7.toStringAsFixed(2);
        EUR7 = double.tryParse(E7);
        E8 = EUR8.toStringAsFixed(2);
        EUR8 = double.tryParse(E8);
        E9 = EUR9.toStringAsFixed(2);
        EUR9 = double.tryParse(E9);
        E10 = EUR10.toStringAsFixed(2);
        EUR10 = double.tryParse(E10);
        E11 = EUR11.toStringAsFixed(2);
        EUR11 = double.tryParse(E11);
        E12 = EUR12.toStringAsFixed(2);
        EUR12 = double.tryParse(E12);

        GBP = resultGBP.rate?? 0.001;
        GBP1 = resultGBP1.rate?? 0.001;
        GBP2 = resultGBP2.rate?? 0.001;
        GBP3 = resultGBP3.rate?? 0.001;
        GBP4 = resultGBP4.rate?? 0.001;
        GBP5 = resultGBP5.rate?? 0.001;
        GBP6 = resultGBP6.rate?? 0.001;
        GBP7 = resultGBP7.rate?? 0.001;
        GBP8 = resultGBP8.rate?? 0.001;
        GBP9 = resultGBP9.rate?? 0.001;
        GBP10 = resultGBP10.rate?? 0.001;
        GBP11 = resultGBP11.rate?? 0.01;
      GBP12 = resultGBP12.rate?? 0.01;
        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        G1 = GBP1.toStringAsFixed(2);
        GBP1 = double.tryParse(G1);
        G2 = GBP2.toStringAsFixed(2);
        GBP2 = double.tryParse(G2);
        G3 = GBP3.toStringAsFixed(2);
        GBP3 = double.tryParse(G3);
        G4 = GBP4.toStringAsFixed(2);
        GBP4 = double.tryParse(G4);
        G5 = GBP5.toStringAsFixed(2);
        GBP5 = double.tryParse(G5);
        G6 = GBP6.toStringAsFixed(2);
        GBP6 = double.tryParse(G6);
        G7 = GBP7.toStringAsFixed(2);
        GBP7 = double.tryParse(G7);
        G8 = GBP8.toStringAsFixed(2);
        GBP8 = double.tryParse(G8);
        G9 = GBP9.toStringAsFixed(2);
        GBP9 = double.tryParse(G9);
        G10 = GBP10.toStringAsFixed(2);
        GBP10 = double.tryParse(G10);
        G11 = GBP11.toStringAsFixed(2);
        GBP11 = double.tryParse(G11);
        G12 = GBP12.toStringAsFixed(2);
        GBP12 = double.tryParse(G12);


      });
    }


  }

  Future<void> handleSubmit() async {

    setState((){loading = "Uploading to database!";});
   file!=null? await compressImage():null;
    String mediaUrl =  file!=null?await uploadImage(file):"";
  file1!=null? await compressImage1():null;
    String mediaUrl1 =  file1!=null?await uploadImage1(file1):"";
  file2!=null? await compressImage2():null;
    String mediaUrl2 =  file2!=null?await uploadImage2(file2):"";
  file3!=null? await compressImage3():null;
    String mediaUrl3 =  file3!=null?await uploadImage3(file3):"";
  file4!=null? await compressImage4():null;
    String mediaUrl4 =  file4!=null?await uploadImage4(file4):"";
  file5!=null? await compressImage5():null;
    String mediaUrl5 =  file5!=null?await uploadImage5(file5):"";
  file6!=null? await compressImage6():null;
    String mediaUrl6 =  file6!=null?await uploadImage6(file6):"";
  file7!=null? await compressImage7():null;
    String mediaUrl7 =  file7!=null?await uploadImage7(file7):"";
  file8!=null? await compressImage8():null;
    String mediaUrl8 =  file8!=null?await uploadImage8(file8):"";
 file9!=null? await compressImage9():null;
    String mediaUrl9 =  file9!=null?await uploadImage9(file9):"";

    customImg1!=null? await compressImage01():null;
    String mediaUrl01 =  customImg1!=null?await uploadImage01(customImg1):"";
    // customImg2!=null? await compressImage02():null;
    // String mediaUrl02 =  customImg2!=null?await uploadImage02(customImg2):"";
    // customImg3!=null? await compressImage03():null;
    // String mediaUrl03 =  customImg3!=null?await uploadImage03(customImg3):"";
    // customImg4!=null? await compressImage04():null;
    // String mediaUrl04 =  customImg4!=null?await uploadImage04(customImg4):"";
    // customImg5!=null? await compressImage05():null;
    // String mediaUrl05 =  customImg5!=null?await uploadImage05(customImg5):"";
    // customImg6!=null? await compressImage06():null;
    // String mediaUrl06 =  customImg6!=null?await uploadImage06(customImg6):"";
    // customImg7!=null? await compressImage07():null;
    // String mediaUrl07 =  customImg7!=null?await uploadImage07(customImg7):"";
    // customImg8!=null? await compressImage08():null;
    // String mediaUrl08 =  customImg8!=null?await uploadImage08(customImg8):"";
    // customImg9!=null? await compressImage09():null;
    // String mediaUrl09 =  customImg9!=null?await uploadImage09(customImg9):"";
    // customImg10!=null? await compressImage010():null;
    // String mediaUrl010 =  customImg10!=null?await uploadImage010(customImg10):"";
    // customImg11!=null? await compressImage011():null;
    // String mediaUrl011 =  customImg11!=null?await uploadImage011(customImg11):"";
    // customImg12!=null? await compressImage012():null;
    // String mediaUrl012 =  customImg12!=null?await uploadImage012(customImg12):"";
    // customImg13!=null? await compressImage013():null;
    // String mediaUrl013 =  customImg13!=null?await uploadImage013(customImg13):"";
    // customImg14!=null? await compressImage014():null;
    // String mediaUrl014 =  customImg14!=null?await uploadImage014(customImg14):"";
    // customImg15!=null? await compressImage015():null;
    // String mediaUrl015 =  customImg15!=null?await uploadImage015(customImg15):"";
    // customImg16!=null? await compressImage016():null;
    // String mediaUrl016 =  customImg16!=null?await uploadImage016(customImg16):"";
    // customImg17!=null? await compressImage017():null;
    // String mediaUrl017 =  customImg17!=null?await uploadImage017(customImg17):"";
    // customImg18!=null? await compressImage018():null;
    // String mediaUrl018 =  customImg18!=null?await uploadImage018(customImg18):"";
    // customImg19!=null? await compressImage019():null;
    // String mediaUrl019 =  customImg19!=null?await uploadImage019(customImg19):"";
    // customImg20!=null? await compressImage020():null;
    // String mediaUrl020 =  customImg20!=null?await uploadImage020(customImg20):"";
    // customImg21!=null? await compressImage021():null;
    // String mediaUrl021 =  customImg21!=null?await uploadImage021(customImg21):"";
    // customImg22!=null? await compressImage022():null;
    // String mediaUrl022 =  customImg22!=null?await uploadImage022(customImg22):"";
    // customImg23!=null? await compressImage023():null;
    // String mediaUrl023 =  customImg23!=null?await uploadImage023(customImg23):"";
    // customImg24!=null? await compressImage024():null;
    // String mediaUrl024 =  customImg24!=null?await uploadImage024(customImg24):"";
    // customImg25!=null? await compressImage025():null;
    // String mediaUrl025 =  customImg25!=null?await uploadImage025(customImg25):"";
    // customImg26!=null? await compressImage026():null;
    // String mediaUrl026 =  customImg26!=null?await uploadImage026(customImg26):"";
    // customImg27!=null? await compressImage027():null;
    // String mediaUrl027 =  customImg27!=null?await uploadImage027(customImg27):"";
    // customImg28!=null? await compressImage028():null;
    // String mediaUrl028 =  customImg28!=null?await uploadImage028(customImg28):"";
    // customImg29!=null? await compressImage029():null;
    // String mediaUrl029 =  customImg29!=null?await uploadImage029(customImg29):"";
    // customImg30!=null? await compressImage030():null;
    // String mediaUrl030 =  customImg30!=null?await uploadImage030(customImg30):"";
    // customImg31!=null? await compressImage031():null;
    // String mediaUrl031 =  customImg31!=null?await uploadImage031(customImg31):"";
    // customImg32!=null? await compressImage032():null;
    // String mediaUrl032 =  customImg32!=null?await uploadImage032(customImg32):"";
    // customImg33!=null? await compressImage033():null;
    // String mediaUrl033 =  customImg33!=null?await uploadImage033(customImg33):"";
    // customImg34!=null? await compressImage034():null;
    // String mediaUrl034 =  customImg34!=null?await uploadImage034(customImg34):"";
    // customImg35!=null? await compressImage035():null;
    // String mediaUrl035 =  customImg35!=null?await uploadImage035(customImg35):"";
    // customImg36!=null? await compressImage036():null;
    // String mediaUrl036 =  customImg36!=null?await uploadImage036(customImg36):"";
    // customImg37!=null? await compressImage037():null;
    // String mediaUrl037 =  customImg37!=null?await uploadImage037(customImg37):"";
    // customImg38!=null? await compressImage038():null;
    // String mediaUrl038 =  customImg38!=null?await uploadImage038(customImg38):"";
    // customImg39!=null? await compressImage039():null;
    // String mediaUrl039 =  customImg39!=null?await uploadImage039(customImg39):"";
    // customImg40!=null? await compressImage040():null;
    // String mediaUrl040 =  customImg40!=null?await uploadImage040(customImg40):"";
    // customImg41!=null? await compressImage041():null;
    // String mediaUrl041 =  customImg41!=null?await uploadImage041(customImg41):"";
    // customImg42!=null? await compressImage042():null;
    // String mediaUrl042 =  customImg42!=null?await uploadImage042(customImg42):"";
    // customImg43!=null? await compressImage043():null;
    // String mediaUrl043 =  customImg43!=null?await uploadImage043(customImg43):"";
    // customImg44!=null? await compressImage044():null;
    // String mediaUrl044 =  customImg44!=null?await uploadImage044(customImg44):"";
    // customImg45!=null? await compressImage045():null;
    // String mediaUrl045 =  customImg45!=null?await uploadImage045(customImg45):"";
    // customImg46!=null? await compressImage046():null;
    // String mediaUrl046 =  customImg46!=null?await uploadImage046(customImg46):"";
    // customImg47!=null? await compressImage047():null;
    // String mediaUrl047 =  customImg47!=null?await uploadImage047(customImg47):"";
    // customImg48!=null? await compressImage048():null;
    // String mediaUrl048 =  customImg48!=null?await uploadImage048(customImg48):"";
    //  customImg49!=null? await compressImage049():null;
    // String mediaUrl049 =  customImg49!=null?await uploadImage049(customImg49):"";
    //  customImg50!=null? await compressImage050():null;
    // String mediaUrl050 =  customImg50!=null?await uploadImage050(customImg50):"";
    for ( var imageFile in images) {
      postImage(imageFile).then((downloadUrl)  {
        imageUrls.add(downloadUrl.toString());
        if(imageUrls.length==images.length){
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

          productsRef
              .doc(widget.currentUser.id)
              .collection("userProducts")
              .doc(prodId)
              .set({
            "sizechartBool":mediaUrl01,
            "sizeChart":sizeChart,
            "colorText1":colorController1.text ?? "",
            "colorText2":colorController2.text ?? "",
            "colorText3":colorController3.text ?? "",
            "colorText4":colorController4.text ?? "",
            "colorText5":colorController5.text ?? "",
            "colorText6":colorController6.text ?? "",
            "colorText7":colorController7.text ?? "",
            "colorText8":colorController8.text ?? "",
            "colorText9":colorController9.text ?? "",
            "colorText10":colorController10.text ?? "",
            "color1":int.tryParse(colorController11.text) ?? 0,
            "color2":int.tryParse(colorController21.text) ?? 0,
            "color3":int.tryParse(colorController31.text) ?? 0,
            "color4":int.tryParse(colorController41.text) ?? 0,
            "color5":int.tryParse(colorController51.text) ?? 0,
            "color6":int.tryParse(colorController61.text) ?? 0,
            "color7":int.tryParse(colorController71.text) ?? 0,
            "color8":int.tryParse(colorController81.text) ?? 0,
            "color9":int.tryParse(colorController91.text) ?? 0,
            "color10":int.tryParse(colorController10.text) ?? 0,
            "country":  currentUser.country,
            "currency":  currentUser.currency,

            "worldship":worldship,
            "freeworldship":freeworldship,
            "freeship":freeship,
            "shipment": shipcontroller.text,
            "prodId": prodId,
            "ownerId": widget.currentUser.id,
            "photoUrl": widget.currentUser.photoUrl,
            "username": widget.currentUser.displayName,
            "shopmediaUrl": imageUrls,
            "Category": value,
            "Gender": dropdownValue,
            "details": detailsController.text,
            "productname": productnameController.text,
            "usd": USD ,
            "eur": EUR,
            "gbp": GBP,
            "inr": INR,

            "timestamp": timestamp,
            "composition": compositionController.text,
            "washandcare": washandcareController.text,
            "sizeandfit": sizeandfitController.text,
            "xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
            "xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
            "xsQuantity":  int.tryParse(xscontroller.text )?? 0,
            "sQuantity": int.tryParse(scontroller.text) ?? 0,

            "mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
            "freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


            "mQuantity":  int.tryParse(mcontroller.text) ?? 0,
            "lQuantity":  int.tryParse(lcontroller.text) ?? 0,
            "xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
            "xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
            "xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
            "fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
            "fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
            "sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
            "sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
            "eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
            "Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
            "Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
            "Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
            "Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
            "Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
            "Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
            "Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
            "Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
            "Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
            "Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
            "Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
            "Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
            "Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
            "Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
            "Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
            "Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
            "Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
            "Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
            "Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
            "Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
            "Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
            "Ring1":   int.tryParse(Ring1controller.text) ?? 0,
            "Ring2":   int.tryParse(Ring2controller.text) ?? 0,
            "Ring3":   int.tryParse(Ring3controller.text) ?? 0,
            "Ring4":   int.tryParse(Ring4controller.text) ?? 0,
            "Ring5":   int.tryParse(Ring5controller.text) ?? 0,
            "Ring6":   int.tryParse(Ring6controller.text) ?? 0,
            "Ring7":   int.tryParse(Ring7controller.text) ?? 0,
            "Ring8":   int.tryParse(Ring8controller.text) ?? 0,
            "Ring9":   int.tryParse(Ring9controller.text) ?? 0,
            "Ring10":   int.tryParse(Ring10controller.text) ?? 0,
            "Ring11":   int.tryParse(Ring11controller.text) ?? 0,
            "Ring12":   int.tryParse(Ring12controller.text) ?? 0,
            "Ring13":   int.tryParse(Ring13controller.text) ?? 0,
            "Ring14":   int.tryParse(Ring14controller.text) ?? 0,
            "Ring15":  int.tryParse(Ring15controller.text) ?? 0,
            "Ring16":  int.tryParse(Ring16controller.text) ?? 0,
            "Ring17":  int.tryParse(Ring17controller.text) ?? 0,
            "Ring18":  int.tryParse(Ring18controller.text) ?? 0,
            "Ring19":  int.tryParse(Ring19controller.text) ?? 0,
            "Ring20":  int.tryParse(Ring20controller.text) ?? 0,
            "Ring21":  int.tryParse(Ring21controller.text) ?? 0,
            "Ring22":  int.tryParse(Ring22controller.text) ?? 0,
            "Ring23":  int.tryParse(Ring23controller.text) ?? 0,

//             "customTitle1":  title1Controller.text ?? "",
//  "customTitle2":  title2Controller.text ?? "",
//  "customTitle3":  title3Controller.text ?? "",
//  "customTitle4":  title4Controller.text ?? "",
//  "customTitle5":  title5Controller.text ?? "",
//
//  "customQuantity1":   int.tryParse(custom1.text ) ?? 0,
//  "customQuantity2":   int.tryParse(custom2.text ) ?? 0,
//  "customQuantity3":   int.tryParse(custom3.text ) ?? 0,
//  "customQuantity4":   int.tryParse(custom4.text ) ?? 0,
//  "customQuantity5":   int.tryParse(custom5.text ) ?? 0,
//  "customQuantity6":   int.tryParse(custom6.text ) ?? 0,
//  "customQuantity7":   int.tryParse(custom7.text ) ?? 0,
//  "customQuantity8":   int.tryParse(custom8.text ) ?? 0,
//  "customQuantity9":   int.tryParse(custom9.text ) ?? 0,
//  "customQuantity10":   int.tryParse(custom10.text ) ?? 0,
//  "customQuantity11":   int.tryParse(custom11.text ) ?? 0,
//  "customQuantity12":   int.tryParse(custom12.text ) ?? 0,
//  "customQuantity13":   int.tryParse(custom13.text ) ?? 0,
// "customQuantity14":   int.tryParse(custom14.text ) ?? 0,
// "customQuantity15":   int.tryParse(custom15.text ) ?? 0,
// "customQuantity16":   int.tryParse(custom16.text ) ?? 0,
// "customQuantity17":   int.tryParse(custom17.text ) ?? 0,
// "customQuantity18":   int.tryParse(custom18.text ) ?? 0,
// "customQuantity19":   int.tryParse(custom19.text ) ?? 0,
// "customQuantity20":   int.tryParse(custom20.text ) ?? 0,
// "customQuantity21":   int.tryParse(custom21.text ) ?? 0,
// "customQuantity22":   int.tryParse(custom22.text ) ?? 0,
// "customQuantity23":   int.tryParse(custom23.text ) ?? 0,
// "customQuantity24":   int.tryParse(custom24.text ) ?? 0,
// "customQuantity25":   int.tryParse(custom25.text ) ?? 0,
// "customQuantity26":   int.tryParse(custom26.text ) ?? 0,
// "customQuantity27":   int.tryParse(custom27.text ) ?? 0,
// "customQuantity28":   int.tryParse(custom28.text ) ?? 0,
// "customQuantity29":   int.tryParse(custom29.text ) ?? 0,
// "customQuantity30":   int.tryParse(custom30.text ) ?? 0,
// "customQuantity31":   int.tryParse(custom31.text ) ?? 0,
// "customQuantity32":   int.tryParse(custom32.text ) ?? 0,
// "customQuantity33":   int.tryParse(custom33.text ) ?? 0,
// "customQuantity34":   int.tryParse(custom34.text ) ?? 0,
// "customQuantity35":   int.tryParse(custom35.text ) ?? 0,
// "customQuantity36":   int.tryParse(custom36.text ) ?? 0,
// "customQuantity37":   int.tryParse(custom37.text ) ?? 0,
// "customQuantity38":   int.tryParse(custom38.text ) ?? 0,
// "customQuantity39":   int.tryParse(custom39.text ) ?? 0,
// "customQuantity40":   int.tryParse(custom40.text ) ?? 0,
// "customQuantity41":   int.tryParse(custom41.text ) ?? 0,
// "customQuantity42":   int.tryParse(custom42.text ) ?? 0,
// "customQuantity43":   int.tryParse(custom43.text ) ?? 0,
// "customQuantity44":   int.tryParse(custom44.text ) ?? 0,
// "customQuantity45":   int.tryParse(custom45.text ) ?? 0,
// "customQuantity46":   int.tryParse(custom46.text ) ?? 0,
// "customQuantity47":   int.tryParse(custom47.text ) ?? 0,
// "customQuantity48":   int.tryParse(custom48.text ) ?? 0,
// "customQuantity49":   int.tryParse(custom49.text ) ?? 0,
// "customQuantity50":   int.tryParse(custom50.text ) ?? 0,
//
//  "customName1":   customName1.text ?? "",
//  "customName2":   customName2.text ?? "",
//  "customName3":   customName3.text ?? "",
//  "customName4":   customName4.text ?? "",
//  "customName5":   customName5.text ?? "",
//  "customName6":   customName6.text ?? "",
//  "customName7":   customName7.text ?? "",
//  "customName8":   customName8.text ?? "",
//  "customName9":   customName9.text ?? "",
//  "customName10":  customName10.text ?? "",
//  "customName11":  customName11.text ?? "",
//  "customName12":  customName12.text ?? "",
//  "customName13":  customName13.text ?? "",
// "customName14":   customName14.text ?? "",
// "customName15":   customName15.text ?? "",
// "customName16":   customName16.text ?? "",
// "customName17":   customName17.text ?? "",
// "customName18":   customName18.text ?? "",
// "customName19":   customName19.text ?? "",
// "customName20":   customName20.text ?? "",
// "customName21":   customName21.text ?? "",
// "customName22":   customName22.text ?? "",
// "customName23":   customName23.text ?? "",
// "customName24":   customName24.text ?? "",
// "customName25":   customName25.text ?? "",
// "customName26":   customName26.text ?? "",
// "customName27":   customName27.text ?? "",
// "customName28":   customName28.text ?? "",
// "customName29":   customName29.text ?? "",
// "customName30":   customName30.text ?? "",
// "customName31":   customName31.text ?? "",
// "customName32":   customName32.text ?? "",
// "customName33":   customName33.text ?? "",
// "customName34":   customName34.text ?? "",
// "customName35":   customName35.text ?? "",
// "customName36":   customName36.text ?? "",
// "customName37":   customName37.text ?? "",
// "customName38":   customName38.text ?? "",
// "customName39":   customName39.text ?? "",
// "customName40":   customName40.text ?? "",
// "customName41":   customName41.text ?? "",
// "customName42":   customName42.text ?? "",
// "customName43":   customName43.text ?? "",
// "customName44":   customName44.text ?? "",
// "customName45":   customName45.text ?? "",
// "customName46":   customName46.text ?? "",
// "customName47":   customName47.text ?? "",
// "customName48":   customName48.text ?? "",
// "customName49":   customName49.text ?? "",
// "customName50":   customName50.text ?? "",
//
//             "custom1img":  mediaUrl01 ?? "",
// "custom2img":  mediaUrl02 ?? "",
// "custom3img":  mediaUrl03 ?? "",
// "custom4img":  mediaUrl04 ?? "",
// "custom5img":  mediaUrl05 ?? "",
// "custom6img":  mediaUrl06 ?? "",
// "custom7img":  mediaUrl07 ?? "",
// "custom8img":  mediaUrl08 ?? "",
// "custom9img":  mediaUrl09 ?? "",
// "custom10img":  mediaUrl010 ?? "",
// "custom11img":  mediaUrl011 ?? "",
// "custom12img":  mediaUrl012 ?? "",
// "custom13img":  mediaUrl013 ?? "",
// "custom14img":  mediaUrl014 ?? "",
// "custom15img":  mediaUrl015 ?? "",
// "custom16img":  mediaUrl016 ?? "",
// "custom17img":  mediaUrl017 ?? "",
// "custom18img":  mediaUrl018 ?? "",
// "custom19img":  mediaUrl019 ?? "",
// "custom20img":  mediaUrl020 ?? "",
// "custom21img":  mediaUrl021 ?? "",
// "custom22img":  mediaUrl022 ?? "",
// "custom23img":  mediaUrl023 ?? "",
// "custom24img":  mediaUrl024 ?? "",
// "custom25img":  mediaUrl025 ?? "",
// "custom26img":  mediaUrl026 ?? "",
// "custom27img":  mediaUrl027 ?? "",
// "custom28img":  mediaUrl028 ?? "",
// "custom29img":  mediaUrl029 ?? "",
// "custom30img":  mediaUrl030 ?? "",
// "custom31img":  mediaUrl031 ?? "",
// "custom32img":  mediaUrl032 ?? "",
// "custom33img":  mediaUrl033 ?? "",
// "custom34img":  mediaUrl034 ?? "",
// "custom35img":  mediaUrl035 ?? "",
// "custom36img":  mediaUrl036 ?? "",
// "custom37img":  mediaUrl037 ?? "",
// "custom38img":  mediaUrl038 ?? "",
// "custom39img":  mediaUrl039 ?? "",
// "custom40img":  mediaUrl040 ?? "",
// "custom41img":  mediaUrl041 ?? "",
// "custom42img":  mediaUrl042 ?? "",
// "custom43img":  mediaUrl043 ?? "",
// "custom44img":  mediaUrl044 ?? "",
// "custom45img":  mediaUrl045 ?? "",
// "custom46img":  mediaUrl046 ?? "",
// "custom47img":  mediaUrl047 ?? "",
// "custom48img":  mediaUrl048 ?? "",
// "custom49img":  mediaUrl049 ?? "",
// "custom50img":  mediaUrl050 ?? "",
//


            "variation1":  customController1.text ?? "",
            "variation2":  customController2.text ?? "",
            "variation3":  customController3.text ?? "",
            "variation4":  customController4.text ?? "",
            "variation5":  customController5.text ?? "",
            "variation6":  customController6.text ?? "",
            "variation7":  customController7.text ?? "",
            "variation8":  customController8.text ?? "",
            "variation9":  customController9.text ?? "",
            "variation10":  customController10.text ?? "",


            "variation1img":  mediaUrl ?? "",
            "variation2img":  mediaUrl1 ?? "",
            "variation3img":  mediaUrl2 ?? "",
            "variation4img":  mediaUrl3 ?? "",
            "variation5img":  mediaUrl4 ?? "",
            "variation6img":  mediaUrl5 ?? "",
            "variation7img":  mediaUrl6 ?? "",
            "variation8img":  mediaUrl7 ?? "",
            "variation9img":  mediaUrl8 ?? "",
            "variation10img":  mediaUrl9 ?? "",

            "variationQuantity1":  int.tryParse(customControllerQuantity1.text) ?? 0,
            "variationQuantity2":  int.tryParse(customControllerQuantity2.text) ?? 0,
            "variationQuantity3":  int.tryParse(customControllerQuantity3.text) ?? 0,
            "variationQuantity4":  int.tryParse(customControllerQuantity4.text) ?? 0,
            "variationQuantity5":  int.tryParse(customControllerQuantity5.text) ?? 0,
            "variationQuantity6":  int.tryParse(customControllerQuantity6.text) ?? 0,
            "variationQuantity7":  int.tryParse(customControllerQuantity7.text) ?? 0,
            "variationQuantity8":  int.tryParse(customControllerQuantity8.text) ?? 0,
            "variationQuantity9":  int.tryParse(customControllerQuantity9.text) ?? 0,
            "variationQuantity10":  int.tryParse(customControllerQuantity10.text) ??0,

            "custom11inr": INR1,
            "custom11usd": USD1,
            "custom11eur": EUR1,
            "custom11gbp": GBP1,

            "custom21inr": INR2,
            "custom21usd": USD2 ,
            "custom21gbp": GBP2,
            "custom21eur": EUR2,

            "custom31usd": USD3,
            "custom31inr": INR3,
            "custom31gbp": GBP3,
            "custom31eur": EUR3,

            "custom41usd": USD4,
            "custom41inr": INR4,
            "custom41gbp": GBP4,
            "custom41eur": EUR4,

            "custom51usd": USD5,
            "custom51inr": INR5,
            "custom51gbp": GBP5,
            "custom51eur": EUR5,

            "custom61usd": USD6,
            "custom61inr": INR6,
            "custom61eur": EUR6,
            "custom61gbp": GBP6,

            "custom71usd": USD7,
            "custom71inr": INR7,
            "custom71eur": EUR7,
            "custom71gbp": GBP7,

            "custom81usd": USD8,
            "custom81inr": INR8,
            "custom81eur": EUR8,
            "custom81gbp": GBP8,

            "custom91usd": USD9,
            "custom91inr": INR9,
            "custom91eur": EUR9,
            "custom91gbp": GBP9,

            "custom101usd": USD10,
            "custom101inr": INR10,
            "custom101eur": EUR10,
            "custom101gbp": GBP10,

            "shipcostusd": USD11,
            "shipcostinr": INR11,
            "shipcostgbp": GBP11,
            "shipcosteur": EUR11,

            "shipcostinternusd": USD12,
            "shipcostinterninr": INR12,
            "shipcostinterneur": EUR12,
            "shipcostinterngbp": GBP12,

            "round": USD ?? 0.0,

            "processfrom":  int.tryParse(durationfromp.text) ?? 0,
            "processto":  int.tryParse(durationto.text) ?? 0,
            "shipfrom":  int.tryParse(durationfrom.text) ?? 0,
            "shipto":  int.tryParse(durationto.text) ?? 0,
            "shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
            "shipinterto":  int.tryParse(durationtow.text) ?? 0,

            "likes": {},
          });



          setState(() {
            file = null;
            isUploading = false;
          });



        }
      }).catchError((err) {
        print(err);

      });
    }

    Get.back();


  }
  carousel(){

    return
      CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
          ),
          items: images.map((e) => Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: e,
                width: 500,
                height: 500,
              ),
            ),
          ), ).toList()

      );

  }
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return images.isEmpty ? buildSplashScreen() : builduploadForm();
  }

}

class SearchTag extends StatefulWidget {
  final String prodId;
  SearchTag({this.prodId});
  @override
  _SearchTagState createState() => _SearchTagState();
}

class _SearchTagState extends State<SearchTag> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = Users.fromDocument(tripSnapshot).displayName.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    var data = await FirebaseFirestore.instance
        .collection('users')

        .where("seller", isEqualTo: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear,
                color: Colors.white),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buCard(context, _resultsList[index]),
                )

            ),
          ],
        ),
      ),
    );
  }
  df({String ownerId,String prodId}){
    return
      showMaterialModalBottomSheet(
        expand:true,
        context: context,
        builder: (BuildContext context)
        {
          SizeConfig().init(context);

          return
            Builder(builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.75,

                    child: SearchTagProduct(ownerId:ownerId,prodId:prodId),

                  );
              }
              );
            }
            );
        },
      );

  }
  Widget buCard(BuildContext context, DocumentSnapshot document) {
    final user = Users.fromDocument(document);
    // final tripType = trip.types();

    return new Container(
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(  user.photoUrl,),
              ),
              title: Text(
                user.displayName,
                style:
                TextStyle(color:kText, fontWeight: FontWeight.bold),
              ),

            ),
          ),


          onTap: ()  {
            Get.back();
            df(ownerId: user.id,prodId: widget.prodId);},
        ),
      ),
    );
  }

}


class SearchTagProduct extends StatefulWidget {
  final String ownerId;
 final String prodId;
  SearchTagProduct({this.ownerId, this.prodId});
  @override
  _SearchTagProductState createState() => _SearchTagProductState();
}

class _SearchTagProductState extends State<SearchTagProduct> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = Prod.fromDocument(tripSnapshot).productname.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    var data = await FirebaseFirestore.instance
        .collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .orderBy('timestamp',descending: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a product...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,

          suffixIcon: IconButton(
            icon: Icon(Icons.clear,
                color: Colors.white),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: Container(
        color:Colors.grey.shade200,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buprod(context, _resultsList[index],widget.prodId),
                )

            ),
          ],
        ),
      ),
    );
  }
}

Widget buprod(BuildContext context, DocumentSnapshot document,prodId) {
  final prod = Prod.fromDocument(document);
  // final tripType = trip.types();

  return new Container(
    child: Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(child: Image.network(prod.shopmediaUrl.first),)),

            title: Text(
              prod.productname,
              style:
              TextStyle(color:kText, fontWeight: FontWeight.bold),
            ),

          ),
        ),


        onTap: ()
        {
          FirebaseFirestore.instance
              .collection('products')
              .doc(currentUser.id)
              .collection('userProducts')
              .doc(prodId)
              .collection('tags')
              .doc(prod.prodId)
              .set({
            "ownerId":prod.ownerId,
            "prodId":prod.prodId,
            "image":prod.shopmediaUrl.first,
            "name":prod.productname,
            "usd":prod.usd,
            "eur":prod.eur,
            "inr":prod.inr,
            "gbp":prod.gbp,
            "taggerId":currentUser.id,
            "taggerImg":currentUser.photoUrl,
            "taggerName":currentUser.username,
            "taggerCurrency":currentUser.currency,

            "timestamp":timestamp,

          });
          Get.back();},
      ),
    ),
  );
}
class TagItem extends StatelessWidget {
 final String ownerId ;
  final String prodId ;

 final String Id ;
 final String image ;
 final String name;
 final usd ;
 final inr ;
 final gbp ;
 final eur ;
 String taggerId;
 String  taggerImg;
 String taggerName;
 String taggerCurrency;

 TagItem({
 this.ownerId,
 this.taggerId,
 this.taggerImg,
 this.taggerName,
 this.taggerCurrency,
 this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

  delete(){
  var  docReference =  FirebaseFirestore.instance
        .collection('products')
        .doc(currentUser.id)
        .collection('userProducts')
        .doc(prodId)
        .collection('tags')
        .doc(Id);
    docReference.delete();

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(children:[
    ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: CachedImage(image)),
    Row(
    children: [
    Text(name,
    style: TextStyle(color: kText,
    fontSize: SizeConfig.safeBlockHorizontal * 4,
    fontWeight: FontWeight.bold))
    ],
    ),
      Row(
        children: [
          currentUser.currency == "INR"? Row(
            children: [
              Text("${cf.format(inr, CurrencyFormatter.inr)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ):
          currentUser.currency == "EUR"?Row(
            children: [
              Text("${cf.format(eur, CurrencyFormatter.eur)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ):
          currentUser.currency == "GBP"?Row(
            children: [
              Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ):Row(
            children: [
              Text("${cf.format(usd, CurrencyFormatter.usd)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),

        ],
      ),
    ]),
    ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: FloatingActionButton(
            mini: true,
            backgroundColor:kText.withOpacity(0.5),
            onPressed: delete,
            child: Icon(Icons.delete,color: Colors.red,),
          ),
        ),
    ]
    );
  }
}

