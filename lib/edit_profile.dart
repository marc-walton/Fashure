import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:uuid/uuid.dart';

//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image/image.dart' as Im;

import 'package:image_cropper/image_cropper.dart';

class EditProfile extends StatefulWidget {
  final String currentUserId;

  EditProfile({this.currentUserId});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool isLoading = false;
  User user;
  bool _displayNameValid = true;
  bool _bioValid = true;
  bool isCheckedDesigner = false;
  bool isCheckedIllustrator = false;
  bool isCheckedPhotographer = false;
  bool isCheckedModel = false;
  bool isCheckedMakeup = false;
  bool isCheckedHair = false;
  bool isCheckedChoreographer = false;
  bool isCheckedStylist = false;
  bool CheckedDesigner ;
  bool CheckedIllustrator ;
  bool CheckedPhotographer ;
  bool CheckedModel ;
  bool CheckedMakeup ;
  bool CheckedHair ;
  bool CheckedChoreographer ;
  bool CheckedStylist ;
  File file;
  bool isUploading = false;
  bool _inProcess = false;
  String photoId = Uuid().v4();

  var resultHolder = 'Checkbox is UN-CHECKED';
  @override
  void initState() {
    super.initState();
    getUser();
    checkbox();
    // setcheckbox();

  }
  getImage(ImageSource source) async {
    setState(() {
      isLoading = true;
    });
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
      handleSubmit();
    } else {
      this.setState((){
        _inProcess = false;
      });
    }
    setState(() {
      isLoading = true;
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(file);

    createPostInFirestore(
      mediaUrl: mediaUrl,

    );

    Navigator.pop(context);

  }

  selectImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
//            shape: ,
            title: Text("Select Image"),
            children: <Widget>[
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
checkbox()
async {
  Firestore.instance.collection('users')
      .where('id', isEqualTo: currentUser.id)

      .snapshots()
      .listen((snapshot){  snapshot.documents.forEach((doc) {
    setState(() {

      CheckedIllustrator = doc.data['illustrator'] ?? false;
      CheckedModel = doc.data['model'] ?? false;
      CheckedMakeup = doc.data['makeup'] ?? false;
      CheckedHair = doc.data['hair'] ?? false;
      CheckedChoreographer = doc.data['choreographer'] ?? false;
      CheckedPhotographer = doc.data['photographer'] ?? false;
      CheckedStylist = doc.data['stylist'] ?? false;
      CheckedDesigner = doc.data['designer'] ?? false;

print(CheckedIllustrator);
      if(CheckedDesigner==true){
    setState(() {
      isCheckedDesigner = true;
    });
  }
  else if(CheckedIllustrator==true){
    setState(() {
      isCheckedIllustrator = true;
    });
  }
  else if(CheckedPhotographer==true){
    setState(() {
      isCheckedPhotographer = true;
    });
  }
   else if(CheckedModel==true){
    setState(() {
      isCheckedModel = true;
    });
  }
  else if(CheckedMakeup==true){
    setState(() {
      isCheckedMakeup = true;
    });
  }
   else if(CheckedHair==true){
    setState(() {
      isCheckedHair = true;
    });
  }
   else if(CheckedChoreographer==true){
    setState(() {
      isCheckedChoreographer = true;
    });
  }
  else if(CheckedStylist==true){
    setState(() {
      isCheckedStylist = true;
    });
  }
    });
  }); });



}
// setcheckbox(){
//
//   if(CheckedDesigner==true){
//     setState(() {
//       isCheckedDesigner = true;
//     });
//   }
//   else if(CheckedIllustrator==true){
//     setState(() {
//       isCheckedIllustrator = true;
//     });
//   }
//   else if(CheckedPhotographer==true){
//     setState(() {
//       isCheckedPhotographer = true;
//     });
//   }
//    else if(CheckedModel==true){
//     setState(() {
//       isCheckedModel = true;
//     });
//   }
//   else if(CheckedMakeup==true){
//     setState(() {
//       isCheckedMakeup = true;
//     });
//   }
//    else if(CheckedHair==true){
//     setState(() {
//       isCheckedHair = true;
//     });
//   }
//    else if(CheckedChoreographer==true){
//     setState(() {
//       isCheckedChoreographer = true;
//     });
//   }
//   else if(CheckedStylist==true){
//     setState(() {
//       isCheckedStylist = true;
//     });
//   }
//
//
// }



  clearImage() {
    setState(() {
      file = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$photoId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    StorageUploadTask uploadTask =
    storageRef.child("profile_$photoId.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({String mediaUrl, }) {
    usersRef
        .document(currentUser.id)
        .updateData({
      "photoUrl": mediaUrl,

    });

    setState(() {
      file = null;
//      isUploading = false;1111
    });
  }
  getCoverImage(ImageSource source) async {
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
          maxWidth: 900,
          maxHeight: 500,
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
      handleCoverSubmit();
    } else {
      this.setState((){
        _inProcess = false;
      });
    }
  }

  handleCoverSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressCoverImage();
    String mediaUrl = await uploadCoverImage(file);

    createcoverInFirestore(
      mediaUrl: mediaUrl,

    );

    Navigator.pop(context);

  }

  selectCoverImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
//            shape: ,
            title: Text("Select Image"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed:  () {
                  getCoverImage(ImageSource.gallery);
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


  clearCoverImage() {
    setState(() {
      file = null;
    });
  }

  compressCoverImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$photoId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadCoverImage(imageFile) async {
    StorageUploadTask uploadTask =
    storageRef.child("cover_$photoId.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createcoverInFirestore({String mediaUrl, }) {
    usersRef
        .document(currentUser.id)
        .setData({
      "coverPhoto": mediaUrl,

    });

    setState(() {
      file = null;
//      isUploading = false;1111
    });
  }
  CoverPhoto(){
    try{
      StreamBuilder(
        stream: usersRef.document(currentUser.id).snapshots(),
        builder: (context,snapshot){
          return
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1,
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data['coverPhoto'],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10.0,
                  bottom: 10.0,
                  child: FlatButton(
                    color: kblue,
                    onPressed: () {selectCoverImage();},
                    child: Text('Change cover'),
                  ),
                )
              ],
            );
        },
      );

    }
    catch(e){
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1,
        child: Text('Cover Photo',style: TextStyle(fontSize: 20.0,color: kText),),
      );
    }
  }
  ProfilePhoto(){
    try{
      StreamBuilder(
        stream: usersRef.document(currentUser.id).snapshots(),
        builder: (context,snapshot){
          return
            Positioned(
              top: 90.0,
              left: 50.0,
              right: 50.0,

              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxHeight: 80, maxWidth: 80),
                child: Stack(
                    children: [

                      Positioned(
                        right: 0.1,
                        bottom: 0.1,
                        child: GestureDetector(
                          onTap: (){
                            selectImage();
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                            child: Icon(Icons.add),
                          ),
                        ),
                      )

                    ]
                ),
              ),
            );

        },
      );

    }
    catch(e){
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1,
        child: Text('Cover Photo',style: TextStyle(fontSize: 20.0,color: kText),),
      );
    }
  }

  void toggleDesigner(bool value) {

    if(isCheckedDesigner == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedDesigner = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'designer':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedDesigner = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'designer':false
      });
    }
  }
  void toggleIllustrator(bool value) {

    if(isCheckedIllustrator == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedIllustrator = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'illustrator':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedIllustrator = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'illustrator':false
      });
    }
  }
  void togglePhotographer(bool value) {

    if(isCheckedPhotographer == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedPhotographer = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'photographer':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedPhotographer = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'photographer':false
      });
    }
  }
  void toggleModel(bool value) {

    if(isCheckedModel == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedModel = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'model':true

      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedModel = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'model':false
      });
    }
  }
  void toggleMakeup(bool value) {

    if(isCheckedMakeup == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedMakeup = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'makeup':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedMakeup = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'makeup':false
      });
    }
  }
void toggleHair(bool value) {

    if(isCheckedHair == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedHair = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'hair':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedHair = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'hair':false
      });
    }
  }
void toggleChoreographer(bool value) {

    if(isCheckedChoreographer == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedChoreographer = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'choreographer':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedChoreographer = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'choreographer':false
      });
    }
  }
void toggleStylist(bool value) {

    if(isCheckedStylist == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedStylist = true;

      });
      usersRef.document(widget.currentUserId).updateData({
   'stylist':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedStylist = false;

      });
      usersRef.document(widget.currentUserId).updateData({
        'stylist':false
      });
    }
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await usersRef.document(widget.currentUserId).get();
    user = User.fromDocument(doc);
    displayNameController.text = user.displayName;
    bioController.text = user.bio;
    setState(() {
      isLoading = false;
    });
  }

  Container buildDisplayNameField() {
    return Container(
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15.0),
      color: kPrimaryColor) ,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Display Name",
              style: TextStyle(color: kText),
            ),
          ),
          TextField(
            style: TextStyle(color: kSubtitle),
            controller: displayNameController,
            decoration: InputDecoration(
              hintText: "Update Display Name",
              hintStyle: TextStyle(color: kSubtitle),
              errorText: _displayNameValid ? null : "Display Name too short",
              fillColor: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  Container buildBioField() {
    return Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(15.0),
        color: kPrimaryColor) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Bio",
              style: TextStyle(color: kText),
            ),
          ),
          TextField(style: TextStyle(color: kSubtitle),
            controller: bioController,
            decoration: InputDecoration(
              hintText: "Bio",
              hintStyle: TextStyle(color: kGrey),
              errorText: _bioValid ? null : "Bio too long",
              fillColor:Colors.red,
            ),
          )
        ],
      ),
    );
  }

  updateProfileData() {
    setState(() {
      displayNameController.text.trim().length < 3 ||
          displayNameController.text.isEmpty
          ? _displayNameValid = false
          : _displayNameValid = true;
      bioController.text.trim().length > 100
          ? _bioValid = false
          : _bioValid = true;
    });

    if (_displayNameValid && _bioValid) {
      usersRef.document(widget.currentUserId).updateData({
        "displayName": displayNameController.text,
        "bio": bioController.text,
      });
      SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  logout() async {
    await googleSignIn.signOut();
    // await FirebaseAuth.instance.signOut();
  // Get.offAll(Homepage());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(

            )),
            (_) => false );
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,


        title: Center(
          child:   FittedBox(
            fit:BoxFit.contain,
            child: Text(   'Edit Profile',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  // fontSizfit: e:  35.0 ,
                  color: Colors.white),),
          ),
          ),
        iconTheme: new IconThemeData(color: kText),
//        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.done,
                size: 30.0,
//                color: Colors.green,
              ))
        ],
      ),
      body: isLoading
          ? circularProgress()
          : Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
            child: ListView(
        children: <Widget>[
            Container(
                color: kPrimaryColor,

              child: Column(
                children: <Widget>[

                  Padding(
        padding: EdgeInsets.only(
        top: 16.0,
        bottom: 8.0,
    ),
      child: Stack(
        children:[ CircleAvatar(
            radius: 50.0,
            backgroundImage:
            CachedNetworkImageProvider(user.photoUrl),
        ),
            Positioned(
              right: 0.1,
              bottom: 0.1,
              child: GestureDetector(
                onTap: (){
                  selectImage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(Icons.add,color: kText,),
                ),
              ),
            ),
        ],
      ),
    ),

                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        buildDisplayNameField(),
                        buildBioField(),
                       SizedBox(height: 10.0,),
                       Container(
                         decoration: BoxDecoration( borderRadius: BorderRadius.circular(20.0),
                             color: kPrimaryColor) ,
                         child: Column(
                           children: [
                             // Text('I\'m a ',style: TextStyle(color: kText,fontSize: 30.0), ),
                             // SizedBox(height: 10.0,),
                             ListTileTheme(
                         tileColor:kblue,

                         child: ExpansionTile (
                                 title: Text('I Freelance in',style:TextStyle(color:kText)),
                                 maintainState:true,
                                 trailing:Icon(Icons.arrow_drop_down,color: kText,),
                                 children: [
                                   CheckboxListTile(
                                     title: Text('Designer',style: TextStyle(color: kText), ),
                                     value: isCheckedDesigner,
                                     onChanged: (value){toggleDesigner(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Stylist',style: TextStyle(color: kText), ),
                                     value: isCheckedStylist,
                                     onChanged: (value){toggleStylist(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Illustrator',style: TextStyle(color: kText), ),
                                     value: isCheckedIllustrator,
                                     onChanged: (value){toggleIllustrator(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Photographer',style: TextStyle(color: kText), ),
                                     value: isCheckedPhotographer,
                                     onChanged: (value){togglePhotographer(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Model',style: TextStyle(color: kText), ),
                                     value: isCheckedModel,
                                     onChanged: (value){toggleModel(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Makeup Artist',style: TextStyle(color: kText), ),
                                     value: isCheckedMakeup,
                                     onChanged: (value){toggleMakeup(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Hairdresser',style: TextStyle(color: kText), ),
                                     value: isCheckedHair,
                                     onChanged: (value){toggleHair(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                   CheckboxListTile(
                                     title: Text('Choreographer',style: TextStyle(color: kText), ),
                                     value: isCheckedChoreographer,
                                     onChanged: (value){toggleChoreographer(value);},
                                     activeColor: Colors.pink,
                                     checkColor: Colors.white,
                                     tristate: false,
                                   ),
                                 ],
                               ),
                             )
                           ],
                         ),
                       )
                      ],
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: updateProfileData,
                    backgroundColor: kblue,
                    label: Text(
                      "Save",
                      style: TextStyle(
                        color: kText,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FlatButton.icon(
                      onPressed: logout,
                      icon: Icon(Icons.cancel, color: Colors.red),
                      label: Text(
                        "Logout",
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
          ),
    );
  }
}