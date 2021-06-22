import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
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

class Upload extends StatefulWidget {
  final Users currentUser;

  final GlobalKey<ScaffoldState> globalKey;

  Upload({this.currentUser, this.globalKey});
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload>
    with AutomaticKeepAliveClientMixin<Upload> {
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File file;
  bool isUploading = false;
  String postId = Uuid().v4();
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  List<String> imageUrls = <String>[];



  bool _inProcess = false;
  @override
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

    for ( var imageFile in images) {
      postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if(imageUrls.length==images.length){
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
          postsRef .doc(widget.currentUser.id)
              .collection("userPosts")
              .doc(postId).set({
            'mediaUrl':imageUrls,
            "postId": postId,
            "ownerId": widget.currentUser.id,
            "username": widget.currentUser.displayName,
            "description": captionController.text,
            "location": locationController.text,
            "timestamp": timestamp,
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
          options: CarouselOptions(),
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
  Widget buildGridView() {
    return Container(
      height: 400,
      child: GridView.count(
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          print(asset.getByteData(quality: 75));
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,

              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: AssetThumb(
                  asset: asset,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

up(){
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(  backgroundColor: kPrimaryColor,
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
          ],)
      ];
    },
    body: Hero(
      tag: 'test',
      child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
          child: Builder(builder: (context) {
            var handle = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
            print('test');
            return Column(  // whatever you want to return here
            children: [ isUploading ? linearProgress() : Text(""),


              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              buildGridView(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  CachedNetworkImageProvider(widget.currentUser.photoUrl),
                ),
                title: Container(
                  width: 250.0,
                  child: TextField(
                    style:TextStyle(color: kText),

                    controller: captionController,
                    decoration: InputDecoration(
                        hintText: "Write a caption...", border: InputBorder.none),
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
                    style:TextStyle(color: kText),

                    controller: locationController,
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
              ),],
            );
           // print('test');

            })
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

            onPressed: () async {Navigator.of(context).pop(true);

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
                "Select Header Image",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              color: Colors.deepOrange,
              onPressed: () =>  loadAssets(),
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
    storageRef.child("post_$postId.jpg").putFile(imageFile);
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
    ListView(
      shrinkWrap: true,
      children: <Widget>[
        isUploading ? linearProgress() : Text(""),
        carousel(),

        ListTile(
          leading: CircleAvatar(
            backgroundImage:
            CachedNetworkImageProvider(widget.currentUser.photoUrl),
          ),
          title: Container(
            width: 250.0,
            child: TextField(
              style:TextStyle(color: kText),

              controller: captionController,
              decoration: InputDecoration(
                  hintText: "Write a caption...", border: InputBorder.none),
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
              style:TextStyle(color: kText),

              controller: locationController,
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
    return
      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Stack(
          children: [
            WillPopScope(
              onWillPop:()=>   _onBackPressed(),
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
            isUploading ? Center(child: CircularProgressIndicator(backgroundColor: kText,)) : Text(""),
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

    createPostInFirestore(
      mediaUrl: mediaUrl,
      location: locationController.text,
      description: captionController.text,
    );

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
    locationController.text = formattedAddress;
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return images.isEmpty?buildSplashScreen():  builduploadForm();
  }
}
