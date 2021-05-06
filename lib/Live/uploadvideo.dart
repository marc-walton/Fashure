import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/methods/Tag_search.dart';
import 'package:fashow/methods/tag_search2.dart';
import 'package:fashow/methods/tag_search3.dart';
import 'package:fashow/methods/tag_search4.dart';
import 'package:fashow/methods/tag_search5.dart';
// import 'package:light_compressor/light_compressor.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/Header.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_compress/video_compress.dart';
import 'package:alert_dialog/alert_dialog.dart';
class UploadVideo extends StatefulWidget {
  final User currentUser;


  UploadVideo({this.currentUser});
  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo>
    with AutomaticKeepAliveClientMixin<UploadVideo> {

  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File file;
  bool isUploading = false;
  String videoId = Uuid().v4();
  // late String _desFile;
  // String? _displayedFile;
  // late int _duration;
  // String? _failureMessage;
  // String? _filePath;
  // bool _isVideoCompressed = false;


  Uint8List IMAGE;
  bool _inProcess = false;

  @override
  Subscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription =
        VideoCompress.compressProgress$.subscribe((progress) {
          debugPrint('progress: $progress');
        });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.unsubscribe();
  }
  Widget getImageWidget() {
    if (file != null) {
      return Image.memory(
        IMAGE,
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

    File video =await ImagePicker.pickVideo(source: source);
    await ImagePicker().getVideo(source: source);
    this.setState((){
      file = video;

    });
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
                child: Text("Video from Gallery"),
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

  Container buildSplashScreen() {
    return Container(
      color:kSecondaryColor,
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
                "Upload Video",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
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

  Future<String> uploadToStorage(videoUrl) async {
    // final file =
    // await ImagePicker().getVideo(source: ImageSource.gallery);
    // await VideoCompress.setLogLevel(0);
    // final info = await VideoCompress.compressVideo(
    //   file.path,
    //   quality: VideoQuality.MediumQuality,
    //   deleteOrigin: false,
    //   includeAudio: true,
    // );
    // if (info != null) {
    //   StorageReference ref = FirebaseStorage.instance.ref().child("video").child(videoId);
    //     StorageUploadTask uploadTask = ref.putFile(file.path, StorageMetadata(contentType: 'video/mp4'));
    //     var storageTaskSnapshot = await uploadTask.onComplete;
    //     var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    //     final String url = downloadUrl.toString();
    //   setState(() {
    //     file = info;
    //   });
    // }
    // file =  await ImagePicker.pickVideo(source: ImageSource.gallery);
    // await ImagePicker().getVideo(source: ImageSource.gallery);
    await VideoCompress.setLogLevel(0);
    MediaInfo mediaInfo = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
      includeAudio: true,

    );
    final thumbnailFile = await VideoCompress.getFileThumbnail(
        file.path,
        quality: 50, // default(100)
        position: 6 // default(-1)
    );
    final uint8list = await VideoCompress.getByteThumbnail(
        file.path,
        quality: 50, // default(100)
        position: 6 // default(-1)
    );
    if(mediaInfo != null){
      setState(() {
        file = mediaInfo.file;
        IMAGE = uint8list;
      });
    }
    final filesizeLimit = 20000000;  // in bytes
    final filesize = await file.length(); // in bytes
    final isValidFilesize = filesize < filesizeLimit;
    // StorageReference ref = FirebaseStorage.instance.ref().child("video").child(videoId);
    // StorageUploadTask uploadTask = ref.putFile(file, StorageMetadata(contentType: 'video/mp4'));
    // var storageTaskSnapshot = await uploadTask.onComplete;
    // var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    // final String url = downloadUrl.toString();
    if (isValidFilesize) {
      // upload...

      StorageReference ref = FirebaseStorage.instance.ref().child("video_$videoId.mp4");
      StorageUploadTask uploadTask = ref.putFile(videoUrl, StorageMetadata(contentType: 'video/mp4'));
      var storageTaskSnapshot = await uploadTask.onComplete;
      var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      final String url = downloadUrl.toString();
      return url;
    } else {
      alert(
        context,
        title: Text('File Size too big'),
        content: Text('We only accept files of size not exceeding 20MB as of now'),
        textOK: Text('Ok'),
      );

      // show message to the user that the file is too big
    }
  }

  createPostInFirestore({String mediaUrl, String location, String description}) {
    videoRef
        .document(widget.currentUser.id)
        .collection("userVideos")
        .document(videoId)
        .setData({
      "videoId": videoId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.username,
      "mediaUrl": mediaUrl,
      "description": description,
      "location": location,
      "timestamp": timestamp,
      "likes": {},
    });
    captionController.clear();
    locationController.clear();
    setState(() {
      file = null;
//      isUploading = false;1111
    });
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
    setState(() {
      isUploading = true;
    });

    String mediaUrl = await uploadToStorage(file);

    createPostInFirestore(
      mediaUrl: mediaUrl,
      location: locationController.text,
      description: captionController.text,
    );
    Navigator.pop(context);

  }

  builduploadForm() {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: kSecondaryColor),
              onPressed:_onBackPressed),
          title: Text(
            "Caption Video",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            FlatButton(
              onPressed: isUploading ? null : () => handleSubmit(),
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
        body: Stack(

          children:[ ListView(
            children: <Widget>[
              isUploading ? linearProgress() : Text(""),
//          Container(
////            height: 220.0,
////            width: MediaQuery.of(context).size.width * 0.8,
//            child: Center(
//              child: AspectRatio(
//                aspectRatio: 16 / 9,
//                child: Container(
//                  child:
//                ),
//              ),
//            ),
//          ),
//               Container(
//                   height:500,
//                   width:300,child: getImageWidget()),
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