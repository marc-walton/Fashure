import 'dart:io';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashow/Categories/BboyEcomUp.dart';
import 'package:fashow/Categories/BgirlEcomUp.dart';
import 'package:fashow/Categories/KboyEcomUp.dart';
import 'package:fashow/Categories/KgirlEcomUp.dart';
import 'package:fashow/Categories/MenEcomUp.dart';
import 'package:fashow/Categories/WomenEcomUp.dart';
import 'package:fashow/Categories/TboyEcomUp.dart';
import 'package:fashow/Categories/TgirlEcomUp.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fashow/user.dart';
import 'package:fashow/methods/country.dart';
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
import 'package:get/get.dart';
import 'package:back_pressed/back_pressed.dart';
import 'package:fashow/size_config.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class Uploadecom extends StatefulWidget {
  final Users currentUser;


  Uploadecom({this.currentUser});
  @override
  _UploadecomState createState() => _UploadecomState();
}

class _UploadecomState extends State<Uploadecom>
    with AutomaticKeepAliveClientMixin<Uploadecom> {

  String value = 'None';
  List colors;
bool worldship = true;
bool freeship = true;
bool freeworldship = true;
String loading = "Converting currencies";
 TabController _tabController;
  ScrollController _controller;
  TextEditingController detailsController = TextEditingController();
  TextEditingController productnameController = TextEditingController();
  TextEditingController compositionController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController washandcareController = TextEditingController();
  TextEditingController sizeandfitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController xxxscontroller = TextEditingController();
  TextEditingController xxscontroller = TextEditingController();
  TextEditingController xscontroller = TextEditingController();
  TextEditingController scontroller = TextEditingController();
  TextEditingController mcontroller = TextEditingController();
  TextEditingController lcontroller = TextEditingController();
  TextEditingController xlcontroller = TextEditingController();
  TextEditingController xxlcontroller = TextEditingController();
  TextEditingController xxxlcontroller = TextEditingController();
   TextEditingController fourxlcontroller = TextEditingController();
  TextEditingController fivexlcontroller = TextEditingController();
  TextEditingController sixxlcontroller = TextEditingController();
  TextEditingController sevenxlcontroller = TextEditingController();
  TextEditingController eightxlcontroller = TextEditingController();
  TextEditingController mtocontroller = TextEditingController();
  TextEditingController freesizecontroller = TextEditingController();
TextEditingController Shoe1controller = TextEditingController();
TextEditingController Shoe2controller = TextEditingController();
TextEditingController Shoe3controller = TextEditingController();
TextEditingController Shoe4controller = TextEditingController();
TextEditingController Shoe5controller = TextEditingController();
TextEditingController Shoe6controller = TextEditingController();
TextEditingController Shoe7controller = TextEditingController();
TextEditingController Shoe8controller = TextEditingController();
TextEditingController Shoe9controller = TextEditingController();
TextEditingController Shoe10controller = TextEditingController();
TextEditingController Shoe11controller = TextEditingController();
TextEditingController Shoe12controller = TextEditingController();
TextEditingController Shoe13controller = TextEditingController();
TextEditingController Shoe14controller = TextEditingController();
TextEditingController Shoe15controller = TextEditingController();
TextEditingController Shoe16controller = TextEditingController();
TextEditingController Shoe17controller = TextEditingController();
TextEditingController Shoe18controller = TextEditingController();
TextEditingController Shoe19controller = TextEditingController();
TextEditingController Shoe20controller = TextEditingController();
TextEditingController Shoe21controller = TextEditingController();
TextEditingController Ring1controller = TextEditingController();
TextEditingController Ring2controller = TextEditingController();
TextEditingController Ring3controller = TextEditingController();
TextEditingController Ring4controller = TextEditingController();
TextEditingController Ring5controller = TextEditingController();
TextEditingController Ring6controller = TextEditingController();
TextEditingController Ring7controller = TextEditingController();
TextEditingController Ring8controller = TextEditingController();
TextEditingController Ring9controller = TextEditingController();
TextEditingController Ring10controller = TextEditingController();
TextEditingController Ring11controller = TextEditingController();
TextEditingController Ring12controller = TextEditingController();
TextEditingController Ring13controller = TextEditingController();
TextEditingController Ring14controller = TextEditingController();
TextEditingController Ring15controller = TextEditingController();
TextEditingController Ring16controller = TextEditingController();
TextEditingController Ring17controller = TextEditingController();
TextEditingController Ring18controller = TextEditingController();
TextEditingController Ring19controller = TextEditingController();
TextEditingController Ring20controller = TextEditingController();
TextEditingController Ring21controller = TextEditingController();
TextEditingController Ring22controller = TextEditingController();
TextEditingController Ring23controller = TextEditingController();
TextEditingController customController1 = TextEditingController();
TextEditingController customController2 = TextEditingController();
TextEditingController customController3 = TextEditingController();
TextEditingController customController4 = TextEditingController();
TextEditingController customController5 = TextEditingController();
TextEditingController customController6 = TextEditingController();
TextEditingController customController7 = TextEditingController();
TextEditingController customController8 = TextEditingController();
TextEditingController customController9 = TextEditingController();
TextEditingController customController10 = TextEditingController();
TextEditingController customController11 = TextEditingController();
TextEditingController customController21 = TextEditingController();
TextEditingController customController31 = TextEditingController();
TextEditingController customController41 = TextEditingController();
TextEditingController customController51 = TextEditingController();
TextEditingController customController61 = TextEditingController();
TextEditingController customController71 = TextEditingController();
TextEditingController customController81 = TextEditingController();
TextEditingController customController91 = TextEditingController();
TextEditingController customController101 = TextEditingController();
TextEditingController customController12 = TextEditingController();
TextEditingController customController22 = TextEditingController();
TextEditingController customController32 = TextEditingController();
TextEditingController customController42 = TextEditingController();
TextEditingController customController52 = TextEditingController();
TextEditingController customController62 = TextEditingController();
TextEditingController customController72 = TextEditingController();
TextEditingController customController82 = TextEditingController();
TextEditingController customController92 = TextEditingController();
TextEditingController customController102 = TextEditingController();

  TextEditingController colorController1 = TextEditingController();
  TextEditingController colorController2 = TextEditingController();
  TextEditingController colorController3 = TextEditingController();
  TextEditingController colorController4 = TextEditingController();
  TextEditingController colorController5 = TextEditingController();
  TextEditingController colorController6 = TextEditingController();
  TextEditingController colorController7 = TextEditingController();
  TextEditingController colorController8 = TextEditingController();
  TextEditingController colorController9 = TextEditingController();
  TextEditingController colorController10 = TextEditingController();
  TextEditingController colorController11 = TextEditingController();
  TextEditingController colorController21 = TextEditingController();
  TextEditingController colorController31 = TextEditingController();
  TextEditingController colorController41 = TextEditingController();
  TextEditingController colorController51 = TextEditingController();
  TextEditingController colorController61 = TextEditingController();
  TextEditingController colorController71 = TextEditingController();
  TextEditingController colorController81 = TextEditingController();
  TextEditingController colorController91 = TextEditingController();
  TextEditingController colorController101 = TextEditingController();

  TextEditingController durationfrom = TextEditingController();
TextEditingController durationto = TextEditingController();
TextEditingController durationfromw = TextEditingController();
TextEditingController durationtow = TextEditingController();
TextEditingController durationfromp = TextEditingController();
TextEditingController durationtop = TextEditingController();

TextEditingController shipcost = TextEditingController();
TextEditingController shipcostintern = TextEditingController();

TextEditingController namecontroller = TextEditingController();
TextEditingController shipcontroller = TextEditingController();
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  List<String> imageUrls = <String>[];
  File file;
  bool isUploading = false;
  String prodId = Uuid().v4();
  List<String> selectedSizes = <String>[];

  String dropdownValue = 'Women';

bool indian = false;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
 // final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  var userprice;
  var inrtousd;

  var inrtocny;
  var inrtogbp;
  var inrtoeur;
  var usdtoinr;
  var usdtocny;
  var usdtogbp;
  var usdtoeur;
  var cnytoinr;
  var cnytousd;
  var cnytogbp;
  var cnytoeur;
  var gbptoinr;
  var gbptocny;
  var gbptousd;
  var gbptoeur;
  var eurtoinr;
  var eurtousd;
  var eurtocny;
  var eurtogbp;
  var userprice1;
  var inrtousd1;
  var inrtocny1;
  var inrtogbp1;
  var inrtoeur1;
  var usdtoinr1;
  var usdtocny1;
  var usdtogbp1;
  var usdtoeur1;
  var cnytoinr1;
  var cnytousd1;
  var cnytogbp1;
  var cnytoeur1;
  var gbptoinr1;
  var gbptocny1;
  var gbptousd1;
  var gbptoeur1;
  var eurtoinr1;
  var eurtousd1;
  var eurtocny1;
  var eurtogbp1;
  var userprice2;
  var inrtousd2;
  var inrtocny2;
  var inrtogbp2;
  var inrtoeur2;
  var usdtoinr2;
  var usdtocny2;
  var usdtogbp2;
  var usdtoeur2;
  var cnytoinr2;
  var cnytousd2;
  var cnytogbp2;
  var cnytoeur2;
  var gbptoinr2;
  var gbptocny2;
  var gbptousd2;
  var gbptoeur2;
  var eurtoinr2;
  var eurtousd2;
  var eurtocny2;
  var eurtogbp2;
  var userprice3;
  var inrtousd3;
  var inrtocny3;
  var inrtogbp3;
  var inrtoeur3;
  var usdtoinr3;
  var usdtocny3;
  var usdtogbp3;
  var usdtoeur3;
  var cnytoinr3;
  var cnytousd3;
  var cnytogbp3;
  var cnytoeur3;
  var gbptoinr3;
  var gbptocny3;
  var gbptousd3;
  var gbptoeur3;
  var eurtoinr3;
  var eurtousd3;
  var eurtocny3;
  var eurtogbp3;
  var userprice4;
  var inrtousd4;
  var inrtocny4;
  var inrtogbp4;
  var inrtoeur4;
  var usdtoinr4;
  var usdtocny4;
  var usdtogbp4;
  var usdtoeur4;
  var cnytoinr4;
  var cnytousd4;
  var cnytogbp4;
  var cnytoeur4;
  var gbptoinr4;
  var gbptocny4;
  var gbptousd4;
  var gbptoeur4;
  var eurtoinr4;
  var eurtousd4;
  var eurtocny4;
  var eurtogbp4;
  var userprice5;
  var inrtousd5;
  var inrtocny5;
  var inrtogbp5;
  var inrtoeur5;
  var usdtoinr5;
  var usdtocny5;
  var usdtogbp5;
  var usdtoeur5;
  var cnytoinr5;
  var cnytousd5;
  var cnytogbp5;
  var cnytoeur5;
  var gbptoinr5;
  var gbptocny5;
  var gbptousd5;
  var gbptoeur5;
  var eurtoinr5;
  var eurtousd5;
  var eurtocny5;
  var eurtogbp5;
  var userprice6;
  var inrtousd6;
  var inrtocny6;
  var inrtogbp6;
  var inrtoeur6;
  var usdtoinr6;
  var usdtocny6;
  var usdtogbp6;
  var usdtoeur6;
  var cnytoinr6;
  var cnytousd6;
  var cnytogbp6;
  var cnytoeur6;
  var gbptoinr6;
  var gbptocny6;
  var gbptousd6;
  var gbptoeur6;
  var eurtoinr6;
  var eurtousd6;
  var eurtocny6;
  var eurtogbp6;
  var userprice7;
  var inrtousd7;
  var inrtocny7;
  var inrtogbp7;
  var inrtoeur7;
  var usdtoinr7;
  var usdtocny7;
  var usdtogbp7;
  var usdtoeur7;
  var cnytoinr7;
  var cnytousd7;
  var cnytogbp7;
  var cnytoeur7;
  var gbptoinr7;
  var gbptocny7;
  var gbptousd7;
  var gbptoeur7;
  var eurtoinr7;
  var eurtousd7;
  var eurtocny7;
  var eurtogbp7;
  var userprice8;
  var inrtousd8;
  var inrtocny8;
  var inrtogbp8;
  var inrtoeur8;
  var usdtoinr8;
  var usdtocny8;
  var usdtogbp8;
  var usdtoeur8;
  var cnytoinr8;
  var cnytousd8;
  var cnytogbp8;
  var cnytoeur8;
  var gbptoinr8;
  var gbptocny8;
  var gbptousd8;
  var gbptoeur8;
  var eurtoinr8;
  var eurtousd8;
  var eurtocny8;
  var eurtogbp8;
  var userprice9;
  var inrtousd9;
  var inrtocny9;
  var inrtogbp9;
  var inrtoeur9;
  var usdtoinr9;
  var usdtocny9;
  var usdtogbp9;
  var usdtoeur9;
  var cnytoinr9;
  var cnytousd9;
  var cnytogbp9;
  var cnytoeur9;
  var gbptoinr9;
  var gbptocny9;
  var gbptousd9;
  var gbptoeur9;
  var eurtoinr9;
  var eurtousd9;
  var eurtocny9;
  var eurtogbp9;
  var userprice10;
  var inrtousd10;
  var inrtocny10;
  var inrtogbp10;
  var inrtoeur10;
  var usdtoinr10;
  var usdtocny10;
  var usdtogbp10;
  var usdtoeur10;
  var cnytoinr10;
  var cnytousd10;
  var cnytogbp10;
  var cnytoeur10;
  var gbptoinr10;
  var gbptocny10;
  var gbptousd10;
  var gbptoeur10;
  var eurtoinr10;
  var eurtousd10;
  var eurtocny10;
  var eurtogbp10;
  var userprice11;
  var inrtousd11;
  var inrtocny11;
  var inrtogbp11;
  var inrtoeur11;
  var usdtoinr11;
  var usdtocny11;
  var usdtogbp11;
  var usdtoeur11;
  var cnytoinr11;
  var cnytousd11;
  var cnytogbp11;
  var cnytoeur11;
  var gbptoinr11;
  var gbptocny11;
  var gbptousd11;
  var gbptoeur11;
  var eurtoinr11;
  var eurtousd11;
  var eurtocny11;
  var eurtogbp11;
  var userprice12;
  var inrtousd12;
  var inrtocny12;
  var inrtogbp12;
  var inrtoeur12;
  var usdtoinr12;
  var usdtocny12;
  var usdtogbp12;
  var usdtoeur12;
  var cnytoinr12;
  var cnytousd12;
  var cnytogbp12;
  var cnytoeur12;
  var gbptoinr12;
  var gbptocny12;
  var gbptousd12;
  var gbptoeur12;
  var eurtoinr12;
  var eurtousd12;
  var eurtocny12;
  var eurtogbp12;

int count  = 1;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
    // _tabController = TabController(length: 2,vsync: this);
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() { //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() { //you can do anything here
      });
    }
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


  selectImage() {
    return showDialog(
        context: context,
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
                          "Upload Product",
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

  clearImage() {
    setState(() {
      file = null;
    });
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$prodId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
   UploadTask uploadTask =
    storageRef.child("prod_$prodId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }



  Future<bool> _onBackPressed() {
    return showDialog(
      context : context,
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

            onPressed: () => Navigator.of(context).maybePop(true),
                       child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }
  Widget MenCategory(){
    return
    Expanded(
      child: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('Accessories'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Hats',
                  value: value,
                  choiceItems: Hats,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Scarves',
                  value: value,
                  choiceItems: Scarves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Belts',
                  value: value,
                  choiceItems: Belts,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Braces and Suspenders',
                  value: value,
                  choiceItems: Braces,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Ties & Bow Ties',
                  value: value,
                  choiceItems: Ties,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Glasses & Frames',
                  value: value,
                  choiceItems: Glasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Sunglasses',
                  value: value,
                  choiceItems: Sunglasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Gloves',
                  value: value,
                  choiceItems: Gloves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Socks',
                  value: value,
                  choiceItems: Socks,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Pocket Square',
                  value: value,
                  choiceItems: PocketSquare,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Wallets',
                  value: value,
                  choiceItems: Wallets,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Umbrellas & Travel',
                  value: value,
                  choiceItems: Umbrellas,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Phone cases',
                  value: value,
                  choiceItems: Phone,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bags'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Bags',
                  value: value,
                  choiceItems: Bags,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Activewear'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Activewear',
                  value: value,
                  choiceItems: Activewear,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Beach & Swimwear'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Beach & Swimwear',
                  value: value,
                  choiceItems: Beach,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Denim'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Denim',
                  value: value,
                  choiceItems: Denim,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Grooming'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Grooming',
                  value: value,
                  choiceItems: Grooming,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Indian Ethnic'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Indian Ethnic',
                  value: value,
                  choiceItems: Indian,
                  onChange: (state) => setState(() { value = state.value; indian = true;})
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Jackets'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jackets',
                  value: value,
                  choiceItems: Jackets,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Coats'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Coats',
                value: value,
                choiceItems: Coats,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Jewellery'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                title: 'Jewellery',
                value: value,
                choiceItems: Jewellery,
                onChange: (state) => setState(() => value = state.value)
            ),

            ],
          ),
          ExpansionTile(
            title: Text('Shirts'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                title: 'Shirts',
                value: value,
                choiceItems: Shirts,
                onChange: (state) => setState(() => value = state.value)
            ),

            ],
          ),
          ExpansionTile(
            title: Text('Shorts'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Shorts',
                  value: value,
                  choiceItems: Shorts,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Suits'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Suits',
                  value: value,
                  choiceItems: Suits,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Sweatshirts & Sweaters'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Sweatshirts & Sweaters',
                  value: value,
                  choiceItems: Sweatshirts,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Trousers'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Trousers',
                  value: value,
                  choiceItems: Trousers,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Casual Tops'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Casual Tops',
                  value: value,
                  choiceItems: Tops,
                  onChange: (state) => setState(() => value = state.value)

              ),
            ],
          ),
          ExpansionTile(
            title: Text('Watches'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Watches',
                  value: value,
                  choiceItems: Watches,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Shoes'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Shoes',
                  value: value,
                  choiceItems: Shoes,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Sneakers'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Sneakers',
                  value: value,
                  choiceItems: Sneakers,
                  onChange: (state) => setState(() => value = state.value)
              ),


            ],
          ),

        ],
      ),
    );
  }
 Widget WomenCategory(){
   return

     Expanded(
     child: ListView(
          children: [

         ExpansionTile(
           title: Text('Accessories'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Bridal & Wedding',
                 value: value,
                 choiceItems: Bridal,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Belts',
                 value: value,
                 choiceItems: WBelts,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Braces',
                 value: value,
                 choiceItems: WBraces,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Glasses & Frames',
                 value: value,
                 choiceItems: WGlasses,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Sunglasses',
                 value: value,
                 choiceItems: WSunglasses,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Hair Accessories',
                 value: value,
                 choiceItems: WHair,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Hats',
                 value: value,
                 choiceItems: WHats,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Ties & Collars',
                 value: value,
                 choiceItems: WTies,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Gloves',
                 value: value,
                 choiceItems: WGloves,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Socks',
                 value: value,
                 choiceItems: WSocks,
                 onChange: (state) => setState(() => value = state.value)
             ),
             SmartSelect<String>.single(
                 title: 'Scarves',
                 value: value,
                 choiceItems: WScarves,
                 onChange: (state) => setState(() => value = state.value)
             ),

  SmartSelect<String>.single(
                 title: 'Umbrellas & Travel',
                 value: value,
                 choiceItems: WUmbrellas,
                 onChange: (state) => setState(() => value = state.value)
             ),
SmartSelect<String>.single(
                 title: 'Phone cases',
                 value: value,
                 choiceItems: WPhone,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Indian Ethnic'),
           maintainState:true,
           children: [
SmartSelect<String>.single(
                 title: 'Indian Ethnic',
                 value: value,
                 choiceItems: WEthnic,
                 onChange: (state) => setState(() { value = state.value; indian = true;})
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Bags'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Bags',
                 value: value,
                 choiceItems: WBags,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Bridal Wear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Bridal Wear',
                 value: value,
                 choiceItems: WBridal,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),

         ExpansionTile(
           title: Text('Activewear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Activewear',
                 value: value,
                 choiceItems: WActivewear,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Beach & Swimwear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Beach & Swimwear',
                 value: value,
                 choiceItems: WBeach,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Coats'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
               title: 'Coats',
               value: value,
               choiceItems: WCoats,
               onChange: (state) => setState(() => value = state.value)
           ),
           ],
         ),
         ExpansionTile(
           title: Text('Jackets'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Jackets',
                 value: value,
                 choiceItems: WJackets,
                 onChange: (state) => setState(() => value = state.value)
             ),

           ],
         ),
         ExpansionTile(
           title: Text('Denim'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Denim',
                 value: value,
                 choiceItems: WDenim,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Dresses'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Dresses',
                 value: value,
                 choiceItems: WDresses,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Jumpsuits & Playsuits'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Jumpsuits & Playsuits',
                 value: value,
                 choiceItems: WJumpsuits,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Jewellery'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Jewellery',
                 value: value,
                 choiceItems: WJewellery,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Knitwear'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Knitwear',
                 value: value,
                 choiceItems: WKnitwear,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Tops'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Tops',
                 value: value,
                 choiceItems: WTops,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('WTrouser'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'WTrouserops',
                 value: value,
                 choiceItems: WTrouser,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Skirts'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Skirts',
                 value: value,
                 choiceItems: WSkirts,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Shorts'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Shorts',
                 value: value,
                 choiceItems: WShorts,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
          ExpansionTile(
           title: Text('Shoes'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Shoes',
                 value: value,
                 choiceItems: WShoes,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Sneakers'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Sneakers',
                 value: value,
                 choiceItems: WSneakers,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),
         ExpansionTile(
           title: Text('Watches'),
           maintainState:true,
           children: [
             SmartSelect<String>.single(
                 title: 'Watches',
                 value: value,
                 choiceItems: WWatches,
                 onChange: (state) => setState(() => value = state.value)
             ),
           ],
         ),

       ],
     ),
   );
  }
Widget BabyBCategory(){
    return

      Expanded(
          child: ListView(
            children: [
              ExpansionTile(
                title: Text('Accessories'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Hats',
                      value: value,
                      choiceItems: BBHats,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Scarves',
                      value: value,
                      choiceItems: BBScarves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Ties & Bow Ties',
                      value: value,
                      choiceItems: BBTies,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Gloves',
                      value: value,
                      choiceItems: BBGloves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Socks',
                      value: value,
                      choiceItems: BBSocks,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                   SmartSelect<String>.single(
                      title: 'Travel',
                      value: value,
                      choiceItems: BBTravel,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Indian Ethnic'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Indian Ethnic',
                      value: value,
                      choiceItems: BBEthnic,
                      onChange: (state) => setState((){ value = state.value; indian = true;})
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Coats & Jackets'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Coats & Jackets',
                    value: value,
                    choiceItems: BBCoats,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
               ExpansionTile(
                title: Text('Babysuits'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Babysuits',
                    value: value,
                    choiceItems: BBBabysuits,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Knitwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Knitwear',
                    value: value,
                    choiceItems: BBKnitwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
 ExpansionTile(
                title: Text('Shoes'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shoes',
                    value: value,
                    choiceItems: BBShoes,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
 ExpansionTile(
                title: Text('Shorts'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shorts',
                    value: value,
                    choiceItems: BBShorts,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Swimwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Swimwear',
                    value: value,
                    choiceItems: BBSwimwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Tops'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tops',
                    value: value,
                    choiceItems: BBTops,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Tracks'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tracks',
                    value: value,
                    choiceItems: BBTracks,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Trousers'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Trousers',
                    value: value,
                    choiceItems: BBTrousers,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),

            ],
          ),
        );

}
Widget BabyGCategory() {
  return
  Expanded(
    child: ListView(
      children: [
        ExpansionTile(
          title: Text('Accessories'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Hats',
                value: value,
                choiceItems: GGHats,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Scarves',
                value: value,
                choiceItems: GGScarves,
                onChange: (state) => setState(() => value = state.value)
            ),

            SmartSelect<String>.single(
                title: 'Gloves',
                value: value,
                choiceItems: GGGloves,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Socks',
                value: value,
                choiceItems: GGSocks,
                onChange: (state) => setState(() => value = state.value)
            ),
              SmartSelect<String>.single(
                title: 'Travel',
                value: value,
                choiceItems: GGTravel,
                onChange: (state) => setState(() => value = state.value)
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Indian Ethnic'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Indian Ethnic',
                value: value,
                choiceItems: GGEthnic,
                onChange: (state) => setState(() { value = state.value; indian = true;})
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Coats & Jackets'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Coats & Jackets',
              value: value,
              choiceItems: GGCoats,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Dresses'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Dresses',
              value: value,
              choiceItems: GGDresses,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Babysuits'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Babysuits',
              value: value,
              choiceItems: GGBabysuits,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Knitwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Knitwear',
              value: value,
              choiceItems: GGKnitwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Shoes'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shoes',
              value: value,
              choiceItems: GGShoes,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Shorts'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shorts',
              value: value,
              choiceItems: GGShorts,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Skirts'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Skirts',
              value: value,
              choiceItems: GGSkirts,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),

        ExpansionTile(
          title: Text('Swimwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Swimwear',
              value: value,
              choiceItems: GGSwimwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tops'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tops',
              value: value,
              choiceItems: GGTops,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tracks'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tracks',
              value: value,
              choiceItems: GGTracks,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Trousers'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Trousers',
              value: value,
              choiceItems: GGTrousers,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),

      ],
    ),
  );
}
Widget KidBCategory(){
    return
      Expanded(
          child: ListView(
            children: [
              ExpansionTile(
                title: Text('Accessories'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Hats',
                      value: value,
                      choiceItems: KBHats,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Scarves',
                      value: value,
                      choiceItems: KBScarves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Belts & Braces ',
                      value: value,
                      choiceItems: KBBelts,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Ties & Bow Ties',
                      value: value,
                      choiceItems: KBTies,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Eyewear',
                      value: value,
                      choiceItems: KBGlasses,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Gloves',
                      value: value,
                      choiceItems: KBGloves,
                      onChange: (state) => setState(() => value = state.value)
                  ),
                  SmartSelect<String>.single(
                      title: 'Socks',
                      value: value,
                      choiceItems: KBSocks,
                      onChange: (state) => setState(() => value = state.value)
                  ),
   SmartSelect<String>.single(
                      title: 'Travel',
                      value: value,
                      choiceItems: KBSocks,
                      onChange: (state) => setState(() => value = state.value)
                  ),


                ],
              ),
              ExpansionTile(
                title: Text('Indian Ethnic'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Indian Ethnic',
                      value: value,
                      choiceItems: KBEthnic,
                      onChange: (state) => setState(() { value = state.value; indian = true;})
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Bags'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Bags',
                      value: value,
                      choiceItems: KBBags,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),
               ExpansionTile(
                title: Text('Denim'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Denim',
                      value: value,
                      choiceItems: KBDenim,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),
              ExpansionTile(
                title: Text('Coats & Jackets'),
                maintainState:true,
                children: [
                  SmartSelect<String>.single(
                      title: 'Coats & Jackets',
                      value: value,
                      choiceItems: KBCoats,
                      onChange: (state) => setState(() => value = state.value)
                  ),

                ],
              ),

              ExpansionTile(
                title: Text('Shoes'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shoes',
                    value: value,
                    choiceItems: KBShoes,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Shorts'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Shorts',
                    value: value,
                    choiceItems: KBShorts,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Swimwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Swimwear',
                    value: value,
                    choiceItems: KBSwimwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
ExpansionTile(
                title: Text('Knitwear'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Knitwear',
                    value: value,
                    choiceItems: KBKnitwear,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Tops'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tops',
                    value: value,
                    choiceItems: KBTops,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Tracks'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Tracks',
                    value: value,
                    choiceItems: KBTracks,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
              ExpansionTile(
                title: Text('Trousers'),
                maintainState:true,
                children: [SmartSelect<String>.single(
                    title: 'Trousers',
                    value: value,
                    choiceItems: KBTrousers,
                    onChange: (state) => setState(() => value = state.value)
                ),
                ],
              ),
            ],
          ),
        );
}
Widget KidGCategory(){
return

  Expanded(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('Accessories'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Hats',
                  value: value,
                  choiceItems: KGHats,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Scarves',
                  value: value,
                  choiceItems: KGScarves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Belts',
                  value: value,
                  choiceItems: KGBelts,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Hair Accessories',
                  value: value,
                  choiceItems: KGHair,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Eyewear',
                  value: value,
                  choiceItems: KGGlasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Gloves',
                  value: value,
                  choiceItems: KGGloves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Socks',
                  value: value,
                  choiceItems: KGSocks,
                  onChange: (state) => setState(() => value = state.value)
              ),
 SmartSelect<String>.single(
                  title: 'Jewellery',
                  value: value,
                  choiceItems: KGJewellery,
                  onChange: (state) => setState(() => value = state.value)
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Indian Ethnic'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Indian Ethnic',
                  value: value,
                  choiceItems: KGEthnic,
                  onChange: (state) => setState(() { value = state.value; indian = true;})
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Bags'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Bags',
                  value: value,
                  choiceItems: KGBags,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Denim'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Denim',
                  value: value,
                  choiceItems: KGDenim,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
         ExpansionTile(
            title: Text('Dresses'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Dresses',
                  value: value,
                  choiceItems: KGDresses,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Jumpsuits & Playsuits'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jumpsuits & Playsuits',
                  value: value,
                  choiceItems: KGJumpsuit,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
 ExpansionTile(
            title: Text('Coats'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Coats',
                  value: value,
                  choiceItems: KGCoats,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
 ExpansionTile(
            title: Text('Jackets'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jackets',
                  value: value,
                  choiceItems: KGJackets,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),

          ExpansionTile(
            title: Text('Shoes'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shoes',
                value: value,
                choiceItems: KGShoes,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Shorts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shorts',
                value: value,
                choiceItems: KGShorts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Skirts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Skirts',
                value: value,
                choiceItems: KGSkirts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Swimwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Swimwear',
                value: value,
                choiceItems: KGSwimwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Knitwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Knitwear',
                value: value,
                choiceItems: KGKnitwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tops'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tops',
                value: value,
                choiceItems: KGTops,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tracks'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tracks',
                value: value,
                choiceItems: KGTracks,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Trousers'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Trousers',
                value: value,
                choiceItems: KGTrousers,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
        ],
      ),
    );
}
Widget TeenBCategory(){
    return

      Expanded(
    child: ListView(
      children: [
        ExpansionTile(
          title: Text('Accessories'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Hats',
                value: value,
                choiceItems: TBHats,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Scarves',
                value: value,
                choiceItems: TBScarves,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Belts & Braces ',
                value: value,
                choiceItems: TBBelts,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Ties & Bow Ties',
                value: value,
                choiceItems: TBTies,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Eyewear',
                value: value,
                choiceItems: TBGlasses,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Gloves',
                value: value,
                choiceItems: TBGloves,
                onChange: (state) => setState(() => value = state.value)
            ),
            SmartSelect<String>.single(
                title: 'Socks',
                value: value,
                choiceItems: TBSocks,
                onChange: (state) => setState(() => value = state.value)
            ),
 SmartSelect<String>.single(
                title: 'Travel',
                value: value,
                choiceItems: TBTravel,
                onChange: (state) => setState(() => value = state.value)
            ),


          ],
        ),
        ExpansionTile(
          title: Text('Indian Ethnic'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Indian Ethnic',
                value: value,
                choiceItems: TBEthnic,
                onChange: (state) => setState((){ value = state.value; indian = true;})
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Bags'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Bags',
                value: value,
                choiceItems: TBBags,
                onChange: (state) => setState(() => value = state.value)
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Denim'),
          maintainState:true,
          children: [
            SmartSelect<String>.single(
                title: 'Denim',
                value: value,
                choiceItems: TBDenim,
                onChange: (state) => setState(() => value = state.value)
            ),

          ],
        ),
        ExpansionTile(
          title: Text('Shoes'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shoes',
              value: value,
              choiceItems: TBShoes,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Shorts'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Shorts',
              value: value,
              choiceItems: TBShorts,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Swimwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Swimwear',
              value: value,
              choiceItems: TBSwimwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Knitwear'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Knitwear',
              value: value,
              choiceItems: TBKnitwear,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tops'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tops',
              value: value,
              choiceItems: TBTops,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Tracks'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Tracks',
              value: value,
              choiceItems: TBTracks,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
        ExpansionTile(
          title: Text('Trousers'),
          maintainState:true,
          children: [SmartSelect<String>.single(
              title: 'Trousers',
              value: value,
              choiceItems: TBTrousers,
              onChange: (state) => setState(() => value = state.value)
          ),
          ],
        ),
      ],
    ),
  );
}
Widget TeenGCategory(){
  return
  
    Expanded(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('Accessories'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Hats',
                  value: value,
                  choiceItems: TGHats,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Scarves',
                  value: value,
                  choiceItems: TGScarves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Belts',
                  value: value,
                  choiceItems: TGBelts,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Hair Accessories',
                  value: value,
                  choiceItems: TGHair,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Eyewear',
                  value: value,
                  choiceItems: TGGlasses,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Gloves',
                  value: value,
                  choiceItems: TGGloves,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Socks',
                  value: value,
                  choiceItems: TGSocks,
                  onChange: (state) => setState(() => value = state.value)
              ),
              SmartSelect<String>.single(
                  title: 'Jewellery',
                  value: value,
                  choiceItems: TGJewellery,
                  onChange: (state) => setState(() => value = state.value)
              ),
                SmartSelect<String>.single(
                  title: 'Travel',
                  value: value,
                  choiceItems: TGTravel,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Indian Ethnic'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Indian Ethnic',
                  value: value,
                  choiceItems: TGEthnic,
                  onChange: (state) => setState((){ value = state.value; indian = true;})
              ),

            ],
          ),

          ExpansionTile(
            title: Text('Bags'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Bags',
                  value: value,
                  choiceItems: TGBags,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Denim'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Denim',
                  value: value,
                  choiceItems: TGDenim,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Dresses'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Dresses',
                  value: value,
                  choiceItems: TGDresses,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),
          ExpansionTile(
            title: Text('Jumpsuit'),
            maintainState:true,
            children: [
              SmartSelect<String>.single(
                  title: 'Jumpsuit',
                  value: value,
                  choiceItems: TGJumpsuit,
                  onChange: (state) => setState(() => value = state.value)
              ),

            ],
          ),

          ExpansionTile(
            title: Text('Shoes'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shoes',
                value: value,
                choiceItems: TGShoes,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Shorts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Shorts',
                value: value,
                choiceItems: TGShorts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Skirts'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Skirts',
                value: value,
                choiceItems: TGSkirts,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Swimwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Swimwear',
                value: value,
                choiceItems: TGSwimwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Knitwear'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Knitwear',
                value: value,
                choiceItems: TGKnitwear,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tops'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tops',
                value: value,
                choiceItems: TGTops,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Tracks'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Tracks',
                value: value,
                choiceItems: TGTracks,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
          ExpansionTile(
            title: Text('Trousers'),
            maintainState:true,
            children: [SmartSelect<String>.single(
                title: 'Trousers',
                value: value,
                choiceItems: TGTrousers,
                onChange: (state) => setState(() => value = state.value)
            ),
            ],
          ),
        ],
      ),
    );
}
Widget sizeGuide(){

  if(dropdownValue=='Men'){
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
        child: Container(
          height: 400,
          child:PhotoView(imageProvider: AssetImage
        ('assets/img/MenClothingsize.jpg')),),
          );
      },
    );
  }
    else if(dropdownValue=='Women'){
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/WomanClothingsize.jpg'),

              ),),
          );
      },
    );
  }
  else  if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/babysizecloth.jpg')),),
          );
      },
    );
    }
  else if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls') {
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/kisclothsize.jpg')),),
          );
      },
    );
 }
  else if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
    showDialog<void>(
      context: context,
      // useRootNavigator:true,

      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return
          Dialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),),
            child: Container(
              height: 400,
              child:PhotoView(imageProvider: AssetImage
                ('assets/img/teenclothing.jpg')),),
          );
      },
    );
   }

}
 AddSize(){
  if(dropdownValue=='Men') {
return
  showMaterialModalBottomSheet(
    expand: true,
      context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
   Container(
              height: MediaQuery.of(context).size.height * 0.75,

            child: DefaultTabController(

                length:6,
                child: Scaffold(
                  resizeToAvoidBottomInset:true,
                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                        Text("Custom size(upto 10)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Ring(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Shoes(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                      ],
                    ),
                  ),

                  body: Container(
                    height: MediaQuery.of(context).size.height * 0.75,

                    child: TabBarView(
                        children:<Widget> [
                          ListView(


                            children: [



                              ExpansionTile(
                                title: Text('XXXS'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXS'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XS'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('S'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('M'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('L'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fourxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fivexlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sixxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sevenxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: eightxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                              // ConstrainedBox(
                              //   constraints: new BoxConstraints(
                              //     minHeight: 5.0,
                              //     maxHeight: 40.0,
                              //   ),
                              //   child: Expanded(
                              //     child: ListView(
                              //         shrinkWrap: true,
                              //         // scrollDirection: Axis.vertical,
                              //         children:[
                              //         ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Custom size 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController12,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController22,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController32,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController42,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController52,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController62,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController72,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController82,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController92,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                        hintText:" ${currentUser.currencyISO}0",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController102,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring22controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring23controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('3-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                        ]),
                  ),
                )
            ),
          );      },
    );
  }
  else if(dropdownValue=='Women') {
return
  showMaterialModalBottomSheet(
    expand: true,
    context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
          Expanded(
            child: DefaultTabController(

                length:6,
                child: Scaffold(

                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                        Text("Custom size(upto 10)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Ring(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Shoes(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                      ],
                    ),
                  ),

                  body: Container(

                    child: TabBarView(
                        children:<Widget> [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('XXXS'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXS'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XS'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('S'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('M'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('L'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('XXXL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fourxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fivexlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sixxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: sevenxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8XL'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: eightxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kSubtitle)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Custom size 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController12,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController22,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController32,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController42,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController52,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController62,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController72,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController82,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController92,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController102,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring22controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring23controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15-1/2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),



                            ],
                          ),
                        ]),
                  ),
                )
            ),
          );      },
    );
  }
  else if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
return
  showMaterialModalBottomSheet(
    expand: true,
    context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
          Expanded(
            child: DefaultTabController(

                length:6,
                child: Scaffold(

                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                        Text("Custom size(upto 10)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Ring(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Shoes(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                      ],
                    ),
                  ),

                  body: Container(

                    child: TabBarView(
                        children:<Widget> [
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('0-3 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3-6 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-9 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-12 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12-18 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('18-24 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Custom size 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController12,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController22,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController32,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController42,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController52,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController62,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController72,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController82,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController92,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController102,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring22controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring23controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('0-3 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3-6 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-12 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12-18 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('18-24 mth'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),




                            ],
                          ),

                        ]),
                  ),
                )
            ),
          );      },
    );
  }
  else  if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls') {
return
  showMaterialModalBottomSheet(
    expand: true,
    context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
          Expanded(
            child: DefaultTabController(

                length:6,
                child: Scaffold(

                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                        Text("Custom size(upto 10)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Ring(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Shoes(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                      ],
                    ),
                  ),

                  body: Container(

                    child: TabBarView(
                        children:<Widget> [
                          ListView(


                            children: [

                              ExpansionTile(
                                title: Text('2'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3-4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4-5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5-6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6-7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7-8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: lcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8-9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9-10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10-11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11-12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: fourxlcontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Custom size 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController12,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController22,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController32,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController42,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController52,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController62,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController72,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController82,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController92,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController102,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring22controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring23controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('2 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('2 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('3 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12 Y'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),




                            ],
                          ),

                        ]),
                  ),
                )
            ),
          );      },
    );
  }
  else  if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
return
  showMaterialModalBottomSheet(
    expand: true,
    context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
          Expanded(
            child: DefaultTabController(

                length:6,
                child: Scaffold(

                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Clothing",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Made-to-order",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),
                        Text("Free size",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                        Text("Custom size(upto 10)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Ring(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),
                       Text("Shoes(US/Canada)",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5),),

                      ],
                    ),
                  ),

                  body: Container(

                    child: TabBarView(
                        children:<Widget> [
                          ListView(


                            children: [

                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xxscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: xscontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('16'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: scontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Made-to-order'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: mtocontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Free size'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: freesizecontroller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Custom size 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController12,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController22,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController32,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController42,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController52,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController62,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController72,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController82,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController92,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('Custom size 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: customController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Title',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Additional price(optional)',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: customController102,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('4'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('4.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('5.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring5controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('6.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring6controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring7controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('7.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring8controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring9controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('8.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring10controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring11controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('9.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring12controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring13controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('10.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring14controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring15controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('11.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring16controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring17controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('12.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring18controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring19controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('13.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring20controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring21controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14.5'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring22controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Ring23controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          ListView(
                            children: [
                              ExpansionTile(
                                title: Text('13'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe1controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('14'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe2controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('15'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe3controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text('16'),
                                maintainState: true,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: Shoe4controller,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
                                          hintText: '0'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),






                            ],
                          ),
                        ]),
                  ),
                )
            ),
          );      },
    );
  } 
  


}
  AddCustomSize(parentContext){
    return
      showDialog(
          context: parentContext,
          builder: (context) {
            return SimpleDialog(
              title: Text("Add Size Chart"),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          maxLines: null,
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Catgeory(Women\'s Clothing)',
                          ),
                          textAlign: TextAlign.start,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Name is empty';
                            }
                            return null;
                          },
                        ),
                      ),


                    ],
                  ),
                )
              ],
            );
          });

  }
color(){
  return
    showMaterialModalBottomSheet(
      expand: true,
      context: context,
      builder: (BuildContext context) {
        SizeConfig().init(context);

        return
          Container(
            height: MediaQuery.of(context).size.height * 0.75,

            child: DefaultTabController(

                length:1,
                child: Scaffold(
                  resizeToAvoidBottomInset:true,
                  appBar:AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: kIcon,


                      tabs:[
                        Text("Add Colors",style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal *5,),),


                      ],
                    ),
                  ),

                  body: Container(
                    height: MediaQuery.of(context).size.height * 0.75,

                    child: TabBarView(
                        children:<Widget> [

                          ListView(


                            children: [


                              ExpansionTile(
                                title: Text('Color 1'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController11,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 2'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController21,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 3'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController31,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 4'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController4,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController41,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 5'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController51,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 6'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController6,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                          hintText: '117 cm'
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController61,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 7'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController7,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController71,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 8'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController8,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController81,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 9'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController9,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController91,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Text('color 10'),
                                maintainState: true,
                                children: [

                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      maxLines: 1,
                                      controller: colorController10,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'color',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                                    child: TextField(

                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: colorController101,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: kGrey)),
                                          labelText: 'Quantity in inventory',
),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),

                        ]),
                  ),
                )
            ),
          );      },
    );
}
  builduploadForm() {
    return  WillPopScope(
      onWillPop:()=> _onBackPressed(),
      child: ModalProgressHUD(

        progressIndicator:Column(mainAxisAlignment:MainAxisAlignment.center,
            children:[
          Text("Uploading...",style:TextStyle(color:Colors.red,fontSize:20,decoration:TextDecoration.none)),Text("$loading",style:TextStyle(color:Colors.red,fontSize:20,decoration:TextDecoration.none)),
        ]),
        inAsyncCall: isUploading,
        child: Scaffold(
         // key:  scaffoldKey,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: kSecondaryColor),
                onPressed:_onBackPressed),
            title: Text(
              "Product Details",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              FlatButton(
                onPressed: () async{


                  if(_formKey.currentState.validate()) {
                    // ignore: unnecessary_statements
                    await INRUSD();

                   handleSubmit();
                  Get.back();
                  }
else {          _formKey.currentState.validate()? Container(): Fluttertoast.showToast(
                      msg: "Fill the required fields " , timeInSecForIos: 4);}
                },

                child: Text(
                  "Post",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          ),
          body: Container( decoration: BoxDecoration(
              gradient: fabGradient
          ) ,
            alignment: Alignment.center,
            child: Stack(
              children:[
                Form(
                key: _formKey,
                child:
                Column(
                    children: <Widget>[
                    isUploading ? linearProgress() : Text(""),

                      carousel(),
                         Expanded(
                           child: SingleChildScrollView(
                             child: Column(
                        children: [

                    SizedBox(height: 8.0,),
                    Text('Select Gender',style:TextStyle(color: kText,fontSize:20.0) ,),
                    SizedBox(height: 8.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: kText,fontSize:20.0),

                          onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                          },
                          items: <String>['Women', 'Men', 'Baby-Boys', 'Baby-Girls', 'Kids-Boys', 'Kids-Girls', 'Teen-Boys', 'Teen-Girls']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),

                                );
                          }).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                      child: RaisedButton(
                        color:kblue,
                      child: Text('Select Category',style:TextStyle(color: Colors.white) ,),
                      onPressed: (){
                          showModalBottomSheet(context: context, builder:(BuildContext context){


                                if(dropdownValue=='Women')
                                {
                                  return
                                    WomenCategory();
                                }
                                else if(dropdownValue=='Men')
                                {
                                  return
                                    MenCategory();
                                }
      else if(dropdownValue=='Baby-Boys')
      {
        return
        BabyBCategory();
      }
      else if(dropdownValue== 'Baby-Girls'){
        return
        BabyGCategory();
      }
      else if(dropdownValue=='Kids-Boys'){
        return
        KidBCategory();
      }
      else if(dropdownValue=='Kids-Girls'){
        return
        KidGCategory();
      }
      else if(dropdownValue== 'Teen-Boys'){
        return
        TeenBCategory();
      }
      else if(dropdownValue=='Teen-Girls'){
        return
        TeenGCategory();
      }
                                else{
                                  return
                                  Text('text');
                                }
                          },
                          );
                      }
                      ,
                          ),
                    ),
                    value == 'None' ?   Text('Select Category',style:TextStyle(color: kText,fontSize:20.0),):
                    Text(' ',),


                    SizedBox(height: 8.0,),

                 Row(
                   mainAxisAlignment:MainAxisAlignment.center,
                      children:[
                     Container(
                 // alignment:Alignment.centerLeft,
                       child:   FloatingActionButton.extended(
backgroundColor: kblue,
                         onPressed: ()=>AddSize(),
                         label: Text('Specify Quantity',style:TextStyle(color:  Colors.white) ,),
                       ),
                     ),
        SizedBox(width: 8.0,),Container(
                 // alignment:Alignment.centerRight,
                       child:   FloatingActionButton.extended(
backgroundColor: kblue,
                         onPressed: ()=>sizeGuide(),
                         label: Text('Size Guide',style:TextStyle(color:  Colors.white) ,),
                       ),
                     ),

                      ],
                    ),
                    SizedBox(height: 8.0,),

                         Text("Processing time",  style:TextStyle(color: kText,fontSize:20.0)),
                          SizedBox(height: 8.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style:TextStyle(color: kText),
                                    keyboardType: TextInputType.number,

                                    controller: durationfromp,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                      labelText: 'Business days',labelStyle: TextStyle(color: kText),
                                    ),
                                    textAlign: TextAlign.center,
                                    validator: (text) {
                                      if ( text.isEmpty) {
                                        return 'Processing time is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Text("-",  style:TextStyle(color: kText)),

                              Expanded(

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style:TextStyle(color: kText),
                                    keyboardType: TextInputType.number,

                                    controller: durationtop,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                    ),
                                    textAlign: TextAlign.center,
                                    validator: (text) {
                                      if ( text.isEmpty) {
                                        return 'Processing time is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 8.0,),

                          ListTile(
                            leading: Icon(
                              Icons.local_shipping,
                              color: Colors.orange,
                              size: 35.0,
                            ),
                            title:Text("Shipping duration to ${currentUser.country}",  style:TextStyle(color: kText)),

                          ),
                          SizedBox(height: 8.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:TextStyle(color: kText),
                              keyboardType: TextInputType.number,

                              controller: durationfrom,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                               // labelText: 'Between',labelStyle: TextStyle(color: kText),
                              ),
                              textAlign: TextAlign.center,
                              validator: (text) {
                                if ( text.isEmpty) {
                                  return 'Shipping duration is empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Text("-",  style:TextStyle(color: kText)),

                        Expanded(

                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:TextStyle(color: kText),
                              keyboardType: TextInputType.number,

                              controller: durationto,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                              ),
                              textAlign: TextAlign.center,
                              validator: (text) {
                                if ( text.isEmpty) {
                                  return 'Shipping duration is empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                          SizedBox( height: 8.0,),
                          Text('Free shipping',style:TextStyle(color: kText)) ,
                          SizedBox( height: 8.0,),

                              Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text('No'),
                              SizedBox( width: 8.0,),

                              Switch(
                                value: freeship,
                                onChanged: (value){setState(() {
                                  freeship = value;
                                });},
                                activeColor: Colors.blue,
                                activeTrackColor: kPrimaryColor,
                              ),
                              SizedBox( width: 8.0,),

                              Text('Yes')
                            ],
                          ),

                          SizedBox( height: 8.0,),

                          !freeship?  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:TextStyle(color: kText),
                              keyboardType: TextInputType.number,

                              controller: shipcost,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                hintText:" ${currentUser.currencyISO}",

                                labelText: '${currentUser.currencyISO}Shipping cost',labelStyle: TextStyle(color: kText),

                              ),
                              textAlign: TextAlign.center,
                              validator: (text) {
                                if ( freeship==false && text.isEmpty ) {
                                  return 'Shipping cost is empty';
                                }
                                return null;
                              },
                            ),
                          ):Container(),

                          SizedBox( height: 8.0,),
                          Text('Worldwide shipping',style:TextStyle(color: kText)) ,
                          SizedBox( height: 8.0,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text('No'),
                              SizedBox( width: 8.0,),

                              Switch(
                                value: worldship,
                                onChanged: (value){setState(() {
                                  worldship = value;
                                });},
                                activeColor: Colors.blue,
                                activeTrackColor:kPrimaryColor,
                              ),
                              SizedBox( width: 8.0,),

                              Text('Yes')
                            ],
                          ),
                          SizedBox(height: 8.0,),

                          worldship ?     Container(
                            margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.local_shipping,
                                color: Colors.orange,
                                size: 35.0,
                              ),
                              title:Text("Shipping duration to worldwide",  style:TextStyle(color: kText)),

                            ),
                          ):Container(),
                          SizedBox(height: 8.0,),

                          worldship ?   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: TextFormField(
                                    style:TextStyle(color: kText),
                                    keyboardType: TextInputType.number,

                                    controller: durationfromw,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

// labelText: 'Between',labelStyle: TextStyle(color: kText),
                                    ),
                                    textAlign: TextAlign.center,
                                    validator: (text) {
                                      if (worldship==true && text.isEmpty) {
                                        return 'Shipping duration is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Text("-",  style:TextStyle(color: kText)),

                              Expanded(

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style:TextStyle(color: kText),
                                    keyboardType: TextInputType.number,
                                    controller: durationtow,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                    ),
                                    textAlign: TextAlign.center,
                                    validator: (text) {
                                      if (worldship==true && text.isEmpty) {
                                        return 'Shipping duration is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),

                            ],
                          ):Container(),
                          SizedBox( height: 8.0,),
                          Text('Free shipping',style:TextStyle(color: kText)) ,

                          SizedBox( height: 8.0,),

                          worldship ? Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text('No'),
                              SizedBox( width: 8.0,),

                              Switch(
                                value: freeworldship,
                                onChanged: (value){setState(() {
                                  freeworldship = value;
                                });},
                                activeColor: Colors.blue,
                                activeTrackColor:kPrimaryColor,
                              ),
                              SizedBox( width: 8.0,),

                              Text('Yes')
                            ],
                          ):Container(),

                          worldship && !freeworldship ?   Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:TextStyle(color: kText),
                              keyboardType: TextInputType.number,

                              controller: shipcostintern,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                hintText:" ${currentUser.currencyISO}",

                                labelText: 'Shipping cost',labelStyle: TextStyle(color: kText),
                              ),
                              textAlign: TextAlign.center,
                              validator: (text) {
                                if ( freeworldship==false && text.isEmpty ) {
                                  return 'Shipping cost is empty';
                                }
                                return null;
                              },
                            ),
                          ):Container(),
                          SizedBox(height: 8.0,),


                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: ListTile(
                                leading: Icon(
                                  EvilIcons.eye,
                                  color: Colors.orange,
                                  size: 35.0,
                                ),
                                title:  TextFormField(
                                  style:TextStyle(color: kText),
                                  controller: productnameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                    labelText: 'Product Name',labelStyle: TextStyle(color: kText),
                                    hintText: 'Product Name',
                                  ),
                                  textAlign: TextAlign.center,
                                  validator: (text) {
                                    if ( text.isEmpty) {
                                      return 'Product Name is empty';
                                    }
                                    return null;
                                  },
                                ),
                          ),
                        ),
                        SizedBox(height: 8.0,),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: ListTile(
                                leading: Icon(
                                  EvilIcons.tag,
                                  color: Colors.orange,
                                  size: 35.0,
                                ),
                                title:TextFormField(
                                  style:TextStyle(color: kText),
keyboardType:TextInputType.number,
                                  controller: priceController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                    labelText: 'Price',labelStyle: TextStyle(color: kText),
                                    hintText:" ${currentUser.currencyISO}",
                                  ),
                                  textAlign: TextAlign.center,
                                  validator: (text) {
                                    if (text.isEmpty) {
                                      return 'Price is empty';
                                    }
                                    return null;
                                  },
                                ),
                          ),
                        ),
                        SizedBox( height: 8.0,),

                          //Customised
                          Container(
                            // alignment:Alignment.centerLeft,
                            child:   FloatingActionButton.extended(
                              backgroundColor: kblue,
                              onPressed: ()=>color(),
                              label: Text('Add Colors',style:TextStyle(color:  Colors.white) ,),
                            ),
                          ),

                        SizedBox( height: 8.0,),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: TextFormField(
                            style:TextStyle(color: kText),

                            keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: detailsController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Product description',labelStyle: TextStyle(color: kText),
                                  hintText: 'Product description',
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
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
                            style:TextStyle(color: kText),

                            keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: compositionController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Fabric description',labelStyle: TextStyle(color: kText),
                                  hintText: 'ex.Cotton: 100%' ,
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Fabric description is empty';
                                  }
                                  return null;
                                },
                          ),
                        ),
                        SizedBox( height: 8.0,),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: TextFormField(
                            style:TextStyle(color: kText),

                            keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: washandcareController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Wash & Care',labelStyle: TextStyle(color: kText),
                                  hintText: 'Wash & Care instructions',
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Wash & Care instructions is empty';
                                  }
                                  return null;
                                },
                          ),
                        ),
                        SizedBox( height: 8.0,),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: TextFormField(
                            style:TextStyle(color: kText),

                            keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: sizeandfitController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Size & Fit recommendations',labelStyle: TextStyle(color: kText),
                                  hintText: 'ex.Cut for slim fit,take your normal size',
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return ' Size & Fit recommendations is empty';
                                  }
                                  return null;
                                },
                          ),
                        ),

                          SizedBox( height: 8.0,),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                          child: TextFormField(
                            style:TextStyle(color: kText),

                            keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: shipcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                  labelText: 'Shipping & returns',labelStyle: TextStyle(color: kText),
                                  hintText: 'countries served & return policy',
                                ),
                                textAlign: TextAlign.center,
                                validator: (text) {
                                  if ( text.isEmpty) {
                                    return 'Shipping & returns';
                                  }
                                  return null;
                                },
                          ),
                        ),



  SizedBox( height: 8.0,),


                         ],
                      ),
                           ),
                         ),


                ],
                ),




              ),

                isUploading ? Center(child:  CircularProgressIndicator()) : Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {

    List<Asset> resultList = List<Asset>();
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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {

      images = resultList;
      _error = error;
    });

  }
  void INRUSD() async {
    setState(() {
      isUploading = true;
    });

    var resultUSD = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: priceController.text);
    var resultUSD1 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController11.text ??  0);
    var resultUSD2 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController21.text ??  0);
    var resultUSD3 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController31.text ??  0);
    var resultUSD4 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController41.text ??  0);
    var resultUSD5 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController51.text ??  0);
    var resultUSD6 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController61.text ??  0);
    var resultUSD7 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController71.text ??  0);
    var resultUSD8 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController81.text ??  0);
    var resultUSD9 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController91.text ??  0);
    var resultUSD10 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController101.text ??  0);
    var resultUSD11 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: shipcost.text ??  0);
    var resultUSD12 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: shipcostintern.text ??  0);
    // String date = result.date; // Returns the last updated date
    setState(() {

      inrtousd = resultUSD.rate;
      inrtousd1 = resultUSD1.rate;
      inrtousd2 = resultUSD2.rate;
      inrtousd3 = resultUSD3.rate;
      inrtousd4 = resultUSD4.rate;
      inrtousd5 = resultUSD5.rate;
      inrtousd6 = resultUSD6.rate;
      inrtousd7 = resultUSD7.rate;
      inrtousd8 = resultUSD8.rate;
      inrtousd9 = resultUSD9.rate;
      inrtousd10 = resultUSD10.rate;
      inrtousd11 = resultUSD11.rate;
      inrtousd12 = resultUSD12.rate;
      userprice = priceController.text;
      userprice1 = customController11.text;
      userprice2 = customController21.text;
      userprice3 = customController31.text;
      userprice4 = customController41.text;
      userprice5 = customController51.text;
      userprice6 = customController61.text;
      userprice7 = customController71.text;
      userprice8 = customController81.text;
      userprice9 = customController91.text;
      userprice10 = customController101.text;
      userprice11 = shipcost.text;
      userprice12 = shipcostintern.text;

    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
//    ByteData byteData = await imageFile.requestOriginal(quality: 75);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("Shop${prodId}").child("$fileName.jpg");
    UploadTask uploadTask = reference.putData((await imageFile.getByteData(quality: 70)).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask;
//    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }
  gsd()async{
    await INRUSD();

  }
  Future<void> handleSubmit() async {

    setState((){loading = "Uploading to database!";});

    for ( var imageFile in images) {
      postImage(imageFile).then((downloadUrl)  {
        imageUrls.add(downloadUrl.toString());
        if(imageUrls.length==images.length){
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();

            productsRef
                .doc(widget.currentUser.id)
                .collection("userProducts")
                .doc(prodId)
                .set({
              "colorText1":colorController1.text ?? "",
              "colorText2":colorController2.text ?? "",
              "colorText3":colorController3.text ?? "",
              "colorText4":colorController4.text ?? "",
              "colorText5":colorController5.text ?? "",
              "colorText6":colorController6.text ?? "",
              "colorText7":colorController7.text ?? "",
              "colorText8":colorController8.text ?? "",
              "colorText9":colorController9.text ?? "",
              "colorText10":colorController10.text ?? "",
              "color1":int.tryParse(colorController11.text) ?? 0,
              "color2":int.tryParse(colorController21.text) ?? 0,
              "color3":int.tryParse(colorController31.text) ?? 0,
              "color4":int.tryParse(colorController41.text) ?? 0,
              "color5":int.tryParse(colorController51.text) ?? 0,
              "color6":int.tryParse(colorController61.text) ?? 0,
              "color7":int.tryParse(colorController71.text) ?? 0,
              "color8":int.tryParse(colorController81.text) ?? 0,
              "color9":int.tryParse(colorController91.text) ?? 0,
              "color10":int.tryParse(colorController10.text) ?? 0,
              "country":  currentUser.country,

              "indian":indian,
               "worldship":worldship,
               "freeworldship":freeworldship,
              "freeship":freeship,
              "shipment": shipcontroller.text,
              "prodId": prodId,
              "ownerId": widget.currentUser.id,
              "username": widget.currentUser.displayName,
              "photoUrl": widget.currentUser.photoUrl,
              "displayName": widget.currentUser.displayName,
              "shopmediaUrl": imageUrls,
              "Category": value,
              // "type":type,
              "Gender": dropdownValue,
              "details": detailsController.text,
              "productname": productnameController.text,
              "usd": inrtousd.toString(),

              "inr": userprice.toString(),

              "timestamp": timestamp,
              "composition": compositionController.text,
              "washandcare": washandcareController.text,
              "sizeandfit": sizeandfitController.text,
              "xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
              "xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
              "xsQuantity":  int.tryParse(xscontroller.text )?? 0,
              "sQuantity": int.tryParse(scontroller.text) ?? 0,

              "mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
              "freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


              "mQuantity":  int.tryParse(mcontroller.text) ?? 0,
              "lQuantity":  int.tryParse(lcontroller.text) ?? 0,
              "xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
              "xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
              "xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
              "fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
              "fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
              "sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
              "sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
              "eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
              "Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
              "Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
              "Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
              "Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
              "Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
              "Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
              "Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
              "Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
              "Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
              "Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
              "Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
              "Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
              "Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
              "Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
              "Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
              "Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
              "Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
              "Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
              "Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
              "Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
              "Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
              "Ring1":   int.tryParse(Ring1controller.text) ?? 0,
              "Ring2":   int.tryParse(Ring2controller.text) ?? 0,
              "Ring3":   int.tryParse(Ring3controller.text) ?? 0,
              "Ring4":   int.tryParse(Ring4controller.text) ?? 0,
              "Ring5":   int.tryParse(Ring5controller.text) ?? 0,
              "Ring6":   int.tryParse(Ring6controller.text) ?? 0,
              "Ring7":   int.tryParse(Ring7controller.text) ?? 0,
              "Ring8":   int.tryParse(Ring8controller.text) ?? 0,
              "Ring9":   int.tryParse(Ring9controller.text) ?? 0,
              "Ring10":   int.tryParse(Ring10controller.text) ?? 0,
              "Ring11":   int.tryParse(Ring11controller.text) ?? 0,
              "Ring12":   int.tryParse(Ring12controller.text) ?? 0,
              "Ring13":   int.tryParse(Ring13controller.text) ?? 0,
              "Ring14":   int.tryParse(Ring14controller.text) ?? 0,
              "Ring15":  int.tryParse(Ring15controller.text) ?? 0,
              "Ring16":  int.tryParse(Ring16controller.text) ?? 0,
              "Ring17":  int.tryParse(Ring17controller.text) ?? 0,
              "Ring18":  int.tryParse(Ring18controller.text) ?? 0,
              "Ring19":  int.tryParse(Ring19controller.text) ?? 0,
              "Ring20":  int.tryParse(Ring20controller.text) ?? 0,
              "Ring21":  int.tryParse(Ring21controller.text) ?? 0,
              "Ring22":  int.tryParse(Ring22controller.text) ?? 0,
              "Ring23":  int.tryParse(Ring23controller.text) ?? 0,
              "custom1":  customController1.text ?? "",
              "custom2":  customController2.text ?? "",
              "custom3":  customController3.text ?? "",
              "custom4":  customController4.text ?? "",
              "custom5":  customController5.text ?? "",
              "custom6":  customController6.text ?? "",
              "custom7":  customController7.text ?? "",
              "custom8":  customController8.text ?? "",
              "custom9":  customController9.text ?? "",
              "custom10":  customController10.text ?? "",
              "custom12":  int.tryParse(customController12.text) ?? 0,
              "custom22":  int.tryParse(customController22.text) ?? 0,
              "custom32":  int.tryParse(customController32.text) ?? 0,
              "custom42":  int.tryParse(customController42.text) ?? 0,
              "custom52":  int.tryParse(customController52.text) ?? 0,
              "custom62":  int.tryParse(customController62.text) ?? 0,
              "custom72":  int.tryParse(customController72.text) ?? 0,
              "custom82":  int.tryParse(customController82.text) ?? 0,
              "custom92":  int.tryParse(customController92.text) ?? 0,
              "custom102":  int.tryParse(customController102.text) ??0,

              "custom11inr": userprice1.toString() ?? "0.0",
              "custom21usd": inrtousd2.toString() ?? "0.0",
              "custom21inr": userprice2.toString() ?? "0.0",
              "custom31usd": inrtousd3.toString() ?? "0.0",
              "custom31inr": userprice3.toString() ?? "0.0",
              "custom41usd": inrtousd4.toString() ?? "0.0",
              "custom41inr": userprice4.toString() ?? "0.0",
              "custom51usd": inrtousd5.toString() ?? "0.0",
              "custom51inr": userprice5.toString() ?? "0.0",
              "custom61usd": inrtousd6.toString() ?? "0.0",
              "custom61inr": userprice6.toString() ?? "0.0",
              "custom71usd": inrtousd7.toString() ?? "0.0",
              "custom71inr": userprice7.toString() ?? "0.0",
              "custom81usd": inrtousd8.toString() ?? "0.0",
              "custom81inr": userprice8.toString() ?? "0.0",
              "custom91usd": inrtousd9.toString() ?? "0.0",
              "custom91inr": userprice9.toString() ?? "0.0",
              "custom101usd": inrtousd10.toString() ?? "0.0",
              "custom101inr": userprice10.toString() ?? "0.0",
              "shipcostusd": inrtousd11.toString() ?? "0.0",
              "shipcostinr": userprice11.toString() ?? "0.0",
 "shipcostinterusd": inrtousd12.toString() ?? "0.0",
              "shipcostinterinr": userprice12.toString() ?? "0.0",

              "processfrom":  int.tryParse(durationfromp.text) ?? 0,
              "processto":  int.tryParse(durationto.text) ?? 0,
              "shipfrom":  int.tryParse(durationfrom.text) ?? 0,
              "shipto":  int.tryParse(durationto.text) ?? 0,
 "shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
              "shipinterto":  int.tryParse(durationtow.text) ?? 0,

              "likes": {},
            });



            setState(() {
              file = null;
              isUploading = false;
            });



        }
      }).catchError((err) {
        print(err);
        print('rtherjhertjnherj${imageUrls.length}');
        print('rjertertj${images.length}');

      });
    }
    Get.back();


  }

  carousel(){

    return
      CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
          ),
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
  bool get wantKeepAlive => true;
sdf(){
  floatingActionButton: new FloatingActionButton(
    child: new Icon(Icons.add),
    onPressed: () {
      setState(() {
        count = count + 1;
      });
    },
  );
}
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Widget> children = new List.generate(count, (int i) => new InputWidget(i));

    return images.isEmpty ? buildSplashScreen() : builduploadForm();
  }

  customSize({int index}){
    return index == 0  ?   Container(
      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
      child: TextFormField(
        style:TextStyle(color: kText),

        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: customController1,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

          labelText: 'Custom size',labelStyle: TextStyle(color: kText),
          hintText: 'ex.117 cm',
        ),
        textAlign: TextAlign.center,
        validator: (text) {
          if ( text.isEmpty) {
            return 'Shoud not be empty';
          }
          return null;
        },
      ),
    ):index == 1  ?   Container(
      margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
      child: TextFormField(
        style:TextStyle(color: kText),

        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: customController1,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

          labelText: 'Custom size',labelStyle: TextStyle(color: kText),
          hintText: 'ex.117 cm',
        ),
        textAlign: TextAlign.center,
        validator: (text) {
          if ( text.isEmpty) {
            return 'Shoud not be empty';
          }
          return null;
        },
      ),
    ):Text("Upto 10 allowed");
  }
}
class InputWidget extends StatelessWidget {

  final int index;

  InputWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Text("Upto 10 allowed");
  }
}