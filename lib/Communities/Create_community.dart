
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fashow/progress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_select/smart_select.dart';

import 'package:uuid/uuid.dart';
import 'dart:async';
import 'dart:ui';

import 'package:fashow/size_config.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:flutter/cupertino.dart';


class CreateCommunity extends StatefulWidget {


  @override
  _CreateCommunityState createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity>
    with AutomaticKeepAliveClientMixin<CreateCommunity>{
  String communityId = Uuid().v4();
  bool isUploading = false;
  List<String> images = <String>[];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  bool private = false;

  TextEditingController detailsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
 List<String> leaders = <String>[];
List<String> leadersImg = <String>[];
List<String> leadersId = <String>[];
 List<String> members = <String>[];
List<String> membersImg = <String>[];
List<String> membersId = <String>[];
 List<String> awaitingAcceptance = <String>[];
List<String> awaitingAcceptanceImg = <String>[];
List<String> awaitingAcceptanceId = <String>[];

List<String> bannedMembersId = <String>[];
List<String> userCommunityId = <String>[];

  File file1;

  @override
  void initState() {
    super.initState();
     leaders.add(currentUser.displayName) ;
     leadersImg.add(currentUser.photoUrl)  ;
     leadersId.add(currentUser.id)  ;
     members.add(currentUser.displayName) ;
     membersImg.add(currentUser.photoUrl) ;
     membersId.add(currentUser.id)  ;
    userCommunityId.add(communityId)  ;

  }

  Widget getImageWidget1() {
    if (file1 != null) {
      return InkWell(
        onTap:()=>getImage1(),
        child: Image.file(
          file1,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3,
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
  compressImage1() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file1.readAsBytesSync());
    final compressedImageFile = File('$path/img1_$communityId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file1 = compressedImageFile;
    });
  }


  Future<String> uploadImage1(imageFile) async {
    Reference reference = FirebaseStorage.instance.ref().child("$communityId.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    images.add(downloadUrl);
    return downloadUrl;
  }

  Servicecatalog()async{
    setState(() {
      isUploading = true;
    });
    file1!=null? await compressImage1():null;
    String mediaUrl =  file1!=null?await uploadImage1(file1):"";


    FirebaseFirestore.instance.collection('Community')
        .doc(communityId)
        .set({
      "leader":leaders,
      "leaderImg":leadersImg,
      "leaderId":leadersId,
      "members":members,
      'communityId':communityId,
      "communityImg":mediaUrl,
       "bannedMembers":bannedMembersId,
"awaitingAcceptance":awaitingAcceptance,
      "timestamp": timestamp,
      'title':titleController.text,
      'description':detailsController.text,
      "closed":private,
    });
 FirebaseFirestore.instance.collection('users')
        .doc(currentUser.id)
        .update({

      'communityId':userCommunityId,

    });

    setState(() {
      isUploading = false;
    });
  }

  buildSplashScreen() {
    return
      ModalProgressHUD(
        inAsyncCall: _inProcess,
        child: Scaffold(
          body: Container(
            alignment:Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//          SvgPicture.asset('assets/images/upload.svg', height: 260.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation : 0.001,
                      primary:  Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ), ),
                    child: Text(
                      "Select Image",
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
  buildUploadScreen()  {
    return    ModalProgressHUD(
      inAsyncCall: isUploading,
      child: Scaffold(
        appBar:  AppBar(      backgroundColor: kPrimaryColor,

          title: FittedBox(
            fit:BoxFit.contain,
            child: Text('Create ',
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  // fontSize:  35.0 ,
                  color: Colors.white),),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
        ),

        body:
        Container(color:Cont,
          child: Stack(
            children:[
              Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      isUploading ? linearProgress() : Text(""),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: getImageWidget1(),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          style:TextStyle(color:kText),
                          controller: titleController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText: 'Title',labelStyle: TextStyle(color: kText),
                            hintText: 'Title',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if ( text.isEmpty) {
                              return 'Title is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox( height: 8.0,),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          style:TextStyle(color:kText),

                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: detailsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText: 'Description',labelStyle: TextStyle(color: kText),
                            hintText: 'Description',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Description is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox( height: 8.0,),
                      

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Make this community private?',style:TextStyle(color: kText)),
                      ) ,
                      SizedBox( height: 8.0,),

                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('No'),
                          SizedBox( width: 8.0,),

                          Switch(
                            value: private,
                            onChanged: (value){setState(() {
                              private = value;
                            });},
                            activeColor: Colors.blue,
                            activeTrackColor: kPrimaryColor,
                          ),
                          SizedBox( width: 8.0,),

                          Text('Yes')
                        ],
                      ),

                      SizedBox( height: 8.0,),


                      Container(
                          margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation : 0.001,
                              primary:  Colors.black, ),
                            onPressed:() async{
                              Fluttertoast.showToast(
                                  msg: "Please wait: Creating community", timeInSecForIos: 4);


                              if(_formKey.currentState.validate()) {
                                // ignore: unnecessary_statements
Servicecatalog();
                                Navigator.pop(context);
                              }

                            },
                            child: Text('Create', style: TextStyle(
                              // fontFamily :"MajorMonoDisplay",
                              //   fontSize:  ,
                                color: Colors.white),),
                          )
                      ),

                    ],
                  ),

                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return file1 == null ? buildSplashScreen() : buildUploadScreen();
  }

}
