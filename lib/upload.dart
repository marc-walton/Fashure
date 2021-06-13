import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
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
import 'package:translated_text/translated_text.dart';
class Upload extends StatefulWidget {
  final Users currentUser;


  Upload({this.currentUser});
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




  bool _inProcess = false;
  @override

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
  getImage(ImageSource source) async {
    this.setState((){
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if(image != null){
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 500,
          maxHeight: 900,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState((){
        file = cropped;
        _inProcess = false;
      });

    } else {
      this.setState((){
        _inProcess = false;
      });
    }
  }


  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
//            shape: ,
            title: TranslatedText('Create Posts',to:'${currentUser.language}',
              ),
            // Text(" Post"),
            children: <Widget>[
              SimpleDialogOption(
                  child:  TranslatedText('Photo with Camera',to:'${currentUser.language}',
                  ),

                  onPressed:() {
          getImage(ImageSource.camera);
          Navigator.pop(context);
          }),
              SimpleDialogOption(
                child: TranslatedText('Image from Gallery',to:'${currentUser.language}',
                ),

                onPressed:  () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: TranslatedText('Cancel',to:'${currentUser.language}',
                ),

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
      alignment: Alignment.center,      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          SvgPicture.asset('assets/images/upload.svg', height: 260.0),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TranslatedText('Upload Image',to:'${currentUser.language}',
                textStyle:TextStyle(
                 color: Colors.white,
                 fontSize: 22.0,
       ),  ),
              // Text(
              //   "",
              //
              color: Colors.deepOrange,
              onPressed: () => selectImage(context),
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
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new
        TranslatedText('Are you sure?',to:'${currentUser.language}',
          ),

        content: new
        TranslatedText('Do you want to exit without uploading?',to:'${currentUser.language}',
        ),

        actions: <Widget>[
          new FlatButton(

            onPressed: () => Navigator.of(context).pop(false),
            child: TranslatedText('NO',to:'${currentUser.language}',
            ),

          ),
          SizedBox(height: 16),
          new FlatButton(
            onPressed: () async {Navigator.of(context).pop(true);

            clearImage();
            },
            child: TranslatedText('YES',to:'${currentUser.language}',
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(file);

    createPostInFirestore(
      mediaUrl: mediaUrl,
      location: locationController.text??"",
      description: captionController.text??"",
    );

    Navigator.pop(context);

  }

  builduploadForm() {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: ModalProgressHUD(
        color: Colors.black,
        opacity: 1.0,
        progressIndicator: Image.asset('assets/img/loading-76.gif'),
        inAsyncCall: isUploading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kSecondaryColor),
                onPressed:_onBackPressed),
            title:TranslatedText('Caption Post',to:'${currentUser.language}',
              textStyle: TextStyle(
                color: Colors.white),
              ),
            actions: [
              FlatButton(
                onPressed: (){   isUploading ? null : handleSubmit();
        Navigator.pop(context);

        },
                child:
                TranslatedText('Post',to:'${currentUser.language}',
                  textStyle: TextStyle(
                    color: Colors.blueAccent,
                         fontWeight: FontWeight.bold,
                           fontSize: 20.0),
                ),
                // Text(
                //   "Post",
                //   style: TextStyle(
                //       ),
                // ),
              )
            ],
          ),
          body: Container( decoration: BoxDecoration(
              gradient: fabGradient
          ) ,
            alignment: Alignment.center,
            child: Stack(

              children:[ ListView(
                children: <Widget>[
                  isUploading ? linearProgress() : Text(""),

                  Container(
                      height:500,
                      width:300,child: getImageWidget()),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
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
                        label: TranslatedText('Use Current Location',to:'${currentUser.language}',
                          textStyle: TextStyle(
                              color: Colors.white),
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
              ),

        ],
            ),
          ),
        ),
      ),
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
    return file == null ? buildSplashScreen() : builduploadForm();
  }
}
