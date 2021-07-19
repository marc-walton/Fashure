import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
import 'package:paginate_firestore/paginate_firestore.dart';
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
  List<Asset> images = List<Asset>();
  List<TextEditingController> _controller = <TextEditingController>[];
  List<String> image =[];
  List<String> doll =[];
  List<String> inr =[];

  List<String> des =[];
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
"inr":[],
"usd":[],
"description":[],
"images":[],

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
       image =[];
       doll =[];
       inr =[];

      des =[];
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
  Navigator.pop(context);}  carousel() {
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

  up() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () =>
                    showDialog(
                      context: context,
                      builder: (context) => new AlertDialog(
                        title: new Text('Are you sure?'),
                        content:
                            new Text('Do you want to exit without uploading?'),
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
          )
        ];
      },
      body: Hero(
        tag: 'test',
        child: Container(
            padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
            child: Builder(builder: (context) {
              var handle =
                  NestedScrollView.sliverOverlapAbsorberHandleFor(context);
              print('test');
              return Column(
                // whatever you want to return here
                children: [
                  isUploading ? linearProgress() : Text(""),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  buildGridView(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          widget.currentUser.photoUrl),
                    ),
                    title: Container(
                      width: 250.0,
                      child: TextField(
                        style: TextStyle(color: kText),
                        controller: titleController,
                        decoration: InputDecoration(
                            hintText: "Write a title...",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.pin_drop,
                      color: Colors.orange,
                      size: 35.0,
                    ),
                    title: Container(
                      width: 250.0,
                      child: TextField(
                        style: TextStyle(color: kText),
                        controller: desController,
                        decoration: InputDecoration(
                          hintText: "Where was this photo taken?",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 100.0,
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                        label: Text(
                          "Use Current Location",
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.blue,
                        onPressed: getUserLocation,
                        icon: Icon(
                          Icons.my_location,
                          color: Colors.white,
                        )),
                  ),
                ],
              );
              // print('test');
            })),
      ),
    );
  }
sdgvsd(parentContext){
  SizeConfig().init(context);

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
                child:StreamBuilder(
                  key: ValueKey<String>(Skey),
                  stream:bidsRef
                      .doc(widget.currentUser.id)
                      .collection("userBids")
                  .where("postId",isEqualTo:postId)
                      .snapshots(),
                  builder:(BuildContext context,  AsyncSnapshot<QuerySnapshot> snapshot){
                    if (!snapshot.hasData) {
                      return Text('text');
                    } return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index){
                          List a=snapshot.data.docs[index]["images"];
                          List b=snapshot.data.docs[index]["inr"];
                          List c=snapshot.data.docs[index]["description"];
if(a.isEmpty){return                                 InkWell(
  onTap:(){  selectImage(parentContext);
  },
  child: Container(
    height:100,
    width:100,
    child:Stack(
      children: [
        Icon(
          Icons.image,
          size: 100.0,
          color: Colors.grey,
        ),
      ],
    ),
  ),
);
                          }
                          return

                            Row(
                              children: [
                                Container(  height:SizeConfig.blockSizeHorizontal*90,
                                  width:SizeConfig.blockSizeHorizontal*90,
                                  child: ListTile(
                                    title:Container(height:SizeConfig.blockSizeHorizontal*90,width:SizeConfig.blockSizeVertical*90,child:
                                    CachedNetworkImage(imageUrl:a[index] )),
                                    subtitle:
                                    Column(
                                      children: [
                                        Text(b[index]),
                                         Text(c[index]),

                                      ],
                                    ) ,

                                  ),
                                ),
                                InkWell(
                                  onTap:(){  selectImage(parentContext);
                                  },
                                  child: Container(
                                    height:100,
                                    width:100,
                                    child:Stack(
                                      children: [
                                        Icon(
                                          Icons.image,
                                          size: 100.0,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            );
                        });

                  },


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
      Skey = titleController.text;
    });
    var resultUSD = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: titleController.text);
    var usd;
    String USD;


    setState(() {
  usd = resultUSD.rate;
  USD = usd.toStringAsFixed(2);
  doll.add(USD);
  print(USD);
});
    await compressImage();
    String mediaUrl = await uploadImage(file);
    print(mediaUrl);
    image.add(mediaUrl);
    des.add(desController.text);
    inr.add(titleController.text);
    print(inr);
  createPostInFirestore(
   mediaUrl:image,
    inr:inr,
    usd:doll,
    description:des,

  );
clearImage();

Get.back();
  }
modal(){
  showMaterialModalBottomSheet(
    expand: true,
    context: context,
    builder: (BuildContext context) {
      file != null ?
null:Navigator.pop(context);
      return
        Container(child:Column(
          children: [
            getImageWidget(),
            Expanded(
              child: SingleChildScrollView(
                child:    Expanded(
                child: Form(
                  key:_formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 250.0,
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
                              labelText: "Price",
                              hintText: "${currentUser.currencysym}", border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: 250.0,
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
                              labelText: "Description",
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        // alignment:Alignment.centerLeft,
                        child:   FloatingActionButton.extended(
                          backgroundColor: kblue,
                          onPressed: (){
                            if(_formKey.currentState.validate()) {
                              // ignore: unnecessary_statements
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
        ));
    },
  );}
  Future<String> uploadImage(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    UploadTask uploadTask =
        storageRef.child("postnow${postId}")
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
    return sdgvsd(context);
  }
}
