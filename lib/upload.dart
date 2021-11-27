import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
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
  List<Asset> images = <Asset>[];
  List<String> Img = <String>[];
  
  String _error = 'No Error Dectected';
  PageController pageController = PageController();
  int pageChanged  = 0;

  List<String> imageUrls = <String>[];

  bool _inProcess = false;
  @override
  void initState() {
    // _controller = ScrollController();
    // _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
    // _tabController = TabController(length: 2,vsync: this);
    postsRef
        .doc(widget.currentUser.id)
        .collection("userPosts")
        .doc(postId)
        .set({});
  }

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
    final compressedImageFile = File('$path/img1_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file1 = compressedImageFile;
    });
  }
  compressImage2() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file2.readAsBytesSync());
    final compressedImageFile = File('$path/img2_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file2 = compressedImageFile;
    });
  }
  compressImage3() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file3.readAsBytesSync());
    final compressedImageFile = File('$path/img3_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file3 = compressedImageFile;
    });
  }
  compressImage4() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file4.readAsBytesSync());
    final compressedImageFile = File('$path/img4_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file4 = compressedImageFile;
    });
  }
  compressImage5() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file5.readAsBytesSync());
    final compressedImageFile = File('$path/img5_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file5 = compressedImageFile;
    });
  }
  Future<String> uploadImage1(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("post${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    Img.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage2(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("post${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    Img.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage3(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("post${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    Img.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage4(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("post${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    Img.add(downloadUrl);
    return downloadUrl;
  }
  Future<String> uploadImage5(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("post${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    Img.add(downloadUrl);
    return downloadUrl;
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
      file1 = null;
      file2 = null;
      file3 = null;
      file4 = null;
      file5 = null;
      
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
  delete()async{     postsRef
      .doc(currentUser.id)
      .collection('userPosts')
      .doc(postId)
      .get()
      .then((doc) {
    if (doc.exists) {
      doc.reference.delete();
    }
  });}
  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("post${postId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }
  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    postsRef .doc(widget.currentUser.id)
        .collection("userPosts")
        .doc(postId).update({
      "type":'Post',

      'mediaUrl':Img,
      "postId": postId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.displayName,
      "photoUrl":widget.currentUser.photoUrl,
      "currency":widget.currentUser.currency,
      "description": captionController.text,
      "location": locationController.text,
      "timestamp": timestamp,
      "likes": {},
    }).then((_){

      setState(() {
        Img = [];
        clearImage();
        isUploading = false;
        _inProcess = false;

      });
    });

    Navigator.pop(context);

  }

  carousel(){

    return
      CarouselSlider(
          options: CarouselOptions(enableInfiniteScroll:false,),
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
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
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

            onPressed: () async {Navigator.of(context).pop(true);
            delete();
clearImage();
            setState(() {
              isUploading = false;
              _inProcess = false;
            });
            },
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
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
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//          SvgPicture.asset('assets/images/upload.svg', height: 260.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation : 0.1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary:  Colors.black, // background
                      onPrimary: Colors.white, // foreground
                    ),

                    child: Text(
                      "Select images",
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

  page0(){
   return
     ListView(
       shrinkWrap: true,
       children: <Widget>[
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
           child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                 elevation : 0.1,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30.0),
                 ),

                 primary: Colors.blue,// background
                 onPrimary: Colors.white, // foreground
               ),
               label: Text(
                 "Use Current Location",
               ),
               onPressed: getUserLocation,
               icon: Icon(
                 Icons.my_location,
                 color: Colors.white,
               )),
         ),
         SizedBox( height:MediaQuery. of(context). size. width *0.5,
         ),
         Row(
           mainAxisAlignment:MainAxisAlignment.end,

           children: [
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
                   height:MediaQuery. of(context). size. height *0.06,

                   width:MediaQuery. of(context). size. width *0.5,

                   //icon: Icon(Icons.drag_handle),
                   child:Text("Next",style:TextStyle(color: Colors.black)),

                 ),
               ),
             ),


           ],
         ),

       ],
     );
}
page1(){
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
SizedBox(width: 10,)  ,
              Text("(optional)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *2.5
                  ,color:kText),),
            ],
          ),
          Container(
            height:MediaQuery. of(context). size. height *0.75,
            child: tagView(),
          ),
          Row(
            children: [
              InkWell(
                onTap: (){
                  pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                },
                child: FittedBox(
                  fit:  BoxFit.fitHeight,
                  child: Container(
                    alignment:Alignment.center,
                    height:MediaQuery. of(context). size. height *0.06,

                    width:MediaQuery. of(context). size. width *0.5,

                    //icon: Icon(Icons.drag_handle),
                    child:Text("Previous",style:TextStyle(color: Colors.black)),

                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  isUploading ? null : handleSubmit();
                },
                child: FittedBox(
                  fit:  BoxFit.fitHeight,
                  child: Container(
                    alignment:Alignment.center,
                    height:MediaQuery. of(context). size. height *0.06,

                    width:MediaQuery. of(context). size. width *0.5,

                    //icon: Icon(Icons.drag_handle),
                    child:Text("Post",style:TextStyle(color: Colors.black)),

                  ),
                ),
              ),


            ],
          ),




        ],
      ),
    );

}
  builduploadForm() {
    this.setState(() {
      _inProcess = false;
    });

    return
      Container(
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
                            new TextButton(

                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text("NO"),
                            ),
                            SizedBox(height: 16),
                            new TextButton(

                              onPressed: () async {
                                Get.back();
                                Get.back();
                                delete();
clearImage();
                                setState(() {
                                  isUploading = false;
                                  _inProcess = false;
                                });
                              },
                              child: Text("YES"),
                            ),
                          ],
                        ),
                      ) ??
                          false),

                ),
                body:
                PageView(
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
                    Container(
                      child: page1(),
                    ),


                  ],
                ),

              ),

            ),
            isUploading ? Center(child: CircularProgressIndicator(backgroundColor: kText,)) : Text(""),
          ],
        ),
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

                    child: SearchTag(prodId:postId),

                  );
              }
              );
            }
            );
        },
      );

  }
  tagView(){
    return
      StreamBuilder(
        stream: postsRef
            .doc(currentUser.id).collection("userPosts").doc(postId)
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
                    prodId: postId,

                  );
                }
            );
          }
        },
      );

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
    return file1 == null ?buildSplashScreen():  builduploadForm();
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
              .collection('posts')
              .doc(currentUser.id)
              .collection('userPosts')
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


  TagItem({this.ownerId,this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

  delete(){
    var  docReference =  FirebaseFirestore.instance
        .collection('posts')
        .doc(currentUser.id)
        .collection('userPosts')
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
