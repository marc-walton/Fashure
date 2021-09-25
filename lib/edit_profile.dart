import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool selectedDesigner = false;
  bool selectedArtisan = false;
  bool selectedIllustrator = false;
  bool selectedPhotographer = false;
  bool selectedModel = false;
  bool selectedMakeup = false;
  bool selectedHair = false;
  bool selectedChoreographer = false;
  bool selectedStylist = false;
  bool selectedBlogger = false;
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

  var USD;
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
 //  checkbox()
 //  async {
 //    FirebaseFirestore.instance.collection('users')
 //        .where('id', isEqualTo: currentUser.id)
 //
 //        .snapshots()
 //        .listen((snapshot){  snapshot.docs.forEach((doc) {
 //      setState(() {
 //
 //        CheckedIllustrator = currentUser.illustrator ?? false;
 //        CheckedModel =  currentUser.model ?? false;
 //        CheckedMakeup =  currentUser.makeup ?? false;
 //        CheckedHair =  currentUser.hair ?? false;
 //        CheckedChoreographer =  currentUser.choreographer ?? false;
 //        CheckedPhotographer =  currentUser.photographer ?? false;
 //        CheckedStylist =  currentUser.stylist ?? false;
 //        CheckedDesigner =  currentUser.designer ?? false;
 //        CheckedBlogger =  currentUser.blogger ?? false;
 // CheckedArtisan =  currentUser.artisans ?? false;
 // //
 // //        CheckedIllustrator = doc.data()['illustrator'] ?? false;
 // //        CheckedModel = doc.data()['model'] ?? false;
 // //        CheckedMakeup = doc.data()['makeup'] ?? false;
 // //        CheckedHair = doc.data()['hair'] ?? false;
 // //        CheckedChoreographer = doc.data()['choreographer'] ?? false;
 // //        CheckedPhotographer = doc.data()['photographer'] ?? false;
 // //        CheckedStylist = doc.data()['stylist'] ?? false;
 // //        CheckedDesigner = doc.data()['designer'] ?? false;
 // //        CheckedBlogger = doc.data()['blogger'] ?? false;
 // // CheckedArtisan = doc.data()['artisan'] ?? false;
 //
 //        if(CheckedDesigner==true){
 //          setState(() {
 //            isCheckedDesigner = true;
 //          });
 //        }
 //        else if(CheckedIllustrator==true){
 //          setState(() {
 //            isCheckedIllustrator = true;
 //          });
 //        }  else if(CheckedArtisan==true){
 //          setState(() {
 //            CheckedArtisan = true;
 //          });
 //        }
 //        else if(CheckedPhotographer==true){
 //          setState(() {
 //            isCheckedPhotographer = true;
 //          });
 //        }
 //        else if(CheckedModel==true){
 //          setState(() {
 //            isCheckedModel = true;
 //          });
 //        }
 //        else if(CheckedMakeup==true){
 //          setState(() {
 //            isCheckedMakeup = true;
 //          });
 //        }
 //        else if(CheckedHair==true){
 //          setState(() {
 //            isCheckedHair = true;
 //          });
 //        }
 //        else if(CheckedChoreographer==true){
 //          setState(() {
 //            isCheckedChoreographer = true;
 //          });
 //        }
 //        else if(CheckedStylist==true){
 //          setState(() {
 //            isCheckedStylist = true;
 //          });
 //        }
 //        else if(CheckedBlogger==true){
 //          setState(() {
 //            isCheckedBlogger = true;
 //          });
 //        }
 //
 //      });
 //    }); });
 //
 //
 //
 //  }
 checkbox()
  async {
    setState(() {

      CheckedIllustrator = currentUser.illustrator ?? false;
      CheckedModel =  currentUser.model ?? false;
      CheckedMakeup =  currentUser.makeup ?? false;
      CheckedHair =  currentUser.hair ?? false;
      CheckedChoreographer =  currentUser.choreographer ?? false;
      CheckedPhotographer =  currentUser.photographer ?? false;
      CheckedStylist =  currentUser.stylist ?? false;
      CheckedDesigner =  currentUser.designer ?? false;
      CheckedBlogger =  currentUser.blogger ?? false;
      CheckedArtisan =  currentUser.artisans ?? false;
      //
      //        CheckedIllustrator = doc.data()['illustrator'] ?? false;
      //        CheckedModel = doc.data()['model'] ?? false;
      //        CheckedMakeup = doc.data()['makeup'] ?? false;
      //        CheckedHair = doc.data()['hair'] ?? false;
      //        CheckedChoreographer = doc.data()['choreographer'] ?? false;
      //        CheckedPhotographer = doc.data()['photographer'] ?? false;
      //        CheckedStylist = doc.data()['stylist'] ?? false;
      //        CheckedDesigner = doc.data()['designer'] ?? false;
      //        CheckedBlogger = doc.data()['blogger'] ?? false;
      // CheckedArtisan = doc.data()['artisan'] ?? false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedDesigner = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedIllustrator = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedPhotographer = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedModel = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedMakeup = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedHair = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedChoreographer = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedStylist = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedBlogger = false;

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

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isCheckedArtisan = false;

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


          TextField(
            style: TextStyle(color: kSubtitle),
            controller: displayNameController,
            decoration: InputDecoration(
                hintText: "Update Display Name",
                labelText: "Name",
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
          TextField(style: TextStyle(color: kSubtitle),
            controller: bioController,
            decoration: InputDecoration(
                hintText: "Bio",
                labelText: "Bio",
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
  conversion({String price})async{

    if(currentUser.currencyISO == "USD") {
      setState(() {

        USD =price;

      }); }
    else {
      var resultUSD1 = await Currency.getConversion(
          from: 'USD', to: '${currentUser.currencyISO}', amount: price);
      setState(() {
        USD = resultUSD1.rate;
      });
    }


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
            : Container(
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
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(Icons.add,color: Colors.white,),
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
                          SizedBox(height: 10.0,),

                          buildBioField(),
                          SizedBox(height: 10.0,),
                          Container(
                            decoration: BoxDecoration( borderRadius: BorderRadius.circular(20.0),
                            ) ,
                            child: Column(
                              children: [

                                ListTileTheme(
                                  // tileColor:Colors.black,

                                  child: ExpansionTile (
                                    title: Text('I Freelance in',),
                                    maintainState:true,
                                    trailing:Icon(Icons.arrow_drop_down,color: kText,),
                                    children: [

                                      CheckboxListTile(
                                        title: Text('Designer',),
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  
                                                   textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedDesigner?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                 setState((){selectedDesigner=true;});
                                                  conversion(price:designerController.text);

                                                 isCheckedDesigner?   usersRef.doc(widget.currentUserId).update({
                                                    'designerAvg':designerController.text?? "Contact for price",
                                                    "designerUsd":USD ?? 0,
                                                    'designer':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'designerAvg':designerController.text?? "Contact for price",
                                                    "designerUsd":USD ?? 0,
                                                    'designer':false
                                                  });


                                                 setState((){selectedDesigner=false;});
                                                 Fluttertoast.showToast(
                                                     msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedArtisan?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedArtisan=true;});
                                                  conversion(price:artisanController.text);

                                                  isCheckedArtisan?   usersRef.doc(widget.currentUserId).update({
                                                    'artisanAvg':artisanController.text?? "Contact for price",
                                                    "artisanUsd":USD ?? 0,
                                                    'artisan':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'artisanAvg':artisanController.text?? "Contact for price",
                                                    "artisanUsd":USD ?? 0,
                                                    'artisan':false
                                                  });


                                                  setState((){selectedArtisan=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedStylist?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedStylist=true;});
                                                  conversion(price:stylController.text);

                                                  isCheckedStylist?   usersRef.doc(widget.currentUserId).update({
                                                    'stylistAvg':stylController.text?? "Contact for price",
                                                    "stylistUsd":USD ?? 0,
                                                    'stylist':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'stylistAvg':stylController.text?? "Contact for price",
                                                    "stylistUsd":USD ?? 0,
                                                    'stylist':false
                                                  });


                                                  setState((){selectedStylist=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedBlogger?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedBlogger=true;});
                                                  conversion(price:blogController.text);

                                                  isCheckedBlogger?   usersRef.doc(widget.currentUserId).update({
                                                    'bloggerAvg':blogController.text?? "Contact for price",
                                                    "bloggerUsd":USD ?? 0,
                                                    'blogger':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'bloggerAvg':blogController.text?? "Contact for price",
                                                    "bloggerUsd":USD ?? 0,
                                                    'blogger':false
                                                  });


                                                  setState((){selectedBlogger=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedIllustrator?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedIllustrator=true;});
                                                  conversion(price:illustController.text);

                                                  isCheckedIllustrator?   usersRef.doc(widget.currentUserId).update({
                                                    'illustratorAvg':illustController.text?? "Contact for price",
                                                    "illustratorUsd":USD ?? 0,
                                                    'illustrator':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'illustratorAvg':illustController.text?? "Contact for price",
                                                    "illustratorUsd":USD ?? 0,
                                                    'illustrator':false
                                                  });


                                                  setState((){selectedIllustrator=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedPhotographer?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedPhotographer=true;});
                                                  conversion(price:photoController.text);

                                                  isCheckedPhotographer?   usersRef.doc(widget.currentUserId).update({
                                                    'photographerAvg':photoController.text?? "Contact for price",
                                                    "photographerUsd":USD ?? 0,
                                                    'photographer':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'photographerAvg':photoController.text?? "Contact for price",
                                                    "photographerUsd":USD ?? 0,
                                                    'photographer':false
                                                  });


                                                  setState((){selectedPhotographer=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedModel?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedModel=true;});
                                                  conversion(price:modelController.text);

                                                  isCheckedModel?   usersRef.doc(widget.currentUserId).update({
                                                    'modelAvg':modelController.text?? "Contact for price",
                                                    "modelUsd":USD ?? 0,
                                                    'model':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'modelAvg':modelController.text?? "Contact for price",
                                                    "modelUsd":USD ?? 0,
                                                    'model':false
                                                  });


                                                  setState((){selectedModel=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedMakeup?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedMakeup=true;});
                                                  conversion(price:makeController.text);

                                                  isCheckedMakeup?   usersRef.doc(widget.currentUserId).update({
                                                    'makeupAvg':makeController.text?? "Contact for price",
                                                    "makeupUsd":USD ?? 0,
                                                    'makeup':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'makeupAvg':makeController.text?? "Contact for price",
                                                    "makeupUsd":USD ?? 0,
                                                    'makeup':false
                                                  });


                                                  setState((){selectedMakeup=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedHair?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedHair=true;});
                                                  conversion(price:hairController.text);

                                                  isCheckedHair?   usersRef.doc(widget.currentUserId).update({
                                                    'hairAvg':hairController.text?? "Contact for price",
                                                    "hairUsd":USD ?? 0,
                                                    'hair':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'hairAvg':hairController.text?? "Contact for price",
                                                    "hairUsd":USD ?? 0,
                                                    'hair':false
                                                  });


                                                  setState((){selectedHair=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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
                                              child:  ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  textStyle: TextStyle(color: Colors.white) ,
                                                  onPrimary:kButton,  primary:Colors.black, // foreground
                                                ),
                                                child:selectedChoreographer?
                                                CircularProgressIndicator(color: Colors.black,):
                                                Text("Save", style: TextStyle(color: Colors.black) ),
                                                onPressed: (){
                                                  setState((){selectedChoreographer=true;});
                                                  conversion(price:choController.text);

                                                  isCheckedChoreographer?   usersRef.doc(widget.currentUserId).update({
                                                    'choreographerAvg':choController.text?? "Contact for price",
                                                    "choreographerUsd":USD ?? 0,
                                                    'choreographer':true
                                                  }): usersRef.doc(widget.currentUserId).update({
                                                    'choreographerAvg':choController.text?? "Contact for price",
                                                    "choreographerUsd":USD ?? 0,
                                                    'choreographer':false
                                                  });


                                                  setState((){selectedChoreographer=false;});
                                                  Fluttertoast.showToast(
                                                      msg: "Saved! ", timeInSecForIos: 4);

                                                },
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