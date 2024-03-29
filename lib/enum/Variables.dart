import 'dart:io';
import 'dart:async';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Categories/BboyEcomUp.dart';
import 'package:fashow/Categories/BgirlEcomUp.dart';
import 'package:fashow/Categories/KboyEcomUp.dart';
import 'package:fashow/Categories/KgirlEcomUp.dart';
import 'package:fashow/Categories/MenEcomUp.dart';
import 'package:fashow/Categories/WomenEcomUp.dart';
import 'package:fashow/Categories/TboyEcomUp.dart';
import 'package:fashow/Categories/TgirlEcomUp.dart';
import 'package:fashow/enum/Variables.dart';

import 'package:fashow/Products.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:intl/intl.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_formatter/currency_formatter.dart';

// userVariationPrice =  currentUser.currency == "EUR"? custom11eur:
// currentUser.currency == "INR"? custom11inr:
// currentUser.currency == "GBP"? custom11gbp:
// custom11usd;
CurrencyFormatter cf = CurrencyFormatter();



File file;
File file1;
File file2;
File file3;
File file4;
File file5;
File file6;
File file7;
File file8;
File file9;
File customImg1;
bool sizeChart = false;
// File customImg2;
// File customImg3;
// File customImg4;
// File customImg5;
// File customImg6;
// File customImg7;
// File customImg8;
// File customImg9;
// File customImg10;
// File customImg11;
// File customImg12;
// File customImg13;
// File customImg14;
// File customImg15;
// File customImg16;
// File customImg17;
// File customImg18;
// File customImg19;
// File customImg20;
// File customImg21;
// File customImg22;
// File customImg23;
// File customImg24;
// File customImg25;
// File customImg26;
// File customImg27;
// File customImg28;
// File customImg29;
// File customImg30;
// File customImg31;
// File customImg32;
// File customImg33;
// File customImg34;
// File customImg35;
// File customImg36;
// File customImg37;
// File customImg38;
// File customImg39;
// File customImg40;
// File customImg41;
// File customImg42;
// File customImg43;
// File customImg44;
// File customImg45;
// File customImg46;
// File customImg47;
// File customImg48;
// File customImg49;
// File customImg50;


bool tile = false;
bool tile1 = false;
bool tile2 = false;
bool tile3 = false;
bool tile4 = false;
bool tile5 = false;
bool tile6 = false;
bool tile7 = false;
bool tile8 = false;
bool tile9 = false;

String value = 'Select Category';
List colors;
bool worldship = true;
bool freeship = true;
bool freeworldship = true;
bool isTag = false;
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
TextEditingController customControllerQuantity1 = TextEditingController();
TextEditingController customControllerQuantity2 = TextEditingController();
TextEditingController customControllerQuantity3 = TextEditingController();
TextEditingController customControllerQuantity4 = TextEditingController();
TextEditingController customControllerQuantity5 = TextEditingController();
TextEditingController customControllerQuantity6 = TextEditingController();
TextEditingController customControllerQuantity7 = TextEditingController();
TextEditingController customControllerQuantity8 = TextEditingController();
TextEditingController customControllerQuantity9 = TextEditingController();
TextEditingController customControllerQuantity10 = TextEditingController();

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
TextEditingController tagController = TextEditingController();

// TextEditingController title1Controller = TextEditingController();
// TextEditingController title2Controller = TextEditingController();
// TextEditingController title3Controller = TextEditingController();
// TextEditingController title4Controller = TextEditingController();
// TextEditingController title5Controller = TextEditingController();
//
// TextEditingController custom1 = TextEditingController();
// TextEditingController custom2 = TextEditingController();
// TextEditingController custom3 = TextEditingController();
// TextEditingController custom4 = TextEditingController();
// TextEditingController custom5 = TextEditingController();
// TextEditingController custom6 = TextEditingController();
// TextEditingController custom7 = TextEditingController();
// TextEditingController custom8 = TextEditingController();
// TextEditingController custom9 = TextEditingController();
// TextEditingController custom10 = TextEditingController();
// TextEditingController custom11 = TextEditingController();
// TextEditingController custom12 = TextEditingController();
// TextEditingController custom13 = TextEditingController();
// TextEditingController custom14 = TextEditingController();
// TextEditingController custom15 = TextEditingController();
// TextEditingController custom16 = TextEditingController();
// TextEditingController custom17 = TextEditingController();
// TextEditingController custom18 = TextEditingController();
// TextEditingController custom19 = TextEditingController();
// TextEditingController custom20 = TextEditingController();
// TextEditingController custom21 = TextEditingController();
// TextEditingController custom22 = TextEditingController();
// TextEditingController custom23 = TextEditingController();
// TextEditingController custom24 = TextEditingController();
// TextEditingController custom25 = TextEditingController();
// TextEditingController custom26 = TextEditingController();
// TextEditingController custom27 = TextEditingController();
// TextEditingController custom28 = TextEditingController();
// TextEditingController custom29 = TextEditingController();
// TextEditingController custom30 = TextEditingController();
// TextEditingController custom31 = TextEditingController();
// TextEditingController custom32 = TextEditingController();
// TextEditingController custom33 = TextEditingController();
// TextEditingController custom34 = TextEditingController();
// TextEditingController custom35 = TextEditingController();
// TextEditingController custom36 = TextEditingController();
// TextEditingController custom37 = TextEditingController();
// TextEditingController custom38 = TextEditingController();
// TextEditingController custom39 = TextEditingController();
// TextEditingController custom40 = TextEditingController();
// TextEditingController custom41 = TextEditingController();
// TextEditingController custom42 = TextEditingController();
// TextEditingController custom43 = TextEditingController();
// TextEditingController custom44 = TextEditingController();
// TextEditingController custom45 = TextEditingController();
// TextEditingController custom46 = TextEditingController();
// TextEditingController custom47 = TextEditingController();
// TextEditingController custom48 = TextEditingController();
// TextEditingController custom49 = TextEditingController();
// TextEditingController custom50 = TextEditingController();
//
// TextEditingController customName1 = TextEditingController();
// TextEditingController customName2 = TextEditingController();
// TextEditingController customName3 = TextEditingController();
// TextEditingController customName4 = TextEditingController();
// TextEditingController customName5 = TextEditingController();
// TextEditingController customName6 = TextEditingController();
// TextEditingController customName7 = TextEditingController();
// TextEditingController customName8 = TextEditingController();
// TextEditingController customName9 = TextEditingController();
// TextEditingController customName10 = TextEditingController();
// TextEditingController customName11 = TextEditingController();
// TextEditingController customName12 = TextEditingController();
// TextEditingController customName13 = TextEditingController();
// TextEditingController customName14 = TextEditingController();
// TextEditingController customName15 = TextEditingController();
// TextEditingController customName16 = TextEditingController();
// TextEditingController customName17 = TextEditingController();
// TextEditingController customName18 = TextEditingController();
// TextEditingController customName19 = TextEditingController();
// TextEditingController customName20 = TextEditingController();
// TextEditingController customName21 = TextEditingController();
// TextEditingController customName22 = TextEditingController();
// TextEditingController customName23 = TextEditingController();
// TextEditingController customName24 = TextEditingController();
// TextEditingController customName25 = TextEditingController();
// TextEditingController customName26 = TextEditingController();
// TextEditingController customName27 = TextEditingController();
// TextEditingController customName28 = TextEditingController();
// TextEditingController customName29 = TextEditingController();
// TextEditingController customName30 = TextEditingController();
// TextEditingController customName31 = TextEditingController();
// TextEditingController customName32 = TextEditingController();
// TextEditingController customName33 = TextEditingController();
// TextEditingController customName34 = TextEditingController();
// TextEditingController customName35 = TextEditingController();
// TextEditingController customName36 = TextEditingController();
// TextEditingController customName37 = TextEditingController();
// TextEditingController customName38 = TextEditingController();
// TextEditingController customName39 = TextEditingController();
// TextEditingController customName40 = TextEditingController();
// TextEditingController customName41 = TextEditingController();
// TextEditingController customName42 = TextEditingController();
// TextEditingController customName43 = TextEditingController();
// TextEditingController customName44 = TextEditingController();
// TextEditingController customName45 = TextEditingController();
// TextEditingController customName46 = TextEditingController();
// TextEditingController customName47 = TextEditingController();
// TextEditingController customName48 = TextEditingController();
// TextEditingController customName49 = TextEditingController();
// TextEditingController customName50 = TextEditingController();
//
//

