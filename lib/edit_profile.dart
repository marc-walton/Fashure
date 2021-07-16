import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:get/get.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:uuid/uuid.dart';

//import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';

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
   TextEditingController artisanController = TextEditingController();
   TextEditingController designerController = TextEditingController();
   TextEditingController illustController = TextEditingController();
   TextEditingController stylController = TextEditingController();
   TextEditingController modelController = TextEditingController();
   TextEditingController makeController = TextEditingController();
   TextEditingController hairController = TextEditingController();
   TextEditingController photoController = TextEditingController();
   TextEditingController choController = TextEditingController();
   TextEditingController blogController = TextEditingController();

  bool isLoading = false;
  Users user;
  bool _displayNameValid = true;
  bool _bioValid = true;

  bool isCheckedDesigner = false;
  bool isCheckedArtisan = false;

  bool isCheckedIllustrator = false;
  bool isCheckedPhotographer = false;
  bool isCheckedModel = false;
  bool isCheckedMakeup = false;
  bool isCheckedHair = false;
  bool isCheckedChoreographer = false;
  bool isCheckedStylist = false;
  bool isCheckedBlogger = false;
  bool CheckedDesigner ;
  bool CheckedIllustrator ;
  bool CheckedPhotographer ;
  bool CheckedModel ;
  bool CheckedMakeup ;
  bool CheckedHair ;
  bool CheckedChoreographer ;
  bool CheckedStylist ;
  bool CheckedBlogger ;
  bool CheckedArtisan ;

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
            title: Text('Select Image'),

            children: <Widget>[
              SimpleDialogOption(
                child: Text('Image from Gallery'),
                onPressed:  () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }
  checkbox()
  async {
    FirebaseFirestore.instance.collection('users')
        .where('id', isEqualTo: currentUser.id)

        .snapshots()
        .listen((snapshot){  snapshot.docs.forEach((doc) {
      setState(() {

        CheckedIllustrator = doc.data()['illustrator'] ?? false;
        CheckedModel = doc.data()['model'] ?? false;
        CheckedMakeup = doc.data()['makeup'] ?? false;
        CheckedHair = doc.data()['hair'] ?? false;
        CheckedChoreographer = doc.data()['choreographer'] ?? false;
        CheckedPhotographer = doc.data()['photographer'] ?? false;
        CheckedStylist = doc.data()['stylist'] ?? false;
        CheckedDesigner = doc.data()['designer'] ?? false;
        CheckedBlogger = doc.data()['blogger'] ?? false;
 CheckedArtisan = doc.data()['artisan'] ?? false;

        if(CheckedDesigner==true){
          setState(() {
            isCheckedDesigner = true;
          });
        }
        else if(CheckedIllustrator==true){
          setState(() {
            isCheckedIllustrator = true;
          });
        }  else if(CheckedArtisan==true){
          setState(() {
            CheckedArtisan = true;
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
        else if(CheckedBlogger==true){
          setState(() {
            isCheckedBlogger = true;
          });
        }

      });
    }); });



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
    final compressedImageFile = File('$path/img_$photoId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    UploadTask  uploadTask =
    storageRef.child("profile_$photoId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({String mediaUrl, }) {
    usersRef
        .doc(currentUser.id)
        .update({
      "photoUrl": mediaUrl,

    });

    setState(() {
      file = null;
//      isUploading = false;1111
    });
  }





  void toggleDesigner(bool value) {

    if(isCheckedDesigner == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedDesigner = true;

      });
      usersRef.doc(widget.currentUserId).update({
        'designer':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedDesigner = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'illustrator':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedIllustrator = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'photographer':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedPhotographer = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'model':true

      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedModel = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'makeup':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedMakeup = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'hair':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedHair = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'choreographer':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedChoreographer = false;

      });
      usersRef.doc(widget.currentUserId).update({
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
      usersRef.doc(widget.currentUserId).update({
        'stylist':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedStylist = false;

      });
      usersRef.doc(widget.currentUserId).update({
        'stylist':false
      });
    }
  }
  void toggleBlogger(bool value) {

    if(isCheckedBlogger == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedBlogger = true;

      });
      usersRef.doc(widget.currentUserId).update({
        'blogger':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedBlogger = false;

      });
      usersRef.doc(widget.currentUserId).update({
        'blogger':false
      });
    }
  }
void toggleArtisan(bool value) {

    if(isCheckedArtisan == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isCheckedArtisan = true;

      });
      usersRef.doc(widget.currentUserId).update({
        'artisan':true
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedArtisan = false;

      });
      usersRef.doc(widget.currentUserId).update({
        'artisan':false
      });
    }
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await usersRef.doc(widget.currentUserId).get();
    user = Users.fromDocument(doc);
    displayNameController.text = user.displayName;
    bioController.text = user.bio;
    setState(() {
      isLoading = false;
    });
  }

  Container buildDisplayNameField() {
    return Container(
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15.0),
      ) ,

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
                hintStyle: TextStyle(color: kGrey),
                errorText: _displayNameValid ? null : "Display Name too short",
                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)            ),
          )
        ],
      ),
    );
  }

  Container buildBioField() {
    return Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(15.0),
    ) ,
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
                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)            ),
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
      usersRef.doc(widget.currentUserId).update({
        "displayName": displayNameController.text,
        "bio": bioController.text,
      });
      SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  logout() async {
    // await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    // Get.offAll(Homepage());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(
              auth: false,
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
              child: Text('Edit Profile',style:TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  color: Colors.white),),
            ),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
//        ),

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
                            ) ,
                            child: Column(
                              children: [

                                ListTileTheme(
                                  tileColor:kblue,

                                  child: ExpansionTile (
                                    title: Text('I Freelance in',style:TextStyle(
                                        color: Colors.white),),
                                    maintainState:true,
                                    trailing:Icon(Icons.arrow_drop_down,color: kText,),
                                    children: [

                                      CheckboxListTile(
                                        title: Text('Designer',style:TextStyle(
                                            color: Colors.white),),
                                        value: isCheckedDesigner,
                                        onChanged: (value){toggleDesigner(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      SizedBox(height: 8.0,),
                                      isCheckedDesigner ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:designerController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                     price = int.tryParse(designerController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'designerAvg':designerController.text?? "Contact for price",
                                                    "designerrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                    
                                      CheckboxListTile(
                                        title: Text('Artisan(Ex.Embroiderer',style:TextStyle(
                                            color: Colors.white),),
                                        value: isCheckedArtisan,
                                        onChanged: (value){toggleArtisan(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      SizedBox(height: 8.0,),
                                      isCheckedArtisan ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:artisanController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(artisanController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'artisanAvg':artisanController.text?? "Contact for price",
                                                    "artisanrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Stylist',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedStylist,
                                        onChanged: (value){toggleStylist(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      SizedBox(height: 8.0,),
                                      isCheckedStylist ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:stylController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(stylController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'stylistAvg':stylController.text?? "Contact for price",
                                                    "stylistrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Blogger',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedBlogger,
                                        onChanged: (value){toggleStylist(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedBlogger ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:blogController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(blogController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'bloggerAvg':blogController.text?? "Contact for price",
                                                    "bloggerrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Illustrator',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedIllustrator,
                                        onChanged: (value){toggleIllustrator(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedIllustrator ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:illustController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(illustController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'illustratorAvg':illustController.text?? "Contact for price",
                                                    "illustratorrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Photographer',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedPhotographer,
                                        onChanged: (value){togglePhotographer(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedPhotographer ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:photoController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(photoController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'photographerAvg':photoController.text?? "Contact for price",
                                                    "photographerrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Model',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedModel,
                                        onChanged: (value){toggleModel(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedModel ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:modelController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(modelController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'modelAvg':modelController.text?? "Contact for price",
                                                    "modelrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Makeup Artist',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedMakeup,
                                        onChanged: (value){toggleMakeup(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedMakeup ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:makeController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(makeController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'makeupAvg':makeController.text?? "Contact for price",
                                                    "makeuprounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Hairdresser',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedHair,
                                        onChanged: (value){toggleHair(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedHair ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:hairController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(hairController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'hairAvg':hairController.text?? "Contact for price",
                                                    "hairrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

                                      CheckboxListTile(
                                        title: Text('Choreographer',style: TextStyle(color: Colors.white), ),
                                        value: isCheckedChoreographer,
                                        onChanged: (value){toggleChoreographer(value);},
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      isCheckedChoreographer ?   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),

                                              child: TextFormField(
                                                style:TextStyle(color: kText),
                                                keyboardType:TextInputType.number,
                                                controller:choController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                                  labelText: 'Average cost',labelStyle: TextStyle(color: kText),
                                                  hintText:" ${currentUser.currencysym}",
                                                ),
                                                textAlign: TextAlign.center,

                                              ),
                                            ),
                                          ),

                                          Expanded(

                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:  GFButton(
                                                color: kblue,
                                                onPressed: (){
                                                  var rounded;
                                                  var price;
                                                  setState(() {
                                                    price = int.tryParse(choController.text)?? 0;
                                                    // inrtousd = resultUSD.rate;
                                                    rounded = price.round();


                                                  });
                                                  usersRef.doc(widget.currentUserId).update({
                                                    'choreographerAvg':choController.text?? "Contact for price",
                                                    "choreographerrounded":int.tryParse(rounded)?? 0,
                                                  });


                                                },
                                                text: "Save",
                                              ),
                                            ),
                                          ),

                                        ],
                                      ):Container(),

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
                          color: Colors.white,
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
        )
    );
  }
}