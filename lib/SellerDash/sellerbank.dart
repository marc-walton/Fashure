import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/user.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fashow/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellerBank extends StatefulWidget {
  final User currentUser;

  const SellerBank({Key key, this.currentUser}) : super(key: key);
  @override
  _SellerBankState createState() => _SellerBankState();
}

class _SellerBankState extends State<SellerBank> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _inProcess = false;
  bool isUploading = false;
  String country;
  String dialcode;
  String bankId;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController taxidcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController accnocontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();
  TextEditingController telephonecontroller = TextEditingController();
AddBank(){

          return
            Container(
              child:          SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          maxLines: null,
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Business name',
                          ),
                          textAlign: TextAlign.start,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Business name is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          maxLines: null,
                          controller: addresscontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Business address',
                          ),
                          textAlign: TextAlign.start,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Business address';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: taxidcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'GST/Tax ID',
                          ),
                          textAlign: TextAlign.start,
                          // validator: (text) {
                          //   if (text == null || text.isEmpty) {
                          //     return 'GST/Tax ID is empty';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Center(
                        child: CountryListPick(
                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: true,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          initialSelection: '+91',
                          onChanged: (CountryCode code) {
                            print(code.name);
                            print(code.code);
                            print(code.dialCode);
                            print(code.flagUri);
                            setState(() {
                              country = code.name;
                              dialcode = code.dialCode;
                            });
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text('$dialcode'),
                          ),
                          SizedBox(width: 5.0,),
                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLines: null,
                              controller: telephonecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                                hintText: 'Mobile number',
                              ),
                              textAlign: TextAlign.start,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Mobile number is empty';
                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: accnocontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'Account Number',
                          ),
                          textAlign: TextAlign.start,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Account Number is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: ifsccontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                            // labelText: 'Full name',labelStyle: TextStyle(color: kText),
                            hintText: 'IFSC code',
                          ),
                          textAlign: TextAlign.start,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'IFSC code is empty';
                            }
                            return null;
                          },
                        ),
                      ),

                      Row(
                        children: [
                          RaisedButton(
                            color: kblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)
                            ),
                            child: Text('Cancel'),
                            onPressed: ()=>Navigator.pop(context),
                          ),
                          SizedBox(width: 5.0,),
                          RaisedButton(
                            color: kblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)
                            ),
                            child: Text('Save'),
                            onPressed: (){SaveBank();
                            },
                          )

                        ],
                      ),


                    ],
                  ),
                ),
              ),

            );


}
SaveBank(){
  bankRef
      .document(widget.currentUser.id)
      .updateData({
    "userId": widget.currentUser.id,
    "username": widget.currentUser.username,
    "photoUrl": widget.currentUser.photoUrl,
    "displayName": widget.currentUser.displayName,
    "businessname":namecontroller.text,
    "taxid":taxidcontroller.text ?? "",
    "businessaddress":addresscontroller.text,
    "accno":accnocontroller.text,
    "ifsc":ifsccontroller.text,
    "phone":telephonecontroller.text,
    "country":country,
    "code":dialcode,
  });
}
Bankdetails(){
 return
        StreamBuilder(
          stream:bankRef
              .document(currentUser.id).snapshots(),
          builder: (context,snapshot){
  String accno =  snapshot.data['accno']  ?? "";
  String ifsc = snapshot.data['ifsc'] ?? "";
  // if(snapshot.data['accno'] == null || snapshot.data['ifsc'] == null){
  // return Container();
  // }

  return Container(
    child:Column(  mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Row(children: [
        Text('Account Number:',style: TextStyle(color: kText),),
        Text("${accno }",style: TextStyle(color: kText),),
      ],),
      Row(children: [
        Text('IFSC:' ,style: TextStyle(color: kText),),
        Text("${ifsc }",style: TextStyle(color: kText),),
      ],)

    ],),
  );
          }

        );
}
  @override
  Widget build(BuildContext context) {
    return

      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Stack(
        children: <Widget>[

            AddBank(),



    (_inProcess)?Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.95,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ):Center()
        ],
    ),
      );
  }
}
