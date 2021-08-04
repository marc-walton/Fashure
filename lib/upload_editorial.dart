import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:quill_format/quill_format.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:image/image.dart' as Im;
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:zefyrka/zefyrka.dart';
class UploadEdit extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final Users currentUser;

  UploadEdit({this.currentUser,
    this.globalKey});
  @override
  _UploadEditState createState() => _UploadEditState();
}

class _UploadEditState extends State<UploadEdit>
{
  /// Allows to control the editor and the document.
  ZefyrController _controller;
  //ZefyrImageDelegate _imageDelegate;
  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;
  List<Asset> images = <Asset>[];

  String _error = 'No Error Dectected';
  TextEditingController titleController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  bool _inProcess = false;

  File file;
  bool isUploading = false;
  String blogId = Uuid().v4();
  var USD;
  String U;
  List<String> imageUrls = <String>[];



  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
//  bool _inProcess = false;

  @override

  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadDocument().then((document) {
      setState(() {
        _controller = ZefyrController(document);
      });
    });
  }
  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + '/quick_start.json');
    if (await file.exists()) {
      final contents = await file
          .readAsString()
          .then((data) => Future.delayed(Duration(seconds: 1), () => data));
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    final delta = Delta()..insert('');
    return NotusDocument()..compose(delta, ChangeSource.local);
  }

  Future<void> loadAssets() async {

    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';
//    ByteData byteData = await asset.getByteData(quality: 80);
    try {
      setState(() {
        _inProcess = true;

      });
      resultList = await MultiImagePicker.pickImages(

        maxImages: 100,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "Images"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Upload Image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",

        ),
      );
      print(resultList.length);
      print((await resultList[0].getThumbByteData(122, 100)));
      print((await resultList[0].getByteData()));
      print((await resultList[0].metadata));

    } on Exception catch (e) {
      error = e.toString();
      setState(() {
        _inProcess = false;

      });
    }

    if (!mounted) return;
    setState(() {

      images = resultList;
      _error = error;
    });

  }
  buildSplashScreen() {
    return
      ModalProgressHUD(
        inAsyncCall: _inProcess,
        child: Scaffold(
          body: Container(
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

                      "Select images",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    color: Colors.deepOrange,
                    onPressed: ()  =>loadAssets(),
                    // selectImage(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("blog${blogId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }
  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });


    for ( var imageFile in images) {
      postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if(imageUrls.length==images.length){
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
          // jsonEncode(_controller.doc.toDelta().toJson());
          final contents = jsonEncode(_controller.document);

          blogRef
              .doc(widget.currentUser.id)
              .collection("userBlog")
              .doc(blogId)
              .set({
            "blogId": blogId,
            "ownerId": widget.currentUser.id,
            "username": widget.currentUser.displayName,
            "photoUrl": widget.currentUser.photoUrl,
            "blogmediaUrl": imageUrls,
            "title":  titleController.text,
            "content":contents,

            "timestamp": timestamp,
            "claps": {},
          }).then((_){
            SnackBar snackbar = SnackBar(content: Text('Uploaded Successfully'));
            widget.globalKey.currentState.showSnackBar(snackbar);
            setState(() {
              images = [];
              imageUrls = [];
            });
          });
        }
      }).catchError((err) {
        print(err);
        print('rtherjhertjnherj${imageUrls.length}');
        print('rjertertj${images.length}');

      });
    }
    Navigator.pop(context);

  }

  carousel(){

    return
      CarouselSlider(
          options: CarouselOptions(
            height:400,
            enableInfiniteScroll: false,
          ),
          items: images.map((e) => Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: e,
                width: 500,
                height: 500,
              ),
            ),
          ), ).toList()

      );

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



  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text('Create Post',style:
        TextStyle(color:
              Colors.white),),
            children: <Widget>[
              SimpleDialogOption(
                  child:  Text('Photo with Camera',),
                  onPressed: () {
                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  }),
              SimpleDialogOption(
                  child:  Text('Image from Gallery'),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }
              ),
              SimpleDialogOption(
                child:  Text('Cancel',),
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
    UploadTask uploadTask =
    storageRef.child("blog_$blogId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }
  _launchRF({String rl}) async {
    String url = rl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }




  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new  Text('Are you sure?',),
        content: new  Text('Do you want to exit without uploading?',),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('NO',),
          ),
          SizedBox(height: 16),
          new FlatButton(

            onPressed: () async {
              Navigator.of(context).pop(true);
Navigator.of(context).pop(true);

//            clearImage();
            },
            child:  Text('YES',),
          ),
        ],
      ),
    ) ??
        false;
  }
  builduploadForm() {
    final editor = ZefyrEditor(
        maxHeight:400,
      scrollPhysics: ClampingScrollPhysics(),
      controller: _controller,
      focusNode: _focusNode,
      autofocus: false,
    );
    final form =
    Column(
      children: <Widget>[
        isUploading ? linearProgress() : Text(""),
        carousel(),
        SizedBox(height:20),
        TextFormField(controller: titleController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(labelText: 'Title of the blog',
                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
        ZefyrToolbar.basic(controller: _controller),
        editor,
        SizedBox(height:20),

        // TextField(controller: sourceController,
        //     keyboardType: TextInputType.multiline,
        //     maxLines: null,
        //     decoration: InputDecoration(labelText: 'source',        fillColor: transwhite,
        //         border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
      ],
    );
    return

      WillPopScope(
        onWillPop:()=> _onBackPressed(),
        child: ModalProgressHUD(
          color: Colors.black,
          opacity: 1.0,
          progressIndicator: Image.asset('assets/img/loading-76.gif'),
          inAsyncCall: isUploading,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed:()=> _onBackPressed()),
              actions: [
                RaisedButton(color:kblue,
                  onPressed: isUploading ? null : () => handleSubmit(),
                  child:  Text('Post',style:
                     TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                )
              ],
            ),
            body:

            SingleChildScrollView(
              reverse: true,


              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:    form,
              ),
            ),

          ),
        ),

      );

  }


  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    return images == null ? buildSplashScreen() : builduploadForm();
  }
/// Loads the document to be edited in Zefyr.
}
