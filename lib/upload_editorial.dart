import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

                    child: SearchTag(prodId:blogId),

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
        stream: blogRef
            .doc(currentUser.id).collection("userBlog").doc(blogId)
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
                    Id: ds['prodId'],
                    ownerId: ds['ownerId'],
                    name: ds['name'],
                    usd: ds['usd'],
                    inr: ds['inr'],
                    eur: ds['eur'],
                    gbp: ds['gbp'],

                    image: ds['image'],
                    prodId: blogId,

                  );
                }
            );
          }
        },
      );

  }

  page0(){

    return
      SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child:      Column(
                children: <Widget>[
                  TextFormField(controller: titleController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(labelText: 'Title of the blog',
                          fillColor: transwhite,
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),))),
                  SizedBox(height:20),
                  carousel(),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(primary: Colors.black,onPrimary: Colors.white),
                    child: Text("Add content"),
                    onPressed: (){

                    },
                  ),
                  ZefyrToolbar.basic(controller: _controller),
                  ZefyrEditor(
                    maxHeight: 900,
                    scrollPhysics: ClampingScrollPhysics(),
                    controller: _controller,
                    focusNode: _focusNode,
                    autofocus: false,
                     ),

                  SizedBox(height:20),

                ],
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){

                    titleController.text == '' ||       _controller.document == "" ?
                    Fluttertoast.showToast(
                        msg: "Fill the required fields", timeInSecForIos: 4):
                    pageController.animateToPage(++pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

                  },
                  child: FittedBox(
                    fit:  BoxFit.fitHeight,
                    child: Container(
                      alignment:Alignment.center,
                      height:MediaQuery. of(context). size. height *0.06,

                      width:MediaQuery. of(context). size. width *0.5,

                      //icon: Icon(Icons.drag_handle),
                      child:Text("Next",style:TextStyle(color: Colors.black)),

                    ),
                  ),
                ),


              ],
            ),

          ],
        ),
      );

  }
  page1(){
    SizeConfig().init(context);
    return
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            isUploading ? linearProgress() : Text(""),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,

              children: [
                ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    primary:kButton, // foreground
                  ),
                  onPressed: () {
                    tag();
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
              height:SizeConfig.screenHeight*0.75,
              child: tagView(),
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                  },
                  child: FittedBox(
                    fit:  BoxFit.fitHeight,
                    child: Container(
                      alignment:Alignment.center,
                      height:MediaQuery. of(context). size. height *0.06,

                      width:MediaQuery. of(context). size. width *0.5,

                      //icon: Icon(Icons.drag_handle),
                      child:Text("Previous",style:TextStyle(color: Colors.black)),

                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    isUploading ? null : handleSubmit();
                  },
                  child: FittedBox(
                    fit:  BoxFit.fitHeight,
                    child: Container(
                      alignment:Alignment.center,
                      height:MediaQuery. of(context). size. height *0.06,

                      width:MediaQuery. of(context). size. width *0.5,

                      //icon: Icon(Icons.drag_handle),
                      child:Text("Post",style:TextStyle(color: Colors.black)),

                    ),
                  ),
                ),


              ],
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
              .update({
            "blogId": blogId,
            "ownerId": widget.currentUser.id,
            "username": widget.currentUser.displayName,
            "photoUrl": widget.currentUser.photoUrl,
            "currency":  currentUser.currency,

            "blogmediaUrl": imageUrls,
            "title":  titleController.text,
            "content":contents,

            "timestamp": timestamp,
            "claps": {},
          }).then((_){

            setState(() {
              images = [];
              imageUrls = [];
              delete();
              clearImage();
              setState(() {
                isUploading = false;
                _inProcess = false;
            });
          });});
        }
      }).catchError((err) {
        print(err);


      });
    }
    Navigator.pop(context);

  }

  carousel(){

    return
      CarouselSlider(
          options: CarouselOptions(
            height:500,
            enableInfiniteScroll: false,
          ),
          items: images.map((e) => Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: e,
                width: 500,
                height: 400,
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

            ),
            body:

            PageView(
              physics:new NeverScrollableScrollPhysics(),
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageChanged = index;
                });
                print(pageChanged);
              },
              children: [
                Container(
                  child: page0(),
                ),
                Container(
                  child: page1(),
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

    return images.isEmpty ? buildSplashScreen() : builduploadForm();
  }
/// Loads the document to be edited in Zefyr.
}

class SearchTag extends StatefulWidget {
  final String prodId;
  SearchTag({this.prodId});
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
  df({String ownerId,String prodId}){
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

                    child: SearchTagProduct(ownerId:ownerId,prodId:prodId),

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
            df(ownerId: user.id,prodId: widget.prodId);},
        ),
      ),
    );
  }

}


class SearchTagProduct extends StatefulWidget {
  final String ownerId;
  final String prodId;
  SearchTagProduct({this.ownerId, this.prodId});
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
                      buprod(context, _resultsList[index],widget.prodId),
                )

            ),
          ],
        ),
      ),
    );
  }
}

Widget buprod(BuildContext context, DocumentSnapshot document,prodId) {
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

            "timestamp":timestamp,

          });
          Get.back();},
      ),
    ),
  );
}
class TagItem extends StatelessWidget {
  final String ownerId ;
  final String prodId ;

  final String Id ;
  final String image ;
  final String name;
  final usd ;
  final inr ;
  final gbp ;
  final eur ;


  TagItem({this.ownerId,this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

  delete(){
    var  docReference =  blogRef
        .doc(currentUser.id)
        .collection('userBlog')
        .doc(prodId)
        .collection('tags')
        .doc(Id);
    docReference.delete();

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
                  child: CachedImage(image)),
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