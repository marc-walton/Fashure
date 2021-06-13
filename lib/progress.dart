import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
//import 'package:flutter/cupertino.dart';
Container circularProgress(){
  return Container (
    alignment: Alignment.center,
padding: EdgeInsets.only(top: 10.0),
child: CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
),
  );
}

Container linearProgress(){
  return Container (
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
    ),


  );
}