import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/methods/register.dart';
import 'package:get/get.dart';

import 'package:fashow/HomePage.dart';
class RIKeys {
  static final riKey1 = const Key('__RIKEY1__');
  static final riKey2 = const Key('__RIKEY2__');
  static final riKey3 = const Key('__RIKEY3__');
}
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>(debugLabel: '_LoginFormState');
  GlobalKey<FormState> _forgotFormKey = GlobalKey<FormState>(debugLabel: '_forgotFormState');

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
  Future<void> resetPassword({String email,parentContext}) async {
    return
      showModalBottomSheet(
          context: parentContext,
          builder: (BuildContext context) {
            return
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                    child:        Form(
                      key: _forgotFormKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(color:kText),
                            decoration: InputDecoration(
                                labelStyle:  TextStyle(color:kText),
                                hintStyle:  TextStyle(color:kText),
                                labelText: 'Email', ),
                            controller: emailInputController,
                            keyboardType: TextInputType.emailAddress,
                            validator: emailValidator,
                          ),
                          RaisedButton(

                            child:
                            Text('Send mail',style: TextStyle(color: kblue,
                            ),),

                            onPressed: () async {
                              if (_loginFormKey.currentState.validate()) {
                                await  FirebaseAuth.instance.sendPasswordResetEmail(email: emailInputController.text);

                              }
                              Get.back();
                              alert(
                                parentContext,
                                content:
                                Text('Password reset has been sent to your Email',
                                  style: TextStyle(color: kblue,
                                  ),),

                                textOK: Text('Ok'),
                              );
                            },
                          ),

                        ],
                      ),
                    )

                ),
              );

          }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Login", style: TextStyle(color:Colors.white),),
        ),
        body: Container(

            decoration: BoxDecoration(
                gradient: fabGradient
            ) ,
            alignment: Alignment.center,
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
                            labelText: 'Email', hintText: "john.doe@gmail.com"),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                            labelText: 'Password', ),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      FlatButton(
                        child: Text("Forgot Password?",  style: TextStyle(color:kText),),
                        onPressed: () {
                  resetPassword(parentContext: context,email: emailInputController.text??"")    ;                    },
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
                                .then((User) => FirebaseFirestore.instance
                                .collection("users")
                                .doc(User.user.uid)
                                .get()
                                .then((DocumentSnapshot result) =>
                            { if (User == null)
                              {

                                // Navigator.pushReplacementNamed(context, "/login")
                              }
                            else
                              {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage(
                                          userid:User.user.uid,
                                          auth: true,
                                        )),
                                        (_) => false ),
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Homepage(
                                //           userid: User.uid,
                                //           authis: isAuth,
                                //         )))
                                // Firestore.instance
                                //     .collection("users")
                                //     .document(currentUser.uid)
                                //     .get()
                                //     .then((DocumentSnapshot result) =>
                                //     Navigator.pushReplacement(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) => HomePage(
                                //               title: result["fname"] + "'s Tasks",
                                //               uid: currentUser.uid,
                                //             ))))
                                //     .catchError((err) => print(err))
                              }}

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