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

import 'package:uuid/uuid.dart';
import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

class ReqPay extends StatefulWidget {
  final String reciever;
final String recievername;
final String recieverUrl;

  const ReqPay({Key key, this.reciever,this.recievername,this.recieverUrl}) : super(key: key);

  @override
  _ReqPayState createState() => _ReqPayState();
}

class _ReqPayState extends State<ReqPay>
    with AutomaticKeepAliveClientMixin<ReqPay>{
String orderId = Uuid().v4();
bool isUploading = false;
List<String> images = <String>[];
final scaffoldKey = new GlobalKey<ScaffoldState>();
final _formKey = GlobalKey<FormState>();
bool _inProcess = false;
  TextEditingController detailsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController totalController = TextEditingController();

var advancePrice;
var totalPrice;
var USD;
var GBP;
var EUR;
var INR;
var USDF;
var GBPF;
var EURF;
var INRF;
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
  final compressedImageFile = File('$path/img1_$orderId.jpg')
    ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
  if (!mounted) return; setState(() {
    file1 = compressedImageFile;
  });
}
compressImage2() async {
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  Im.Image imageFile = Im.decodeImage(file2.readAsBytesSync());
  final compressedImageFile = File('$path/img2_$orderId.jpg')
    ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
  if (!mounted) return; setState(() {
    file2 = compressedImageFile;
  });
}
compressImage3() async {
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  Im.Image imageFile = Im.decodeImage(file3.readAsBytesSync());
  final compressedImageFile = File('$path/img3_$orderId.jpg')
    ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
  if (!mounted) return; setState(() {
    file3 = compressedImageFile;
  });
}
compressImage4() async {
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  Im.Image imageFile = Im.decodeImage(file4.readAsBytesSync());
  final compressedImageFile = File('$path/img4_$orderId.jpg')
    ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
  if (!mounted) return; setState(() {
    file4 = compressedImageFile;
  });
}
compressImage5() async {
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  Im.Image imageFile = Im.decodeImage(file5.readAsBytesSync());
  final compressedImageFile = File('$path/img5_$orderId.jpg')
    ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
  if (!mounted) return; setState(() {
    file5 = compressedImageFile;
  });
}
Future<String> uploadImage1(imageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference reference = FirebaseStorage.instance.ref().child("Freelance${orderId}").child("$fileName.jpg");
  UploadTask uploadTask = reference.putFile(imageFile);

  TaskSnapshot storageSnap = await uploadTask;
  String downloadUrl = await storageSnap.ref.getDownloadURL();
  
 images.add(downloadUrl);
 return downloadUrl;
}
Future<String> uploadImage2(imageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference reference = FirebaseStorage.instance.ref().child("Freelance${orderId}").child("$fileName.jpg");
  UploadTask uploadTask = reference.putFile(imageFile);

  TaskSnapshot storageSnap = await uploadTask;
  String downloadUrl = await storageSnap.ref.getDownloadURL();
 images.add(downloadUrl);
 return downloadUrl;
}
Future<String> uploadImage3(imageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference reference = FirebaseStorage.instance.ref().child("Freelance${orderId}").child("$fileName.jpg");
  UploadTask uploadTask = reference.putFile(imageFile);

  TaskSnapshot storageSnap = await uploadTask;
  String downloadUrl = await storageSnap.ref.getDownloadURL();
 images.add(downloadUrl);
 return downloadUrl;
}
Future<String> uploadImage4(imageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference reference = FirebaseStorage.instance.ref().child("Freelance${orderId}").child("$fileName.jpg");
  UploadTask uploadTask = reference.putFile(imageFile);

  TaskSnapshot storageSnap = await uploadTask;
  String downloadUrl = await storageSnap.ref.getDownloadURL();
 images.add(downloadUrl);
 return downloadUrl;
}
Future<String> uploadImage5(imageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference reference = FirebaseStorage.instance.ref().child("Freelance${orderId}").child("$fileName.jpg");
  UploadTask uploadTask = reference.putFile(imageFile);

  TaskSnapshot storageSnap = await uploadTask;
  String downloadUrl = await storageSnap.ref.getDownloadURL();
 images.add(downloadUrl);
 return downloadUrl;
}
void INRUSD() async {
  setState(() {
    isUploading = true;
    advancePrice = double.tryParse(advanceController.text ?? "0.0");
    totalPrice = double.tryParse(totalController.text ??"0.0");

  });
  if(currentUser.currency == "INR") {
    var resultUSD = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: advanceController.text ?? 0);
    var resultEUR = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: advanceController.text ?? 0);
    var resultGBP = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: advanceController.text ?? 0);
 var resultUSDF = await Currency.getConversion(
        from: 'INR', to: 'USD', amount: totalController.text ?? 0);
    var resultEURF = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: totalController.text ?? 0);
    var resultGBPF = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: totalController.text ?? 0);

    setState(() {
      INR = advancePrice ?? 0.00001;
      USD = resultUSD.rate ?? 0.00001;
      EUR = resultEUR.rate ?? 0.00001;
      GBP = resultGBP.rate ?? 0.00001;
  INRF = totalPrice ?? 0.00001;
      USDF = resultUSDF.rate ?? 0.00001;
      EURF = resultEURF.rate ?? 0.00001;
      GBPF = resultGBPF.rate ?? 0.00001;

    }); }
  else if(currentUser.currency == "EUR") {
    var resultUSD = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: advanceController.text ?? 0);
    var resultINR = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: advanceController.text ?? 0);
    var resultGBP = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: advanceController.text ?? 0);
 var resultUSDF = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: totalController.text ?? 0);
    var resultINRF = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: totalController.text ?? 0);
    var resultGBPF = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: totalController.text ?? 0);

    setState(() {
      INR =  resultINR.rate?? 0.00001;
      USD = resultUSD.rate ?? 0.00001;
      EUR = advancePrice ?? 0.00001;
      GBP = resultGBP.rate ?? 0.00001;
  INRF = resultINRF.rate ?? 0.00001;
      USDF = resultUSDF.rate ?? 0.00001;
      EURF =  totalPrice ?? 0.00001;
      GBPF = resultGBPF.rate ?? 0.00001;

    }); }
  else if(currentUser.currency == "GBP") {
    var resultUSD = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: advanceController.text ?? 0);
    var resultINR = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: advanceController.text ?? 0);
    var resultEUR = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: advanceController.text ?? 0);
 var resultUSDF = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: totalController.text ?? 0);
    var resultINRF = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: totalController.text ?? 0);
    var resultEURF = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: totalController.text ?? 0);

    setState(() {
      INR =  resultINR.rate?? 0.00001;
      USD = resultUSD.rate ?? 0.00001;
      EUR = resultEUR.rate  ?? 0.00001;
      GBP =  advancePrice ?? 0.00001;
  INRF = resultINRF.rate ?? 0.00001;
      USDF = resultUSDF.rate ?? 0.00001;
      EURF =  resultEURF.rate  ?? 0.00001;
      GBPF = totalPrice ?? 0.00001;

    }); }
else {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: advanceController.text ?? 0);
    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: advanceController.text ?? 0);
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: advanceController.text ?? 0);
 var resultEURF = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: totalController.text ?? 0);
    var resultINRF = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: totalController.text ?? 0);
    var resultGBPF = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: totalController.text ?? 0);

    setState(() {
      INR =  resultINR.rate?? 0.00001;
      USD = advancePrice ?? 0.00001;
      EUR = resultEUR.rate  ?? 0.00001;
      GBP =   resultGBP.rate ?? 0.00001;
  INRF = resultINRF.rate ?? 0.00001;
      USDF = totalPrice ?? 0.00001;
      EURF =  resultEURF.rate  ?? 0.00001;
      GBPF = resultGBPF.rate ?? 0.00001;

    }); }



}
currency(){
  return
    Column(
        children:[
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
            child: TextFormField(
              style:TextStyle(color:kText),

              keyboardType: TextInputType.number,
              maxLines: null,
              controller: advanceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                labelText: 'Advance Payment',labelStyle: TextStyle(color: kText),
                hintText:
                currentUser.currency == "INR"?'₹':
                currentUser.currency == "EUR"?'€':
                currentUser.currency == "GBP"?'£':'\u0024',
              ),
              textAlign: TextAlign.center,
              validator: (text) {
                if (text.isEmpty) {
                  return 'Advance Payment is empty';
                }
                return null;
              },
            ),
          ),
          SizedBox( height: 8.0,),
          Text('If one-time payment.Leave payment on delivery empty', style: TextStyle(
            // fontFamily :"MajorMonoDisplay",
            // fontSize:  35.0 ,
              color: Colors.red),),

          Container(
            margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
            child: TextFormField(
              style:TextStyle(color:kText),
              keyboardType: TextInputType.number,

              maxLines: null,
              controller: totalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                labelText: 'Payment on delivery',labelStyle: TextStyle(color: kText),
                hintText:
                currentUser.currency == "INR"?'₹':
                currentUser.currency == "EUR"?'€':
                currentUser.currency == "GBP"?'£':'\u0024',
              ),
              textAlign: TextAlign.center,
              // validator: (text) {
              // if (text.isEmpty) {
              // return 'Final Payment is empty';
              // }
              // return null;
              // },
            ),
          ),
        ]
    );

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

    FirebaseFirestore.instance.collection('serviceCustomer')
        .doc(widget.reciever)
        .collection('customerService')
        .doc(orderId)
        .set({
      'cusId':widget.reciever,
      'cusname':widget.recievername,
      "cusProfileImg": widget.recieverUrl,
      'ownerId':currentUser.id,
      'username':currentUser.displayName,
      'photoUrl':currentUser.photoUrl,
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      'country':currentUser.country,
"images":images,
      "usd": USD,
      "eur":EUR,
      "gbp":GBP,
      "inr": INR ,
      "Fusd": USDF,
      "Feur":EURF,
      "Fgbp":GBPF,
      "Finr": INRF,
      "timestamp": timestamp,

      // 'advance':advanceController.text,
      // 'final':totalController.text ?? "0",
      'title':titleController.text,
      'description':detailsController.text,
      'advancepay':'false',
      'finalpay':'false',
    });
    FirebaseFirestore.instance.collection('serviceSeller')
        .doc(currentUser.id)
        .collection('sellerService')
        .doc(orderId)
        .set({
      'cusId':widget.reciever,
      'cusname':widget.recievername,
      "cusProfileImg": widget.recieverUrl,
      'ownerId':currentUser.id,
      'username':currentUser.displayName,
      'photoUrl':currentUser.photoUrl,
      'orderId':orderId,
      'fulfilled':'false',
      'orderStatus':'Processing',
      "images":images,

      'country':currentUser.country,
      "usd": USD,
      "eur":EUR,
      "gbp":GBP,
      "inr": INR ,
      "Fusd": USDF,
      "Feur":EURF,
      "Fgbp":GBPF,
      "Finr": INRF,
      "timestamp": timestamp,

      // 'final':totalController.text ?? "0",
      'title':titleController.text,
      'description':detailsController.text,    'a'
          'dvancepay':'false',
      'finalpay':'false',

    });
    FirebaseFirestore.instance.collection('feed')
        .doc(currentUser.id)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "ReqPaymentI",
      "username": widget.recievername,
      "userId": widget.reciever,
      "userProfileImg": widget.recieverUrl,

      "postId": orderId,
      "mediaUrl": images.first,
      "timestamp": timestamp,
      "read": 'false',
      'message':'Your invoice has been sent!',
    });
    FirebaseFirestore.instance.collection('feed')
        .doc(widget.reciever)
        .collection('feedItems')
        .doc(orderId)
        .set({
      "type": "ReqPayment",
      "username": currentUser.displayName,
      "userId": currentUser.id,
      "userProfileImg": currentUser.photoUrl,
      "postId": orderId,
      "mediaUrl": images.first,
      "timestamp": timestamp,
      "read": 'false',
      'message':'You received an order invoice!',
    });
    // Navigator.pop(context);
  setState(() {
    isUploading = false;
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation : 0.1,
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
          child: Text('Create new  invoice',
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
                    Divider(color: kGrey,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Payment', style: TextStyle(
                          fontSize:  15.0 ,
                          color: Colors.black),),
                    ),
                    currency(),

                    Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation : 0.1,
                            primary:  Colors.black, ),
                          onPressed:() async{
                            Fluttertoast.showToast(
                                msg: "Please wait:Uploading", timeInSecForIos: 4);


                            if(_formKey.currentState.validate()) {
                              // ignore: unnecessary_statements
                              await INRUSD();

                              isUploading ? Servicecatalog():null;
                              Navigator.pop(context);
                            }

                          },
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              Text('Send Invoice', style: TextStyle(
                                // fontFamily :"MajorMonoDisplay",
                                //   fontSize:  ,
                                  color: Colors.white),),
                            ],
                          ),
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
