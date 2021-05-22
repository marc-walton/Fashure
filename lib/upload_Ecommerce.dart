import 'dart:io';
import 'dart:async';
import 'package:fashow/Categories/BboyEcomUp.dart';
import 'package:fashow/Categories/BgirlEcomUp.dart';
import 'package:fashow/Categories/KboyEcomUp.dart';
import 'package:fashow/Categories/KgirlEcomUp.dart';
import 'package:fashow/Categories/MenEcomUp.dart';
import 'package:fashow/Categories/WomenEcomUp.dart';
import 'package:fashow/Categories/TboyEcomUp.dart';
import 'package:fashow/Categories/TgirlEcomUp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class Uploadecom extends StatefulWidget {
  final User currentUser;


  Uploadecom({this.currentUser});
  @override
  _UploadecomState createState() => _UploadecomState();
}

class _UploadecomState extends State<Uploadecom>
    with AutomaticKeepAliveClientMixin<Uploadecom> {
  String value = 'None';

 TabController _tabController;
  ScrollController _controller;
  TextEditingController detailsController = TextEditingController();
  TextEditingController productnameController = TextEditingController();
  TextEditingController compositionController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController washandcareController = TextEditingController();
  TextEditingController sizeandfitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController xxxscontroller = TextEditingController();
  TextEditingController xxscontroller = TextEditingController();
  TextEditingController xscontroller = TextEditingController();
  TextEditingController scontroller = TextEditingController();
  TextEditingController mcontroller = TextEditingController();
  TextEditingController lcontroller = TextEditingController();
  TextEditingController xlcontroller = TextEditingController();
  TextEditingController xxlcontroller = TextEditingController();
  TextEditingController xxxlcontroller = TextEditingController();
   TextEditingController fourxlcontroller = TextEditingController();
  TextEditingController fivexlcontroller = TextEditingController();
  TextEditingController sixxlcontroller = TextEditingController();
  TextEditingController sevenxlcontroller = TextEditingController();
  TextEditingController eightxlcontroller = TextEditingController();
  TextEditingController mtocontroller = TextEditingController();
  TextEditingController freesizecontroller = TextEditingController();
TextEditingController Shoe1controller = TextEditingController();
TextEditingController Shoe2controller = TextEditingController();
TextEditingController Shoe3controller = TextEditingController();
TextEditingController Shoe4controller = TextEditingController();
TextEditingController Shoe5controller = TextEditingController();
TextEditingController Shoe6controller = TextEditingController();
TextEditingController Shoe7controller = TextEditingController();
TextEditingController Shoe8controller = TextEditingController();
TextEditingController Shoe9controller = TextEditingController();
TextEditingController Shoe10controller = TextEditingController();
TextEditingController Shoe11controller = TextEditingController();
TextEditingController Shoe12controller = TextEditingController();
TextEditingController Shoe13controller = TextEditingController();
TextEditingController Shoe14controller = TextEditingController();
TextEditingController Shoe15controller = TextEditingController();
TextEditingController Shoe16controller = TextEditingController();
TextEditingController Shoe17controller = TextEditingController();
TextEditingController Shoe18controller = TextEditingController();
TextEditingController Shoe19controller = TextEditingController();
TextEditingController Shoe20controller = TextEditingController();
TextEditingController Shoe21controller = TextEditingController();
TextEditingController namecontroller = TextEditingController();

  File file;
  bool isUploading = false;
  String prodId = Uuid().v4();
  List<String> selectedSizes = <String>[];

  String dropdownValue = 'Women';

//  var colorOptions = ['Blue ', 'yellow', 'red','brown','pink','green','black','grey','white','Neutral',];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  var userprice;
  var inrtousd;
  var inrtocny;
  var inrtogbp;
  var inrtoeur;
  var usdtoinr;
  var usdtocny;
  var usdtogbp;
  var usdtoeur;
  var cnytoinr;
  var cnytousd;
  var cnytogbp;
  var cnytoeur;
  var gbptoinr;
  var gbptocny;
  var gbptousd;
  var gbptoeur;
  var eurtoinr;
  var eurtousd;
  var eurtocny;
  var eurtogbp;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
    // _tabController = TabController(length: 2,vsync: this);
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() { //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() { //you can do anything here
      });
    }
  }

  Widget getImageWidget() {
    if (file != null) {
      return Image.file(
        file,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/placeholder.jpg",
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
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
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  // handleTakePhoto() async {
  //   Navigator.pop(context);
  //   File file = await ImagePicker.pickImage(
  //     source: ImageSource.camera,
  //     maxHeight: 400,
  //     maxWidth: 600,
  //   );
  //   setState(() {
  //     this.file = file;
  //   });
  // }

  // handleChooseFromGallery() async {
  //   Navigator.pop(context);
  //   File file = await ImagePicker.pickImage(source: ImageSource.gallery,
  //     maxHeight: 400,
  //     maxWidth: 600,);
  //   setState(() {
  //     this.file = file;
  //   });
  // }

  selectImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed: () {
                getImage(ImageSource.camera);
                Navigator.pop(context);
              }),
              SimpleDialogOption(
                  child: Text("Image from Gallery"),
                  onPressed: () {
                    getImage(ImageSource.gallery);
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

  Container buildSplashScreen() {
    return Container(
      decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
      alignment: Alignment.center,
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
                  "Upload Product",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
                color: Colors.deepOrange,
                onPressed: ()  =>selectImage(),
              // selectImage(context),
            ),
          ),
        ],
      ),
    );
  }

  clearImage() {
    setState(() {
      file = null;
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
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    StorageUploadTask uploadTask =
    storageRef.child("prod_$prodId.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  void INRUSD() async {
    // final frankfurter = Frankfurter();
    //
    // final latest = await frankfurter.latest(from: Currency('EUR'));
    // latest.forEach(print);
    //
    // final rate = await frankfurter.getRate(
    //   from: Currency('EUR'),
    //   to: Currency('GBP'),
    // );
    if (currentUser.country == 'India') {
      var resultUSD = await Currency.getConversion(
          from: 'INR', to: 'USD', amount: priceController.text);
      // String date = result.date; // Returns the last updated date
      setState(() {


         inrtousd = resultUSD.rate;
         inrtousd = inrtousd.round();

         var usd = double.tryParse(priceController.text);
         userprice = usd.round();
      });

      print("$inrtousd");
      var resultGBP = await Currency.getConversion(
          from: 'INR', to: 'GBP', amount: priceController.text);
// Returns the last updated date
      setState(() {
        inrtogbp = resultGBP.rate;
        inrtogbp = inrtogbp.round();

      });

      print("$inrtogbp");
      var resultEUR = await Currency.getConversion(
          from: 'INR', to: 'EUR', amount:priceController.text);
setState(() {
  inrtoeur = resultEUR.rate;
  inrtoeur = inrtoeur.round();

});

      print("$inrtoeur");
      var resultCNY = await Currency.getConversion(
          from: 'INR', to: 'CNY', amount: priceController.text);
setState(() {
  inrtocny = resultCNY.rate;
   inrtocny = inrtocny.round();

});

      print("$inrtocny");
    }
    else if (currentUser.country == 'China') {
      var resultUSD = await Currency.getConversion(
          from: 'CNY', to: 'USD', amount: priceController.text);
      // String date = result.date; // Returns the last updated date
      setState(() {
        cnytousd = resultUSD.rate;
        cnytousd = cnytousd.round();

        var usd = double.tryParse(priceController.text);
        userprice = usd.round();
      });
      print("$cnytousd");
      var resultGBP = await Currency.getConversion(
          from: 'CNY', to: 'GBP', amount: priceController.text);
// Returns the last updated date
      setState(() {
        cnytogbp = resultGBP.rate;
         cnytogbp = cnytogbp.round();

      });
      print("$cnytogbp");
      var resultEUR = await Currency.getConversion(
          from: 'CNY', to: 'EUR', amount: priceController.text);
setState(() {
  cnytoeur = resultEUR.rate;
   cnytoeur = cnytoeur.round();

});

      print("$cnytoeur");
      var resultINR = await Currency.getConversion(
          from: 'CNY', to: 'INR', amount: priceController.text);
setState(() {
  cnytoinr = resultINR.rate;
  cnytoinr = cnytoinr.round();

});

      print("$cnytoinr");
    }
    else if (currentUser.country == 'Europe') {
      var resultUSD = await Currency.getConversion(
          from: 'EUR', to: 'USD', amount: priceController.text);
      // String date = result.date; // Returns the last updated date
      setState(() {
        eurtousd = resultUSD.rate;
        eurtousd = eurtousd.round();

        var usd = double.tryParse(priceController.text);
        userprice = usd.round();
      });

      print("$eurtousd");
      var resultGBP = await Currency.getConversion(
          from: 'EUR', to: 'GBP', amount: priceController.text);
// Returns the last updated date
      setState(() {
        eurtogbp = resultGBP.rate;
        eurtogbp = eurtogbp.round();

      });

      print("$eurtogbp");
      var resultCNY = await Currency.getConversion(
          from: 'EUR', to: 'CNY', amount: priceController.text);
setState(() {
  eurtocny = resultCNY.rate;
   eurtocny = eurtocny.round();

});

      print("$eurtocny");
      var resultINR = await Currency.getConversion(
          from: 'EUR', to: 'INR', amount: priceController.text);
setState(() {
  eurtoinr = resultINR.rate;
  eurtoinr = eurtoinr.round();

});

      print("$eurtoinr");
    }
    else if (currentUser.country == 'UK') {
      var resultUSD = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: priceController.text);
      // String date = result.date; // Returns the last updated date
      var resultEUR = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: priceController.text);
      var resultCNY = await Currency.getConversion(
          from: 'GBP', to: 'CNY', amount: priceController.text);
      var resultINR = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: priceController.text);

      setState(() {
        gbptousd = resultUSD.rate;
        // int usd = int.tryParse(gbptousd);
         gbptousd = gbptousd.round();
        var usd = double.tryParse(priceController.text);
          userprice = usd.round();
        gbptoeur = resultEUR.rate;
        gbptoeur = (gbptoeur).round();

        gbptocny = resultCNY.rate;
        gbptocny = gbptocny.round();
        gbptoinr = resultINR.rate;
        gbptoinr = gbptoinr.round();

        print("$gbptousd");
        print("$userprice");
        print("$gbptoeur");
        print("$gbptocny");
        print("$gbptoinr");


      });

// Returns the last updated date

    }
    else if (currentUser.country == 'USA') {
      var resultGBP = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: priceController.text);
      // String date = result.date; // Returns the last updated date
      setState(() {
        usdtogbp = resultGBP.rate;
         usdtogbp = usdtogbp.round();

        var usd = double.tryParse(priceController.text);
        userprice = usd.round();

      });

      print("$usdtogbp");
      var resultEUR = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: priceController.text);
// Returns the last updated date
      setState(() {
        usdtoeur = resultEUR.rate;
        usdtoeur = usdtoeur.round();


      });
      print("$usdtoeur");
      var resultCNY = await Currency.getConversion(
          from: 'USD', to: 'CNY', amount: priceController.text);
setState(() {
  usdtocny = resultCNY.rate;
  usdtocny = usdtocny.round();

});
      print("$usdtocny");
      var resultINR = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: priceController.text);
setState(() {
  usdtoinr = resultINR.rate;
  usdtoinr = usdtoinr.round();

});

      print("$usdtoinr");
    }
    else  {
      var resultGBP = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: priceController.text);
      // String date = result.date; // Returns the last updated date
      setState(() {
        usdtogbp = resultGBP.rate;
        usdtogbp = usdtogbp.round();

        var usd = double.tryParse(priceController.text);
        userprice = usd.round();

      });

      print("$usdtogbp");
      var resultEUR = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: priceController.text);
// Returns the last updated date
      setState(() {
        usdtoeur = resultEUR.rate;
        usdtoeur = usdtoeur.round();


      });
      print("$usdtoeur");
      var resultCNY = await Currency.getConversion(
          from: 'USD', to: 'CNY', amount: priceController.text);
      setState(() {
        usdtocny = resultCNY.rate;
        usdtocny = usdtocny.round();

      });
      print("$usdtocny");
      var resultINR = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: priceController.text);
      setState(() {
        usdtoinr = resultINR.rate;
        usdtoinr = usdtoinr.round();

      });

      print("$usdtoinr");
    }
  }

  createProdInFirestore(
      {String shopmediaUrl,
    String Category,
    var price,
    List selectedSizes,
    String details,
    String productname,

    String color,
    String composition,
    String washandcare,
    String sizeandfit,
    int freesizeQuantity,
    int xxxsQuantity,
      int xxsQuantity,
      int xsQuantity,
    int sQuantity,
    int mQuantity,
    int lQuantity,
    int xlQuantity,
    int xxlQuantity,
    int xxxlQuantity,
      int fourxlQuantity,
      int fivexlQuantity,
      int sixxlQuantity,
      int sevenxlQuantity,
      int eightxlQuantity,
  int Shoe1,
  int Shoe2,
  int Shoe3,
  int Shoe4,
  int Shoe5,
  int Shoe6,
  int Shoe7,
  int Shoe8,
  int Shoe9,
  int Shoe10,
  int Shoe11,
  int Shoe12,
  int Shoe13,
  int Shoe14,
  int Shoe15,
  int Shoe16,
  int Shoe17,
  int Shoe18,
  int Shoe19,
  int Shoe20,
  int Shoe21,
    int mtoQuantity,
    String gender,
    var inrtousd,
    var inrtocny,
    var inrtogbp,
    var inrtoeur,
    var usdtoinr,
    var usdtocny,
    var usdtogbp,
    var usdtoeur,
    var cnytoinr,
    var cnytousd,
    var cnytogbp,
    var cnytoeur,
    var gbptoinr,
    var gbptocny,
    var gbptousd,
    var gbptoeur,
    var eurtoinr,
    var eurtousd,
    var eurtocny,
    var eurtogbp,

  }) {
    if(dropdownValue=='Men'){
      if (currentUser.country == 'India') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": inrtousd.toString(),
          "cny": inrtocny.toString(),
          "gbp": inrtogbp.toString(),
          "eur": inrtoeur.toString(),
          "inr": price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,
          "Shoe17":Shoe17,
          "Shoe18":Shoe18,
          "Shoe19":Shoe19,
          "Shoe20":Shoe20,
          "Shoe21":Shoe21,
          "mtoQuantity": mtoQuantity,
          // "selectedSizes": selectedSizes,
          "likes": {},
        });



        setState(() {
          file = null;
          // isUploading = false;
        });
      }
      else if (currentUser.country == 'China') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": cnytousd.toString(),
          "cny": price.toString(),
          "gbp": cnytogbp.toString(),
          "eur": cnytoeur.toString(),
          "inr": cnytoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,
          "Shoe17":Shoe17,
          "Shoe18":Shoe18,
          "Shoe19":Shoe19,
          "Shoe20":Shoe20,
          "Shoe21":Shoe21,
          "mtoQuantity": mtoQuantity,
          "likes": {},
        });




        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'Europe'){
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": eurtousd.toString(),
          "cny": eurtocny.toString(),
          "gbp": eurtogbp.toString(),
          "eur": price.toString(),
          "inr": eurtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,
          "Shoe17":Shoe17,
          "Shoe18":Shoe18,
          "Shoe19":Shoe19,
          "Shoe20":Shoe20,
          "Shoe21":Shoe21,
          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'UK') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": gbptousd.toString(),
          "cny": gbptocny.toString(),
          "gbp": price.toString(),
          "eur": gbptoeur.toString(),
          "inr": gbptoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,
          "Shoe17":Shoe17,
          "Shoe18":Shoe18,
          "Shoe19":Shoe19,
          "Shoe20":Shoe20,
          "Shoe21":Shoe21,
          "mtoQuantity": mtoQuantity,
          "likes": {},
        });

        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'USA') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "usd" :price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,
          "Shoe17":Shoe17,
          "Shoe18":Shoe18,
          "Shoe19":Shoe19,
          "Shoe20":Shoe20,
          "Shoe21":Shoe21,
          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "usd" :price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,
          "Shoe17":Shoe17,
          "Shoe18":Shoe18,
          "Shoe19":Shoe19,
          "Shoe20":Shoe20,
          "Shoe21":Shoe21,
          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
    }
    else if(dropdownValue=='Women') {
      if (currentUser.country == 'India') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": inrtousd.toString(),
          "cny": inrtocny.toString(),
          "gbp": inrtogbp.toString(),
          "eur": inrtoeur.toString(),
          "inr": price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'China') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": cnytousd.toString(),
          "cny": price.toString(),
          "gbp": cnytogbp.toString(),
          "eur": cnytoeur.toString(),
          "inr": cnytoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'Europe'){
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": eurtousd.toString(),
          "cny": eurtocny.toString(),
          "gbp": eurtogbp.toString(),
          "eur": price.toString(),
          "inr": eurtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'UK') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": gbptousd.toString(),
          "cny": gbptocny.toString(),
          "gbp": price.toString(),
          "eur": gbptoeur.toString(),
          "inr": gbptoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });

        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'USA') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,
          "5xlQuantity": fivexlQuantity,
          "6xlQuantity": sixxlQuantity,
          "7xlQuantity": sevenxlQuantity,
          "8xlQuantity": eightxlQuantity,
          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,
          "Shoe15":Shoe15,
          "Shoe16":Shoe16,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
    }
    else if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
      if (currentUser.country == 'India') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": inrtousd.toString(),
          "cny": inrtocny.toString(),
          "gbp": inrtogbp.toString(),
          "eur": inrtoeur.toString(),
          "inr": price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,


        "Shoe1":Shoe1,
           "Shoe2":Shoe2,
           "Shoe3":Shoe3,
           "Shoe4":Shoe4,
           "Shoe5":Shoe5,
           "Shoe6":Shoe6,
           "Shoe7":Shoe7,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'China'){
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": cnytousd.toString(),
          "cny": price.toString(),
          "gbp": cnytogbp.toString(),
          "eur": cnytoeur.toString(),
          "inr": cnytoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,


          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'Europe') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": eurtousd.toString(),
          "cny": eurtocny.toString(),
          "gbp": eurtogbp.toString(),
          "eur": price.toString(),
          "inr": eurtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,


          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });

        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'UK') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": gbptousd.toString(),
          "cny": gbptocny.toString(),
          "gbp": price.toString(),
          "eur": gbptoeur.toString(),
          "inr": gbptoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,


          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'USA') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,


          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,


          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
    }
    else if(dropdownValue=='Kids-Boys'|| dropdownValue=='Kids-Girls') {
      if (currentUser.country == 'India') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": inrtousd.toString(),
          "cny": inrtocny.toString(),
          "gbp": inrtogbp.toString(),
          "eur": inrtoeur.toString(),
          "inr": price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'China') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": cnytousd.toString(),
          "cny": price.toString(),
          "gbp": cnytogbp.toString(),
          "eur": cnytoeur.toString(),
          "inr": cnytoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'Europe') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": eurtousd.toString(),
          "cny": eurtocny.toString(),
          "gbp": eurtogbp.toString(),
          "eur": price.toString(),
          "inr": eurtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'UK') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": gbptousd.toString(),
          "cny": gbptocny.toString(),
          "gbp": price.toString(),
          "eur": gbptoeur.toString(),
          "inr": gbptoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });




        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'USA') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,
          "mQuantity": mQuantity,
          "lQuantity": lQuantity,
          "xlQuantity": xlQuantity,
          "xxlQuantity": xxlQuantity,
          "xxxlQuantity": xxxlQuantity,
          "4xlQuantity": fourxlQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,
          "Shoe5":Shoe5,
          "Shoe6":Shoe6,
          "Shoe7":Shoe7,
          "Shoe8":Shoe8,
          "Shoe9":Shoe9,
          "Shoe10":Shoe10,
          "Shoe11":Shoe11,
          "Shoe12":Shoe12,
          "Shoe13":Shoe13,
          "Shoe14":Shoe14,

          "mtoQuantity": mtoQuantity,
          "likes": {},
        });


        setState(() {
          file = null;
          isUploading = false;
        });
      }
    }
    else if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
      if (currentUser.country == 'India') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": inrtousd.toString(),
          "cny": inrtocny.toString(),
          "gbp": inrtogbp.toString(),
          "eur": inrtoeur.toString(),
          "inr": price.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,


          "mtoQuantity": mtoQuantity,
          "likes": {},
        });

        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'China') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": cnytousd.toString(),
          "cny": price.toString(),
          "gbp": cnytogbp.toString(),
          "eur": cnytoeur.toString(),
          "inr": cnytoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,


          "mtoQuantity": mtoQuantity,
          "likes": {},
        });




        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'Europe'){
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": eurtousd.toString(),
          "cny": eurtocny.toString(),
          "gbp": eurtogbp.toString(),
          "eur": price.toString(),
          "inr": eurtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,


          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'UK') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": gbptousd.toString(),
          "cny": gbptocny.toString(),
          "gbp": price.toString(),
          "eur": gbptoeur.toString(),
          "inr": gbptoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,


          "mtoQuantity": mtoQuantity,
          "likes": {},
        });



        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else if (currentUser.country == 'USA') {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,


          "mtoQuantity": mtoQuantity,
          "likes": {},
        });




        setState(() {
          file = null;
          isUploading = false;
        });
      }
      else {
        productsRef
            .document(widget.currentUser.id)
            .collection("userProducts")
            .document(prodId)
            .setData({
          "prodId": prodId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "displayName": widget.currentUser.displayName,
          "shopmediaUrl": shopmediaUrl,
          "Category": Category,
          // "type":type,
          "Gender": gender,
          "details": details,
          "productname": productname,
          "usd": price.toString(),
          "cny": usdtocny.toString(),
          "gbp": usdtogbp.toString(),
          "eur": usdtoeur.toString(),
          "inr": usdtoinr.toString(),
          "color": color,
          "composition": composition,
          "washandcare": washandcare,
          "sizeandfit": sizeandfit,
          "timestamp": timestamp,
          "freesizeQuantity": freesizeQuantity,
          "xxxsQuantity": xxxsQuantity,
          "xxsQuantity": xxsQuantity,
          "xsQuantity": xsQuantity,
          "sQuantity": sQuantity,

          "Shoe1":Shoe1,
          "Shoe2":Shoe2,
          "Shoe3":Shoe3,
          "Shoe4":Shoe4,


          "mtoQuantity": mtoQuantity,
          "likes": {},
        });




        setState(() {
          file = null;
          isUploading = false;
        });
      }
    }


}
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit without uploading?'),
        actions: <Widget>[
          new FlatButton(

            onPressed: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new FlatButton(

            onPressed: () async {Navigator.of(context).pop(true);
//            await tag1Prefs.clear();
//            await tag2Prefs.clear();
//            await tag3prefs.clear();
//            await tag4Prefs.clear();
//            await tag5Prefs.clear();
            clearImage();
            },
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }

  handleSubmit() async {
    Fluttertoast.showToast(
        msg: "Please wait:Uploading", timeInSecForIos: 4);

    setState(() {
      isUploading = true;
    });
    Fluttertoast.showToast(
        msg: "Please wait:Uploading", timeInSecForIos: 4);

    await compressImage();
    String shopmediaUrl = await uploadImage(file);
    // await INRUSD();

     if(dropdownValue=='Men'){
      if (currentUser.country == 'India') {
        await createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          // selectedSizes: selectedSizes,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          inrtousd: inrtousd,
          inrtocny: inrtocny,
          inrtogbp: inrtogbp,
          inrtoeur: inrtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
          Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
          Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
          Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
          Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
          Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,




        );
      }
      else if (currentUser.country == 'China') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          // selectedSizes: selectedSizes,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          cnytoinr:cnytoinr,
          cnytousd:cnytousd,
          cnytogbp:cnytogbp,
          cnytoeur:cnytoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
          Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
          Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
          Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
          Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
          Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,

        );
      }
      else if (currentUser.country == 'Europe'){
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          // selectedSizes: selectedSizes,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          eurtoinr:eurtoinr,
          eurtousd:eurtousd,
          eurtocny:eurtocny,
          eurtogbp:eurtogbp,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
          Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
          Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
          Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
          Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
          Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,

        );
      }
      else if (currentUser.country == 'UK') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          // selectedSizes: selectedSizes,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          gbptoinr:gbptoinr,
           gbptocny:gbptocny,
          gbptousd:gbptousd,
          gbptoeur:gbptoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
          Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
          Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
          Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
          Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
          Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,


        );
      }
      else if (currentUser.country == 'USA') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          // selectedSizes: selectedSizes,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
           usdtocny:usdtocny,
           usdtogbp:usdtogbp,
           usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
          Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
          Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
          Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
          Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
          Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,

        );
      }
      else {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          // selectedSizes: selectedSizes,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
          Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
          Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
          Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
          Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
          Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,


        );
      }
      Navigator.pop(context);
    }
     if(dropdownValue=='Women'){
      if (currentUser.country == 'India') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          inrtousd: inrtousd,
          inrtocny: inrtocny,
          inrtogbp: inrtogbp,
          inrtoeur: inrtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


        );
            }
      else if (currentUser.country == 'China')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          cnytoinr:cnytoinr,
          cnytousd:cnytousd,
          cnytogbp:cnytogbp,
          cnytoeur:cnytoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


        );
    }
      else if (currentUser.country == 'Europe')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          eurtoinr:eurtoinr,
          eurtousd:eurtousd,
          eurtocny:eurtocny,
          eurtogbp:eurtogbp,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


        );
      }
      else if (currentUser.country == 'UK')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          gbptoinr:gbptoinr,
          gbptocny:gbptocny,
          gbptousd:gbptousd,
          gbptoeur:gbptoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


        );
      }
      else if (currentUser.country == 'USA')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


        );
      }
      else   {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
          fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
          sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
          sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
          eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
          Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
          Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


        );
      }
      Navigator.pop(context);
    }
     if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls'){
      if (currentUser.country == 'India') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          inrtousd: inrtousd,
          inrtocny: inrtocny,
          inrtogbp: inrtogbp,
          inrtoeur: inrtoeur,
          color: colorController.text,
          composition: compositionController.text ?? "",
          washandcare: washandcareController.text ?? "",
          sizeandfit: sizeandfitController.text ?? "",
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,
          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        
          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        



        );
            }
      else if (currentUser.country == 'China') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          cnytoinr:cnytoinr,
          cnytousd:cnytousd,
          cnytogbp:cnytogbp,
          cnytoeur:cnytoeur,
          color: colorController.text,
          composition: compositionController.text ?? "",
          washandcare: washandcareController.text ?? "",
          sizeandfit: sizeandfitController.text ?? "",
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,
          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,



        );
            }
      else if (currentUser.country == 'Europe') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          eurtoinr:eurtoinr,
           eurtousd:eurtousd,
          eurtocny:eurtocny,
           eurtogbp:eurtogbp,
          color: colorController.text,
          composition: compositionController.text ?? "",
          washandcare: washandcareController.text ?? "",
          sizeandfit: sizeandfitController.text ?? "",
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,
          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,


        );
      }
      else if (currentUser.country == 'UK')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          gbptoinr:gbptoinr,
          gbptocny:gbptocny,
          gbptousd:gbptousd,
          gbptoeur:gbptoeur,
          color: colorController.text,
          composition: compositionController.text ?? "",
          washandcare: washandcareController.text ?? "",
          sizeandfit: sizeandfitController.text ?? "",
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,
          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,

        );
      }
      else if (currentUser.country == 'USA') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text ?? "",
          washandcare: washandcareController.text ?? "",
          sizeandfit: sizeandfitController.text ?? "",
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,
          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,


        );
      }
      else {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text ?? "",
          washandcare: washandcareController.text ?? "",
          sizeandfit: sizeandfitController.text ?? "",
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,
          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,


        );
      }
      Navigator.pop(context);
    }
     if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls'){
      if (currentUser.country == 'India') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          inrtousd: inrtousd,
          inrtocny: inrtocny,
          inrtogbp: inrtogbp,
          inrtoeur: inrtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'China') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          cnytoinr:cnytoinr,
          cnytousd:cnytousd,
          cnytogbp:cnytogbp,
          cnytoeur:cnytoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'Europe'){
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          eurtoinr:eurtoinr,
          eurtousd:eurtousd,
          eurtocny:eurtocny,
          eurtogbp:eurtogbp,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'UK') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          gbptoinr:gbptoinr,
          gbptocny:gbptocny,
          gbptousd:gbptousd,
          gbptoeur:gbptoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'USA') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



        );
      }
      else{
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


          mQuantity:  int.tryParse(mcontroller.text) ?? 0,
          lQuantity:  int.tryParse(lcontroller.text) ?? 0,
          xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
          xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
          fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
          Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
          Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
          Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
          Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
          Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
          Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
          Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
          Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
          Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
          Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



        );
      }
      Navigator.pop(context);
    }
     if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls'){
      if (currentUser.country == 'India') {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          inrtousd: inrtousd,
          inrtocny: inrtocny,
          inrtogbp: inrtogbp,
          inrtoeur: inrtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'China')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          cnytoinr:cnytoinr,
          cnytousd:cnytousd,
          cnytogbp:cnytogbp,
          cnytoeur:cnytoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,




        );
      }
      else if (currentUser.country == 'Europe')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          eurtoinr:eurtoinr,
          eurtousd:eurtousd,
          eurtocny:eurtocny,
          eurtogbp:eurtogbp,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'UK')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          gbptoinr:gbptoinr,
          gbptocny:gbptocny,
          gbptousd:gbptousd,
          gbptoeur:gbptoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



        );
      }
      else if (currentUser.country == 'USA')  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity: int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



        );
      }
      else  {
        createProdInFirestore(
          shopmediaUrl: shopmediaUrl,
          Category: value,
          // type: value1 ,
          gender: dropdownValue,
          details: detailsController.text,
          productname: productnameController.text,
          price: userprice,
          usdtoinr:usdtoinr,
          usdtocny:usdtocny,
          usdtogbp:usdtogbp,
          usdtoeur:usdtoeur,
          color: colorController.text,
          composition: compositionController.text,
          washandcare: washandcareController.text,
          sizeandfit: sizeandfitController.text,
          xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
          xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
          xsQuantity:  int.tryParse(xscontroller.text )?? 0,
          sQuantity: int.tryParse(scontroller.text) ?? 0,

          mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
          freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
          Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
          Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
          Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
          Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,




        );
      }
      Navigator.pop(context);
    }

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
                      onChange: (state) => setState(() => value = state.value)
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
                onChange: (state) => setState(() => value = state.value)
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
        child: Container(
          height: 400,
          child:PhotoView(imageProvider: AssetImage
        ('assets/img/MenClothingsize.jpg')),),
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
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/WomanClothingsize.jpg'),

              ),),
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
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/babysizecloth.jpg')),),
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
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/kisclothsize.jpg')),),
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
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/teenclothing.jpg')),),
          );
      },
    );
   }

}
 AddSize(){
  if(dropdownValue=='Men') {
return
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return
          Column(
            children: [

              Expanded(
                child: Container(
                  // color: kPrimaryColor,
                  child: ContainedTabBarView(
                    tabs: [
                      Text('Clothing',style:TextStyle(color:Colors.black)),
                      Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                    ],
                    views: [
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
                            title: Text('3-1/2'),
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
                            title: Text('4-1/2'),
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
                            title: Text('5-1/2'),
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
                            title: Text('6-1/2'),
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
                            title: Text('7-1/2'),
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
                            title: Text('8-1/2'),
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
                            title: Text('9-1/2'),
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
                            title: Text('10-1/2'),
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
                            title: Text('11-1/2'),
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
                            title: Text('12-1/2'),
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
                            title: Text('13-1/2'),
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

                    ],
                    onChange: (index) => print(index),

                  ),
                ),
              ),

            ],
          );
      },
    );
  }
  else if(dropdownValue=='Women') {
    return
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return
          Column(
            children: [
              Expanded(
                child: Container(
                  // color: kPrimaryColor,
                  child: ContainedTabBarView(
                    tabs: [
                      Text('Clothing',style:TextStyle(color:Colors.black)),
                      Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                    ],
                    views: [
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
                            title: Text('5-1/2'),
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
                            title: Text('6-1/2'),
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
                            title: Text('7-1/2'),
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
                            title: Text('8-1/2'),
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
                            title: Text('9-1/2'),
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
                            title: Text('10-1/2'),
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
                            title: Text('15-1/2'),
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

                    ],
                    onChange: (index) => print(index),

                  ),
                ),
              ),
            ],
          );
      },
    );
  }
else  if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
    return
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return
          Column(
            children: [

              Expanded(
                child: Container(
                  // color: kPrimaryColor,
                  child: ContainedTabBarView(
                    tabs: [
                      Text('Clothing',style:TextStyle(color:Colors.black)),
                      Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                    ],
                    views: [
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

                    ],
                    onChange: (index) => print(index),

                  ),
                ),
              ),

            ],
          );

      },
    );
  }

  else if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls') {
    return
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return
            Column(
            children: [


              Expanded(
                child: Container(
                  // color: kPrimaryColor,
                  child: ContainedTabBarView(
                    tabs: [
                      Text('Clothing',style:TextStyle(color:Colors.black)),
                      Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                    ],
                    views: [
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
                          ExpansionTile(
                            title: Text('2'),
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
                            title: Text('3-4'),
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
                            title: Text('4-5'),
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
                            title: Text('5-6'),
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
                            title: Text('6-7'),
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
                            title: Text('7-8'),
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
                            title: Text('8-9'),
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
                            title: Text('9-10'),
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
                            title: Text('10-11'),
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
                            title: Text('11-12'),
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
                            title: Text('2 Y'),
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
                            title: Text('3 Y'),
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

                    ],
                    onChange: (index) => print(index),

                  ),
                ),
              ),

            ],
          );

      },
    );
  }

  else if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
    return
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return
          Column(
            children: [

              Expanded(
                child: Container(
                  // color: kPrimaryColor,
                  child: ContainedTabBarView(
                    tabs: [
                      Text('Clothing',style:TextStyle(color:Colors.black)),
                      Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
                    ],
                    views: [
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
                          ExpansionTile(
                            title: Text('13'),
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
                            title: Text('14'),
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
                            title: Text('15'),
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
                            title: Text('16'),
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
                            title: Text('13'),
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
                            title: Text('14'),
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
                            title: Text('15'),
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
                            title: Text('16'),
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

                    ],
                    onChange: (index) => print(index),

                  ),
                ),
              ),

            ],
          );

      },
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

  builduploadForm() {
    return WillPopScope
      (
      onWillPop: _onBackPressed,
      child: Scaffold(
        key:  scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: kSecondaryColor),
              onPressed:_onBackPressed),
          title: Text(
            "Product Details",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            FlatButton(
              onPressed: () async{
                Fluttertoast.showToast(
                    msg: "Please wait:Uploading", timeInSecForIos: 4);

                await INRUSD();
                if(_formKey.currentState.validate()) {
                  // ignore: unnecessary_statements
                  isUploading ? null : handleSubmit();
                  Navigator.pop(context);
                }

              },

              child: Text(
                "Post",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            )
          ],
        ),
        body: Container( decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
          alignment: Alignment.center,
          child: Stack(
            children:[
              Form(
              key: _formKey,
              child:
              Column(
                  children: <Widget>[
                  isUploading ? linearProgress() : Text(""),
   getImageWidget(),
                       Expanded(
                         child: SingleChildScrollView(
                           child: Column(
                      children: [

                  SizedBox(height: 8.0,),
                  Text('Select Gender',style:TextStyle(color: kText) ,),
                  SizedBox(height: 8.0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                    decoration:     BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                        dropdownColor: kPrimaryColor,
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: kText),
                        // underline: Container(
                        //     height: 2,
                        //     color: Colors.deepPurpleAccent,
                        // ),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                    child: RaisedButton(
                      color:kblue,
                    child: Text('Select Category',style:TextStyle(color: kText) ,),
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
                  value == 'None' ?   Text('Select Category',style:TextStyle(color: kText) ,):
                  Text(' ',),


                  SizedBox(height: 8.0,),
// AddSize(),
               Row(
                 mainAxisAlignment:MainAxisAlignment.center,
                    children:[
                   Container(
               // alignment:Alignment.centerLeft,
                     child:   FloatingActionButton.extended(
backgroundColor: kblue,
                       onPressed: ()=>AddSize(),
                       label: Text('Select Size',style:TextStyle(color: kText) ,),
                     ),
                   ),
      SizedBox(width: 8.0,),Container(
               // alignment:Alignment.centerRight,
                     child:   FloatingActionButton.extended(
backgroundColor: kblue,
                       onPressed: ()=>sizeGuide(),
                       label: Text('Size Guide',style:TextStyle(color: kText) ,),
                     ),
                   ),
   //                GestureDetector(
   //                  onTap: () {
   //                    sizeGuide();
   //
   //                  },
   //                  child:
   // Container(
   //  alignment:Alignment.centerRight,
   //
   //  child: ListTile(
   //
   //                    trailing: Column(children: [
   //                      FaIcon(FontAwesomeIcons.rulerCombined),
   //                      Text('Size Guide', style: TextStyle(color: kText),),
   //                    ],),
   //                  ),),
   //                ),
                    ],
                  ),
                  SizedBox(height: 8.0,),

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
                                  hintText: Country(),
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

                          controller: colorController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                labelText: 'Color',labelStyle: TextStyle(color: kText),
                                hintText: 'ex.Peach',
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


                       ],
                    ),
                         ),
                       ),

                    (_inProcess)?Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ):Center()
              ],
              ),




            ),
              (_inProcess)?Container(

                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ):Center(),
              isUploading ? Center(child:  CircularProgressIndicator()) : Text(""),
            ],
          ),
        ),
      ),
    );
  }


  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return file == null ? buildSplashScreen() : builduploadForm();
  }
}