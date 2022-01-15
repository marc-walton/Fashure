import 'dart:io';
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/size_config.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:fashow/Constants.dart';

import 'package:fashow/user.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:image/image.dart' as Im;
import 'package:textfield_tags/textfield_tags.dart';
import 'package:uuid/uuid.dart';


class UploadColl extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final Users currentUser;

  UploadColl({this.currentUser,
    this.globalKey});
  @override
  _UploadCollState createState() => _UploadCollState();
}

class _UploadCollState extends State<UploadColl>
    with AutomaticKeepAliveClientMixin<UploadColl> {
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  List<String> imageUrls = <String>[];
   List<String> hashTags = <String>[];

  TextEditingController titleController = TextEditingController();
  TextEditingController sourceController = TextEditingController();

  File file;
  bool isUploading = false;
  String CollId = Uuid().v4();

  PageController pageController = PageController();
  int pageChanged  = 0;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.
    collRef .doc(widget.currentUser.id)
        .collection("userCollections").doc(CollId)
        .set({});
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

                    child: SearchTag(prodId:CollId),

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
        stream: collRef .doc(widget.currentUser.id)
            .collection("userCollections").doc(CollId)
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
                    prodId: CollId,

                  );
                }
            );
          }
        },
      );

  }
  delete()async{         collRef .doc(widget.currentUser.id)
      .collection("userCollections").doc(CollId)
      .get()
      .then((doc) {
    if (doc.exists) {
      doc.reference.delete();
    }
  });

  }

  page0(){
    final form =  ListView(
      shrinkWrap: true,
      children: <Widget>[
        isUploading ? linearProgress() : Text(""),
        Carousel(),
        // getImageWidget(),
        SizedBox(height:12.0),

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

        SizedBox(height:12.0),

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

      ],
    );
    return
      SingleChildScrollView(
        reverse: true,


        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:    form,
            ),
            SizedBox( height:MediaQuery. of(context). size. width *0.5,
            ),
            TextFieldTags(
                textSeparators: <String> [
                  //text tag seperators
                  //Default = " ", ","
                ],
                // tags: <String>[
                //   // List of tags
                //   // Provide a list of initial tags to initialize it
                // ],
                textFieldStyler: TextFieldStyler(
                  //These are properties you can tweek for customization

                  // bool textFieldFilled = false,
                  // Icon icon,
                  helperText :'Add #Tags',
                  // TextStyle helperStyle,
                  // String hintText = 'Got tags?',
                  // TextStyle hintStyle,
                  // EdgeInsets contentPadding,
                  // Color textFieldFilledColor,
                  // bool isDense = true,
                  // bool textFieldEnabled = true,
                  // OutlineInputBorder textFieldBorder = const OutlineInputBorder(),
                  // OutlineInputBorder textFieldFocusedBorder,
                  // OutlineInputBorder textFieldDisabledBorder,
                  // OutlineInputBorder textFieldEnabledBorder
                ),
                tagsStyler: TagsStyler(
                  //These are properties you can tweek for customization

                  showHashtag : true,
                  // EdgeInsets tagPadding = const EdgeInsets.all(4.0),
                  // EdgeInsets tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
                  // BoxDecoration tagDecoration = const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
                  // TextStyle tagTextStyle,
                  // Icon tagCancelIcon = const Icon(Icons.cancel, size: 18.0, color: Colors.green)
                ),
                onTag: (tag) {
                  //This give you the tag that was entered
                  //print(tag)
                  hashTags.add(tag);
                  print(hashTags);

                },

                onDelete: (tag){
                  //This gives you the tag that was deleted
                  //print(tag)
                  hashTags.remove(tag);
                  print(hashTags);
                },
                validator: (tag){
                  if(tag.length>20){
                    return "hey that's too long";
                  }
                  return null;
                }
              //tagsDistanceFromBorderEnd: 0.725,
              //scrollableTagsMargin: EdgeInsets.only(left: 9),
              //scrollableTagsPadding: EdgeInsets.only(left: 9),
            ),

            SizedBox( height:MediaQuery. of(context). size. width *0.5,
            ),

            Row(
              mainAxisAlignment:MainAxisAlignment.end,

              children: [
                InkWell(
                  onTap: (){
                    pageController.animateToPage(++pageChanged,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
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
   UploadTask uploadTask =
    storageRef.child("collhead_$CollId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
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
      _inProcess = true;
      images = resultList;
      _error = error;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Coll$CollId").child("colle_$CollId$fileName.jpg");
   UploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
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
Carousel(){

    return
        CarouselSlider(
          options: CarouselOptions(enableInfiniteScroll : false),
          items: images.map((e) => Container(
            width: 400,
            height: 400,
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

  Future<void> handleSubmit() async {
    setState(() {
      isUploading = true;
    });
   // await compressImage();
   // String headerImage = await uploadImage(file);
    for ( var imageFile in images) {
     postImage(imageFile).then((downloadUrl) {
       imageUrls.add(downloadUrl.toString());
       if(imageUrls.length==images.length){
         String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
         collRef .doc(widget.currentUser.id)
             .collection("userCollections")
            .doc(CollId).set({
           'collmediaUrl':imageUrls,
           "hashTags":hashTags,
           "hasHashTags":hashTags.isEmpty?false:true,
          "collId": CollId,
          "ownerId": widget.currentUser.id,
          "username": widget.currentUser.displayName,
          "photoUrl": widget.currentUser.photoUrl,
           "currency":  currentUser.currency,
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
             delete();
             clearImage();
             setState(() {
               isUploading = false;
               _inProcess = false;
           });       });
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
            delete();
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
        false;
  }
  builduploadForm() {
    setState(() {
      _inProcess = true;

    });

    return
      Stack(
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
          isUploading ? Center(child: CircularProgressIndicator(backgroundColor: kText,)) : Text(""),
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
                "Select Header Image",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              color: Colors.deepOrange,
              onPressed: () =>  loadAssets(),
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
    return images.isEmpty ? buildSplashScreen() : builduploadForm();

  }

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
          collRef .doc(currentUser.id)
              .collection("userCollections")
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
    var  docReference =      collRef .doc(currentUser.id)
        .collection("userCollections")
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
