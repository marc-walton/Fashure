import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/methods/Empty_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/size_config.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  PageController pageController = PageController();
  int pageChanged  = 0;
  String _error = 'No Error Dectected';
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController contentTitle = TextEditingController();
  TextEditingController contentBody = TextEditingController();
  bool _inProcess = false;

  File file;
  bool isUploading = false;
  String blogId = Uuid().v4();
  var USD;
  String U;
  List<String> imageUrls = <String>[];

File file1;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
//  bool _inProcess = false;

  @override

  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadFromAssets();
    blogRef
        .doc(widget.currentUser.id)
        .collection("userBlog")
        .doc(blogId)
        .set({});
  }
  Future<void> _loadFromAssets() async {
    final doc = NotusDocument()..insert(0, '');
    setState(() {
      _controller = ZefyrController(doc);
    });
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

  tag(){
    return
      showMaterialModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {
          SizeConfig().init(context);

          return
            Builder(builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.75,

                    child: TagItem(

                  ),

                  );
              }
              );
            }
            );
        },
      );

  }
  tagView(){
    return new ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return TagItem(


          );
        }
    );


  }

  Widget getImageWidget1() {
    if (file1 != null) {
      return Stack(
        children: [
          InkWell(
            onTap:()=>getImage1(),
            child: Image.file(
              file1,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child:     ElevatedButton(

              style: ElevatedButton.styleFrom(

                primary:Colors.black,
                onPrimary:Colors.white,// foreground
              ),
              onPressed: () {
                tag();
              },

              child:   Text("Tag other products",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *3.5
                  ,color:kText),),
            ),

          ),
        ],
      );
    } else {
      return InkWell(
          onTap:()=>getImage1(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Icon(
                  Icons.add,
                  size:50,
                ),
                Text("Add image(optional)")

              ],
            ),
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
    final compressedImageFile = File('$path/img1_$blogId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file1 = compressedImageFile;
    });
  }
  Future<String> uploadImage1(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("blog${blogId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    // images.add(downloadUrl);
    return downloadUrl;
  }
  Widget getImageWidget() {
    if (file != null) {
      return InkWell(
        onTap:()=>getImage(),
        child: Image.file(
          file,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return InkWell(
          onTap:()=>getImage(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center ,

              children: [
                Icon(
                  Icons.add,
                  size:50,
                ),
                Text("Add image")

              ],
            ),
          ));
    }
  }
  getImage() async {

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
        file = cropped;
        _inProcess = true;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img1_$blogId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
    if (!mounted) return; setState(() {
      file = compressedImageFile;
    });
  }
  Future<String> uploadImage(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("blog${blogId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    // images.add(downloadUrl);
    return downloadUrl;
  }
clearContent() {
  contentTitle.clear();
  contentBody.clear();
  file1 = null;
}
  contentView(){
    return
      StreamBuilder(
        stream:  blogRef
            .doc(currentUser.id)
            .collection('userBlog')
            .doc(blogId)
            .collection('content')
            .orderBy('timestamp',descending: false).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.isEmpty){
            return
              Container();
          } else {
            return new ListView.builder(
              shrinkWrap: true,
physics:NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return contentItem(

                    Id: ds['Id'],
                  title: ds['title'],
                  body: ds['body'],

                  blogId: blogId,

                    image: ds['image'],

                  );
                }
            );
          }
        },
      );

  }

  addContent(){
    return
  showMaterialModalBottomSheet(
    expand:true,
    context: context,
    builder: (BuildContext context)
    {
      bool adding =  false;

      SizeConfig().init(context);

          return StatefulBuilder(builder: (BuildContext context, State) {
            Widget getImageWidget1() {
              if (file1 != null) {
                return InkWell(
                  onTap:() async {
                    State(() {
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

                 State(() {
                  file1 = cropped;
                  _inProcess = true;
                  });
                  } else {
                  State(() {
                  _inProcess = false;
                  });
                  }},
                  child: Image.file(
                    file1,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/3,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return InkWell(
                    onTap:() async {
                     State(() {
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

                        State(() {
                          file1 = cropped;
                          _inProcess = true;
                        });
                      } else {
                        State(() {
                          _inProcess = false;
                        });
                      }},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center ,
                        children: [
                          Icon(
                            Icons.add,
                            size:50,
                          ),
                          Text("Add image(optional)")

                        ],
                      ),
                    ));
              }
            }

            compressImage1() async {
              final tempDir = await getTemporaryDirectory();
              final path = tempDir.path;
              Im.Image imageFile = Im.decodeImage(file1.readAsBytesSync());
              final compressedImageFile = File('$path/img1_$blogId.jpg')
                ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 50));
              if (!mounted) return; setState(() {
                file1 = compressedImageFile;
              });
            }
            Future<String> uploadImage1(imageFile) async {
              String fileName = DateTime.now().millisecondsSinceEpoch.toString();
              Reference reference = FirebaseStorage.instance.ref().child("blog${blogId}").child("$fileName.jpg");
              UploadTask uploadTask = reference.putFile(imageFile);

              TaskSnapshot storageSnap = await uploadTask;
              String downloadUrl = await storageSnap.ref.getDownloadURL();

              // images.add(downloadUrl);
              return downloadUrl;
            }
            return
              Scaffold(
                appBar: AppBar(backgroundColor:Colors.black,automaticallyImplyLeading: false,
                    actions:[IconButton(icon: Icon(Icons.close),onPressed:() =>Navigator.pop(context),)]),
                body:               Stack(
                  children: [
                   adding?Center(
                     child: Column(
                       mainAxisAlignment:MainAxisAlignment.center ,
crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         CircularProgressIndicator(),
                         Text("Please wait...."),
                       ],
                     ),
                   ): Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,

                      child:                   SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              TextFormField(controller: contentTitle,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(labelText: 'heading',
                                      fillColor: transwhite,
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
                              SizedBox(height:10),
                              getImageWidget1(),
                              SizedBox(height:10),

                              TextFormField(controller: contentBody,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,

                                  decoration: InputDecoration(labelText: 'body',
                                      fillColor: transwhite,
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
                              SizedBox(height:10),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(

                                    primary:Colors.black,
                                    onPrimary:Colors.white,// foreground
                                  ),
                                  onPressed:()async{
                                    print("||||||||||||||||||||||||||||$adding");
                                   State((){adding =  true;});
                                    print("||||||||||||||||||||||||||||$adding");

                                    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
                                file1!=null? await compressImage1():null;
                                String mediaUrl1 =  file1!=null?await uploadImage1(file1):"";
                              await  blogRef
                                    .doc(currentUser.id)
                                    .collection('userBlog')
                                    .doc(blogId)
                                    .collection('content')
                                    .doc(fileName)
                                    .set({
                                  "title":contentTitle.text??"",
                                  "body":contentBody.text??"",
                                  "image":mediaUrl1??"",

"Id":fileName,
                                  "timestamp":timestamp,

                                });
                                clearContent();
                                Navigator.pop(context);
                                   State((){adding =  false;});
                                    print("||||||||||||||||||||||||||||$adding");

                                  }, child: Text("Done"))
                            ],
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              );
          }
          );

    },
  );
}
  page0(){

    return
      Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:      Column(
                children: <Widget>[
                  TextFormField(controller: titleController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(labelText: 'Title of the blog',
                          fillColor: transwhite,
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)),
                    textAlign: TextAlign.center,
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Title is empty';
                      }
                      return null;
                    },),
                  SizedBox(height:20),
                  getImageWidget(),
                  TextFormField(controller: bodyController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'body of the blog',
                          fillColor: transwhite,
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'body is empty';
                      }
                      return null;
                    },),


                ],
              ),
            ),
            SizedBox(height:20),

            Expanded(
              child: Container(
                  // height:MediaQuery.of(context).size.height,
                  child: contentView()),
            ),
            SizedBox(height:20),

            ElevatedButton(
              style:ElevatedButton.styleFrom(primary: Colors.black,onPrimary: Colors.white),
              child: Text("Add content"),
              onPressed: (){
                addContent();
              },
            ),



          ],
        ),
      );

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
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      primary: Colors.black,
                    ),

                    child: Text(

                      "Select images",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    onPressed: ()  =>getImage(),
                    // selectImage(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    file!=null? await compressImage():null;
    String mediaUrl =  file!=null?await uploadImage(file):"";
   await blogRef
        .doc(widget.currentUser.id)
        .collection("userBlog")
        .doc(blogId)
        .update({
      "blogId": blogId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.displayName,
      "photoUrl": widget.currentUser.photoUrl,
      "currency":  currentUser.currency,

      "blogmediaUrl": mediaUrl??"",
      "title":  titleController.text,
      "body": bodyController.text,

      "timestamp": timestamp,
      "claps": {},
    });

    setState(() {
      isUploading = false;
      _inProcess = false;
      clearImage() ;

      clearContent();
    });
    Navigator.pop(context);

  }







  clearImage() {
    setState(() {
      file = null;
      file1 = null;

    });
  }



  delete()async {
    blogRef
        .doc(currentUser.id)
        .collection('userBlog')
        .doc(blogId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new  Text('Are you sure?',),
        content: new  Text('Do you want to exit without uploading?',),
        actions: <Widget>[
          new TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('NO',),
          ),
          SizedBox(height: 16),
          new TextButton(

            onPressed: () async {
              Navigator.of(context).pop(true);
              delete();
              clearImage();
              setState(() {
                isUploading = false;
                _inProcess = false;
              });
            },
            child:  Text('YES',),
          ),
        ],
      ),
    ) ??
        false;
  }
  builduploadForm() {

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
                            delete();
                            clearImage();
                            setState(() {
                              isUploading = false;
                              _inProcess = false;
                            });
//            clearImage();
                          },
                          child: Text("YES"),
                        ),
                      ],
                    ),
                  ) ??
                      false),
actions: [ElevatedButton(style:ElevatedButton.styleFrom(
  primary:Colors.black,
  onPrimary:Colors.white,
),
  child: Text("Post"),onPressed: () async {

  titleController.text == ''||bodyController.text ==''?
  Fluttertoast.showToast(
      msg: "Fill the required fields", timeInSecForIos: 4):
  isUploading ? null : handleSubmit();},)],
            ),
            body:

            Container(
              child: page0(),
            ),
          ),
        ),

      );

  }


  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    return file == null ? buildSplashScreen() : builduploadForm();
  }
/// Loads the document to be edited in Zefyr.
}

class SearchTag extends StatefulWidget {
  final String prodId;
   final String Id;

  SearchTag({this.prodId,this.Id});
  @override
  _SearchTagState createState() => _SearchTagState();
}

class _SearchTagState extends State<SearchTag> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = Users.fromDocument(tripSnapshot).displayName.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    var data = await FirebaseFirestore.instance
        .collection('users')

        .where("seller", isEqualTo: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear,
                color: Colors.white),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buCard(context, _resultsList[index]),
                )

            ),
          ],
        ),
      ),
    );
  }
  df({String ownerId,String prodId,String Id}){
    return
      showMaterialModalBottomSheet(
        expand:true,
        context: context,
        builder: (BuildContext context)
        {
          SizeConfig().init(context);

          return
            Builder(builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.75,

                    child: SearchTagProduct(ownerId:ownerId,prodId:prodId,Id:Id),

                  );
              }
              );
            }
            );
        },
      );

  }
  Widget buCard(BuildContext context, DocumentSnapshot document) {
    final user = Users.fromDocument(document);
    // final tripType = trip.types();

    return new Container(
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(  user.photoUrl,),
              ),
              title: Text(
                user.displayName,
                style:
                TextStyle(color:kText, fontWeight: FontWeight.bold),
              ),

            ),
          ),


          onTap: ()  {
            Get.back();
            df(ownerId: user.id,prodId: widget.prodId,Id:widget.Id);},
        ),
      ),
    );
  }

}


class SearchTagProduct extends StatefulWidget {
  final String ownerId;
  final String prodId;
  final String Id;

  SearchTagProduct({this.ownerId, this.prodId,this.Id});
  @override
  _SearchTagProductState createState() => _SearchTagProductState();
}

class _SearchTagProductState extends State<SearchTagProduct> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = Prod.fromDocument(tripSnapshot).productname.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    var data = await FirebaseFirestore.instance
        .collection('products')
        .doc(widget.ownerId)
        .collection('userProducts')
        .orderBy('timestamp',descending: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a product...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,

          suffixIcon: IconButton(
            icon: Icon(Icons.clear,
                color: Colors.white),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: Container(
        color:Colors.grey.shade200,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buprod(context, _resultsList[index],widget.prodId,widget.Id),
                )

            ),
          ],
        ),
      ),
    );
  }
}

Widget buprod(BuildContext context, DocumentSnapshot document,prodId,Id) {
  final prod = Prod.fromDocument(document);
  // final tripType = trip.types();

  return new Container(
    child: Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(child: Image.network(prod.shopmediaUrl.first),)),

            title: Text(
              prod.productname,
              style:
              TextStyle(color:kText, fontWeight: FontWeight.bold),
            ),

          ),
        ),


        onTap: ()
        {
          blogRef
              .doc(currentUser.id)
              .collection('userBlog')
              .doc(prodId)
              .collection('content')
              .doc(Id)
              .collection('tags')
              .doc(prod.prodId)
              .set({
            "ownerId":prod.ownerId,
            "prodId":prod.prodId,
            "image":prod.shopmediaUrl.first,
            "name":prod.productname,
            "usd":prod.usd,
            "eur":prod.eur,
            "inr":prod.inr,
            "gbp":prod.gbp,
            "taggerId":currentUser.id,
            "taggerImg":currentUser.photoUrl,
            "taggerName":currentUser.username,
            "taggerCurrency":currentUser.currency,
"Id":Id,

            "timestamp":timestamp,

          });
          Get.back();
         },
      ),
    ),
  );
}



class TagItem extends StatelessWidget {
  final String blogId;
  final String Id;
 final String prodId;
  final String image ;
  final String name;
  final usd ;
  final inr ;
  final gbp ;
  final eur ;
  const TagItem({Key key, this.blogId, this.prodId, this.Id, this.image, this.name, this.usd, this.inr, this.gbp, this.eur}) : super(key: key);

  delete(){

   var docRefernce = blogRef
        .doc(currentUser.id)
        .collection('userBlog')
        .doc(blogId)
        .collection('content')
        .doc(Id)
        .collection('tags')
        .doc(prodId);
   docRefernce.delete();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedImage(image,height: MediaQuery.of(context).size.height/3,)),
              Row(
                children: [
                  Text(name,
                      style: TextStyle(color: kText,
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: [
                  currentUser.currency == "INR"? Row(
                    children: [
                      Text("${cf.format(inr, CurrencyFormatter.inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "EUR"?Row(
                    children: [
                      Text("${cf.format(eur, CurrencyFormatter.eur)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "GBP"?Row(
                    children: [
                      Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):Row(
                    children: [
                      Text("${cf.format(usd, CurrencyFormatter.usd)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ),
                ],
              ),

            ]),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              mini: true,
              backgroundColor:kText.withOpacity(0.5),
              onPressed: delete,
              child: Icon(Icons.delete,color: Colors.red,),
            ),
          ),
        ]
    );
  }
}
class contentItem extends StatelessWidget {
final String image;
final String title;
final String body;

final String blogId;
final String Id;


   contentItem({ this.image, this.title, this.body,this.blogId, this.Id,  });



  delete(){

  var docReference =   blogRef
        .doc(currentUser.id)
        .collection('userBlog')
        .doc(blogId)
        .collection('content')
    .doc(Id);
    docReference.delete();
  blogRef
      .doc(currentUser.id)
      .collection('userBlog')
      .doc(blogId)
      .collection('content')
      .doc(Id) .collection('tags').get().then((snapshot) {
    for(DocumentSnapshot doc in snapshot.docs ){
    doc.reference.delete();

    }
    });
  }

tag(ctx){
  return
    showMaterialModalBottomSheet(
      expand:true,
      context: ctx,
      builder: (BuildContext context)
      {
        SizeConfig().init(context);

        return
          Builder(builder: (BuildContext context) {
            return StatefulBuilder(builder: (BuildContext context, State) {
              return
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.75,

                  child:

                  SearchTag(prodId:blogId,Id:Id),

                );
            }
            );
          }
          );
      },
    );

}
tags(ctx){
  return
    showMaterialModalBottomSheet(
      expand:true,
      context: ctx,
      builder: (BuildContext context)
      {
        SizeConfig().init(context);

        return
          Builder(builder: (BuildContext context) {
            return StatefulBuilder(builder: (BuildContext context, State) {
              return
                Scaffold(
                  appBar: AppBar(backgroundColor:Colors.black,automaticallyImplyLeading: false,
                      actions:[IconButton(icon: Icon(Icons.close),onPressed:() =>Navigator.pop(context),)]),
                  body:
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,

                            children: [
                              ElevatedButton(

                                style: ElevatedButton.styleFrom(

                                  primary:kButton, // foreground
                                ),
                                onPressed: () {
                                  tag(ctx);
                                },

                                child:   Text("Tag other products",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *3.5
                                    ,color:kText),),
                              ),
                              SizedBox(width: 10,)  ,
                              Text("(optional)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *2.5
                                  ,color:kText),),
                            ],
                          ),
                          Container(
                            height:MediaQuery. of(context). size. height *0.75,
                            child: tagView(),
                          ),




                        ],
                      ),


                  ),
                );
            }
            );
          }
          );
      },
    );

}

tagView(){
  return
    StreamBuilder(
      stream:blogRef
          .doc(currentUser.id)
          .collection('userBlog')
          .doc(blogId)
          .collection('content')
          .doc(Id)
          .collection("tags")
          .orderBy('timestamp',descending: true).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data.docs.isEmpty){
          return
            Container();
        } else {
          return new ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return TagItem(
                  Id: ds['Id'],
prodId: ds['prodId'],
                  name: ds['name'],
                  usd: ds['usd'],
                  inr: ds['inr'],
                  eur: ds['eur'],
                  gbp: ds['gbp'],

                  image: ds['image'],
                  blogId: blogId,

                );
              }
          );
        }
      },
    );

}

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text(title,
                style:  GoogleFonts.notoSerif(fontSize: SizeConfig.safeBlockHorizontal * 8,fontWeight: FontWeight.bold),
              ),
            SizedBox(height:10),
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: EmptyImage(image)),

              ],
            ),

            SizedBox(height:10),
            Text(body,
                style: TextStyle(color: kText,
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                )),
            SizedBox(height:10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  backgroundColor:Colors.white.withOpacity(0.5),
                  onPressed:()=> tags(context),
                    elevation:0.1,
                    icon: Icon(Icons.shopping_cart_outlined,color:Colors.black),
                    label:Text("Tag Products",style:TextStyle(color:Colors.black))

                ),

                FloatingActionButton.extended(
                  backgroundColor:Colors.white.withOpacity(0.5),
                  onPressed:()=> delete(),
                  elevation:0.1,
                  icon: Icon(Icons.delete,color:Colors.red),
                  label:Text("Delete",style:TextStyle(color:Colors.black))
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}