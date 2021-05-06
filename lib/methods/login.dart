import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/methods/register.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Login", style: TextStyle(color:kText),),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors:[ kPrimaryColor,
                  kSecondaryColor

                ],
              ),
            ) ,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                            labelText: 'Email*,', hintText: "john.doe@gmail.com"),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                          labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                            labelText: 'Password*', hintText: "********"),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      RaisedButton(

                        child: Text("Login"),
                        color: kblue,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_loginFormKey.currentState.validate()) {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                                .then((User) => Firestore.instance
                                .collection("users")
                                .document(User.user.uid)
                                .get()
                                .then((DocumentSnapshot result) =>

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage(

                                        )),
                                        (_) => false ),
                            )
                                .catchError((err) => print(err)))
                                .catchError((err) => print(err));
                          }
                        },
                      ),
                      Text("your first time?",  style: TextStyle(color:kText),),
                      FlatButton(
                        child: Text("Register here!",  style: TextStyle(color:kText),),
                        onPressed: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                          builder: (context) => RegisterPage()))    ;                    },
                      )
                    ],
                  ),
                ))));
  }
}