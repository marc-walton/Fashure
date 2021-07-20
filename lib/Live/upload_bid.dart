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
List <Widget>listOfImages = <Widget>[];
List <Widget>listOfPrice = <Widget>[];
List <Widget>listOfDes = <Widget>[];
int dropdownValue = 2;
bool auction;
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
  List<Asset> images = List<Asset>();
  List<TextEditingController> _controller = <TextEditingController>[];
  String image ;
  String inr ;

  String des ;
  String _error = 'No Error Dectected';

  List<String> imageUrls = <String>[];

  bool _inProcess = false;
  @override
  void initState() {
    super.initState();
    bidsRef
        .doc(widget.currentUser.id)
        .collection("userBids")
        .doc(postId)

        .set({
      "uploaded":false,
 "postId":postId,
 "ownerId":currentUser.id,
 "country":currentUser.country,
 "currency":currentUser.currencyISO,


    });
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

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
//    ByteData byteData = await asset.getByteData(quality: 80);
    try {
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
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _inProcess = true;
      images = resultList;
      _error = error;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("bidnow${postId}")
        .child("$fileName.jpg");
    UploadTask uploadTask = reference.putData(
        (await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }

  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    print(_controller);
    List<String> textList = _controller.map((x) => x.text).toList();
    print(textList);

  }
ip()
{
  for (var imageFile in images) {
    postImage(imageFile).then((downloadUrl) {
      imageUrls.add(downloadUrl.toString());
      if (imageUrls.length == images.length) {
        String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
        bidsRef
            .doc(widget.currentUser.id)
            .collection("userBids")
            .doc(postId)
            .set({
          'mediaUrl': imageUrls,
          "postId": postId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "Price": "textList",
          "timestamp": timestamp,
          "likes": {},
        }).then((_) {
          SnackBar snackbar =
          SnackBar(content: Text('Uploaded Successfully'));
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
  Navigator.pop(context);}
  carousel() {
    return CarouselSlider(
        options: CarouselOptions(),
        items: images
            .map(
              (e) => Container(
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
              ),
            )
            .toList());
  }

  Widget buildGridView() {

    return Container(
      height: 400,
      child: Form(
        key: _formKey,
        child: GridView.count(
          crossAxisCount: 1,
          scrollDirection: Axis.horizontal,
          children: List.generate(images.length, (index) {
            setState((){
              TextEditingController controller =   _controller[index];
    });


            Asset asset = images[index];

            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: AssetThumb(
                        asset: asset,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        double sal = double.tryParse(value);
                        if (sal == null) {
                          return 'enter or delete row';
                        }
                        return null;
                      },
                      controller: _controller[index],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
  Future<QuerySnapshot> searchResultsFuture;
  List<Items> itemsres = [];
  handleSearch() {
    Future<QuerySnapshot> items =   bidsRef
        .doc(widget.currentUser.id)
        .collection("userBids")
        .where("postId",isEqualTo:postId)

        .get();

    setState(() {
      searchResultsFuture = items;
    });
  }
buildWidget(parentContext)  {

  SizeConfig().init(context);

  return Container(
    decoration: BoxDecoration(gradient: fabGradient),
    child: Stack(
      children: [
        WillPopScope(
          onWillPop: () => _onBackPressed(),
          child: Scaffold(
            // resizeToAvoidBottomPadding: true,
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
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

//            clearImage();
                          },
                          child: Text("YES"),
                        ),
                      ],
                    ),
                  ) ??
                      false),
              actions: [
                RaisedButton(
                  color: kblue,
                  onPressed: () {
                    if (images.isNotEmpty) {
                      isUploading ? null : handleSubmit();
                    } else {
                      alert(
                        context,
                        // title: Text('Coming Soon'),
                        content: Text(
                          "Coming Soon",
                        ),

                        textOK: Text(
                          "OK",
                        ),
                      );
                    }
                  },
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
            body: Container(
              decoration: BoxDecoration(gradient: fabGradient),
              //alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:StreamBuilder(
  stream:bidsRef
      .doc(widget.currentUser.id)
      .collection("userBids")

      .where("postId",isEqualTo:postId)
      .snapshots(),
  builder:(BuildContext context,  AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return Text('text');
    }
    return
    Column(
      children: [
        Row(
          children: [
            InkWell(

              onTap: () {
                selectImage(parentContext);
              },
              child: Icon(
                Icons.add_photo_alternate_outlined,
                size: SizeConfig.screenHeight*0.2,
                color: Colors.grey,
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
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
                            title: Text('To start the auction'),
                            content: Text("Click on clock icon in FashureTV",
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

        Container(
          height:SizeConfig.screenHeight*0.65,
          child: StreamBuilder(
            key: ValueKey<String>(Skey),
            stream: bidsRef
                .doc(widget.currentUser.id)
                .collection("userBids")
                .doc(postId)
                .collection("Items")
                .where("postId", isEqualTo: postId)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text('text');
              }
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {

                    String a = snapshot.data.docs[index]["images"];


                    if (a.isEmpty) {
                      return
Container();
                    }
                    return

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Container(
                                height:SizeConfig.screenHeight*0.4,

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: CachedNetworkImage(
                                      imageUrl: snapshot.data.docs[index]['images']),
                                ),
                              ),
                              SizedBox(height:SizeConfig.blockSizeVertical*2),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Opening bid:",style:TextStyle(fontWeight: FontWeight.bold)),
                                   Text(" ${snapshot.data.docs[index]['inr']}"),

                                ],
                              ),
                              SizedBox(height:SizeConfig.blockSizeVertical*2),

                              Row(
                                children: [
                                  Text("Description:",style:TextStyle(fontWeight: FontWeight.bold)),
                                   Text(" ${snapshot.data
                                      .docs[index]['description']}",overflow: TextOverflow.fade,),

                                ],
                              ),

                            ],
                          ),
                        ),
                      );
                  });
            },


          ),
        ),
      ],
    );
  }
                ),

              ),
            ),
          ),
        ),
        isUploading
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: kText,
            ))
            : Text(""),
      ],
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

//            clearImage();
                },
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }

  Container buildSplashScreen() {
    return Container(
      decoration: BoxDecoration(gradient: fabGradient),
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
                "Select Header Image",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              color: Colors.deepOrange,
              onPressed: () => loadAssets(),
              // selectImage(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImageWidget() {
    SizeConfig().init(context);

    if (file != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),

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
      isUploading = true;
      Skey = titleController.text;
    });
    var resultUSD = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: titleController.text);
    var usd;
    String USD;


    setState(() {
  usd = resultUSD.rate;
  USD = usd.toStringAsFixed(2);

});
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
      "inr":titleController.text,
      "usd":USD,
      "description":desController.text,
      "postId":postId,
      "topBid1":"",
      "topBid2":"",
      "topBid3":"",
       "topBidder1":"",
      "topBidder2":"",
      "topBidder3":"",

    });

clearImage();
    
Get.back();
    setState(() {
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
        ModalProgressHUD(

          inAsyncCall: isUploading,
          child: Stack(
            children: [
              Container(child:Column(
                children: [
                  getImageWidget(),
                  SizedBox(height:SizeConfig.blockSizeVertical*2),
                  Expanded(
                    child: SingleChildScrollView(
                      child:    Expanded(
                      child: Form(
                        key:_formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                      isUploading = true;
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
                  ),

                ],
              )),
              isUploading?Center(child: CircularProgressIndicator()):Container(),
            ],
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

  createPostInFirestore(
      {List mediaUrl, List inr, List usd, List description}) {
    bidsRef
        .doc(widget.currentUser.id)
        .collection("userBids")
        .doc(postId)
        .update({
      "images":FieldValue.arrayUnion(mediaUrl),
      "inr":FieldValue.arrayUnion(inr),
      "usd":FieldValue.arrayUnion(usd),
      "description":FieldValue.arrayUnion(description),
    });

    setState(() {
clearImage();
    });
  }

  builduploadForm() {
    this.setState(() {
      _inProcess = false;
    });
    final form = ListView(
      shrinkWrap: true,
      children: <Widget>[
        isUploading ? linearProgress() : Text(""),
        buildGridView(),
      ],
    );
    return Container(
      decoration: BoxDecoration(gradient: fabGradient),
      alignment: Alignment.center,
      child: Stack(
        children: [
          WillPopScope(
            onWillPop: () => _onBackPressed(),
            child: Scaffold(
              // resizeToAvoidBottomPadding: true,
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
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

//            clearImage();
                                },
                                child: Text("YES"),
                              ),
                            ],
                          ),
                        ) ??
                        false),
                actions: [
                  RaisedButton(
                    color: kblue,
                    onPressed: () {
                      if (images.isNotEmpty) {
                        isUploading ? null : handleSubmit();
                      } else {
                        alert(
                          context,
                          // title: Text('Coming Soon'),
                          content: Text(
                            "Coming Soon",
                          ),

                          textOK: Text(
                            "OK",
                          ),
                        );
                      }
                    },
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
              body: Container(
                decoration: BoxDecoration(gradient: fabGradient),
                //alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: form,
                ),
              ),
            ),
          ),
          isUploading
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: kText,
                ))
              : Text(""),
        ],
      ),
    );
  }

  HandleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(file);


    Navigator.pop(context);
  }

  getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String completeAddress =
        '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality} ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
    print(completeAddress);
    String formattedAddress = "${placemark.locality}, ${placemark.country}";
    desController.text = formattedAddress;
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildWidget(context);
  }
}




class CItem extends StatefulWidget {
  final Items items;

  CItem(this.items);
  @override
  _CItemState createState() => _CItemState(this.items);
}

class _CItemState extends State<CItem> {
  final Items items;


  _CItemState(this.items);
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          margin:
          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(
                color: Colors.grey,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                  ],
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}