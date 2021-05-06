import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:quill_delta/quill_delta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fashow/user.dart';


import 'package:flutter_icons/flutter_icons.dart';
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
//import 'package:flutter_form_builder/flutter_form_builder.dart';

class UploadEdit extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final User currentUser;

  UploadEdit({this.currentUser,
  this.globalKey});
  @override
  _UploadEditState createState() => _UploadEditState();
}

class _UploadEditState extends State<UploadEdit>
    with AutomaticKeepAliveClientMixin<UploadEdit> {
  /// Allows to control the editor and the document.
  ZefyrController _controller;
ZefyrImageDelegate _imageDelegate;
  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;
  // QuillController controller = QuillController.basic();
  // final FocusNode focusNode = FocusNode();
  // List<Asset> images = List<Asset>();
  // List<File> image = List<File>();
  // List<String> imageUrls = <String>[];
  // String ImagesUrl;
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
//    _imageDelegate =  MyAppZefyrImageDelegate();
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
      "username": widget.currentUser.username,
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

//   Future<String> _onImagePickCallback(File file) async {
//
//     if (file == null) return null;
//     image.add(file);
//     print(image);
//     // Copies the picked file fr`om temporary cache to applications directory
//     // Directory appDocDir = await getApplicationDocumentsDirectory();
//     // File copiedFile =
//     // await file.copy('${appDocDir.path}/${basename(file.path)}');
//     if( isUploading = true){
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       StorageUploadTask uploadTask =
//       storageRef.child("blog$blogId$fileName.jpg").putFile(file);
//       StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
//       String downloadUrl = await storageSnap.ref.getDownloadURL();
//       return downloadUrl;
// //       StorageReference reference = FirebaseStorage.instance.ref().child("blog_$fileName.jpg");
// //       StorageUploadTask uploadTask = reference.putData((await file.getByteData(quality: 70)).buffer.asUint8List());
// //       StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
// // //    print(storageTaskSnapshot.ref.getDownloadURL());
// //       return storageTaskSnapshot.ref.getDownloadURL();
//    }
//
//   }
  handleSubmit() async {

    setState(() {
      isUploading = true;
    });
    await compressImage();
   String blogmediaUrl = await uploadImage(file);
    // jsonEncode(_controller.document.toDelta().toJson());
    final contents = jsonEncode(_controller.document);
//    final titleedit = jsonEncode(titleController);
//    final sourceedit = jsonEncode(sourceController);
     String url;
//    for ( var imageFile in images) {
//      postImage(imageFile).then((downloadUrl) {
//        imageUrls.add(downloadUrl.toString());
//        if(imageUrls.length==images.length){
//           url = DateTime.now().millisecondsSinceEpoch.toString();
//
//print(imageUrls);
//        }
//      });
//    }
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
//       imageDelegate: CustomImageDelegate(),
//
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
            decoration: InputDecoration(labelText: 'Title of the blog')),

        editor,

        TextField(controller: sourceController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(labelText: 'source')),
      ],
    );
    return
        Stack(
          children: [
            WillPopScope(
              onWillPop: _onBackPressed,
              child: Scaffold(
                // resizeToAvoidBottomPadding: true,
                appBar: AppBar(title: Text('Blog Form'),
                  backgroundColor: kPrimaryColor,
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: kSecondaryColor),
                      onPressed:_onBackPressed),
                  actions: [
                    FlatButton(
                      onPressed: isUploading ? null : () => handleSubmit(),
                      child: Text(
                        "Post",
                        style: TextStyle(
                            color: kGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )
                  ],
                ),
                body:
                // Column(
                //   children: [
                //     QuillToolbar.basic(onImagePickCallback: _onImagePickCallback,
                //         controller: controller),
                //     Expanded(
                //       child: Container(
                //         child: QuillEditor(
                //           // onImagePickCallback: _onImagePickCallback,
                //           scrollable: true,
                //           focusNode: focusNode,
                //           expands: false,
                //           scrollController: ScrollController(),
                //           autoFocus: false,
                //           padding: EdgeInsets.zero,
                //           controller: controller,
                //           readOnly: false, // true for view only mode
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                ZefyrScaffold(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: form,
                  ),
                ),
              ),
//        ),
//        isUploading ? Center(child: CircularProgressIndicator()) : Text(""),
//      ],
    ),
            isUploading ? Center(child: CircularProgressIndicator()) : Text(""),
          ],
        );


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
    super.build(context);
    return file == null ? buildSplashScreen() : builduploadForm();
  }
  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("");
    return NotusDocument.fromDelta(delta);
  }
}

class CustomImageDelegate implements ZefyrImageDelegate<ImageSource> {
  String Url;
  @override
  Future<String> pickImage(ImageSource source) async {
    final file = await ImagePicker.pickImage(source: source);
    if (file == null) return null;

    StorageUploadTask uploadTask =
    storageRef.child("post_$file.jpg").putFile(file);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return Url =  downloadUrl ;
  }

  @override
  ImageSource get cameraSource => ImageSource.camera;

  @override
  ImageSource get gallerySource => ImageSource.gallery;

  @override
  Widget buildImage(BuildContext context, String key) {
//    final file = File.fromUri(Uri.parse(key));
//    final image = FileImage(file);

    return Container(child: Image.network(Url));
  }
}