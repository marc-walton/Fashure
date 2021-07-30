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
  String Skey  ="0";
  bool isUploading = false;
  String postId = Uuid().v4();
  List<File> images = <File>[];
   List<String> price = <String>[];
   List<String> description = <String>[];
 List<String> url = <String>[];
  int dropdownValue = 2;
  bool auction = false;
  List<TextEditingController> _controller = <TextEditingController>[];
  String image ;
  String inr ;
  var USD;

  String des ;
  String _error = 'No Error Dectected';

  List<String> imageUrls = <String>[];

  bool _inProcess = false;
  @override
  void initState() {
    super.initState();
auction = false;
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }
  clearImage() {
    setState(() {
      file = null;
      titleController.clear();
      desController.clear();

    });
  }
  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          ));

      this.setState(() {
        file = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
   modal();

  }
  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    if(auction == true){  bidsRef.doc(widget.currentUser.id)
        .collection("userBids")
        .doc(postId)
        .set({
    "uploaded":true,
    "bidTimer":1,
     "endingTime": "",
    "bidOn": false,
      "ownerId": widget.currentUser.id,
      "postId": postId,
      "username":currentUser.username,
      "photoUrl": currentUser.photoUrl,
    "country":currentUser.country,
    "currency":currentUser.currencyISO,
      "timestamp":timestamp,
  "hasEnded":false,
      "likes": {},

    });
    usersRef.doc(widget.currentUser.id).update({
      'Bidding':true,
    });
    }
  else {
      bidsRef.doc(widget.currentUser.id)
          .collection("userBids")
          .doc(postId)
          .set({
        "uploaded": true,
        "hasEnded":false,
        "bidTimer": dropdownValue,
        "endingTime": timestamp.add(Duration(hours: dropdownValue)),
        "bidOn": true,
        "ownerId": widget.currentUser.id,
        "postId": postId,
        "country":currentUser.country,
        "currency":currentUser.currencyISO,
        "timestamp":timestamp,
        "likes": {},

      });
      usersRef.doc(widget.currentUser.id).update({
        'Bidding':true,
      });
    }
Get.back();
    Fluttertoast.showToast(
        msg: "Upload successful", timeInSecForIos: 4);
  }
buildWidget(parentContext)  {

  SizeConfig().init(parentContext);

  return         WillPopScope(
    onWillPop: () => _onBackPressed(),
    child: ModalProgressHUD(
      inAsyncCall: isUploading,
      child: Scaffold(
        // resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () =>
              showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                  title: new Text('Are you sure?'),
                  content: new Text(
                      'Do you want to exit without uploading?'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () =>
                          Navigator.of(context).pop(false),
                      child: Text("NO"),
                    ),
                    SizedBox(height: 16),
                    new FlatButton(
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);
                        deletePost();

                        clearImage();
                      },
                      child: Text("YES"),
                    ),
                  ],
                ),
              ) ??
                  false),
          actions: [
            RaisedButton(
              color: Colors.transparent,
              onPressed: ()=> handleSubmit(),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Column(
            children: [
            Container(
            height:SizeConfig.screenHeight*0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(

                  onTap: () {
                    selectImage(parentContext);
                  },
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    size: SizeConfig.screenHeight*0.1,
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: [
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
                    Text("Manually start timer?"),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text('No'),
                        SizedBox( width: 8.0,),

                        Switch(
                          value: auction,
                          onChanged: (value){setState(() {
                            auction = value;
                            auction?   alert(
                              context,
                              title: Text('To start the auction timer'),

                              content: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Click on  ",style: TextStyle(color: Colors.black)
                                    ),
                                    WidgetSpan(
                                      child: Icon(FrinoIcons.f_gavel),
                                    ),
                                    TextSpan(
                                        text: "    in FashureTV page" ,style: TextStyle(color: Colors.black)
                                    ),
                                  ],
                                ),
                              ),


                              textOK: Text("OK",
                              ),
                            ):Container();
                          });},
                          activeColor: Colors.blue,
                          activeTrackColor:kPrimaryColor,
                        ),
                        SizedBox( width: 8.0,),

                        Text('Yes')
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),

              Container(
                  height:SizeConfig.screenHeight*0.65,
                  child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {

                    if (images.isEmpty) {
                      print("empty");
                      return Container();
                    }
                    else{
                      print("exists");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: SizeConfig.screenHeight * 0.4,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(20.0),
                                child: Stack(
                                  children: [
                                    Image.file(
                                        images[index]),
                                    Positioned(
                                      top: 10.0,
                                      right: 10.0,
                                      child: FloatingActionButton(
                                        mini: true,
                                        backgroundColor: kText
                                            .withOpacity(0.5),
                                        onPressed: singleDelete,
                                        child: Icon(Icons.delete,
                                          color: Colors.red,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                SizeConfig.blockSizeVertical * 2),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text("Opening bid:",
                                    style: TextStyle(
                                        fontWeight: FontWeight
                                            .bold)),
                                Text("${currentUser
                                    .currencysym} ${price[index]}"),
                              ],
                            ),
                            SizedBox(
                                height:
                                SizeConfig.blockSizeVertical * 2),
                            Row(
                              children: [
                                Text("Description:",
                                    style: TextStyle(
                                        fontWeight: FontWeight
                                            .bold)),
                                Text("${description[index]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.fade,),


                              ],
                            ),


                          ],
                        ),
                      );

                    }
                  }),





              ),          ],
          ),

          ),
        ),
      ),
    ),
  );

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
                  deletePost();
           clearImage();
                },
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
  Widget getImageWidget() {
    SizeConfig().init(context);

    if (file != null) {
      return ClipRRect(
          borderRadius: BorderRadius.only( bottomLeft:Radius.circular(20.0), bottomRight:Radius.circular(20.0)),

    child: Image.file(
          file,
          width: SizeConfig.blockSizeHorizontal *100,
          height: SizeConfig.blockSizeVertical *50,
          fit: BoxFit.cover,
        ),
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
            title: Text("Select Image"),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text("Photo with Camera"),
                  onPressed: () {
                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  }),
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: () {
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
  uploadimage()async{
    setState(() {
      images.add(file);
price.add(titleController.text);
description.add(desController.text);

      Skey = titleController.text;
      isUploading = true;
    });
    String U;
    Get.back();
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

    await compressImage();
    String mediaUrl = await uploadImage(file);

    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    bidsRef
        .doc(widget.currentUser.id)
        .collection("userBids")
        .doc(postId)
        .collection("Items")
        .doc(fileName)
        .set({
      "images":mediaUrl,
      "inr":int.tryParse(titleController.text),
      "usd":USD,
      "description":desController.text,
      "postId":postId,
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
      "docId":fileName,
      "minimumBid":10

    });

clearImage();
    
    setState(() {
      url.add(mediaUrl);
      isUploading = false;
    });
  }
modal(){
  showMaterialModalBottomSheet(

    expand: true,
    context: context,
    builder: (BuildContext context) {
      SizeConfig().init(context);
      file != null ?
null:Navigator.pop(context);
      return
        Scaffold(

          resizeToAvoidBottomInset: true,
          appBar: AppBar(backgroundColor: Colors.black,),
          body:
              SingleChildScrollView(
                child:    Expanded(
                child: Form(
                  key:_formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getImageWidget(),
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

                      Container(
                        // alignment:Alignment.centerLeft,
                        child:   FloatingActionButton.extended(
                          backgroundColor: kblue,
                          onPressed: (){
                            if(_formKey.currentState.validate()) {
                              // ignore: unnecessary_statements
                              setState(() {
                                Skey = titleController.text;
                              });
                              uploadimage();
                            }
                            else {          _formKey.currentState.validate()? Container(): Fluttertoast.showToast(
                                msg: "Fill the required fields " , timeInSecForIos: 4);}
                          },
                          label: Text('Done',style:TextStyle(color:  Colors.white) ,),
                        ),
                      ),
                    ],
                  ),
                )),
              ),

        );
    },
  );}
  Future<String> uploadImage(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    UploadTask uploadTask =
        storageRef.child("bidnow${postId}")
            .child("$fileName.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  deletePost() async {
    var collection =
    bidsRef
        .doc(widget.currentUser.id)
        .collection("userBids")
        .doc(postId)
        .collection("Items");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
    // delete post itself
    bidsRef
        .doc(widget.currentUser.id)
        .collection("userBids")
        .doc(postId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });

    for ( var imageFile in url) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}

  }
singleDelete({String id}) async {

  var docReference =  bidsRef
      .doc(widget.currentUser.id)
      .collection("userBids")
      .doc(postId)
      .collection("Items")
      .doc(id);
  docReference.delete();

}


  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildWidget(context);
  }
}


