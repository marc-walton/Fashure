import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fashow/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:translated_text/translated_text.dart';
class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String username;
  String country;
  bool save = false;
  String dropdownValue ;
  void initState() {
    super.initState();
    alert(
      context,
      title: TranslatedText('This is still in beta',to:'${currentUser.language}'),
      content: TranslatedText('The final version of the app with more features and better user-interface will be released soon.Meanwhile feel free to contact us at fashure.business@gmail.com',to:'${currentUser.language}'),
      textOK: TranslatedText('OK',to:'${currentUser.language}'),
    );
  }

  usernamecheck({String name})async{
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('namelow',isEqualTo:name.toLowerCase())
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    print(documents.length);
    if(documents.length > 0){
      alert(
        context,
        title: TranslatedText('Username already taken',to:'${currentUser.language}'),
        content: TranslatedText('Please choose another user name',to:'${currentUser.language}'),
        textOK: TranslatedText('OK',to:'${currentUser.language}'),
      );
    }
    else{
      alert(
        context,
        title: TranslatedText('Username is not taken',to:'${currentUser.language}'),
        content: TranslatedText('Please choose another user name',to:'${currentUser.language}'),
        textOK: TranslatedText('OK',to:'${currentUser.language}'),
      );
    }

  }
  _saveForm() {


    Navigator.pop(context,dropdownValue);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(

            )),
           );


  }

  submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      usernamecheck(name:username);
if(save == true){
  SnackBar snackbar = SnackBar(
    content: TranslatedText("Welcome $username!",to:'${currentUser.language}'),
    // Text("Welcome $username!"),

  );
  _scaffoldKey.currentState.showSnackBar(snackbar);
  Navigator.pop(context,username);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => Homepage(

          )),
          (_) => false );

}

    }
  }

  @override
  Widget build(BuildContext parentContext) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,

          title: FittedBox(
            fit: BoxFit.contain,
            child:TranslatedText('Select region',to:'${currentUser.language}',textStyle:TextStyle(
                color: Colors.white),),),),
        body: Container( decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
          Center(
            child: Form(
              key: _formKey,
              child:                   Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  TranslatedText('Select region',to:'${currentUser.language}',textStyle:TextStyle(
                    color: kText),
                  ),



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
                          },
                          {
                            "display": "󠁧󠁢󠁥Rest of the World",
                            "value": "Rest",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                    FloatingActionButton.extended(
                      heroTag:'save',
                      backgroundColor: kblue,
                      onPressed: (){_saveForm();
                      },

                      label: TranslatedText('Sign up',to:'${currentUser.language}',textStyle:TextStyle(
                          color: Colors.white),),
                    ),
                  ],
                ),
              ),

            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}