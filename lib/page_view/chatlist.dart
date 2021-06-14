import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/methods/chat_method.dart';
import 'package:fashow/model/contact_model.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/page_view/quiet_box.dart';
import 'package:fashow/utils/app_bar.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/material.dart';
import 'package:fashow/page_view/contact_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChatListScreen extends StatelessWidget {
  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(

      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {

          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      ChatListContainer();
  }
}

class ChatListContainer extends StatefulWidget {
  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  String id;
  String userDisplayName;
  String userPhotoUrl;
  final ChatMethods _chatMethods = ChatMethods();
  SharedPreferences myPrefs;
  UserModel me;
  @override
  void initState() {
  super.initState();
    // Add code after super
    readLocal();

  }
  readLocal() async {
    myPrefs = await SharedPreferences.getInstance();
    id = myPrefs.getString('id') ?? '';
    userDisplayName = myPrefs.getString('displayName') ?? '';
    userPhotoUrl = myPrefs.getString('photoUrl') ?? '';
//    print(id);
  setState(() {
    me = UserModel(
      id: id,
      displayName: userDisplayName,
      photoUrl: userPhotoUrl,
    );
  });
  }

  @override
  Widget build(BuildContext context) {
//    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _chatMethods.fetchContacts(
            userId: id,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var docList = snapshot.data.documents;

              if (docList.isEmpty) {
                return QuietBox();
              }
              return
                Container(
                  decoration: BoxDecoration(
                      gradient: fabGradient
                  ) ,
                  alignment: Alignment.center,
                  height: 200,

                  child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: docList.length,
                  itemBuilder: (context, index) {
                    Contact contact = Contact.fromMap(docList[index].data);

                    return ContactView(contact);
                  },
              ),
                );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}


// ChatListContainer( {this.user});


