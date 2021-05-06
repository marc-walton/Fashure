import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';

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
import 'package:shared_preferences/shared_preferences.dart';

class Upload extends StatefulWidget {
  final User currentUser;


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
            toolbarTitle: "Crop Image",
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
                "Upload Image",
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
    StorageUploadTask uploadTask =
    storageRef.child("post_$postId.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({String mediaUrl, String location, String description}) {
    postsRef
        .document(widget.currentUser.id)
        .collection("userPosts")
        .document(postId)
        .setData({
      "postId": postId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.username,
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
    await compressImage();
    String mediaUrl = await uploadImage(file);

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
            "Caption Post",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            FlatButton(
              onPressed: (){   isUploading ? null : handleSubmit();
      Navigator.pop(context);

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
            // FloatingActionButton.extended(onPressed: Tags, label:  Text('Add product tags(Max 5 )',style: TextStyle(color: kText),),),
            //   Container
            //     (
            //     child: GridView(
            //       shrinkWrap: true,
            //       primary: false,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 3 : 3),
            //       children: [
            //         Image.network( shopmediaUrl1??""),
            //         Image.network( shopmediaUrl2??""),
            //         Image.network( shopmediaUrl3??""),
            //         Image.network( shopmediaUrl4??""),
            //         Image.network( shopmediaUrl5??""),
            //
            //       ],
            //     ),
            //   ),



//          Container(
//            width: 200.0,
//            height: 100.0,
//            alignment: Alignment.center,
//            child: RaisedButton.icon(
//                label: Text(
//                  "Add product tags",
//                  style: TextStyle(color: Colors.white),
//                ),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(30.0),
//                ),
//                color: Colors.blue,
//                onPressed: GetTags,
//                icon: Icon(
//                  Icons.my_location,
//                  color: Colors.white,
//                )),
//          ),


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
// Tags(){
//   showModalBottomSheet(
// //      isScrollControlled: true,
//       context: context,
//       backgroundColor: kSecondaryColor,
//       builder: (BuildContext context){
//         return Column(
//           children: [
//             ListTile(leading: IconButton( icon:Icon(Icons.arrow_back_ios,color:kText,),
//               onPressed: ()=>Navigator.pop(context),),
//               title: Text("Add Tags",style: TextStyle(color: kText),),),
//             FloatingActionButton.extended(onPressed: GetTags, label: Text("Tag - 1")),
//             Container(
//               child: Image.network(shopmediaUrl1??""),
//             ),
//             FloatingActionButton.extended(onPressed: GetTags2, label: Text("Tag - 2")),
//             Container(
//               child: Image.network(shopmediaUrl2??""),
//             ),
//             FloatingActionButton.extended(onPressed: GetTags3, label: Text("Tag - 3")),
//             Container(
//               child: Image.network(shopmediaUrl3??""),
//             ),
//             FloatingActionButton.extended(onPressed: GetTags4, label: Text("Tag - 4")),
//             Container(
//               child: Image.network(shopmediaUrl4??""),
//             ),
//             FloatingActionButton.extended(onPressed: GetTags5, label: Text("Tag - 5")),
//             Container(
//               child: Image.network(shopmediaUrl5??""),
//             ),
//           ],
//         );
//       }
//
//   );
// }
// GetTags(){
//   showModalBottomSheet(
//       isScrollControlled:true,
//       context:context,
//       builder: (BuildContext context){
//         return
//           Container(
// //              height: MediaQuery.of(context).size.height,
//             color: kPrimaryColor,
//             child: ListView(
//                 children: [
//                   SizedBox(height: 52.0,),
//                   Expanded(child: TagSearch())
//                 ]
//             ),
//           );
//       }
//   );
// }
// GetTags2(){
//   showModalBottomSheet(
//       isScrollControlled:true,
//       context:context,
//       builder: (BuildContext context){
//         return
//           Container(
// //              height: MediaQuery.of(context).size.height,
//             color: kPrimaryColor,
//             child: ListView(
//                 children: [
//                   SizedBox(height: 52.0,),
//                   Expanded(child: TagSearch2())
//                 ]
//             ),
//           );
//       }
//   );
// }
// GetTags3(){
//   showModalBottomSheet(
//       context:context,
//       builder: (BuildContext context){
//         return
//           Container(
// //              height: MediaQuery.of(context).size.height,
//             color: kPrimaryColor,
//             child: ListView(
//                 children: [
//                   SizedBox(height: 52.0,),
//                   Expanded(child: TagSearch3())
//                 ]
//             ),
//           );
//       }
//   );
// }
// GetTags4(){
//   showModalBottomSheet(
//       context:context,
//       builder: (BuildContext context){
//         return
//           Container(
// //              height: MediaQuery.of(context).size.height,
//             color: kPrimaryColor,
//             child: ListView(
//                 children: [
//                   SizedBox(height: 52.0,),
//                   Expanded(child: TagSearch4())
//                 ]
//             ),
//           );
//       }
//   );
// }
// GetTags5(){
//   showModalBottomSheet(
//       context:context,
//       builder: (BuildContext context){
//         return
//           Container(
// //              height: MediaQuery.of(context).size.height,
//             color: kPrimaryColor,
//             child: ListView(
//                 children: [
//                   SizedBox(height: 52.0,),
//                   Expanded(child: TagSearch5())
//                 ]
//             ),
//           );
//       }
//   );
// }