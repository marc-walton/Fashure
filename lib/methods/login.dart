import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/methods/register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:fashow/HomePage.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/types/gf_toast_type.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:getwidget/getwidget.dart';
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
bool _passwordVisible = false;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
String accountErrorMessage;
bool loging =  false;
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation : 0.1,

                              primary:  Colors.white.withOpacity(0.1), // background
                            ),
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
    return  ModalProgressHUD(
      inAsyncCall: loging,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Login", style: TextStyle(color:Colors.white),),
          ),
          body: Container(

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
                          obscureText: !_passwordVisible,//This will obscure text dynamically

                          style: TextStyle(color:kText),
                          decoration: InputDecoration(
                              labelStyle:  TextStyle(color:kText),
                              hintStyle:  TextStyle(color:kText),
                              labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),),
                          controller: pwdInputController,
                          validator: pwdValidator,
                        ),
                        TextButton(
                          child: Text("Forgot Password?",  style: TextStyle(color:kText),),
                          onPressed: () {
                    resetPassword(parentContext: context,email: emailInputController.text??"")    ;                    },
                        ),
                        ElevatedButton(

                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            elevation : 0.1,

                            primary:  Colors.black, // background
                          ),
                          onPressed: () {
                            if (_loginFormKey.currentState.validate()) {
                              try{
                                 loging =  true;

                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: pwdInputController.text)
                                    .then((User) => FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(User.user.uid)
                                    .get()
                                    .then((DocumentSnapshot result)
                                {


                                    loging =  false;

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage(
                                              userid:User.user.uid,
                                              auth: true,
                                            )),
                                            (_) => false );
                                  }

                                ).catchError((error){
                                loging =  false;
                                GFToast(
                                 text: '${error.message}',
                                  duration: Duration(milliseconds: 400),
                                  alignment: Alignment.topCenter,
                                  textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                                  backgroundColor: GFColors.DARK,
                                );


                                }),
                                ).catchError((error){
                                  loging =  false;

                                  GFToast(
                                    text: '${error.message}',
                                    duration: Duration(milliseconds: 400),
                                    alignment: Alignment.topCenter,
                                    textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                                    backgroundColor: GFColors.DARK,
                                  );
                                });
                              } on FirebaseAuthException catch(error){
                                 loging =  false;

                                 GFToast(
                                   text: '${error.message}',
                                   duration: Duration(milliseconds: 400),
                                   alignment: Alignment.topCenter,
                                   textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                                   backgroundColor: GFColors.DARK,
                                 );
                              }

                            }
                          },
                        ),
                        Text("your first time?",  style: TextStyle(color:kText),),
                        TextButton(
                          child: Text("Register here!",  style: TextStyle(color:kText),),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()))    ;                    },
                        )
                      ],
                    ),
                  )))),
    );
  }
}