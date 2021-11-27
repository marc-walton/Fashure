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

import 'package:fashow/Categories/BboyEcomUp.dart';
import 'package:fashow/Categories/BgirlEcomUp.dart';
import 'package:fashow/Categories/KboyEcomUp.dart';
import 'package:fashow/Categories/KgirlEcomUp.dart';
import 'package:fashow/Categories/MenEcomUp.dart';
import 'package:fashow/Categories/WomenEcomUp.dart';
import 'package:fashow/Categories/TboyEcomUp.dart';
import 'package:fashow/Categories/TgirlEcomUp.dart';

import 'package:photo_view/photo_view.dart';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
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


class UploadResale extends StatefulWidget {

  @override
  _UploadResaleState createState() => _UploadResaleState();
}

class _UploadResaleState extends State<UploadResale>
    with AutomaticKeepAliveClientMixin<UploadResale>{
  String postId = Uuid().v4();
  bool isUploading = false;
  List<String> images = <String>[];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController detailsController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController option5Controller = TextEditingController();

  Servicecatalog()async{
    setState(() {
      isUploading = true;
    });

    postsRef
        .doc(currentUser.id)
        .collection("userPosts")
        .doc(postId)
        .set({
      "type":'Poll',
      'ownerId':currentUser.id,
      'username':currentUser.displayName,
      'photoUrl':currentUser.photoUrl,
      'postId':postId,
      "country":  currentUser.country,
      "currency":  currentUser.currency,
      "option1": option1Controller.text,
      "option2": option2Controller.text,
      "option3": option3Controller.text,
      "option4": option4Controller.text,
      "option5": option5Controller.text,
      "option1Votes": {},
      "option2Votes": {},
      "option3Votes": {},
      "option4Votes": {},
      "option5Votes": {},
      "Voters": {},

      "timestamp": timestamp,

      'description':detailsController.text,

    });

    setState(() {
      isUploading = false;
    });
  }


  page0(){
    return
      ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Form(
              key: _formKey,
              child: Column(

                children: [
                  isUploading ? linearProgress() : Text(""),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                    child: TextFormField(
                      style:TextStyle(color:kText),

                      maxLines: null,
                      controller: option1Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Option 1',labelStyle: TextStyle(color: kText),
                        hintText: 'Option 1',
                      ),
                      textAlign: TextAlign.center,
                      validator: (text) {
                        if (text.isEmpty) {
                          return 'Option 1 is empty';
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

                      maxLines: null,
                      controller: option2Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Option 2',labelStyle: TextStyle(color: kText),
                        hintText: 'Option 2',
                      ),
                      textAlign: TextAlign.center,
                      validator: (text) {
                        if (text.isEmpty) {
                          return 'Option 2 is empty';
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

                      maxLines: null,
                      controller: option3Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Option 3',labelStyle: TextStyle(color: kText),
                        hintText: 'Option 3',
                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  SizedBox( height: 8.0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                    child: TextFormField(
                      style:TextStyle(color:kText),

                      maxLines: null,
                      controller: option4Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Option 4',labelStyle: TextStyle(color: kText),
                        hintText: 'Option 4',
                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  SizedBox( height: 8.0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                    child: TextFormField(
                      style:TextStyle(color:kText),

                      maxLines: null,
                      controller: option5Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                        labelText: 'Option 5',labelStyle: TextStyle(color: kText),
                        hintText: 'Option 5',
                      ),
                      textAlign: TextAlign.center,

                    ),
                  ),
                  SizedBox( height: 8.0,),


                ],
              ),

            ),
          ),

          InkWell(
            onTap:() async{
              Fluttertoast.showToast(
                  msg: "Please wait:Uploading", timeInSecForIos: 4);


              if(_formKey.currentState.validate()) {
                // ignore: unnecessary_statements

                Servicecatalog();
                Navigator.pop(context);
              }

            },
            child: FittedBox(
              fit:  BoxFit.fitHeight,
              child: Container(
                alignment:Alignment.center,
                height:MediaQuery. of(context). size. height *0.06,

                width:MediaQuery. of(context). size. width,

                //icon: Icon(Icons.drag_handle),
                child:Text("Post",style:TextStyle(color: Colors.black)),

              ),
            ),
          ),

        ],
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
    setState(() {
    isUploading = false;
    });               },
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }

  buildUploadScreen() {


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
    setState(() {
    isUploading = false;
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
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(

                          children: [
                            isUploading ? linearProgress() : Text(""),
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
                            Container(
                              margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                              child: TextFormField(
                                style:TextStyle(color:kText),

                                maxLines: null,
                                controller: option1Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Option 1',labelStyle: TextStyle(color: kText),
                                  hintText: 'Option 1',
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if (text.isEmpty) {
                                    return 'Option 1 is empty';
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

                                maxLines: null,
                                controller: option2Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Option 2',labelStyle: TextStyle(color: kText),
                                  hintText: 'Option 2',
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if (text.isEmpty) {
                                    return 'Option 2 is empty';
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

                                maxLines: null,
                                controller: option3Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Option 3',labelStyle: TextStyle(color: kText),
                                  hintText: 'Option 3',
                                ),
                                textAlign: TextAlign.center,

                              ),
                            ),
                            SizedBox( height: 8.0,),
                            Container(
                              margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                              child: TextFormField(
                                style:TextStyle(color:kText),

                                maxLines: null,
                                controller: option4Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Option 4',labelStyle: TextStyle(color: kText),
                                  hintText: 'Option 4',
                                ),
                                textAlign: TextAlign.center,

                              ),
                            ),
                            SizedBox( height: 8.0,),
                            Container(
                              margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                              child: TextFormField(
                                style:TextStyle(color:kText),

                                maxLines: null,
                                controller: option5Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Option 5',labelStyle: TextStyle(color: kText),
                                  hintText: 'Option 5',
                                ),
                                textAlign: TextAlign.center,

                              ),
                            ),
                            SizedBox( height: 8.0,),


                          ],
                        ),

                      ),
                    ),

                    InkWell(
                      onTap:() async{
                        Fluttertoast.showToast(
                            msg: "Please wait:Uploading", timeInSecForIos: 4);


                        if(_formKey.currentState.validate()) {
                          // ignore: unnecessary_statements

                          Servicecatalog();
                          Navigator.pop(context);
                        }

                      },
                      child: FittedBox(
                        fit:  BoxFit.fitHeight,
                        child: Container(
                          alignment:Alignment.center,
                          height:MediaQuery. of(context). size. height *0.06,

                          width:MediaQuery. of(context). size. width,

                          //icon: Icon(Icons.drag_handle),
                          child:Text("Post",style:TextStyle(color: Colors.black)),

                        ),
                      ),
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

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return  buildUploadScreen();
  }

}
