import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Search_screen.dart';
import 'package:fashow/methods/chat_method.dart';
import 'package:fashow/model/contact_model.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/page_view/quiet_box.dart';
import 'package:fashow/page_view/user_circle.dart';
import 'package:fashow/provider/user_provider.dart';
import 'package:fashow/utils/app_bar.dart';
import 'package:fashow/user.dart';
import 'package:fashow/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashow/page_view/contact_view.dart';
import 'package:fashow/page_view/new_chat_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart';
//import 'package:skype_clone/models/contact.dart';
//import 'package:skype_clone/provider/user_provider.dart';
//import 'package:skype_clone/resources/auth_methods.dart';
//import 'package:skype_clone/resources/chat_methods.dart';
//import 'package:skype_clone/screens/callscreens/pickup/pickup_layout.dart';
//import 'package:skype_clone/screens/pageviews/widgets/contact_view.dart';
//import 'package:skype_clone/screens/pageviews/widgets/new_chat_button.dart';
//import 'package:skype_clone/screens/pageviews/widgets/quiet_box.dart';
//import 'package:skype_clone/screens/pageviews/widgets/user_circle.dart';
//import 'package:skype_clone/utils/universal_variables.dart';
//import 'package:skype_clone/utils/utilities.dart';
//import 'package:skype_clone/widgets/appbar.dart';
//import 'package:skype_clone/widgets/custom_tile.dart';

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
//            Navigator.push(context, "/search_screen");
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => SearchScreen(
//                    )));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      ChatListContainer();
//       Scaffold(
////        backgroundColor: UniversalVariables.blackColor,
////        appBar: customAppBar(context),
//        floatingActionButton: NewChatButton(),
//        body:
//
//    );
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


