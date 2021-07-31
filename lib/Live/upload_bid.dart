import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:fashow/Live/models/bid_items.dart';
import 'package:frino_icons/frino_icons.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
import 'package:fashow/size_config.dart';

class Upload_bid extends StatefulWidget {
  final Users currentUser;

  final GlobalKey<ScaffoldState> globalKey;

  Upload_bid({this.currentUser, this.globalKey});
  @override
  _Upload_bidState createState() => _Upload_bidState();
}

class _Upload_bidState extends State<Upload_bid>
    with AutomaticKeepAliveClientMixin<Upload_bid> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  File file;
  final _formKey = GlobalKey<FormState>();
  bool isUploading = false;
  String postId = Uuid().v4();
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  int dropdownValue = 2;
  var USD;
String U;
  List<String> imageUrls = <String>[];



  bool _inProcess = false;
  @override

  Future<void> loadAssets() async {

    List<Asset> resultList = List<Asset>();
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
      print(resultList.length);
      print((await resultList[0].getThumbByteData(122, 100)));
      print((await resultList[0].getByteData()));
      print((await resultList[0].metadata));

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
      _error = error;
    });

  }
  buildSplashScreen() {
    return
      ModalProgressHUD(
        inAsyncCall: _inProcess,
        child: Scaffold(
          body: Container(
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
                      "Select images",
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

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("postnow${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }
  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    if(currentUser.countryISO == "US"){
      var usd;


      setState(() {
        usd = titleController.text;
        U = usd.toStringAsFixed(2);
        USD =  double.tryParse(U);
      });
    }
    else{
      var resultUSD = await Currency.getConversion(
          from: '${currentUser.currencyISO}', to: 'USD', amount: titleController.text);
      var usd;
      setState(() {
        usd = resultUSD.rate;
        U = usd.toStringAsFixed(2);
        USD =  double.tryParse(U);
      });
    }
    for ( var imageFile in images) {
      postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if(imageUrls.length==images.length){
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
          bidsRef.doc(widget.currentUser.id)
              .collection("userBids")
              .doc(postId)
              .set({
            "hasEnded":false,
            "bidTimer": dropdownValue,
            "endingTime": timestamp.add(Duration(hours: dropdownValue)),
            "ownerId": widget.currentUser.id,
            "postId": postId,
            "country":currentUser.country,
            "currency":currentUser.currencyISO,
            "timestamp":timestamp,
            "inr":int.tryParse(titleController.text),
            "usd":USD,
            "description":desController.text,
            "topBid1":"",
            "topBid2":"",
            "topBid3":"",
            "topBidder1":"",
            "topBidder2":"",
            "topBidder3":"",
            "topBidderImg1":"",
            "topBidderImg2":"",
            "topBidderImg3":"",
            "topBidderId1":"",
            "topBidderId2":"",
            "topBidderId3":"",
            "amount":0,
            "minimumBid":10,
"images":imageUrls,
            "likes": {},

          }).then((_){
            SnackBar snackbar = SnackBar(content: Text('Uploaded Successfully'));
            widget.globalKey.currentState.showSnackBar(snackbar);
            setState(() {
              images = [];
              imageUrls = [];
            });
          });
        }
      }).catchError((err) {
        print(err);
        print('rtherjhertjnherj${imageUrls.length}');
        print('rjertertj${images.length}');

      });
    }
    Navigator.pop(context);

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

            onPressed: () async {
              Navigator.of(context).pop(true);
 Navigator.of(context).pop(true);

//            clearImage();
            },
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }
  Widget getImageWidget() {
    if (file != null) {
      return Image.file(
        file,
        width: 400,
        height: 500,
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


  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
//            shape: ,
            title: Text("Create Post"),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed:() {
                getImage(ImageSource.camera);
                Navigator.pop(context);
              }),
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed:  () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }


  Future<String> uploadImage(imageFile) async {
    UploadTask uploadTask =
    storageRef.child("bid_$postId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({String mediaUrl, String location, String description}) {
    postsRef
        .doc(widget.currentUser.id)
        .collection("userPosts")
        .doc(postId)
        .set({
      "postId": postId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.displayName,
      "mediaUrl": mediaUrl,
      "description": description,
      "location": location,
      "timestamp": timestamp,
      "likes": {},
    });

    setState(() {
      file = null;
//      isUploading = false;1111
    });
  }
  builduploadForm() {
    this.setState(() {
      _inProcess = false;
    });
    final form =
    SingleChildScrollView(
      child:    Expanded(
          child: Form(
            key:_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                carousel(),
                SizedBox(height:SizeConfig.blockSizeVertical*2),
                Container(
                  height:SizeConfig.screenHeight*0.1,
                  width:SizeConfig.screenWidth*0.5,

                  child: DropDownFormField(

                    titleText: '',
                    hintText: 'Auction timer',
                    value: dropdownValue,
                    onSaved: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    dataSource: [
                      {
                        "display": "2 Hours",
                        "value": 2,
                      },
                      {
                        "display": "4 Hours",
                        "value": 4,
                      },
                      {
                        "display": "6 Hours",
                        "value": 6,
                      },
                      {
                        "display": "8 Hours",
                        "value": 8,
                      },
                      {
                        "display": "10 Hours",
                        "value": 10,
                      }, {
                        "display": "12 Hours",
                        "value": 12,
                      }, {
                        "display": "1 Day",
                        "value": 24,
                      },
                      {
                        "display": "2 Days",
                        "value": 48,
                      },
                      {
                        "display": "3 Days",
                        "value": 72,
                      },
                      {
                        "display": "4 Days",
                        "value": 96,
                      },
                      {
                        "display": "5 Days",
                        "value": 120,
                      },
                      {
                        "display": "6 Days",
                        "value": 144,
                      },
                      {
                        "display": "7 Days",
                        "value": 168,
                      },
                      {
                        "display": "8 Days",
                        "value": 192,
                      },
                      {
                        "display": "9 Days",
                        "value": 216,
                      },
                      {
                        "display": "10 Days",
                        "value": 240,
                      },

                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),

SizedBox(height:SizeConfig.blockSizeVertical*2),

                Container(
                  width: SizeConfig.blockSizeHorizontal*95,
                  child: TextFormField(
                    style:TextStyle(color: kText),
                    keyboardType: TextInputType.number,
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Price is empty';
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      labelText: "Price",
                      hintText: "${currentUser.currencysym}", ),
                  ),
                ),
                SizedBox(height:SizeConfig.blockSizeVertical*2),

                Container(
                  width: SizeConfig.blockSizeHorizontal*95,
                  child: TextFormField(
                    style:TextStyle(color: kText),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Description is empty';
                      }
                      return null;
                    },
                    controller: desController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      labelText: "Description",
                    ),
                  ),
                ),
                SizedBox(height:SizeConfig.blockSizeVertical*2),

              ],
            ),
          )),
    );
    return
      Container(
        child: WillPopScope(
          onWillPop:()=>   _onBackPressed(),
          child: ModalProgressHUD(
            inAsyncCall: isUploading,
            child: Scaffold(

              // resizeToAvoidBottomPadding: true,
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed:()=>  showDialog(
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

//            clearImage();
                            },
                            child: Text("YES"),
                          ),
                        ],
                      ),
                    ) ??
                        false),
                actions: [
                  RaisedButton(color:kblue,
                    onPressed:(){

                      if(images.isNotEmpty){                      isUploading ? null : handleSubmit();
                      }
                      else{

                        alert(
                          context,
                          // title: Text('Coming Soon'),
                          content: Text("Coming Soon",
                          ),

                          textOK: Text("OK",
                          ),
                        );
                      }
                    }
                    ,

                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
              body:

              Container(

                decoration: BoxDecoration(
                    gradient: fabGradient
                ) ,
                //alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: form,
                ),
              ),

            ),
          ),

        ),
      );


  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return images.isEmpty?buildSplashScreen():  builduploadForm();
  }
}

