import 'package:flutter/material.dart';
import 'package:fashow/Search_screen.dart';
import 'package:fashow/utils/universal_variables.dart';
import 'package:fashow/Constants.dart';
import 'package:translated_text/translated_text.dart';

import '../HomePage.dart';

class QuietBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          color: UniversalVariables.separatorColor,
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TranslatedText('This is where all the contacts are listed',to:'${currentUser.language}',
                textAlign: TextAlign.center,
                  textStyle: TextStyle(
                  color: kText,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 25),
              TranslatedText('Search for your friends and family to start calling or chatting with them',
                to:'${currentUser.language}',
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  color: kText,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
              ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}