import 'dart:io';
import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';
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


class UploadColl extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final User currentUser;

  UploadColl({this.currentUser,
    this.globalKey});
  @override
  _UploadCollState createState() => _UploadCollState();
}

class _UploadCollState extends State<UploadColl>
    with AutomaticKeepAliveClientMixin<UploadColl> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  List<String> imageUrls = <String>[];
  TextEditingController titleController = TextEditingController();
  TextEditingController sourceController = TextEditingController();

  File file;
  bool isUploading = false;
  String CollId = Uuid().v4();


  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.

  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        print(asset.getByteData(quality: 75));
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,

            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
            ),
          ),
        );
      }),
    );
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
    final compressedImageFile = File('$path/img_$CollId.jpg')
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
    storageRef.child("collhead_$CollId.jpg").putFile(imageFile);
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
  Future<void> loadAssets() async {

    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
//    ByteData byteData = await asset.getByteData(quality: 80);
    try {
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
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child("colle_$fileName.jpg");
    StorageUploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }


  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String headerImage = await uploadImage(file);
    for ( var imageFile in images) {
     postImage(imageFile).then((downloadUrl) {
       imageUrls.add(downloadUrl.toString());
       if(imageUrls.length==images.length){
         String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
         collRef
            .document(CollId).setData({
           'collmediaUrl':imageUrls,
          "collId": CollId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
          "headerImage":headerImage,
          "title": titleController.text,
          "source": sourceController.text,
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
     });
   }
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

    final form =
    ListView(
      shrinkWrap: true,
      children: <Widget>[
        isUploading ? linearProgress() : Text(""),
        Text('Header Image', style: TextStyle(
            color: kText,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),),
        getImageWidget(),
        TextFormField(
            style:TextStyle(color: kText),

            controller: titleController,
            keyboardType: TextInputType.multiline,
            maxLines: null,

            decoration: InputDecoration(labelText: 'Name of the Collection',
            labelStyle: TextStyle(
              color: kText, ),
            fillColor: transwhite,
            border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),) )
        ),


        TextField(
            style:TextStyle(color: kText),

            controller: sourceController,
            keyboardType: TextInputType.multiline,
            maxLines: null,

            decoration: InputDecoration(labelText: 'Description of Collection',labelStyle:TextStyle(
              color: kText, ),

                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
SizedBox(height:12.0),
        FloatingActionButton.extended(onPressed: loadAssets, label: Text(
            'Pick Collection Images'),
backgroundColor: kText,
        ),
        Container(height: 400,
            child: buildGridView()),
      ],
    );
    return
      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Stack(
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
            isUploading ? Center(child: CircularProgressIndicator(backgroundColor: kText,)) : Text(""),
          ],
        ),
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
                "Select Header Image",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              color: Colors.deepOrange,
              onPressed: () =>  selectImage(context),
              // selectImage(context),
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

}
