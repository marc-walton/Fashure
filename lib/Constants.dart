import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

 Color kPrimaryColor = Colors.black;
const Color Bappbar = Color(0xff240638);
// const Color kPrimaryColor = Color(0xffffd194);
const Color appbar = Colors.black26;
const Color trans = Colors.transparent;
const Color transwhite = Colors.white38;
final oCcy = new NumberFormat("#,##0.00", "en_US");
var eurosInCurrentLocale = NumberFormat.currency(symbol: "€");
 bool tabs = false;
 bool duties = false;
String priceQuery = "0";
String AQuery = "A0";
String BQuery = "B0";
String CQuery = "C0";
String DQuery = "D0";
String EQuery = "E0";
String FQuery = "F0";
String GQuery = "G0";
String HQuery = "H0";
String IQuery = "I0";
String JQuery = "J0";
String KQuery = "K0";
String LQuery = "L0";
String MQuery = "M0";
String NQuery = "N0";
String OQuery = "O0";
String PQuery = "P0";
String QQuery = "Q0";
String RQuery = "R0";
String SQuery = "S0";
String desQuery = "des0";
String illQuery = "ill0";
String stylQuery = "styl0";
String blogQuery = "blog0";
String phoQuery = "pho0";
String modQuery = "mod0";
String makeQuery = "make0";
String hairQuery = "hair0";
String choQuery = "cho0";
String artQuery = "art0";

 final Gradient fabGradient = LinearGradient(
    colors: [ Color(0xff70e1f5),Color(0xffffd194)],
  begin: Alignment.topRight,
   end: Alignment.bottomLeft,
 );

const Color kSecondaryColor = Color(0xFFFFFFFF);
 Color kIcon = Colors.grey[400]; Color kButton = Colors.pink.shade50;
const Color kSubtitle = Color(0xFFABB6B8);
const Color kUser = Color(0xFFAECCCC);
const Color kText = Color(0xff440a67);
const Color kGrey = Color(0xFF424242);
const Color kblue=Colors.indigoAccent;
const Color kTran=Colors.transparent;
const String MESSAGES_COLLECTION = "messages";
const String USERS_COLLECTION = "users";
const String CALL_COLLECTION = "call";
const String CONTACTS_COLLECTION = "contacts";

const String TIMESTAMP_FIELD = "timestamp";
const String EMAIL_FIELD = "email";

const String MESSAGE_TYPE_IMAGE = "image";


//const Color Ktransparentblue = Color(0XFF9B9BB4).withOpacity(0.3)
//const Color kBottomContainerColor = Color(0xFFEB1555);