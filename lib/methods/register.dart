import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:fashow/Constants.dart';
import 'package:alert_dialog/alert_dialog.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  String dropdownValue = "";
  final DateTime timestamp = DateTime.now();
bool save = false;
  @override
  initState() {

    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
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
usernamecheck()async{
    final QuerySnapshot result = await Firestore.instance
    .collection('users')
    .where('username',isEqualTo: lastNameInputController.text)
    .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    if(documents.length > 0){
      alert(
        context,
        title: Text('User name is already taken'),
        content: Text('Please chose another username'),
        textOK: Text('Ok'),
      );
    }
    else{
      setState(() {
        save = true;
      });
    }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:                   kSecondaryColor,

        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Register", style: TextStyle(color:kText),),
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
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                            labelText: 'Full Name*', hintText: "Full Name*"),
                        controller: firstNameInputController,
                        validator: (value) {
                          if (value.length < 3) {
                            return "Please enter a valid first name.";
                          }
                        },
                      ),
                      TextFormField(
                          style: TextStyle(color:kText),
                          decoration: InputDecoration(
                              labelStyle:  TextStyle(color:kText),
                              hintStyle:  TextStyle(color:kText),                              labelText: 'User Name*', hintText: "unique to you on Fashure "),
                          controller: lastNameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Please enter a valid user name.";
                            }
                          }),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),                            labelText: 'Email*', hintText: "john.doe@gmail.com"),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),                            labelText: 'Password*', hintText: "********"),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                            labelText: 'Confirm Password*', hintText: "********"),
                        controller: confirmPwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      Text('Select your region',style: TextStyle(color:kText)),
                  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16),
                            child: DropDownFormField(

                              titleText: '',
                              hintText: 'Select your region',
                              value: dropdownValue,
                              onSaved: (value) {
                                setState(() {
                                  dropdownValue = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "🇮🇳,India",
                                  "value": "India",
                                },
                                {
                                  "display": "🇺🇸,USA",
                                  "value": "USA",
                                },
                                {
                                  "display": "🇪🇺,Europe",
                                  "value": "Europe",
                                },
                                {
                                  "display": "󠁧󠁢󠁥🇬🇧,United Kingdom",
                                  "value": "UK",
                                }, {
                                  "display": "🇨🇳,China",
                                  "value": "China",
                                },

                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),

                        ],
                      ),
                      RaisedButton(
                        color: kblue,

                        child: Text("Register",        style: TextStyle(color:kText),),
                        textColor: Colors.white,
                        onPressed: () {
                          usernamecheck();
                          if (_registerFormKey.currentState.validate()||save == true) {
                            if (pwdInputController.text ==
                                confirmPwdInputController.text) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                                  .then((ser) async  { Firestore.instance
                                  .collection("users")
                                  .document(ser.user.uid)
                                  .setData({
                                  "id": ser.user.uid,
                                  "username" : lastNameInputController.text,
                                  "photoUrl": "https://firebasestorage.googleapis.com/v0/b/fashure-app.appspot.com/o/appstore.png?alt=media&token=43d3aa9d-bf8a-4272-b0c5-debb92b291b0",
                                  "email": emailInputController.text,
                                  "displayName": firstNameInputController.text,
                                  "bio": "",
                                  "client": 0 ,
                                  "country":dropdownValue,
                                  "timestamp": timestamp
                                  });
                              bankRef
                                  .document(ser.user.uid)
                                  .setData({

                                "accno":"",
                                "ifsc":"",

                              });
                              // make new user their own follower (to include their posts in their timeline)
                              await followersRef
                                  .document(ser.user.uid)
                                  .collection('userFollowers')
                                  .document(ser.user.uid)
                                  .setData({});

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage(

                                      )),
                                      (_) => false );


                              });
                              //     .then((result) => {
                              //   Navigator.pushAndRemoveUntil(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => HomePage(
                              //             title:
                              //             firstNameInputController
                              //                 .text +
                              //                 "'s Tasks",
                              //             uid: currentUser.uid,
                              //           )),
                              //           (_) => false),
                              //   firstNameInputController.clear(),
                              //   lastNameInputController.clear(),
                              //   emailInputController.clear(),
                              //   pwdInputController.clear(),
                              //   confirmPwdInputController.clear()
                              // })
                              //     .catchError((err) => print(err)))
                              //     .catchError((err) => print(err));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error",style: TextStyle(color:kText),),
                                      content: Text("The passwords do not match",style: TextStyle(color:kText),),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close",style: TextStyle(color:kText),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                      ),
                      Text("Already have an account?",style: TextStyle(color:kText),),
                      FlatButton(
                        child: Text("Login here!",style: TextStyle(color:kText),),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ))));
  }
}