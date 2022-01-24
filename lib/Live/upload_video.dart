import 'dart:io';
import 'dart:math';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:fashow/HomePage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
import 'apis/encoding_provider.dart';
import 'apis/firebase_provider.dart';
import 'package:path/path.dart' as p;
import 'models/video_info.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:fashow/Live/models/video_player.dart';
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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:get/get.dart';

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

class UploadVideo extends StatefulWidget {

  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo>  with AutomaticKeepAliveClientMixin<UploadVideo>{
  final thumbWidth = 500;
  final thumbHeight = 750;
  bool _imagePickerActive = false;
  bool _processing = false;
  bool _canceled = false;
  double _progress = 0.0;
  int _videoDuration = 0;
  String _processPhase = '';
  final bool _debugMode = false;
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  File videoFile;
  bool isUploading = false;
  String postId = Uuid().v4();
  List<Asset> images = <Asset>[];
  List<String> Img = <String>[];
  List<String> hashTags = <String>[];

  String _error = 'No Error Dectected';
  PageController pageController = PageController();
  int pageChanged  = 0;
  VideoPlayerController controller;
  List<String> imageUrls = <String>[];
var duration;
var image;
  bool _inProcess = false;
  @override

  File file1;

  @override
  void initState() {
    videoRef
        .doc(currentUser.id)
        .collection("userVideos")
        .doc(postId)
        .set({});
    //
    // EncodingProvider.enableStatisticsCallback((int time,
    //     int size,
    //     double bitrate,
    //     double speed,
    //     int videoFrameNumber,
    //     double videoQuality,
    //     double videoFps) {
    //   if (_canceled) return;
    //
    //   setState(() {
    //     _progress = time / _videoDuration;
    //   });
    // });

    super.initState();
  }
  Future<String> uploadImage1(imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(currentUser.id).child('videos').child(postId).child("$fileName.jpg");
    UploadTask uploadTask = reference.putFile(imageFile);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    // images.add(downloadUrl);
    return downloadUrl;
  }

  void _onUploadProgress(event) {
    UploadTask uploadTask;

    // uploadTask.events.listen((event) {
    //   double _progess = event.snapshot.bytesTransferred.toDouble()  / event.snapshot.totalByteCount.toDouble();
    // });
    uploadTask.snapshotEvents.listen((event) {
      double progress = event.bytesTransferred.toDouble()  / event.totalBytes.toDouble();
      setState(() {
        _progress = progress;
      });
    });
    // if (event.type == uploadTask.snapshotEvents.listen((event) { })) {
    //   final double progress = event.snapshot.bytesTransferred / event.snapshot.totalByteCount;
    //   setState(() {
    //     _progress = progress;
    //   });
    // }
  }
  Future<void> _processVideo(filePath) async {

    setState(() {
      _processPhase = 'Generating thumbnail';
      _progress = 0.0;
    });
    image = await VideoCompress.getFileThumbnail(videoFile.path,quality: 50,position: 2);

    setState(() {
      _processPhase = 'Uploading thumbnail to firebase storage';
      _progress = 0.0;
    });
    final thumbUrl = await uploadImage1(image);


    setState(() {
      _processPhase = 'Compressing and uploading video';
      _progress = 0.0;
    });

    final videoUrl =
    await _uploadFile(filePath);

    tagController.text == ""?null:tagList(tagController.text);

    await videoRef .doc(currentUser.id)
        .collection("userVideos")
        .doc(postId).update({
      "type":'Video',
      "hashTags":hashTags,
      "hasHashTags":hashTags.isEmpty?false:true,
      'mediaUrl':videoUrl,
      'thumbUrl':thumbUrl,

      "postId": postId,
      "ownerId": currentUser.id,
      "username": currentUser.displayName,
      "photoUrl":currentUser.photoUrl,
      "currency":currentUser.currency,
      "description": captionController.text,
      "location": locationController.text,
      "timestamp": timestamp,
      "likes": {},
    }).then((_){

      setState(() {
        clearImage();
        isUploading = false;
        _inProcess = false;

      });
    });

    setState(() {
      _processPhase = '';
      _progress = 0.0;
      _processing = false;
    });
  }

  Future<String> _uploadFile(filePath) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(currentUser.id).child('videos').child(postId).child("$fileName");
    UploadTask uploadTask = reference.putFile(await _compressVideo(filePath));
    uploadTask.snapshotEvents.listen(_onUploadProgress);

    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();

    // images.add(downloadUrl);
    return downloadUrl;

  }




  void _takeVideo(parentContext) async {
    setState((){
      _inProcess = true;
    });
      videoFile = File(await ImagePicker().getVideo(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
    final info = await VideoCompress.getMediaInfo(videoFile.path);
    duration  = info.duration;
    if(    duration > 192000.00){
      videoFile = null;
      Fluttertoast.showToast(
          msg: "Video length should be less than 3 minutes", timeInSecForIos: 4,gravity: ToastGravity.CENTER);
      }

    setState((){
        _inProcess = false;
      });


ss
  }

  _compressVideo( videoPath) async {

    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    // VideoCompress.compressProgress$.subscribe((progress) {
    //   debugPrint('progress: $progress');
    // });
    return compressedVideo.file;
  }
  _getProgressBar() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: Text(_processPhase),
          ),
          LinearProgressIndicator(
            value: _progress,
          ),
        ],
      ),
    );
  }


  clearImage() {
    setState(() {
      videoFile = null;


    });
  }
  delete()async{     postsRef
      .doc(currentUser.id)
      .collection('userPosts')
      .doc(postId)
      .get()
      .then((doc) {
    if (doc.exists) {
      doc.reference.delete();
    }
  });}
  tagList(tagsList){

    hashTags = tagsList.split('');
  }

  Future<void> handleSubmit() async {
    setState(() {
      _processing = true;

    });
    try {
      await _processVideo(videoFile);
    } catch (e) {
      print('${e.toString()}');
    } finally {
      setState(() {
        _processing = false;
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
            clearImage();
            setState(() {
              isUploading = false;
              _inProcess = false;
            });
            },
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }

  buildSplashScreen(parentContext) {
    return
      ModalProgressHUD(
        inAsyncCall: _inProcess,
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//          SvgPicture.asset('assets/images/upload.svg', height: 260.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation : 0.1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary:  Colors.black, // background
                      onPrimary: Colors.white, // foreground
                    ),

                    child: Text(
                      "Select video",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    onPressed: ()  =>_takeVideo(parentContext),
                    // selectImage(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  page0(){
    return
      ListView(
        shrinkWrap: true,
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
          ConfirmScreen(videoFile: videoFile,),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              CachedNetworkImageProvider(currentUser.photoUrl),
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style:TextStyle(color: kText),

                controller: captionController,
                decoration: InputDecoration(
                    hintText: "Write a caption...", border: InputBorder.none),
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: Colors.orange,
              size: 35.0,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style:TextStyle(color: kText),

                controller: locationController,
                decoration: InputDecoration(
                  hintText: "Where was this photo taken?",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: 200.0,
            height: 100.0,
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation : 0.1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),

                  primary: Colors.blue,// background
                  onPrimary: Colors.white, // foreground
                ),
                label: Text(
                  "Use Current Location",
                ),
                onPressed: getUserLocation,
                icon: Icon(
                  Icons.my_location,
                  color: Colors.white,
                )),
          ),
          // TextFieldTags(
          //     textSeparators: <String> [
          //       //text tag seperators
          //       //Default = " ", ","
          //     ],
          //     // tags: <String>[
          //     //   // List of tags
          //     //   // Provide a list of initial tags to initialize it
          //     // ],
          //     textFieldStyler: TextFieldStyler(
          //       //These are properties you can tweek for customization
          //
          //       // bool textFieldFilled = false,
          //       // Icon icon,
          //       helperText :'Add #Tags',
          //       // TextStyle helperStyle,
          //       // String hintText = 'Got tags?',
          //       // TextStyle hintStyle,
          //       // EdgeInsets contentPadding,
          //       // Color textFieldFilledColor,
          //       // bool isDense = true,
          //       // bool textFieldEnabled = true,
          //       // OutlineInputBorder textFieldBorder = const OutlineInputBorder(),
          //       // OutlineInputBorder textFieldFocusedBorder,
          //       // OutlineInputBorder textFieldDisabledBorder,
          //       // OutlineInputBorder textFieldEnabledBorder
          //     ),
          //     tagsStyler: TagsStyler(
          //       //These are properties you can tweek for customization
          //
          //       showHashtag : true,
          //       // EdgeInsets tagPadding = const EdgeInsets.all(4.0),
          //       // EdgeInsets tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
          //       // BoxDecoration tagDecoration = const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
          //       // TextStyle tagTextStyle,
          //       // Icon tagCancelIcon = const Icon(Icons.cancel, size: 18.0, color: Colors.green)
          //     ),
          //     onTag: (tag) {
          //       //This give you the tag that was entered
          //       //print(tag)
          //       hashTags.add(tag);
          //       print(hashTags);
          //
          //     },
          //
          //     onDelete: (tag){
          //       //This gives you the tag that was deleted
          //       //print(tag)
          //       hashTags.remove(tag);
          //       print(hashTags);
          //     },
          //     validator: (tag){
          //       if(tag.length>20){
          //         return "hey that's too long";
          //       }
          //       return null;
          //     }
          //   //tagsDistanceFromBorderEnd: 0.725,
          //   //scrollableTagsMargin: EdgeInsets.only(left: 9),
          //   //scrollableTagsPadding: EdgeInsets.only(left: 9),
          // ),
          Container(
            width: 250.0,
            child: TextField(
              style:TextStyle(color: kText),

              controller: tagController,
              decoration: InputDecoration(
                  hintText: "add hastags",fillColor: transwhite,
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)),
            ),
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
              height:MediaQuery. of(context). size. height *0.70,
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
  builduploadForm(parentContext) {
    this.setState(() {
      _inProcess = false;
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
                              },
                              child: Text("YES"),
                            ),
                          ],
                        ),
                      ) ??
                          false),

                ),
                body:_processing?_getProgressBar():
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
          ],
      );


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

                    child: SearchTag(prodId:postId),

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
        stream: postsRef
            .doc(currentUser.id).collection("userPosts").doc(postId)
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
                    prodId: postId,

                  );
                }
            );
          }
        },
      );

  }

  getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String completeAddress =
        '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality} ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
    print(completeAddress);
    String formattedAddress = "${placemark.locality}, ${placemark.country}";
    locationController.text = formattedAddress;
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return videoFile == null ?buildSplashScreen(context):  builduploadForm(context);
  }
}


class ConfirmScreen extends StatefulWidget {
  final File videoFile;
   ConfirmScreen({
     this.videoFile,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
   VideoPlayerController controller;


  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(false);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: VideoPlayer(controller),
    );
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
          FirebaseFirestore.instance
              .collection('posts')
              .doc(currentUser.id)
              .collection('userPosts')
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
    var  docReference =  FirebaseFirestore.instance
        .collection('posts')
        .doc(currentUser.id)
        .collection('userPosts')
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
                  child: CachedImage(image,height:MediaQuery.of(context).size.height/3)),
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
