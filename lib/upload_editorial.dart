import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:quill_delta/quill_delta.dart';

import 'package:flutter/material.dart';
import 'package:fashow/user.dart';


import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:zefyr/zefyr.dart';

class UploadEdit extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final User currentUser;

  UploadEdit({this.currentUser,
  this.globalKey});
  @override
  _UploadEditState createState() => _UploadEditState();
}

class _UploadEditState extends State<UploadEdit>
     {
  /// Allows to control the editor and the document.
  ZefyrController _controller;
ZefyrImageDelegate _imageDelegate;
  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  String _error = 'No Error Dectected';
  TextEditingController titleController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  bool _inProcess = false;

  File file;
  bool isUploading = false;
  String blogId = Uuid().v4();



  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
//  bool _inProcess = false;

  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }



  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed: () {
                getImage(ImageSource.camera);
                Navigator.pop(context);
              }),
              SimpleDialogOption(
                  child: Text("Image from Gallery"),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  Widget getImageWidget() {
    if (file != null) {
      return Image.file(
        file,
        width: 250,
        height: 250,
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

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$blogId.jpg')
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
  Future<String> uploadImage(imageFile) async {
    StorageUploadTask uploadTask =
    storageRef.child("blog_$blogId.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
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



  createProdInFirestore({
    String   blogmediaUrl,
// ignore: non_constant_identifier_names
String ImagesUrl,
    String content,
  String title,
    String source,

  String headerImage,
  }) {

    blogRef
        .document(widget.currentUser.id)
        .collection("userBlog")
        .document(blogId)
        .setData({
      "blogId": blogId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.displayName,
      "photoUrl": widget.currentUser.photoUrl,
      "blogmediaUrl": blogmediaUrl,
      "title": title,
      "content":content,
      // "headerImage":headerImage,
      "source":source,
      "timestamp": timestamp,
      "claps": {},
    });
    titleController.clear();
    sourceController.clear();
     setState(() {
      file = null;
//      isUploading = false;
//      imageUrls = [];
//      images = [];
    });
  }

  handleSubmit() async {

    setState(() {
      isUploading = true;
    });
    await compressImage();
   String blogmediaUrl = await uploadImage(file);
    // jsonEncode(_controller.document.toDelta().toJson());
    final contents = jsonEncode(_controller.document);

    createProdInFirestore(
      blogmediaUrl: blogmediaUrl,
      content: contents,
      title: titleController.text,
      source: sourceController.text,

    );

    setState(() async {

      isUploading = false;
    });
    Navigator.pop(context);
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
  builduploadForm() {
    final editor = ZefyrField(
      height: 400.0, // set the editor's height
      decoration: InputDecoration(labelText: 'Description'),
      controller: _controller,
      focusNode: _focusNode,
      autofocus: false,
      physics: ClampingScrollPhysics(),
    );
    final form =
    ListView(
shrinkWrap: true,
      children: <Widget>[
        isUploading ? linearProgress() : Text(""),
        getImageWidget(),
        TextFormField(controller: titleController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(labelText: 'Title of the blog',
                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),

        editor,

        TextField(controller: sourceController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(labelText: 'source',        fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
      ],
    );
    return
        Stack(
          children: [
            WillPopScope(
              onWillPop:   showDialog(
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
                  false,
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
                      onPressed: isUploading ? null : () => handleSubmit(),
                      child: Text(
                        "Post",
                        style: TextStyle(
                            color: kblue,
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
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: form,
                  ),
                ),

              ),

            ),
            isUploading ? Center(child: CircularProgressIndicator()) : Text(""),
          ],
        );


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
                "Upload Header Image",
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

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSplashScreen() : builduploadForm();
  }
  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("");
    return NotusDocument.fromDelta(delta);
  }
}

