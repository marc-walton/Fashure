//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:fashow/user.dart';
//import 'package:flutter/material.dart';
//import 'package:html_editor/html_editor.dart';
//class edit extends StatefulWidget {
//  final Users currentUser;
//
//  const edit({Key key, this.currentUser}) : super(key: key);
//
//
//  @override
//  _editState createState() => _editState();
//}
//
//class _editState extends State<edit> {
//  GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
//  String result = "";
//  String e;
//upload(){
//  FirebaseFirestore.instance.collection("bl").doc(e).set({"cone": result});
//}
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('fed'),
//        elevation: 0,
//      ),
//      backgroundColor: Colors.white,
//      body: Padding(
//        padding: const EdgeInsets.all(20),
//        child: SingleChildScrollView(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              HtmlEditor(
//                hint: "Your text here...",
//                //value: "text content initial, if any",
//                key: keyEditor,
//                height: 400,
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    FlatButton(
//                      color: Colors.blueGrey,
//                      onPressed: (){
//                        setState(() {
//                          keyEditor.currentState.setEmpty();
//                        });
//                      },
//                      child: Text("Reset", style: TextStyle(color: Colors.white)),
//                    ),
//                    SizedBox(width: 16,),
//                    FlatButton(
//                      color: Colors.blue,
//                      onPressed: () async {
//                        final txt = await keyEditor.currentState.getText();
//                        setState(() {
//                          result = txt;
//                          upload();
//                        });
//                      },
//                      child: Text("Submit", style: TextStyle(color: Colors.white),),
//                    ),
//                  ],
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(result),
//              )
//            ],
//          ),
//        ),
//      ),
//      // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
