import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fashow/progress.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_select/smart_select.dart';

import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/size_config.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class UploadResale extends StatefulWidget {


  @override
  _UploadResaleState createState() => _UploadResaleState();
}

class _UploadResaleState extends State<UploadResale>
    with AutomaticKeepAliveClientMixin<UploadResale>{
  String resaleId = Uuid().v4();
  bool isUploading = false;
  List<String> images = <String>[];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  TextEditingController detailsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
TextEditingController shipController = TextEditingController();
TextEditingController colorController = TextEditingController();
  TextEditingController durationfrom = TextEditingController();
  TextEditingController durationto = TextEditingController();
  TextEditingController durationfromw = TextEditingController();
  TextEditingController durationtow = TextEditingController();
  TextEditingController shipcost = TextEditingController();
  TextEditingController shipcostintern = TextEditingController();
var  shipCost;
 var shipCostintern;
  String value = 'Select Category';
  String dropdownValue = 'Women';
  String condition = 'Gently Used';

  List colors;
  bool worldship = true;
  bool freeship = true;
  bool freeworldship = true;
  bool isTag = false;
  String loading = "Converting currencies";
  var price;
  var totalPrice;
  var USD;
  var GBP;
  var EUR;
  var INR;
  var USD1;
  var GBP1;
  var EUR1;
  var INR1;
    var USD2;
  var GBP2;
  var EUR2;
  var INR2;
  
  File file1;
  File file2;
  File file3;
  File file4;
  File file5;


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

      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  compressImage1() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file1.readAsBytesSync());
    final compressedImageFile = File('$path/img1_$resaleId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file1 = compressedImageFile;
    });
  }
  compressImage2() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file2.readAsBytesSync());
    final compressedImageFile = File('$path/img2_$resaleId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file2 = compressedImageFile;
    });
  }
  compressImage3() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file3.readAsBytesSync());
    final compressedImageFile = File('$path/img3_$resaleId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file3 = compressedImageFile;
    });
  }
  compressImage4() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file4.readAsBytesSync());
    final compressedImageFile = File('$path/img4_$resaleId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file4 = compressedImageFile;
    });
  }
  compressImage5() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file5.readAsBytesSync());
    final compressedImageFile = File('$path/img5_$resaleId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file5 = compressedImageFile;
    });
  }
  Future<String> uploadImage1(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Resale${resaleId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    images.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage2(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Resale${resaleId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    images.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage3(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Resale${resaleId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    images.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage4(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Resale${resaleId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    images.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage5(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Resale${resaleId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    images.add(downloadUrl);
    return downloadUrl;
  }
  void INRUSD() async {
    var I;
    var E;
    var G;
    var U;
    var I1;
    var E1;
    var G1;
    var U1;
 var I2;
    var E2;
    var G2;
    var U2;

    setState(() {
      isUploading = true;
      price = double.tryParse(priceController.text ?? "0.0");
      shipCost= double.tryParse(shipcost.text ??"0.0");
shipCostintern= double.tryParse(shipcostintern.text ??"0.0");

    });
    if(currentUser.currency == "INR") {
      var resultUSD = await Currency.getConversion(
          from: 'INR', to: 'USD', amount: priceController.text ?? 0);
      var resultEUR = await Currency.getConversion(
          from: 'INR', to: 'EUR', amount: priceController.text ?? 0);
      var resultGBP = await Currency.getConversion(
          from: 'INR', to: 'GBP', amount: priceController.text ?? 0);
      var resultUSD1 = await Currency.getConversion(
          from: 'INR', to: 'USD', amount: shipcost.text ?? 0);
      var resultEUR1 = await Currency.getConversion(
          from: 'INR', to: 'EUR', amount: shipcost.text ?? 0);
      var resultGBP1 = await Currency.getConversion(
          from: 'INR', to: 'GBP', amount: shipcost.text ?? 0);
  var resultUSD2 = await Currency.getConversion(
          from: 'INR', to: 'USD', amount: shipcostintern.text ?? 0);
      var resultEUR2 = await Currency.getConversion(
          from: 'INR', to: 'EUR', amount: shipcostintern.text ?? 0);
      var resultGBP2 = await Currency.getConversion(
          from: 'INR', to: 'GBP', amount: shipcostintern.text ?? 0);

      setState(() {
        INR = price ?? 0.001;
        USD = resultUSD.rate ?? 0.001;
        EUR = resultEUR.rate ?? 0.001;
        GBP = resultGBP.rate ?? 0.001;
        INR1 = shipCost ?? 0.001;
        USD1 = resultUSD1.rate ?? 0.001;
        EUR1 = resultEUR1.rate ?? 0.001;
        GBP1 = resultGBP1.rate ?? 0.001;
         INR2 = shipCostintern ?? 0.001;
        USD2 = resultUSD2.rate ?? 0.001;
        EUR2 = resultEUR2.rate ?? 0.001;
        GBP2 = resultGBP2.rate ?? 0.001;
        
        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
        INR1 = double.tryParse(I1);
         I2 = INR2.toStringAsFixed(2);
        INR2 = double.tryParse(I2);

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
        U1 = USD1.toStringAsFixed(2);
        USD1 = double.tryParse(U1);
         U2 = USD2.toStringAsFixed(2);
        USD2 = double.tryParse(U2);

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        E1 = EUR1.toStringAsFixed(2);
        EUR1 = double.tryParse(E1);
         E2 = EUR2.toStringAsFixed(2);
        EUR2 = double.tryParse(E2);

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        G1 = GBP1.toStringAsFixed(2);
        GBP1 = double.tryParse(G1);
        G2 = GBP2.toStringAsFixed(2);
        GBP2 = double.tryParse(G2);

      }); }
    else if(currentUser.currency == "EUR") {
      var resultUSD = await Currency.getConversion(
          from: 'EUR', to: 'USD', amount: priceController.text ?? 0);
      var resultINR = await Currency.getConversion(
          from: 'EUR', to: 'INR', amount: priceController.text ?? 0);
      var resultGBP = await Currency.getConversion(
          from: 'EUR', to: 'GBP', amount: priceController.text ?? 0);
      var resultUSD1 = await Currency.getConversion(
          from: 'EUR', to: 'USD', amount: shipcost.text ?? 0);
      var resultINR1 = await Currency.getConversion(
          from: 'EUR', to: 'INR', amount: shipcost.text ?? 0);
      var resultGBP1 = await Currency.getConversion(
          from: 'EUR', to: 'GBP', amount: shipcost.text ?? 0);
  var resultUSD2 = await Currency.getConversion(
          from: 'EUR', to: 'USD', amount: shipcostintern.text ?? 0);
      var resultINR2 = await Currency.getConversion(
          from: 'EUR', to: 'INR', amount: shipcostintern.text ?? 0);
      var resultGBP2 = await Currency.getConversion(
          from: 'EUR', to: 'GBP', amount: shipcostintern.text ?? 0);

      setState(() {
        INR =  resultINR.rate?? 0.001;
        USD = resultUSD.rate ?? 0.001;
        EUR = price ?? 0.001;
        GBP = resultGBP.rate ?? 0.001;
        INR1 = resultINR1.rate ?? 0.001;
        USD1 = resultUSD1.rate ?? 0.001;
        EUR1 =  shipCost ?? 0.001;
        GBP1 = resultGBP1.rate ?? 0.001;
        INR2 = resultINR2.rate ?? 0.001;
        USD2 = resultUSD2.rate ?? 0.001;
        EUR2 =  shipCostintern ?? 0.001;
        GBP2 = resultGBP2.rate ?? 0.001;

        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
        INR1 = double.tryParse(I1);
         I2 = INR2.toStringAsFixed(2);
        INR2 = double.tryParse(I2);

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
        U1 = USD1.toStringAsFixed(2);
        USD1 = double.tryParse(U1);
         U2 = USD2.toStringAsFixed(2);
        USD2 = double.tryParse(U2);

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        E1 = EUR1.toStringAsFixed(2);
        EUR1 = double.tryParse(E1);
        E2 = EUR2.toStringAsFixed(2);
        EUR2 = double.tryParse(E2);

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        G1 = GBP1.toStringAsFixed(2);
        GBP1 = double.tryParse(G1);
        G2 = GBP2.toStringAsFixed(2);
        GBP2 = double.tryParse(G2);

      }); }
    else if(currentUser.currency == "GBP") {
      var resultUSD = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: priceController.text ?? 0);
      var resultINR = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: priceController.text ?? 0);
      var resultEUR = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: priceController.text ?? 0);
      var resultUSD1 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: shipcost.text ?? 0);
      var resultINR1 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: shipcost.text ?? 0);
      var resultEUR1 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: shipcost.text ?? 0);
   var resultUSD2 = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: shipcostintern.text ?? 0);
      var resultINR2 = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: shipcostintern.text ?? 0);
      var resultEUR2 = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: shipcostintern.text ?? 0);

      setState(() {
        INR =  resultINR.rate?? 0.001;
        USD = resultUSD.rate ?? 0.001;
        EUR = resultEUR.rate  ?? 0.001;
        GBP =  price ?? 0.001;
        INR1 = resultINR1.rate ?? 0.001;
        USD1 = resultUSD1.rate ?? 0.001;
        EUR1 =  resultEUR1.rate  ?? 0.001;
        GBP1 = shipCost ?? 0.001;
        INR2 = resultINR2.rate ?? 0.001;
        USD2 = resultUSD2.rate ?? 0.001;
        EUR2 =  resultEUR2.rate  ?? 0.001;
        GBP2 = shipCostintern ?? 0.001;
        
        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
        INR1 = double.tryParse(I1);
         I2 = INR2.toStringAsFixed(2);
        INR2 = double.tryParse(I2);

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
        U1 = USD1.toStringAsFixed(2);
        USD1 = double.tryParse(U1);
         U2 = USD2.toStringAsFixed(2);
        USD2 = double.tryParse(U2);

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        E1 = EUR1.toStringAsFixed(2);
        EUR1 = double.tryParse(E1);
        E2 = EUR2.toStringAsFixed(2);
        EUR2 = double.tryParse(E2);

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        G1 = GBP1.toStringAsFixed(2);
        GBP1 = double.tryParse(G1);
         G2 = GBP2.toStringAsFixed(2);
        GBP2 = double.tryParse(G2);
        
      }); }
    else {
      var resultGBP = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: priceController.text ?? 0);
      var resultINR = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: priceController.text ?? 0);
      var resultEUR = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: priceController.text ?? 0);
      var resultEUR1 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: shipcost.text ?? 0);
      var resultINR1 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: shipcost.text ?? 0);
      var resultGBP1 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: shipcost.text ?? 0);
    var resultEUR2 = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: shipcostintern.text ?? 0);
      var resultINR2 = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: shipcostintern.text ?? 0);
      var resultGBP2 = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: shipcostintern.text ?? 0);

      setState(() {
        INR =  resultINR.rate?? 0.001;
        USD = price ?? 0.001;
        EUR = resultEUR.rate  ?? 0.001;
        GBP =   resultGBP.rate ?? 0.001;
        INR1 = resultINR1.rate ?? 0.001;
        USD1 = shipCost ?? 0.001;
        EUR1 =  resultEUR1.rate  ?? 0.001;
        GBP1 = resultGBP1.rate ?? 0.001;
        INR2 = resultINR2.rate ?? 0.001;
        USD2 = shipCostintern ?? 0.001;
        EUR2 =  resultEUR2.rate  ?? 0.001;
        GBP2 = resultGBP2.rate ?? 0.001;
        
        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
        I1 = INR1.toStringAsFixed(2);
        INR1 = double.tryParse(I1);
        I2 = INR2.toStringAsFixed(2);
        INR2 = double.tryParse(I2);

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
        U1 = USD1.toStringAsFixed(2);
        USD1 = double.tryParse(U1);
        U2 = USD2.toStringAsFixed(2);
        USD2 = double.tryParse(U2);

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        E1 = EUR1.toStringAsFixed(2);
        EUR1 = double.tryParse(E1);
         E2 = EUR2.toStringAsFixed(2);
        EUR2 = double.tryParse(E2);

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        G1 = GBP1.toStringAsFixed(2);
        GBP1 = double.tryParse(G1);
        G2 = GBP2.toStringAsFixed(2);
        GBP2 = double.tryParse(G2);

      }); }



  }
  Servicecatalog()async{
    setState(() {
      isUploading = true;
    });
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

    FirebaseFirestore.instance.collection('Resale')
        .doc(currentUser.id)
        .collection('userResale')
        .doc(resaleId)
        .set({
     "condition":condition,
      'ownerId':currentUser.id,
      'username':currentUser.displayName,
      'photoUrl':currentUser.photoUrl,
      'resaleId':resaleId,
      "worldship":worldship,
      "freeworldship":freeworldship,
      "freeship":freeship,
      "shipment": shipController.text,
      "color":colorController.text,
      "country":  currentUser.country,
      "currency":  currentUser.currency,
      "images":images,
      "usd": USD,
      "eur":EUR,
      "gbp":GBP,
      "inr": INR ,
       "shipcostusd": USD1,
      "shipcosteur":EUR1,
      "shipcostgbp":GBP1,
      "shipcostinr": INR1 ,
       "shipcostinternusd": USD2,
      "shipcostinterneur":EUR2,
      "shipcostinterngbp":GBP2,
      "shipcostinterninr": INR2 ,
      "round": USD ?? 0.0,

      "shipfrom":  int.tryParse(durationfrom.text) ?? 0,
      "shipto":  int.tryParse(durationto.text) ?? 0,
      "shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
      "shipinterto":  int.tryParse(durationtow.text) ?? 0,

      "likes": {},
      "timestamp": timestamp,

      'title':titleController.text,
      'description':detailsController.text,
      "Category": value,
      "Gender": dropdownValue,
      "size": sizeController.text,

    });

    setState(() {
      isUploading = false;
    });
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation : 0.001,
                      primary:  Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ), ),
                    child: Text(
                      "Select Image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    onPressed: ()  =>getImage1(),
                    // selectImage(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
  buildUploadScreen()  {
    return    ModalProgressHUD(
      inAsyncCall: isUploading,
      child: Scaffold(
        appBar:  AppBar(      backgroundColor: kPrimaryColor,

          title: FittedBox(
            fit:BoxFit.contain,
            child: Text('Upload ',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  // fontSize:  35.0 ,
                  color: Colors.white),),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
        ),

        body:
        Container(color:Cont,
          child: Stack(
            children:[
              Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      isUploading ? linearProgress() : Text(""),
                      Container(
                          height:160,
                          child:ListView(scrollDirection:Axis.horizontal,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: getImageWidget1(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: getImageWidget2(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: getImageWidget3(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: getImageWidget4(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: getImageWidget5(),
                                ),

                              ])),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          style:TextStyle(color:kText),
                          controller: titleController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText: 'Title',labelStyle: TextStyle(color: kText),
                            hintText: 'Title',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if ( text.isEmpty) {
                              return 'Title is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox( height: 8.0,),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          style:TextStyle(color:kText),

                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: detailsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText: 'Description',labelStyle: TextStyle(color: kText),
                            hintText: 'Description',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Description is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox( height: 8.0,),
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

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
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
                      ),
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
                      SizedBox( height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Condition"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: DropdownButton<String>(
                            value: condition,
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            iconSize: SizeConfig.safeBlockHorizontal *4,
                            elevation: 4,
                            style: TextStyle(color: kText,fontSize:SizeConfig.safeBlockHorizontal *4.5),

                            onChanged: (String newValu) {
                              setState(() {
                                condition = newValu;
                              });
                            },
                            items: <String>['Brand New - with Tags', 'Never Used', 'Barely used', 'Gently Used','Used',]
                                .map<DropdownMenuItem<String>>((String valu) {
                              return DropdownMenuItem<String>(
                                value: valu,
                                child: Text(valu),

                              );
                            }).toList(),
                          ),
                        ),
                      ),

Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          style:TextStyle(color:kText),

                          maxLines: null,
                          controller: sizeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText: 'Size',labelStyle: TextStyle(color: kText),
                            hintText: 'Size',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Size is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox( height: 8.0,),

                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          style:TextStyle(color:kText),

                          maxLines: null,
                          controller: colorController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText: 'Color',labelStyle: TextStyle(color: kText),
                            hintText: 'Color',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Color is empty';
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
                          controller: shipController,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Free shipping',style:TextStyle(color: kText)),
                      ) ,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Worldwide shipping',style:TextStyle(color: kText)),
                      ) ,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Free worldwide shipping',style:TextStyle(color: kText)),
                      ) ,

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
                      SizedBox( height: 8.0,),


                      Container(
                          margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation : 0.001,
                              primary:  Colors.black, ),
                            onPressed:() async{
                              Fluttertoast.showToast(
                                  msg: "Please wait:Uploading", timeInSecForIos: 4);


                              if(_formKey.currentState.validate()) {
                                // ignore: unnecessary_statements
                                await INRUSD();

                                isUploading == false && dropdownValue == "Select Category"? null:Servicecatalog();
                                Navigator.pop(context);
                              }

                            },
                            child: Text('Post', style: TextStyle(
                              // fontFamily :"MajorMonoDisplay",
                              //   fontSize:  ,
                                color: Colors.white),),
                          )
                      ),

                    ],
                  ),

                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return file1 == null ? buildSplashScreen() : buildUploadScreen();
  }

}
