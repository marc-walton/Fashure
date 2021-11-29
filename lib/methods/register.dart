import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/methods/flutter_country_picker.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/types/gf_toast_type.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:getwidget/getwidget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:fashow/Constants.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:smart_select/smart_select.dart';

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
bool loging =false;
  String lang = "en";
String  country = "";
String currency = "Preferred currency";
  String dropTitle = 'Preferred currency';

String currencyISO = "";
String currencysym = "";
String countryISO = "";
  Country _selected;

  bool _passwordVisible = false;

  final DateTime timestamp = DateTime.now();
  // bool save = false;
  List<S2Choice<String>> CURRENCY  = [
    S2Choice<String>(value: 'INR', title: 'INR'),
    S2Choice<String>(value: 'EUR', title: 'EUR'),
    S2Choice<String>(value: 'GBP', title: 'GBP'),
    S2Choice<String>(value: 'USD', title: 'USD'),


  ];
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
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: loging,
        child:Scaffold(

        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Register", style: TextStyle(color:Colors.white),),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: fabGradient
            ) ,
            alignment: Alignment.center,            padding: const EdgeInsets.all(20.0),
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
                            labelText: 'Full Name', hintText: "Full Name"),
                        controller: firstNameInputController,
                        validator: (value) {
                          if (value.length < 3) {
                            return "Please enter a valid name";
                          }
                        },
                      ),
                      // TextFormField(
                      //     style: TextStyle(color:kText),
                      //     decoration: InputDecoration(
                      //         labelStyle:  TextStyle(color:kText),
                      //         hintStyle:  TextStyle(color:kText),                              labelText: 'User Name*', hintText: "unique to you on Fashure "),
                      //     controller: lastNameInputController,
                      //     validator: (value) {
                      //       if (value.length < 3) {
                      //         return "Please enter a valid user name.";
                      //       }
                      //     }),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),                            labelText: 'Email', hintText: "john.doe@gmail.com"),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                          labelText: 'Password', hintText: "", suffixIcon: IconButton(
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
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      TextFormField(
                        style: TextStyle(color:kText),
                        decoration: InputDecoration(
                            labelStyle:  TextStyle(color:kText),
                            hintStyle:  TextStyle(color:kText),
                            labelText: 'Confirm Password', hintText: "Confirm Password",
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
                      ),

                        ),
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
                            child: CountryPicker(
                              dense: false,
                              showFlag: true,  //displays flag, true by default
                              showDialingCode: false, //displays dialing code, false by default
                              showName: true, //displays country name, true by default
                              showCurrency: false, //eg. 'British pound'
                              showCurrencyISO: false, //eg. 'GBP'
                              onChanged: (Country select) {
                                setState(() {
                                  _selected = select;
                                  country = select.name;
                                  // currency = select.currency;
                                  currencyISO = select.currencyISO;
                                  countryISO = select.isoCode;
                                  var format = NumberFormat.simpleCurrency(
                                    name: "${select.currencyISO}", //currencyCode
                                  );
                                  currencysym = format.currencySymbol;
                                });
                              },
                              selectedCountry:_selected,
                            ),
            ),

                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0,8.0),
                        child: GestureDetector(


                          child: ListTile(title: Text('$dropTitle',style:TextStyle(color: Colors.black) ,),
                              trailing:Icon(Icons.arrow_forward_ios_rounded)
                          ),
                          onTap: (){
                            showModalBottomSheet(context: context, builder:(BuildContext context){
return
  Expanded(
    child: ListView(
      children: <Widget>[
        SmartSelect<String>.single(

            title: '$dropTitle',
            value: currency,
            choiceItems: CURRENCY,
            onChange: (state) {
              setState(() => currency = state.value);
              setState(() => dropTitle = state.title);
            }
        ),




      ],
    ),
  );

                            },
                            );
                          }
                          ,
                        ),
                      ),


                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation : 0.1,

                          primary:  Colors.white.withOpacity(0.1), // background
                        ),
                        child: Text("Register",        style: TextStyle(color:Colors.white),),
                        onPressed: () {
                          if(country == ""||currency == "preferred currency"){
                            GFToast(
                              text: "Select your region",
                              duration: Duration(milliseconds: 400),
                              alignment: Alignment.topCenter,
                              textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                              backgroundColor: GFColors.DARK,
                            );}


                      else    if (_registerFormKey.currentState.validate()) {
                            if (pwdInputController.text ==
                                confirmPwdInputController.text) {
                              try {
                                loging = true;
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: pwdInputController.text)
                                    .then((ser) async  { FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(ser.user.uid)
                                    .set({
                                  "id": ser.user.uid,
                                  "username" : firstNameInputController.text,
                                  "photoUrl": "https://firebasestorage.googleapis.com/v0/b/fashure-app.appspot.com/o/appstore.png?alt=media&token=43d3aa9d-bf8a-4272-b0c5-debb92b291b0",
                                  "email": emailInputController.text,
                                  "displayName": firstNameInputController.text,
                                  "bio": "",
                                  "client": 0 ,
                                  "countryISO": countryISO ,

                                  "country":country,
                                  "currency":currency,
                                  "currencyISO":currencyISO,
                                  "currencysym":currencysym,

                                  "timestamp": timestamp,
                                  "language": "en",
                                  "seller": false,
                                  "visits": 0,
                                  "ban": false,
                                  "sales": 0,
                                  "revenue": 0,


                                });
                                bankRef
                                    .doc(ser.user.uid)
                                    .set({

                                  "accno":"",
                                  "ifsc":"",

                                });
                                // make new user their own follower (to include their posts in their timeline)
                                await followersRef
                                    .doc(ser.user.uid)
                                    .collection('userFollowers')
                                    .doc(ser.user.uid)
                                    .set({});

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage(
                                          userid: ser.user.uid,
                                          auth: true,
                                        )),
                                        (_) => false );

                                }).catchError((error){
                                  loging =  false;
                                  GFToast(
                                    text: '${error.message}',
                                    duration: Duration(milliseconds: 400),
                                    alignment: Alignment.topCenter,
                                    textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                                    backgroundColor: GFColors.DARK,
                                  );


                                });
                                loging = false;

                              } on FirebaseAuthException catch(error){
                                loging = false;

                          GFToast(
                          text: '${error.message}',
                          duration: Duration(milliseconds: 400),
                          alignment: Alignment.topCenter,
                          textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                          backgroundColor: GFColors.DARK,
                          );


                              }



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
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error",style: TextStyle(color:kText),),
                                      content: Text("The passwords do not match",style: TextStyle(color:kText),),
                                      actions: <Widget>[
                                       TextButton(
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
                          else {          _registerFormKey.currentState.validate()? Container():
                          GFToast(
                          text: "Fill the required fields " ,
                          duration: Duration(milliseconds: 400),
                          alignment: Alignment.topCenter,
                          textStyle: TextStyle(fontSize: 16, color: GFColors.LIGHT),
                          backgroundColor: GFColors.DARK,
                          );}
                        },
                      ),
                      Text("Already have an account?",style: TextStyle(color:kText),),
                      TextButton(
                        child: Text("Login here!",style: TextStyle(color:kText),),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )))));
  }
}