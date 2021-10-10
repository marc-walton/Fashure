import 'dart:io';
import 'dart:async';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  var inrtousd;
  var inrtousd1;
  var inrtousd2;
  var inrtousd3;
  var inrtousd4;
  var inrtousd5;
  var inrtousd6;
  var inrtousd7;
  var inrtousd8;
  var inrtousd9;
  var inrtousd10;
  var inrtousd11;
  var inrtousd12;
   var inrtoeur;
  var inrtoeur1;
  var inrtoeur2;
  var inrtoeur3;
  var inrtoeur4;
  var inrtoeur5;
  var inrtoeur6;
  var inrtoeur7;
  var inrtoeur8;
  var inrtoeur9;
  var inrtoeur10;
  var inrtoeur11;
  var inrtoeur12;
  var inrtogbp;
  var inrtogbp1;
  var inrtogbp2;
  var inrtogbp3;
  var inrtogbp4;
  var inrtogbp5;
  var inrtogbp6;
  var inrtogbp7;
  var inrtogbp8;
  var inrtogbp9;
  var inrtogbp10;
  var inrtogbp11;
  var inrtogbp12;

  var usdtoinr;
  var usdtoinr1;
  var usdtoinr2;
  var usdtoinr3;
  var usdtoinr4;
  var usdtoinr5;
  var usdtoinr6;
  var usdtoinr7;
  var usdtoinr8;
  var usdtoinr9;
  var usdtoinr10;
  var usdtoinr11;
  var usdtoinr12;
 var usdtoeur;
  var usdtoeur1;
  var usdtoeur2;
  var usdtoeur3;
  var usdtoeur4;
  var usdtoeur5;
  var usdtoeur6;
  var usdtoeur7;
  var usdtoeur8;
  var usdtoeur9;
  var usdtoeur10;
  var usdtoeur11;
  var usdtoeur12;
 var usdtogbp;
  var usdtogbp1;
  var usdtogbp2;
  var usdtogbp3;
  var usdtogbp4;
  var usdtogbp5;
  var usdtogbp6;
  var usdtogbp7;
  var usdtogbp8;
  var usdtogbp9;
  var usdtogbp10;
  var usdtogbp11;
  var usdtogbp12;

 var eurtoinr;
  var eurtoinr1;
  var eurtoinr2;
  var eurtoinr3;
  var eurtoinr4;
  var eurtoinr5;
  var eurtoinr6;
  var eurtoinr7;
  var eurtoinr8;
  var eurtoinr9;
  var eurtoinr10;
  var eurtoinr11;
  var eurtoinr12;
 var eurtousd;
  var eurtousd1;
  var eurtousd2;
  var eurtousd3;
  var eurtousd4;
  var eurtousd5;
  var eurtousd6;
  var eurtousd7;
  var eurtousd8;
  var eurtousd9;
  var eurtousd10;
  var eurtousd11;
  var eurtousd12;
 var eurtogbp;
  var eurtogbp1;
  var eurtogbp2;
  var eurtogbp3;
  var eurtogbp4;
  var eurtogbp5;
  var eurtogbp6;
  var eurtogbp7;
  var eurtogbp8;
  var eurtogbp9;
  var eurtogbp10;
  var eurtogbp11;
  var eurtogbp12;

 var gbptoinr;
  var gbptoinr1;
  var gbptoinr2;
  var gbptoinr3;
  var gbptoinr4;
  var gbptoinr5;
  var gbptoinr6;
  var gbptoinr7;
  var gbptoinr8;
  var gbptoinr9;
  var gbptoinr10;
  var gbptoinr11;
  var gbptoinr12;
 var gbptousd;
  var gbptousd1;
  var gbptousd2;
  var gbptousd3;
  var gbptousd4;
  var gbptousd5;
  var gbptousd6;
  var gbptousd7;
  var gbptousd8;
  var gbptousd9;
  var gbptousd10;
  var gbptousd11;
  var gbptousd12;
 var gbptoeur;
  var gbptoeur1;
  var gbptoeur2;
  var gbptoeur3;
  var gbptoeur4;
  var gbptoeur5;
  var gbptoeur6;
  var gbptoeur7;
  var gbptoeur8;
  var gbptoeur9;
  var gbptoeur10;
  var gbptoeur11;
  var gbptoeur12;
var INR;
var USD;
var EUR;
var GBP;

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
        child: Image.file(
          customImg1,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage01(),
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
  getImage01() async {
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
        customImg1 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
    Widget getImageWidget02() {
    if (customImg2 != null) {
      return InkWell(
        onTap:()=>getImage02(),
        child: Image.file(
          customImg2,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage02(),
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
  getImage02() async {
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
        customImg2 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
    Widget getImageWidget03() {
    if (customImg3 != null) {
      return InkWell(
        onTap:()=>getImage03(),
        child: Image.file(
          customImg3,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage03(),
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
  getImage03() async {
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
        customImg3 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
    Widget getImageWidget04() {
    if (customImg4 != null) {
      return InkWell(
        onTap:()=>getImage04(),
        child: Image.file(
          customImg4,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage04(),
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
  getImage04() async {
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
        customImg4 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
   Widget getImageWidget05() {
    if (customImg5 != null) {
      return InkWell(
        onTap:()=>getImage05(),
        child: Image.file(
          customImg5,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage05(),
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
  getImage05() async {
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
        customImg5 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
   Widget getImageWidget06() {
    if (customImg6 != null) {
      return InkWell(
        onTap:()=>getImage06(),
        child: Image.file(
          customImg6,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage06(),
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
  getImage06() async {
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
        customImg6 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
   Widget getImageWidget07() {
    if (customImg7 != null) {
      return InkWell(
        onTap:()=>getImage07(),
        child: Image.file(
          customImg7,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage07(),
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
  getImage07() async {
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
        customImg7 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
    Widget getImageWidget08() {
    if (customImg8 != null) {
      return InkWell(
        onTap:()=>getImage08(),
        child: Image.file(
          customImg8,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage08(),
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
  getImage08() async {
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
        customImg8 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
   Widget getImageWidget09() {
    if (customImg9 != null) {
      return InkWell(
        onTap:()=>getImage09(),
        child: Image.file(
          customImg9,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage09(),
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
  getImage09() async {
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
        customImg9 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
   Widget getImageWidget010() {
    if (customImg10 != null) {
      return InkWell(
        onTap:()=>getImage010(),
        child: Image.file(
          customImg10,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage010(),
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
  getImage010() async {
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
        customImg10 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
    Widget getImageWidget011() {
    if (customImg11 != null) {
      return InkWell(
        onTap:()=>getImage011(),
        child: Image.file(
          customImg11,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage011(),
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
  getImage011() async {
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
        customImg11 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
   Widget getImageWidget012() {
    if (customImg12 != null) {
      return InkWell(
        onTap:()=>getImage012(),
        child: Image.file(
          customImg12,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage012(),
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
  getImage012() async {
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
        customImg12 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
  Widget getImageWidget013() {
    if (customImg13 != null) {
      return InkWell(
        onTap:()=>getImage013(),
        child: Image.file(
          customImg13,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage013(),
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
  getImage013() async {
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
        customImg13 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget014() {
    if (customImg14 != null) {
      return InkWell(
        onTap:()=>getImage014(),
        child: Image.file(
          customImg14,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage014(),
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
  getImage014() async {
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
        customImg14 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget015() {
    if (customImg15 != null) {
      return InkWell(
        onTap:()=>getImage015(),
        child: Image.file(
          customImg15,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage015(),
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
  getImage015() async {
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
        customImg15 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget016() {
    if (customImg16 != null) {
      return InkWell(
        onTap:()=>getImage016(),
        child: Image.file(
          customImg16,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage016(),
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
  getImage016() async {
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
        customImg16 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget017() {
    if (customImg17 != null) {
      return InkWell(
        onTap:()=>getImage017(),
        child: Image.file(
          customImg17,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage017(),
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
  getImage017() async {
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
        customImg17 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget018() {
    if (customImg18 != null) {
      return InkWell(
        onTap:()=>getImage018(),
        child: Image.file(
          customImg18,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage018(),
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
  getImage018() async {
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
        customImg18 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget019() {
    if (customImg19 != null) {
      return InkWell(
        onTap:()=>getImage019(),
        child: Image.file(
          customImg19,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage019(),
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
  getImage019() async {
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
        customImg19 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget020() {
    if (customImg20 != null) {
      return InkWell(
        onTap:()=>getImage020(),
        child: Image.file(
          customImg20,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage020(),
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
  getImage020() async {
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
        customImg20 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget021() {
    if (customImg21 != null) {
      return InkWell(
        onTap:()=>getImage021(),
        child: Image.file(
          customImg21,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage021(),
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
  getImage021() async {
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
        customImg21 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget022() {
    if (customImg22 != null) {
      return InkWell(
        onTap:()=>getImage022(),
        child: Image.file(
          customImg22,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage022(),
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
  getImage022() async {
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
        customImg22 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget023() {
    if (customImg23 != null) {
      return InkWell(
        onTap:()=>getImage023(),
        child: Image.file(
          customImg23,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage023(),
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
  getImage023() async {
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
        customImg23 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget024() {
    if (customImg24 != null) {
      return InkWell(
        onTap:()=>getImage024(),
        child: Image.file(
          customImg24,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage024(),
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
  getImage024() async {
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
        customImg24 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget025() {
    if (customImg25 != null) {
      return InkWell(
        onTap:()=>getImage025(),
        child: Image.file(
          customImg25,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage025(),
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
  getImage025() async {
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
        customImg25 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget026() {
    if (customImg26 != null) {
      return InkWell(
        onTap:()=>getImage026(),
        child: Image.file(
          customImg26,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage026(),
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
  getImage026() async {
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
        customImg26 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget027() {
    if (customImg27 != null) {
      return InkWell(
        onTap:()=>getImage027(),
        child: Image.file(
          customImg27,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage027(),
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
  getImage027() async {
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
        customImg27 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget028() {
    if (customImg28 != null) {
      return InkWell(
        onTap:()=>getImage028(),
        child: Image.file(
          customImg28,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage028(),
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
  getImage028() async {
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
        customImg28 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget029() {
    if (customImg29 != null) {
      return InkWell(
        onTap:()=>getImage029(),
        child: Image.file(
          customImg29,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage029(),
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
  getImage029() async {
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
        customImg29 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget030() {
    if (customImg30 != null) {
      return InkWell(
        onTap:()=>getImage030(),
        child: Image.file(
          customImg30,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage030(),
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
  getImage030() async {
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
        customImg30 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget031() {
    if (customImg31 != null) {
      return InkWell(
        onTap:()=>getImage031(),
        child: Image.file(
          customImg31,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage031(),
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
  getImage031() async {
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
        customImg31 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget032() {
    if (customImg32 != null) {
      return InkWell(
        onTap:()=>getImage032(),
        child: Image.file(
          customImg32,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage032(),
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
  getImage032() async {
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
        customImg32 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget033() {
    if (customImg33 != null) {
      return InkWell(
        onTap:()=>getImage033(),
        child: Image.file(
          customImg33,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage033(),
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
  getImage033() async {
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
        customImg33 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget034() {
    if (customImg34 != null) {
      return InkWell(
        onTap:()=>getImage034(),
        child: Image.file(
          customImg34,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage034(),
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
  getImage034() async {
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
        customImg34 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget035() {
    if (customImg35 != null) {
      return InkWell(
        onTap:()=>getImage035(),
        child: Image.file(
          customImg35,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage035(),
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
  getImage035() async {
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
        customImg35 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget036() {
    if (customImg36 != null) {
      return InkWell(
        onTap:()=>getImage036(),
        child: Image.file(
          customImg36,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage036(),
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
  getImage036() async {
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
        customImg36 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget037() {
    if (customImg37 != null) {
      return InkWell(
        onTap:()=>getImage037(),
        child: Image.file(
          customImg37,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage037(),
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
  getImage037() async {
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
        customImg37 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget038() {
    if (customImg38 != null) {
      return InkWell(
        onTap:()=>getImage038(),
        child: Image.file(
          customImg38,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage038(),
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
  getImage038() async {
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
        customImg38 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget039() {
    if (customImg39 != null) {
      return InkWell(
        onTap:()=>getImage039(),
        child: Image.file(
          customImg39,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage039(),
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
  getImage039() async {
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
        customImg39 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget040() {
    if (customImg40 != null) {
      return InkWell(
        onTap:()=>getImage040(),
        child: Image.file(
          customImg40,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage040(),
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
  getImage040() async {
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
        customImg40 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget041() {
    if (customImg41 != null) {
      return InkWell(
        onTap:()=>getImage041(),
        child: Image.file(
          customImg41,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage041(),
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
  getImage041() async {
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
        customImg41 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget042() {
    if (customImg42 != null) {
      return InkWell(
        onTap:()=>getImage042(),
        child: Image.file(
          customImg42,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage042(),
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
  getImage042() async {
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
        customImg42 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget043() {
    if (customImg43 != null) {
      return InkWell(
        onTap:()=>getImage043(),
        child: Image.file(
          customImg43,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage043(),
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
  getImage043() async {
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
        customImg43 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget044() {
    if (customImg44 != null) {
      return InkWell(
        onTap:()=>getImage044(),
        child: Image.file(
          customImg44,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage044(),
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
  getImage044() async {
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
        customImg44 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget045() {
    if (customImg45 != null) {
      return InkWell(
        onTap:()=>getImage045(),
        child: Image.file(
          customImg45,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage045(),
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
  getImage045() async {
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
        customImg45 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget046() {
    if (customImg46 != null) {
      return InkWell(
        onTap:()=>getImage046(),
        child: Image.file(
          customImg46,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage046(),
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
  getImage046() async {
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
        customImg46 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget047() {
    if (customImg47 != null) {
      return InkWell(
        onTap:()=>getImage047(),
        child: Image.file(
          customImg47,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage047(),
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
  getImage047() async {
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
        customImg47 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget048() {
    if (customImg48 != null) {
      return InkWell(
        onTap:()=>getImage048(),
        child: Image.file(
          customImg48,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage048(),
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
  getImage048() async {
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
        customImg48 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget049() {
    if (customImg49 != null) {
      return InkWell(
        onTap:()=>getImage049(),
        child: Image.file(
          customImg49,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage049(),
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
  getImage049() async {
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
        customImg49 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
 Widget getImageWidget050() {
    if (customImg50 != null) {
      return InkWell(
        onTap:()=>getImage050(),
        child: Image.file(
          customImg50,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
        onTap:()=>getImage050(),
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
  getImage050() async {
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
        customImg50 = cropped;
        _inProcess = true;

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  
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
compressImage02() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg2.readAsBytesSync());
    final compressedImageFile = File('$path/img02_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg2 = compressedImageFile;
    });
  }
compressImage03() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg3.readAsBytesSync());
    final compressedImageFile = File('$path/img03_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg3 = compressedImageFile;
    });
  }
compressImage04() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg4.readAsBytesSync());
    final compressedImageFile = File('$path/img04_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg4 = compressedImageFile;
    });
  }
compressImage05() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg5.readAsBytesSync());
    final compressedImageFile = File('$path/img05_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg5 = compressedImageFile;
    });
  }
compressImage06() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg6.readAsBytesSync());
    final compressedImageFile = File('$path/img06_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg6 = compressedImageFile;
    });
  }
compressImage07() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg7.readAsBytesSync());
    final compressedImageFile = File('$path/img07_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg7 = compressedImageFile;
    });
  }
compressImage08() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg8.readAsBytesSync());
    final compressedImageFile = File('$path/img08_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg8 = compressedImageFile;
    });
  }
compressImage09() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg9.readAsBytesSync());
    final compressedImageFile = File('$path/img09_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg9 = compressedImageFile;
    });
  }
compressImage010() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg10.readAsBytesSync());
    final compressedImageFile = File('$path/img010_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg10 = compressedImageFile;
    });
  }
compressImage011() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg11.readAsBytesSync());
    final compressedImageFile = File('$path/img011_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg11 = compressedImageFile;
    });
  }
compressImage012() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg12.readAsBytesSync());
    final compressedImageFile = File('$path/img012_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg12 = compressedImageFile;
    });
  }
compressImage013() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg13.readAsBytesSync());
    final compressedImageFile = File('$path/img013_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg13 = compressedImageFile;
    });
  }
compressImage014() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg14.readAsBytesSync());
    final compressedImageFile = File('$path/img014_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg14 = compressedImageFile;
    });
  }
compressImage015() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg15.readAsBytesSync());
    final compressedImageFile = File('$path/img015_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg15 = compressedImageFile;
    });
  }
compressImage016() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg16.readAsBytesSync());
    final compressedImageFile = File('$path/img016_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg16 = compressedImageFile;
    });
  }
compressImage017() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg17.readAsBytesSync());
    final compressedImageFile = File('$path/img017_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg17 = compressedImageFile;
    });
  }
compressImage018() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg18.readAsBytesSync());
    final compressedImageFile = File('$path/img018_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg18 = compressedImageFile;
    });
  }
compressImage019() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg19.readAsBytesSync());
    final compressedImageFile = File('$path/img019_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg19 = compressedImageFile;
    });
  }
compressImage020() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg20.readAsBytesSync());
    final compressedImageFile = File('$path/img020_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg20 = compressedImageFile;
    });
  }
compressImage021() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg21.readAsBytesSync());
    final compressedImageFile = File('$path/img021_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg21 = compressedImageFile;
    });
  }
compressImage022() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg22.readAsBytesSync());
    final compressedImageFile = File('$path/img022_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg22 = compressedImageFile;
    });
  }
compressImage023() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg23.readAsBytesSync());
    final compressedImageFile = File('$path/img023_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg23 = compressedImageFile;
    });
  }
compressImage024() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg24.readAsBytesSync());
    final compressedImageFile = File('$path/img024_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg24 = compressedImageFile;
    });
  }
compressImage025() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg25.readAsBytesSync());
    final compressedImageFile = File('$path/img025_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg25 = compressedImageFile;
    });
  }
compressImage026() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg26.readAsBytesSync());
    final compressedImageFile = File('$path/img026_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg26 = compressedImageFile;
    });
  }
compressImage027() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg27.readAsBytesSync());
    final compressedImageFile = File('$path/img027_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg27 = compressedImageFile;
    });
  }
compressImage028() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg28.readAsBytesSync());
    final compressedImageFile = File('$path/img028_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg28 = compressedImageFile;
    });
  }
compressImage029() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg29.readAsBytesSync());
    final compressedImageFile = File('$path/img029_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg29 = compressedImageFile;
    });
  }
compressImage030() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg30.readAsBytesSync());
    final compressedImageFile = File('$path/img030_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg30 = compressedImageFile;
    });
  }
compressImage031() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg31.readAsBytesSync());
    final compressedImageFile = File('$path/img031_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg31 = compressedImageFile;
    });
  }
compressImage032() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg32.readAsBytesSync());
    final compressedImageFile = File('$path/img032_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg32 = compressedImageFile;
    });
  }
compressImage033() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg33.readAsBytesSync());
    final compressedImageFile = File('$path/img033_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg33 = compressedImageFile;
    });
  }
compressImage034() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg34.readAsBytesSync());
    final compressedImageFile = File('$path/img034_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg34 = compressedImageFile;
    });
  }
compressImage035() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg35.readAsBytesSync());
    final compressedImageFile = File('$path/img035_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg35 = compressedImageFile;
    });
  }
compressImage036() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg36.readAsBytesSync());
    final compressedImageFile = File('$path/img036_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg36 = compressedImageFile;
    });
  }
compressImage037() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg37.readAsBytesSync());
    final compressedImageFile = File('$path/img037_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg37 = compressedImageFile;
    });
  }
compressImage038() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg38.readAsBytesSync());
    final compressedImageFile = File('$path/img038_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg38 = compressedImageFile;
    });
  }
compressImage039() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg39.readAsBytesSync());
    final compressedImageFile = File('$path/img039_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg39 = compressedImageFile;
    });
  }
compressImage040() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg40.readAsBytesSync());
    final compressedImageFile = File('$path/img040_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg40 = compressedImageFile;
    });
  }
compressImage041() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg41.readAsBytesSync());
    final compressedImageFile = File('$path/img041_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg41 = compressedImageFile;
    });
  }
compressImage042() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg42.readAsBytesSync());
    final compressedImageFile = File('$path/img042_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg42 = compressedImageFile;
    });
  }
compressImage043() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg43.readAsBytesSync());
    final compressedImageFile = File('$path/img043_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg43 = compressedImageFile;
    });
  }
compressImage044() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg44.readAsBytesSync());
    final compressedImageFile = File('$path/img044_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg44 = compressedImageFile;
    });
  }
compressImage045() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg45.readAsBytesSync());
    final compressedImageFile = File('$path/img045_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg45 = compressedImageFile;
    });
  }
compressImage046() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg46.readAsBytesSync());
    final compressedImageFile = File('$path/img046_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg46 = compressedImageFile;
    });
  }
compressImage047() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg47.readAsBytesSync());
    final compressedImageFile = File('$path/img047_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg47 = compressedImageFile;
    });
  }
compressImage048() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg48.readAsBytesSync());
    final compressedImageFile = File('$path/img048_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg48 = compressedImageFile;
    });
  }
compressImage049() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg49.readAsBytesSync());
    final compressedImageFile = File('$path/img049_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg49 = compressedImageFile;
    });
  }
compressImage050() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(customImg50.readAsBytesSync());
    final compressedImageFile = File('$path/img050_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      customImg50 = compressedImageFile;
    });
  }

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
    return downloadUrl;
  }
  Future<String> uploadImage02(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage03(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage04(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage05(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage06(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage07(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage08(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage09(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage010(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage011(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage012(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage013(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage014(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage015(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage016(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage017(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage018(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage019(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage020(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage021(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage022(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage023(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage024(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage025(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage026(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage027(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage028(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage029(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage030(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage031(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage032(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage033(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage034(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage035(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage036(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage037(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage038(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage039(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage040(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage041(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage042(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage043(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage044(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage045(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage046(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage047(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage048(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage049(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> uploadImage050(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

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
            delete();
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
delete()async{     productsRef
    .doc(currentUser.id)
    .collection('userProducts')
    .doc(prodId)
    .get()
    .then((doc) {
  if (doc.exists) {
    doc.reference.delete();
  }
});

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
  AddCustomSize(parentContext){
    return
      showDialog(
          context: parentContext,
          builder: (context) {
            return SimpleDialog(
              title: Text("Add Size Chart"),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          maxLines: null,
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Catgeory(Women\'s Clothing)',
                          ),
                          textAlign: TextAlign.start,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Name is empty';
                            }
                            return null;
                          },
                        ),
                      ),


                    ],
                  ),
                )
              ],
            );
          });

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

                  delete();
                  },
                  child: Text("YES"),
                  ),
                  ],
                  ),
                  );
                }),
            title: Text(
              "Product Details",
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
            ), Container(
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
// sdf(){              Container(
//   child: Stack(
//     children:[
//       Form(
//         key: _formKey,
//         child:
//         Column(
//           children: <Widget>[
//             isUploading ? linearProgress() : Text(""),
//
//             carousel(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//
//                     SizedBox(height: 8.0,),
//                     Text('Select Gender',style:TextStyle(color: kText,fontSize:20.0) ,),
//                     SizedBox(height: 8.0,),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: DropdownButton<String>(
//                         value: dropdownValue,
//                         icon: Icon(Icons.keyboard_arrow_down_sharp),
//                         iconSize: 24,
//                         elevation: 16,
//                         style: TextStyle(color: kText,fontSize:20.0),
//
//                         onChanged: (String newValue) {
//                           setState(() {
//                             dropdownValue = newValue;
//                           });
//                         },
//                         items: <String>['Women', 'Men', 'Baby-Boys', 'Baby-Girls', 'Kids-Boys', 'Kids-Girls', 'Teen-Boys', 'Teen-Girls']
//                             .map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
//                       child: RaisedButton(
//                         color:kblue,
//                         child: Text('$value',style:TextStyle(color: Colors.white) ,),
//                         onPressed: (){
//                           showModalBottomSheet(context: context, builder:(BuildContext context){
//
//
//                             if(dropdownValue=='Women')
//                             {
//                               return
//                                 WomenCategory();
//                             }
//                             else if(dropdownValue=='Men')
//                             {
//                               return
//                                 MenCategory();
//                             }
//                             else if(dropdownValue=='Baby-Boys')
//                             {
//                               return
//                                 BabyBCategory();
//                             }
//                             else if(dropdownValue== 'Baby-Girls'){
//                               return
//                                 BabyGCategory();
//                             }
//                             else if(dropdownValue=='Kids-Boys'){
//                               return
//                                 KidBCategory();
//                             }
//                             else if(dropdownValue=='Kids-Girls'){
//                               return
//                                 KidGCategory();
//                             }
//                             else if(dropdownValue== 'Teen-Boys'){
//                               return
//                                 TeenBCategory();
//                             }
//                             else if(dropdownValue=='Teen-Girls'){
//                               return
//                                 TeenGCategory();
//                             }
//                             else{
//                               return
//                                 Text('text');
//                             }
//                           },
//                           );
//                         }
//                         ,
//                       ),
//                     ),
//
//
//
//                     SizedBox(height: 8.0,),
//                     Container(
//                       // alignment:Alignment.centerLeft,
//                       child:   FloatingActionButton.extended(
//                         backgroundColor: kblue,
//                         onPressed: ()=>custom(),
//
//                         label:   Text("Customization/variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
//                       ),
//                     ),
//
//                     SizedBox(height: 8.0,),          Container(
//                       // alignment:Alignment.centerLeft,
//                       child:   FloatingActionButton.extended(
//                         backgroundColor: kblue,
//                         onPressed: ()=>tag(),
//
//                         label:   Text("Tag other products",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
//                       ),
//                     ),
//
//                     SizedBox(height: 8.0,),
//
//                     Row(
//                       mainAxisAlignment:MainAxisAlignment.center,
//                       children:[
//                         Container(
//                           // alignment:Alignment.centerLeft,
//                           child:   FloatingActionButton.extended(
//                             backgroundColor: kblue,
//                             onPressed: ()=>AddSize(),
//
//                             label: Text('Specify Quantity',style:TextStyle(color:  Colors.white) ,),
//                           ),
//                         ),
//
//
//
//                         SizedBox(width: 8.0,),Container(
//                           // alignment:Alignment.centerRight,
//                           child:   FloatingActionButton.extended(
//                             backgroundColor: kblue,
//                             onPressed: ()=>sizeGuide(),
//                             label: Text('Size Guide',style:TextStyle(color:  Colors.white) ,),
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//                     SizedBox(height: 8.0,),
//
//                     Text("Processing time",  style:TextStyle(color: kText,fontSize:20.0)),
//                     SizedBox(height: 8.0,),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               style:TextStyle(color: kText),
//                               keyboardType: TextInputType.number,
//
//                               controller: durationfromp,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                                 labelText: 'Business days',labelStyle: TextStyle(color: kText),
//                               ),
//                               textAlign: TextAlign.center,
//                               validator: (text) {
//                                 if ( text.isEmpty) {
//                                   return 'Processing time is empty';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                         Text("-",  style:TextStyle(color: kText)),
//
//                         Expanded(
//
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               style:TextStyle(color: kText),
//                               keyboardType: TextInputType.number,
//
//                               controller: durationtop,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                               ),
//                               textAlign: TextAlign.center,
//                               validator: (text) {
//                                 if ( text.isEmpty) {
//                                   return 'Processing time is empty';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                     SizedBox(height: 8.0,),
//
//                     ListTile(
//                       leading: Icon(
//                         Icons.local_shipping,
//                         color: Colors.orange,
//                         size: 35.0,
//                       ),
//                       title:Text("Shipping duration to ${currentUser.country}",  style:TextStyle(color: kText)),
//
//                     ),
//                     SizedBox(height: 8.0,),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               style:TextStyle(color: kText),
//                               keyboardType: TextInputType.number,
//
//                               controller: durationfrom,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                                 // labelText: 'Between',labelStyle: TextStyle(color: kText),
//                               ),
//                               textAlign: TextAlign.center,
//                               validator: (text) {
//                                 if ( text.isEmpty) {
//                                   return 'Shipping duration is empty';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                         Text("-",  style:TextStyle(color: kText)),
//
//                         Expanded(
//
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               style:TextStyle(color: kText),
//                               keyboardType: TextInputType.number,
//
//                               controller: durationto,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                               ),
//                               textAlign: TextAlign.center,
//                               validator: (text) {
//                                 if ( text.isEmpty) {
//                                   return 'Shipping duration is empty';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                     SizedBox( height: 8.0,),
//                     Text('Free shipping',style:TextStyle(color: kText)) ,
//                     SizedBox( height: 8.0,),
//
//                     Row(
//                       mainAxisAlignment:MainAxisAlignment.center,
//                       children: [
//                         Text('No'),
//                         SizedBox( width: 8.0,),
//
//                         Switch(
//                           value: freeship,
//                           onChanged: (value){setState(() {
//                             freeship = value;
//                           });},
//                           activeColor: Colors.blue,
//                           activeTrackColor: kPrimaryColor,
//                         ),
//                         SizedBox( width: 8.0,),
//
//                         Text('Yes')
//                       ],
//                     ),
//
//                     SizedBox( height: 8.0,),
//
//                     !freeship?  Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         keyboardType: TextInputType.number,
//
//                         controller: shipcost,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//                           hintText:" ${currentUser.currencysym}",
//
//                           labelText: '${currentUser.currencysym}Shipping cost',labelStyle: TextStyle(color: kText),
//
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( freeship==false || text.isEmpty ) {
//                             return 'Shipping cost is empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ):Container(),
//
//                     SizedBox( height: 8.0,),
//                     Text('Worldwide shipping',style:TextStyle(color: kText)) ,
//                     SizedBox( height: 8.0,),
//                     Row(
//                       mainAxisAlignment:MainAxisAlignment.center,
//                       children: [
//                         Text('No'),
//                         SizedBox( width: 8.0,),
//
//                         Switch(
//                           value: worldship,
//                           onChanged: (value){setState(() {
//                             worldship = value;
//                           });},
//                           activeColor: Colors.blue,
//                           activeTrackColor:kPrimaryColor,
//                         ),
//                         SizedBox( width: 8.0,),
//
//                         Text('Yes')
//                       ],
//                     ),
//                     SizedBox(height: 8.0,),
//
//                     worldship ?     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: ListTile(
//                         leading: Icon(
//                           Icons.local_shipping,
//                           color: Colors.orange,
//                           size: 35.0,
//                         ),
//                         title:Text("Shipping duration to worldwide",  style:TextStyle(color: kText)),
//
//                       ),
//                     ):Container(),
//                     SizedBox(height: 8.0,),
//
//                     worldship ?   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//
//                             child: TextFormField(
//                               style:TextStyle(color: kText),
//                               keyboardType: TextInputType.number,
//
//                               controller: durationfromw,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
// // labelText: 'Between',labelStyle: TextStyle(color: kText),
//                               ),
//                               textAlign: TextAlign.center,
//                               validator: (text) {
//                                 if (worldship==true && text.isEmpty) {
//                                   return 'Shipping duration is empty';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                         Text("-",  style:TextStyle(color: kText)),
//
//                         Expanded(
//
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               style:TextStyle(color: kText),
//                               keyboardType: TextInputType.number,
//                               controller: durationtow,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                               ),
//                               textAlign: TextAlign.center,
//                               validator: (text) {
//                                 if (worldship==true && text.isEmpty) {
//                                   return 'Shipping duration is empty';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//
//                       ],
//                     ):Container(),
//                     SizedBox( height: 8.0,),
//                     Text('Free shipping',style:TextStyle(color: kText)) ,
//
//                     SizedBox( height: 8.0,),
//
//                     worldship ? Row(
//                       mainAxisAlignment:MainAxisAlignment.center,
//                       children: [
//                         Text('No'),
//                         SizedBox( width: 8.0,),
//
//                         Switch(
//                           value: freeworldship,
//                           onChanged: (value){setState(() {
//                             freeworldship = value;
//                           });},
//                           activeColor: Colors.blue,
//                           activeTrackColor:kPrimaryColor,
//                         ),
//                         SizedBox( width: 8.0,),
//
//                         Text('Yes')
//                       ],
//                     ):Container(),
//
//                     worldship && freeworldship == false ?   Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//                         keyboardType: TextInputType.number,
//
//                         controller: shipcostintern,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//                           hintText:" ${currentUser.currencysym}",
//
//                           labelText: 'Shipping cost',labelStyle: TextStyle(color: kText),
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( freeworldship==false && text.isEmpty ) {
//                             return 'Shipping cost is empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ):Container(),
//                     SizedBox(height: 8.0,),
//
//
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: ListTile(
//                         leading: Icon(
//                           EvilIcons.eye,
//                           color: Colors.orange,
//                           size: 35.0,
//                         ),
//                         title:  TextFormField(
//                           style:TextStyle(color: kText),
//                           controller: productnameController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Product Name',labelStyle: TextStyle(color: kText),
//                             hintText: 'Product Name',
//                           ),
//                           textAlign: TextAlign.center,
//                           validator: (text) {
//                             if ( text.isEmpty) {
//                               return 'Product Name is empty';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: ListTile(
//                         leading: Icon(
//                           EvilIcons.tag,
//                           color: Colors.orange,
//                           size: 35.0,
//                         ),
//                         title:TextFormField(
//                           style:TextStyle(color: kText),
//                           keyboardType:TextInputType.number,
//                           controller: priceController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                             labelText: 'Price',labelStyle: TextStyle(color: kText),
//                             hintText:" ${currentUser.currencysym}",
//                           ),
//                           textAlign: TextAlign.center,
//                           validator: (text) {
//                             if (text.isEmpty) {
//                               return 'Price is empty';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox( height: 8.0,),
//
//                     //Customised
//                     Container(
//                       // alignment:Alignment.centerLeft,
//                       child:   FloatingActionButton.extended(
//                         backgroundColor: kblue,
//                         onPressed: ()=>color(),
//                         label: Text('Add Colors',style:TextStyle(color:  Colors.white) ,),
//                       ),
//                     ),
//
//                     SizedBox( height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         controller: detailsController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Product description',labelStyle: TextStyle(color: kText),
//                           hintText: 'Product description',
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( text.isEmpty) {
//                             return 'Description is empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox( height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         controller: compositionController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Fabric description',labelStyle: TextStyle(color: kText),
//                           hintText: 'ex.Cotton: 100%' ,
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( text.isEmpty) {
//                             return 'Fabric description is empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox( height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         controller: washandcareController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Wash & Care',labelStyle: TextStyle(color: kText),
//                           hintText: 'Wash & Care instructions',
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( text.isEmpty) {
//                             return 'Wash & Care instructions is empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox( height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         controller: sizeandfitController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Size & Fit recommendations',labelStyle: TextStyle(color: kText),
//                           hintText: 'ex.Cut for slim fit,take your normal size',
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( text.isEmpty) {
//                             return ' Size & Fit recommendations is empty';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//
//                     SizedBox( height: 8.0,),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
//                       child: TextFormField(
//                         style:TextStyle(color: kText),
//
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         controller: shipcontroller,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
//                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
//
//                           labelText: 'Shipping & returns',labelStyle: TextStyle(color: kText),
//                           hintText: 'countries served & return policy',
//                         ),
//                         textAlign: TextAlign.center,
//                         validator: (text) {
//                           if ( text.isEmpty) {
//                             return 'Shipping & returns';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//
//
//
//                     SizedBox( height: 8.0,),
//
//
//                   ],
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//
//
//
//
//       ),
//
//       isUploading ? Center(child:  CircularProgressIndicator()) : Text(""),
//     ],
//   ),
// );
// }
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
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(

                          primary:kButton, // foreground
                        ),
                        child: Text('$value',style:TextStyle(color: kText) ,),
                        onPressed: (){
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

                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                        Container(
                          // alignment:Alignment.centerLeft,
                          child:   ElevatedButton(

                            style: ElevatedButton.styleFrom(

                              primary:kButton, // foreground
                            ),
                            onPressed: ()=>AddSize(),

                            child: Text('Specify Quantity',style:TextStyle(color: kText,fontSize:SizeConfig.safeBlockHorizontal *3.5) ,),
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal *3),Container(
                          // alignment:Alignment.centerRight,
                          child:  ElevatedButton(

                            style: ElevatedButton.styleFrom(

                              primary:kButton, // foreground
                            ),
                            onPressed: ()=>sizeGuide(),
                            child: Text('Size Guide',style:TextStyle(color:kText,fontSize:SizeConfig.safeBlockHorizontal *3.5) ,),
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Container(
                          // alignment:Alignment.centerLeft,
                          child:   ElevatedButton(

                            style: ElevatedButton.styleFrom(

                              primary:kButton, // foreground
                            ),
                            onPressed: ()=>custom(),

                            child:   Text("Customization/variations",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *4,color:kText),),
                          ),
                        ),
         Text("(optional)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *3.5,color:kText),),
                      ],
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical*0.5,),
                    //Customised
                    Container(
                      // alignment:Alignment.centerLeft,
                      child:   ElevatedButton(

                        style: ElevatedButton.styleFrom(

                          primary:kButton, // foreground
                        ),
                        onPressed: ()=>color(),

                        child: Text('Add Colors',style:TextStyle(color: kText,fontSize:SizeConfig.safeBlockHorizontal *3.5) ,),
                      ),
                    ),


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
                            hintText:" ${currentUser.currencysym}",

                            labelText: '${currentUser.currencysym}Shipping cost',labelStyle: TextStyle(color: kText),

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
                      Text('Free shipping',style:TextStyle(color: kText)) ,

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
                            hintText:" ${currentUser.currencysym}",

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
            Row(
              mainAxisAlignment:MainAxisAlignment.center,

              children: [
                ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    primary:kButton, // foreground
                  ),
                  onPressed: () {
                    tag();
                  },

                  child:   Text("Tag other products",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *3.5
                      ,color:kText),),
                ),
                Text("(optional)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *2.5
                    ,color:kText),),
              ],
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
page2(){
    return
  Form(
    key: _formKey2,
    child:
    SingleChildScrollView(
      child: Column(
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),

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
                  hintText:" ${currentUser.currencysym}",
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
    setState(() {
      isUploading = true;
      userPrice = double.tryParse(priceController.text ?? "0.1");
      userPrice1 = double.tryParse(customController11.text ?? "0.1");
      userPrice2 = double.tryParse(customController21.text ?? "0.1");
      userPrice3 = double.tryParse(customController31.text ?? "0.1");
      userPrice4 = double.tryParse(customController41.text ?? "0.1");
      userPrice5 = double.tryParse(customController51.text ?? "0.1");
      userPrice6 = double.tryParse(customController61.text ?? "0.1");
      userPrice7 = double.tryParse(customController71.text ?? "0.1");
      userPrice8 = double.tryParse(customController81.text ?? "0.1");
      userPrice9 = double.tryParse(customController91.text ?? "0.1");
      userPrice10 = double.tryParse(customController101.text ?? "0.1");
      userPrice11 = double.tryParse(shipcost.text ?? "0.1");
      userPrice12 = double.tryParse(shipcostintern.text ?? "0.1");
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


      inrtousd = resultUSD.rate;
      inrtousd1 = resultUSD1.rate;
      inrtousd2 = resultUSD2.rate;
      inrtousd3 = resultUSD3.rate;
      inrtousd4 = resultUSD4.rate;
      inrtousd5 = resultUSD5.rate;
      inrtousd6 = resultUSD6.rate;
      inrtousd7 = resultUSD7.rate;
      inrtousd8 = resultUSD8.rate;
      inrtousd9 = resultUSD9.rate;
      inrtousd10 = resultUSD10.rate;
      inrtousd11 = resultUSD11.rate;
      inrtousd12 = resultUSD12.rate;

      inrtoeur = resultEUR.rate;

      inrtoeur1 = resultEUR1.rate;

      inrtoeur2 = resultEUR2.rate;
      inrtoeur3 = resultEUR3.rate;
      inrtoeur4 = resultEUR4.rate;
      inrtoeur5 = resultEUR5.rate;
      inrtoeur6 = resultEUR6.rate;
      inrtoeur7 = resultEUR7.rate;
      inrtoeur8 = resultEUR8.rate;
      inrtoeur9 = resultEUR9.rate;
      inrtoeur10 = resultEUR10.rate;
      inrtoeur11 = resultEUR11.rate;
      inrtoeur12 = resultEUR12.rate;

      inrtogbp = resultGBP.rate;

      inrtogbp1 = resultGBP1.rate;

      inrtogbp2 = resultGBP2.rate;
      inrtogbp3 = resultGBP3.rate;
      inrtogbp4 = resultGBP4.rate;
      inrtogbp5 = resultGBP5.rate;
      inrtogbp6 = resultGBP6.rate;
      inrtogbp7 = resultGBP7.rate;
      inrtogbp8 = resultGBP8.rate;
      inrtogbp9 = resultGBP9.rate;
      inrtogbp10 = resultGBP10.rate;
      inrtogbp11 = resultGBP11.rate;
      inrtogbp12 = resultGBP12.rate;


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

      eurtousd = resultUSD.rate;

      eurtousd1 = resultUSD1.rate;

      eurtousd2 = resultUSD2.rate;
      eurtousd3 = resultUSD3.rate;
      eurtousd4 = resultUSD4.rate;
      eurtousd5 = resultUSD5.rate;
      eurtousd6 = resultUSD6.rate;
      eurtousd7 = resultUSD7.rate;
      eurtousd8 = resultUSD8.rate;
      eurtousd9 = resultUSD9.rate;
      eurtousd10 = resultUSD10.rate;
      eurtousd11 = resultUSD11.rate;
      eurtousd12 = resultUSD12.rate;

      eurtoinr = resultINR.rate;
      eurtoinr1 = resultINR1.rate;
      eurtoinr2 = resultINR2.rate;
      eurtoinr3 = resultINR3.rate;
      eurtoinr4 = resultINR4.rate;
      eurtoinr5 = resultINR5.rate;
      eurtoinr6 = resultINR6.rate;
      eurtoinr7 = resultINR7.rate;
      eurtoinr8 = resultINR8.rate;
      eurtoinr9 = resultINR9.rate;
      eurtoinr10 = resultINR10.rate;
      eurtoinr11 = resultINR11.rate;
      eurtoinr12 = resultINR12.rate;

      eurtogbp = resultGBP.rate;
      eurtogbp1 = resultGBP1.rate;
      eurtogbp2 = resultGBP2.rate;
      eurtogbp3 = resultGBP3.rate;
      eurtogbp4 = resultGBP4.rate;
      eurtogbp5 = resultGBP5.rate;
      eurtogbp6 = resultGBP6.rate;
      eurtogbp7 = resultGBP7.rate;
      eurtogbp8 = resultGBP8.rate;
      eurtogbp9 = resultGBP9.rate;
      eurtogbp10 = resultGBP10.rate;
      eurtogbp11 = resultGBP11.rate;
      eurtogbp12 = resultGBP12.rate;


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

        gbptousd = resultUSD.rate;
        gbptousd1 = resultUSD1.rate;
        gbptousd2 = resultUSD2.rate;
        gbptousd3 = resultUSD3.rate;
        gbptousd4 = resultUSD4.rate;
        gbptousd5 = resultUSD5.rate;
        gbptousd6 = resultUSD6.rate;
        gbptousd7 = resultUSD7.rate;
        gbptousd8 = resultUSD8.rate;
        gbptousd9 = resultUSD9.rate;
        gbptousd10 = resultUSD10.rate;
        gbptousd11 = resultUSD11.rate;
        gbptousd12 = resultUSD12.rate;

        gbptoinr = resultINR.rate;
        gbptoinr1 = resultINR1.rate;
        gbptoinr2 = resultINR2.rate;
        gbptoinr3 = resultINR3.rate;
        gbptoinr4 = resultINR4.rate;
        gbptoinr5 = resultINR5.rate;
        gbptoinr6 = resultINR6.rate;
        gbptoinr7 = resultINR7.rate;
        gbptoinr8 = resultINR8.rate;
        gbptoinr9 = resultINR9.rate;
        gbptoinr10 = resultINR10.rate;
        gbptoinr11 = resultINR11.rate;
        gbptoinr12 = resultINR12.rate;

        gbptoeur = resultEUR.rate;
        gbptoeur1 = resultEUR1.rate;
        gbptoeur2 = resultEUR2.rate;
        gbptoeur3 = resultEUR3.rate;
        gbptoeur4 = resultEUR4.rate;
        gbptoeur5 = resultEUR5.rate;
        gbptoeur6 = resultEUR6.rate;
        gbptoeur7 = resultEUR7.rate;
        gbptoeur8 = resultEUR8.rate;
        gbptoeur9 = resultEUR9.rate;
        gbptoeur10 = resultEUR10.rate;
        gbptoeur11 = resultEUR11.rate;
        gbptoeur12 = resultEUR12.rate;


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

        usdtoinr = resultINR.rate;
        usdtoinr1 = resultINR1.rate;
        usdtoinr2 = resultINR2.rate;
        usdtoinr3 = resultINR3.rate;
        usdtoinr4 = resultINR4.rate;
        usdtoinr5 = resultINR5.rate;
        usdtoinr6 = resultINR6.rate;
        usdtoinr7 = resultINR7.rate;
        usdtoinr8 = resultINR8.rate;
        usdtoinr9 = resultINR9.rate;
        usdtoinr10 = resultINR10.rate;
        usdtoinr11 = resultINR11.rate;
        usdtoinr12 = resultINR12.rate;

        usdtoeur = resultEUR.rate;
        usdtoeur1 = resultEUR1.rate;
        usdtoeur2 = resultEUR2.rate;
        usdtoeur3 = resultEUR3.rate;
        usdtoeur4 = resultEUR4.rate;
        usdtoeur5 = resultEUR5.rate;
        usdtoeur6 = resultEUR6.rate;
        usdtoeur7 = resultEUR7.rate;
        usdtoeur8 = resultEUR8.rate;
        usdtoeur9 = resultEUR9.rate;
        usdtoeur10 = resultEUR10.rate;
        usdtoeur11 = resultEUR11.rate;
        usdtoeur12 = resultEUR12.rate;

        usdtogbp = resultGBP.rate;
        usdtogbp1 = resultGBP1.rate;
        usdtogbp2 = resultGBP2.rate;
        usdtogbp3 = resultGBP3.rate;
        usdtogbp4 = resultGBP4.rate;
        usdtogbp5 = resultGBP5.rate;
        usdtogbp6 = resultGBP6.rate;
        usdtogbp7 = resultGBP7.rate;
        usdtogbp8 = resultGBP8.rate;
        usdtogbp9 = resultGBP9.rate;
        usdtogbp10 = resultGBP10.rate;
        usdtogbp11 = resultGBP11.rate;
        usdtogbp12 = resultGBP12.rate;


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
    customImg2!=null? await compressImage02():null;
    String mediaUrl02 =  customImg2!=null?await uploadImage02(customImg2):"";
    customImg3!=null? await compressImage03():null;
    String mediaUrl03 =  customImg3!=null?await uploadImage03(customImg3):"";
    customImg4!=null? await compressImage04():null;
    String mediaUrl04 =  customImg4!=null?await uploadImage04(customImg4):"";
    customImg5!=null? await compressImage05():null;
    String mediaUrl05 =  customImg5!=null?await uploadImage05(customImg5):"";
    customImg6!=null? await compressImage06():null;
    String mediaUrl06 =  customImg6!=null?await uploadImage06(customImg6):"";
    customImg7!=null? await compressImage07():null;
    String mediaUrl07 =  customImg7!=null?await uploadImage07(customImg7):"";
    customImg8!=null? await compressImage08():null;
    String mediaUrl08 =  customImg8!=null?await uploadImage08(customImg8):"";
    customImg9!=null? await compressImage09():null;
    String mediaUrl09 =  customImg9!=null?await uploadImage09(customImg9):"";
    customImg10!=null? await compressImage010():null;
    String mediaUrl010 =  customImg10!=null?await uploadImage010(customImg10):"";
    customImg11!=null? await compressImage011():null;
    String mediaUrl011 =  customImg11!=null?await uploadImage011(customImg11):"";
    customImg12!=null? await compressImage012():null;
    String mediaUrl012 =  customImg12!=null?await uploadImage012(customImg12):"";
    customImg13!=null? await compressImage013():null;
    String mediaUrl013 =  customImg13!=null?await uploadImage013(customImg13):"";
    customImg14!=null? await compressImage014():null;
    String mediaUrl014 =  customImg14!=null?await uploadImage014(customImg14):"";
    customImg15!=null? await compressImage015():null;
    String mediaUrl015 =  customImg15!=null?await uploadImage015(customImg15):"";
    customImg16!=null? await compressImage016():null;
    String mediaUrl016 =  customImg16!=null?await uploadImage016(customImg16):"";
    customImg17!=null? await compressImage017():null;
    String mediaUrl017 =  customImg17!=null?await uploadImage017(customImg17):"";
    customImg18!=null? await compressImage018():null;
    String mediaUrl018 =  customImg18!=null?await uploadImage018(customImg18):"";
    customImg19!=null? await compressImage019():null;
    String mediaUrl019 =  customImg19!=null?await uploadImage019(customImg19):"";
    customImg20!=null? await compressImage020():null;
    String mediaUrl020 =  customImg20!=null?await uploadImage020(customImg20):"";
    customImg21!=null? await compressImage021():null;
    String mediaUrl021 =  customImg21!=null?await uploadImage021(customImg21):"";
    customImg22!=null? await compressImage022():null;
    String mediaUrl022 =  customImg22!=null?await uploadImage022(customImg22):"";
    customImg23!=null? await compressImage023():null;
    String mediaUrl023 =  customImg23!=null?await uploadImage023(customImg23):"";
    customImg24!=null? await compressImage024():null;
    String mediaUrl024 =  customImg24!=null?await uploadImage024(customImg24):"";
    customImg25!=null? await compressImage025():null;
    String mediaUrl025 =  customImg25!=null?await uploadImage025(customImg25):"";
    customImg26!=null? await compressImage026():null;
    String mediaUrl026 =  customImg26!=null?await uploadImage026(customImg26):"";
    customImg27!=null? await compressImage027():null;
    String mediaUrl027 =  customImg27!=null?await uploadImage027(customImg27):"";
    customImg28!=null? await compressImage028():null;
    String mediaUrl028 =  customImg28!=null?await uploadImage028(customImg28):"";
    customImg29!=null? await compressImage029():null;
    String mediaUrl029 =  customImg29!=null?await uploadImage029(customImg29):"";
    customImg30!=null? await compressImage030():null;
    String mediaUrl030 =  customImg30!=null?await uploadImage030(customImg30):"";
    customImg31!=null? await compressImage031():null;
    String mediaUrl031 =  customImg31!=null?await uploadImage031(customImg31):"";
    customImg32!=null? await compressImage032():null;
    String mediaUrl032 =  customImg32!=null?await uploadImage032(customImg32):"";
    customImg33!=null? await compressImage033():null;
    String mediaUrl033 =  customImg33!=null?await uploadImage033(customImg33):"";
    customImg34!=null? await compressImage034():null;
    String mediaUrl034 =  customImg34!=null?await uploadImage034(customImg34):"";
    customImg35!=null? await compressImage035():null;
    String mediaUrl035 =  customImg35!=null?await uploadImage035(customImg35):"";
    customImg36!=null? await compressImage036():null;
    String mediaUrl01 =  customImg1!=null?await uploadImage01(customImg1):"";
    customImg37!=null? await compressImage037():null;
    String mediaUrl037 =  customImg37!=null?await uploadImage037(customImg37):"";
    customImg38!=null? await compressImage038():null;
    String mediaUrl038 =  customImg38!=null?await uploadImage038(customImg38):"";
    customImg39!=null? await compressImage039():null;
    String mediaUrl039 =  customImg39!=null?await uploadImage039(customImg39):"";
    customImg40!=null? await compressImage040():null;
    String mediaUrl040 =  customImg40!=null?await uploadImage040(customImg40):"";
    customImg41!=null? await compressImage041():null;
    String mediaUrl041 =  customImg41!=null?await uploadImage041(customImg41):"";
    customImg42!=null? await compressImage042():null;
    String mediaUrl042 =  customImg42!=null?await uploadImage042(customImg42):"";
    customImg43!=null? await compressImage043():null;
    String mediaUrl043 =  customImg43!=null?await uploadImage043(customImg43):"";
    customImg44!=null? await compressImage044():null;
    String mediaUrl044 =  customImg44!=null?await uploadImage044(customImg44):"";
    customImg45!=null? await compressImage045():null;
    String mediaUrl045 =  customImg45!=null?await uploadImage045(customImg45):"";
    customImg46!=null? await compressImage046():null;
    String mediaUrl046 =  customImg46!=null?await uploadImage046(customImg46):"";
    customImg47!=null? await compressImage047():null;
    String mediaUrl047 =  customImg47!=null?await uploadImage047(customImg47):"";
    customImg48!=null? await compressImage048():null;
    String mediaUrl048 =  customImg48!=null?await uploadImage048(customImg48):"";
     customImg49!=null? await compressImage049():null;
    String mediaUrl049 =  customImg49!=null?await uploadImage049(customImg49):"";
     customImg50!=null? await compressImage050():null;
    String mediaUrl050 =  customImg50!=null?await uploadImage050(customImg50):"";

if(currentUser.currency == "INR"){
  for ( var imageFile in images) {
    postImage(imageFile).then((downloadUrl)  {
      imageUrls.add(downloadUrl.toString());
      if(imageUrls.length==images.length){
        String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

        productsRef
            .doc(widget.currentUser.id)
            .collection("userProducts")
            .doc(prodId)
            .update({
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
          "usd": inrtousd ?? 0.1,
          "eur": inrtoeur ?? 0.1,
          "gbp": inrtogbp ?? 0.1,
          "inr": userPrice ?? 0.1,

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
          "custom1":  customController1.text ?? "",
          "custom2":  customController2.text ?? "",
          "custom3":  customController3.text ?? "",
          "custom4":  customController4.text ?? "",
          "custom5":  customController5.text ?? "",
          "custom6":  customController6.text ?? "",
          "custom7":  customController7.text ?? "",
          "custom8":  customController8.text ?? "",
          "custom9":  customController9.text ?? "",
          "custom10":  customController10.text ?? "",
          "custom1img":  mediaUrl ?? "",
          "custom2img":  mediaUrl1 ?? "",
          "custom3img":  mediaUrl2 ?? "",
          "custom4img":  mediaUrl3 ?? "",
          "custom5img":  mediaUrl4 ?? "",
          "custom6img":  mediaUrl5 ?? "",
          "custom7img":  mediaUrl6 ?? "",
          "custom8img":  mediaUrl7 ?? "",
          "custom9img":  mediaUrl8 ?? "",
          "custom10img":  mediaUrl9 ?? "",

          "customQuantity1":  int.tryParse(customControllerQuantity1.text) ?? 0,
          "customQuantity2":  int.tryParse(customControllerQuantity2.text) ?? 0,
          "customQuantity3":  int.tryParse(customControllerQuantity3.text) ?? 0,
          "customQuantity4":  int.tryParse(customControllerQuantity4.text) ?? 0,
          "customQuantity5":  int.tryParse(customControllerQuantity5.text) ?? 0,
          "customQuantity6":  int.tryParse(customControllerQuantity6.text) ?? 0,
          "customQuantity7":  int.tryParse(customControllerQuantity7.text) ?? 0,
          "customQuantity8":  int.tryParse(customControllerQuantity8.text) ?? 0,
          "customQuantity9":  int.tryParse(customControllerQuantity9.text) ?? 0,
          "customQuantity10":  int.tryParse(customControllerQuantity10.text) ??0,

          "custom11inr": userPrice1??  0.1,
          "custom11usd": inrtousd1?? 0.1,
          "custom11eur": inrtoeur1?? 0.1,
          "custom11gbp": inrtogbp1?? 0.1,

          "custom21inr": userPrice2??  0.1,
          "custom21usd": inrtousd2 ?? 0.1,
          "custom21gbp": inrtogbp2??  0.1,
          "custom21eur": inrtoeur2??  0.1,

          "custom31usd": inrtousd3?? 0.1,
          "custom31inr": userPrice3??  0.1,
          "custom31gbp": inrtogbp3??  0.1,
          "custom31eur": inrtoeur3??  0.1,

          "custom41usd": inrtousd4?? 0.1,
          "custom41inr": userPrice4??  0.1,
          "custom41gbp": inrtogbp4??  0.1,
          "custom41eur": inrtoeur4??  0.1,

          "custom51usd": inrtousd5?? 0.1,
          "custom51inr": userPrice5??  0.1,
           "custom51gbp": inrtogbp5??  0.1,
           "custom51eur": inrtoeur5??  0.1,

          "custom61usd": inrtousd6?? 0.1,
          "custom61inr": userPrice6??  0.1,
           "custom61eur": inrtoeur6??  0.1,
           "custom61gbp": inrtogbp6??  0.1,

          "custom71usd": inrtousd7?? 0.1,
          "custom71inr": userPrice7??  0.1,
           "custom71eur": inrtoeur7??  0.1,
           "custom71gbp": inrtogbp7??  0.1,

          "custom81usd": inrtousd8?? 0.1,
          "custom81inr": userPrice8??  0.1,
          "custom81eur": inrtoeur8??  0.1,
          "custom81gbp": inrtogbp8??  0.1,

          "custom91usd": inrtousd9?? 0.1,
          "custom91inr": userPrice9??  0.1,
          "custom91eur": inrtoeur9??  0.1,
          "custom91gbp": inrtogbp9??  0.1,

          "custom101usd": inrtousd10?? 0.1,
          "custom101inr": userPrice10??  0.1,
          "custom101eur": inrtoeur10??  0.1,
          "custom101gbp": inrtogbp10??  0.1,

          "shipcostusd": inrtousd11?? 0.1,
          "shipcostinr": userPrice11??  0.1,
          "shipcostgbp": inrtogbp11??  0.1,
          "shipcosteur": inrtoeur11??  0.1,

          "shipcostinternusd": inrtousd12?? 0.1,
          "shipcostinterninr": userPrice12??  0.1,
          "shipcostinterneur": inrtoeur12??  0.1,
          "shipcostinterngbp": inrtogbp12??  0.1,

          "round": inrtousd ?? 0.0,

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
      print('rtherjhertjnherj${imageUrls.length}');
      print('rjertertj${images.length}');

    });
  }
}
else if(currentUser.currency == "EUR"){
  for ( var imageFile in images) {
    postImage(imageFile).then((downloadUrl)  {
      imageUrls.add(downloadUrl.toString());
      if(imageUrls.length==images.length){
        String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

        productsRef
            .doc(widget.currentUser.id)
            .collection("userProducts")
            .doc(prodId)
            .update({
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
          "usd": eurtousd ?? 0.1,
          "eur": userPrice ?? 0.1,
          "gbp": eurtogbp ?? 0.1,
          "inr": eurtoinr ?? 0.1,

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
          "custom1":  customController1.text ?? "",
          "custom2":  customController2.text ?? "",
          "custom3":  customController3.text ?? "",
          "custom4":  customController4.text ?? "",
          "custom5":  customController5.text ?? "",
          "custom6":  customController6.text ?? "",
          "custom7":  customController7.text ?? "",
          "custom8":  customController8.text ?? "",
          "custom9":  customController9.text ?? "",
          "custom10":  customController10.text ?? "",
          "custom1img":  mediaUrl ?? "",
          "custom2img":  mediaUrl1 ?? "",
          "custom3img":  mediaUrl2 ?? "",
          "custom4img":  mediaUrl3 ?? "",
          "custom5img":  mediaUrl4 ?? "",
          "custom6img":  mediaUrl5 ?? "",
          "custom7img":  mediaUrl6 ?? "",
          "custom8img":  mediaUrl7 ?? "",
          "custom9img":  mediaUrl8 ?? "",
          "custom10img":  mediaUrl9 ?? "",

          "customQuantity1":  int.tryParse(customControllerQuantity1.text) ?? 0,
          "customQuantity2":  int.tryParse(customControllerQuantity2.text) ?? 0,
          "customQuantity3":  int.tryParse(customControllerQuantity3.text) ?? 0,
          "customQuantity4":  int.tryParse(customControllerQuantity4.text) ?? 0,
          "customQuantity5":  int.tryParse(customControllerQuantity5.text) ?? 0,
          "customQuantity6":  int.tryParse(customControllerQuantity6.text) ?? 0,
          "customQuantity7":  int.tryParse(customControllerQuantity7.text) ?? 0,
          "customQuantity8":  int.tryParse(customControllerQuantity8.text) ?? 0,
          "customQuantity9":  int.tryParse(customControllerQuantity9.text) ?? 0,
          "customQuantity10":  int.tryParse(customControllerQuantity10.text) ??0,

          "custom11inr": eurtoinr1??  0.1,
          "custom11usd": eurtousd1?? 0.1,
          "custom11eur": userPrice1?? 0.1,
          "custom11gbp": eurtogbp1?? 0.1,

          "custom21inr": eurtoinr2??  0.1,
          "custom21usd": eurtousd2 ?? 0.1,
          "custom21gbp": eurtogbp2??  0.1,
          "custom21eur": userPrice2??  0.1,

          "custom31usd": eurtousd3?? 0.1,
          "custom31inr": eurtoinr3??  0.1,
          "custom31gbp": eurtogbp3??  0.1,
          "custom31eur": userPrice3??  0.1,

          "custom41usd": eurtousd4?? 0.1,
          "custom41inr": eurtoinr4??  0.1,
          "custom41gbp": eurtogbp4??  0.1,
          "custom41eur": userPrice4??  0.1,

          "custom51usd": eurtousd5?? 0.1,
          "custom51inr": eurtoinr5??  0.1,
          "custom51gbp": eurtogbp5??  0.1,
          "custom51eur": userPrice5??  0.1,

          "custom61usd": eurtousd6?? 0.1,
          "custom61inr": eurtoinr6??  0.1,
          "custom61eur": userPrice6??  0.1,
          "custom61gbp": eurtogbp6??  0.1,

          "custom71usd": eurtousd7?? 0.1,
          "custom71inr": eurtoinr7??  0.1,
          "custom71eur": userPrice7??  0.1,
          "custom71gbp": eurtogbp7??  0.1,

          "custom81usd": eurtousd8?? 0.1,
          "custom81inr": eurtoinr8??  0.1,
          "custom81eur": userPrice8??  0.1,
          "custom81gbp": eurtogbp8??  0.1,

          "custom91usd": eurtousd9?? 0.1,
          "custom91inr": eurtoinr9??  0.1,
          "custom91eur": userPrice9??  0.1,
          "custom91gbp": eurtogbp9??  0.1,

          "custom101usd": eurtousd10?? 0.1,
          "custom101inr": eurtoinr10??  0.1,
          "custom101eur": userPrice10??  0.1,
          "custom101gbp": eurtogbp10??  0.1,

          "shipcostusd": eurtousd11?? 0.1,
          "shipcostinr": eurtoinr11??  0.1,
          "shipcostgbp": eurtogbp11??  0.1,
          "shipcosteur": userPrice11??  0.1,

          "shipcostinternusd": eurtousd12?? 0.1,
          "shipcostinterninr": eurtoinr12??  0.1,
          "shipcostinterneur": userPrice12??  0.1,
          "shipcostinterngbp": eurtogbp12??  0.1,

          "round": eurtousd ?? 0.0,

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
}
else if(currentUser.currency == "GBP"){
  for ( var imageFile in images) {
    postImage(imageFile).then((downloadUrl)  {
      imageUrls.add(downloadUrl.toString());
      if(imageUrls.length==images.length){
        String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

        productsRef
            .doc(widget.currentUser.id)
            .collection("userProducts")
            .doc(prodId)
            .update({
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
          "usd": gbptousd ?? 0.1,
          "eur": gbptousd ?? 0.1,
          "gbp": userPrice ?? 0.1,
          "inr": gbptoinr ?? 0.1,

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
          "custom1":  customController1.text ?? "",
          "custom2":  customController2.text ?? "",
          "custom3":  customController3.text ?? "",
          "custom4":  customController4.text ?? "",
          "custom5":  customController5.text ?? "",
          "custom6":  customController6.text ?? "",
          "custom7":  customController7.text ?? "",
          "custom8":  customController8.text ?? "",
          "custom9":  customController9.text ?? "",
          "custom10":  customController10.text ?? "",
          "custom1img":  mediaUrl ?? "",
          "custom2img":  mediaUrl1 ?? "",
          "custom3img":  mediaUrl2 ?? "",
          "custom4img":  mediaUrl3 ?? "",
          "custom5img":  mediaUrl4 ?? "",
          "custom6img":  mediaUrl5 ?? "",
          "custom7img":  mediaUrl6 ?? "",
          "custom8img":  mediaUrl7 ?? "",
          "custom9img":  mediaUrl8 ?? "",
          "custom10img":  mediaUrl9 ?? "",

          "customQuantity1":  int.tryParse(customControllerQuantity1.text) ?? 0,
          "customQuantity2":  int.tryParse(customControllerQuantity2.text) ?? 0,
          "customQuantity3":  int.tryParse(customControllerQuantity3.text) ?? 0,
          "customQuantity4":  int.tryParse(customControllerQuantity4.text) ?? 0,
          "customQuantity5":  int.tryParse(customControllerQuantity5.text) ?? 0,
          "customQuantity6":  int.tryParse(customControllerQuantity6.text) ?? 0,
          "customQuantity7":  int.tryParse(customControllerQuantity7.text) ?? 0,
          "customQuantity8":  int.tryParse(customControllerQuantity8.text) ?? 0,
          "customQuantity9":  int.tryParse(customControllerQuantity9.text) ?? 0,
          "customQuantity10":  int.tryParse(customControllerQuantity10.text) ??0,

          "custom11inr": gbptoinr1??  0.1,
          "custom11usd": gbptousd1?? 0.1,
          "custom11eur": gbptoeur1?? 0.1,
          "custom11gbp": userPrice1?? 0.1,

          "custom21inr": gbptoinr2??  0.1,
          "custom21usd": gbptousd2 ?? 0.1,
          "custom21gbp": userPrice2??  0.1,
          "custom21eur": gbptoeur2??  0.1,

          "custom31usd": gbptousd3?? 0.1,
          "custom31inr": gbptoinr3??  0.1,
          "custom31gbp": userPrice3??  0.1,
          "custom31eur": gbptoeur3??  0.1,

          "custom41usd": gbptousd4?? 0.1,
          "custom41inr": gbptoinr4??  0.1,
          "custom41gbp": userPrice4??  0.1,
          "custom41eur": gbptoeur4??  0.1,

          "custom51usd": gbptousd5?? 0.1,
          "custom51inr": gbptoinr5??  0.1,
          "custom51gbp": userPrice5??  0.1,
          "custom51eur": gbptoeur5??  0.1,

          "custom61usd": gbptousd6?? 0.1,
          "custom61inr": gbptoinr6??  0.1,
          "custom61eur": gbptoeur6??  0.1,
          "custom61gbp": userPrice6??  0.1,

          "custom71usd": gbptousd7?? 0.1,
          "custom71inr": gbptoinr7??  0.1,
          "custom71eur": gbptoeur7??  0.1,
          "custom71gbp": userPrice7??  0.1,

          "custom81usd": gbptousd8?? 0.1,
          "custom81inr": gbptoinr8??  0.1,
          "custom81eur": gbptoeur8??  0.1,
          "custom81gbp": userPrice8??  0.1,

          "custom91usd": gbptousd9?? 0.1,
          "custom91inr": gbptoinr9??  0.1,
          "custom91eur": gbptoeur9??  0.1,
          "custom91gbp": userPrice9??  0.1,

          "custom101usd": gbptousd10?? 0.1,
          "custom101inr": gbptoinr10??  0.1,
          "custom101eur": gbptoeur10??  0.1,
          "custom101gbp": userPrice10??  0.1,

          "shipcostusd": gbptousd11?? 0.1,
          "shipcostinr": gbptoinr11??  0.1,
          "shipcostgbp": userPrice11??  0.1,
          "shipcosteur": gbptoeur11??  0.1,

          "shipcostinternusd": gbptousd12?? 0.1,
          "shipcostinterninr": gbptoinr12??  0.1,
          "shipcostinterneur": gbptoeur12??  0.1,
          "shipcostinterngbp": userPrice12??  0.1,

          "round": gbptousd ?? 0.0,

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
}
else{
  for ( var imageFile in images) {
    postImage(imageFile).then((downloadUrl)  {
      imageUrls.add(downloadUrl.toString());
      if(imageUrls.length==images.length){
        String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

        productsRef
            .doc(widget.currentUser.id)
            .collection("userProducts")
            .doc(prodId)
            .update({
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
          "usd": userPrice ?? 0.1,
          "eur": usdtoeur ?? 0.1,
          "gbp": usdtoinr ?? 0.1,
          "inr": usdtoinr ?? 0.1,

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
          "custom1":  customController1.text ?? "",
          "custom2":  customController2.text ?? "",
          "custom3":  customController3.text ?? "",
          "custom4":  customController4.text ?? "",
          "custom5":  customController5.text ?? "",
          "custom6":  customController6.text ?? "",
          "custom7":  customController7.text ?? "",
          "custom8":  customController8.text ?? "",
          "custom9":  customController9.text ?? "",
          "custom10":  customController10.text ?? "",
          "custom1img":  mediaUrl ?? "",
          "custom2img":  mediaUrl1 ?? "",
          "custom3img":  mediaUrl2 ?? "",
          "custom4img":  mediaUrl3 ?? "",
          "custom5img":  mediaUrl4 ?? "",
          "custom6img":  mediaUrl5 ?? "",
          "custom7img":  mediaUrl6 ?? "",
          "custom8img":  mediaUrl7 ?? "",
          "custom9img":  mediaUrl8 ?? "",
          "custom10img":  mediaUrl9 ?? "",

          "customQuantity1":  int.tryParse(customControllerQuantity1.text) ?? 0,
          "customQuantity2":  int.tryParse(customControllerQuantity2.text) ?? 0,
          "customQuantity3":  int.tryParse(customControllerQuantity3.text) ?? 0,
          "customQuantity4":  int.tryParse(customControllerQuantity4.text) ?? 0,
          "customQuantity5":  int.tryParse(customControllerQuantity5.text) ?? 0,
          "customQuantity6":  int.tryParse(customControllerQuantity6.text) ?? 0,
          "customQuantity7":  int.tryParse(customControllerQuantity7.text) ?? 0,
          "customQuantity8":  int.tryParse(customControllerQuantity8.text) ?? 0,
          "customQuantity9":  int.tryParse(customControllerQuantity9.text) ?? 0,
          "customQuantity10":  int.tryParse(customControllerQuantity10.text) ??0,

          "custom11inr": usdtoinr1??  0.1,
          "custom11usd": userPrice1?? 0.1,
          "custom11eur": usdtoeur1?? 0.1,
          "custom11gbp": usdtogbp1?? 0.1,

          "custom21inr": usdtoinr2??  0.1,
          "custom21usd": userPrice2 ?? 0.1,
          "custom21gbp": usdtogbp2??  0.1,
          "custom21eur": usdtoeur2??  0.1,

          "custom31usd": userPrice3?? 0.1,
          "custom31inr": usdtoinr3??  0.1,
          "custom31gbp": usdtogbp3??  0.1,
          "custom31eur": usdtoeur3??  0.1,

          "custom41usd": userPrice4?? 0.1,
          "custom41inr": usdtoinr4??  0.1,
          "custom41gbp": usdtogbp4??  0.1,
          "custom41eur": usdtoeur4??  0.1,

          "custom51usd": userPrice5?? 0.1,
          "custom51inr": usdtoinr5??  0.1,
          "custom51gbp": usdtogbp5??  0.1,
          "custom51eur": usdtoeur5??  0.1,

          "custom61usd": userPrice6?? 0.1,
          "custom61inr": usdtoinr6??  0.1,
          "custom61eur": usdtoeur6??  0.1,
          "custom61gbp": usdtogbp6??  0.1,

          "custom71usd": userPrice7?? 0.1,
          "custom71inr": usdtoinr7??  0.1,
          "custom71eur": usdtoeur7??  0.1,
          "custom71gbp": usdtogbp7??  0.1,

          "custom81usd": userPrice8?? 0.1,
          "custom81inr": usdtoinr8??  0.1,
          "custom81eur": usdtoeur8??  0.1,
          "custom81gbp": usdtogbp8??  0.1,

          "custom91usd": userPrice9?? 0.1,
          "custom91inr": usdtoinr9??  0.1,
          "custom91eur": usdtoeur9??  0.1,
          "custom91gbp": usdtogbp9??  0.1,

          "custom101usd": userPrice10?? 0.1,
          "custom101inr": usdtoinr10??  0.1,
          "custom101eur": usdtoeur10??  0.1,
          "custom101gbp": usdtogbp10??  0.1,

          "shipcostusd": userPrice11?? 0.1,
          "shipcostinr": usdtoinr11??  0.1,
          "shipcostgbp": usdtogbp11??  0.1,
          "shipcosteur": usdtoeur11??  0.1,

          "shipcostinternusd": userPrice12?? 0.1,
          "shipcostinterninr": usdtoinr12??  0.1,
          "shipcostinterneur": usdtoeur12??  0.1,
          "shipcostinterngbp": usdtogbp12??  0.1,

          "round": userPrice ?? 0.0,

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

 var currencyFormatter =      currentUser.currency == "USD"? NumberFormat('#,##0.00', ):
 currentUser.currency == "INR"?NumberFormat.currency(locale:"HI"):
 currentUser.currency == "EUR"? NumberFormat.currency(locale:" ${currentUser.currencyISO}"):
 currentUser.currency == "GBP"?NumberFormat.currency(locale:" ${currentUser.currencyISO}"): NumberFormat('#,##0.00', );

 TagItem({this.ownerId,this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

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
          currentUser.currency == "USD"?Text("\u0024 ${currencyFormatter.format(usd)}",):
          currentUser.currency == "INR"?Text("₹ ${currencyFormatter.format(inr)}",):
          currentUser.currency == "EUR"?Text("€ ${currencyFormatter.format(eur)}",):
          currentUser.currency == "GBP"?Text("£ ${currencyFormatter.format(gbp)}",):Text("\u0024 ${currencyFormatter.format(usd)}",),


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

