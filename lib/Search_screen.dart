import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/page_view/custom_tile.dart';
import 'package:fashow/search_service.dart';
import 'package:fashow/user.dart';
import 'package:fashow/utils/universal_variables.dart';
//import 'package:fashow/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:fashow/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:skype_clone/models/user.dart';
//import 'package:skype_clone/resources/auth_methods.dart';
//import 'package:skype_clone/screens/callscreens/pickup/pickup_layout.dart';
//import 'package:skype_clone/screens/chatscreens/chat_screen.dart';
//import 'package:skype_clone/utils/universal_variables.dart';
//import 'package:skype_clone/widgets/custom_tile.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchMethod _authMethods = SearchMethod();

  List<UserModel> ist;
  String query = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAllUsers();



  }

  fetchAllUsers() async {
    List<UserModel> userList = List<UserModel>();

    QuerySnapshot querySnapshot =
    await usersRef.getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      if (querySnapshot.documents[i].documentID != currentUser.id) {
        userList.add(UserModel.fromMap(querySnapshot.documents[i].data));
      }
    }
    setState(() {
      ist = userList;
      print(ist);
    });

  }

  searchAppBar(BuildContext context) {
    return GradientAppBar(
      gradient: LinearGradient(
        colors: [
          UniversalVariables.gradientColorStart,
          UniversalVariables.gradientColorEnd,
        ],
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              setState(() {
                query = val;
              });
            },
            cursorColor: UniversalVariables.blackColor,
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0x88ffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSuggestions(String query) {
    final List<UserModel> suggestionList = query.isEmpty
        ? []
        :ist != null
        // ignore: missing_return
        ? ist.where((UserModel user) {
      String _getUsername = user.displayName?.toLowerCase();
      String _query = query?.toLowerCase();
      String _getName = user.username?.toLowerCase();
      bool matchesUsername = _getUsername.contains(_query)?? false;
      bool matchesName = _getName.contains(_query);

      return (matchesUsername || matchesName);

//       // ignore: unnecessary_statements
//       user?.username?.toLowerCase()?.contains(query?.toLowerCase()) ?? false||
//
//           user?.displayName?.toLowerCase()?.contains(query?.toLowerCase()) ?? false;
    }).toList()
        : [];

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        UserModel searchedUser = UserModel(
            id: suggestionList[index].id,
            photoUrl: suggestionList[index].photoUrl,
            displayName: suggestionList[index].displayName,
            username: suggestionList[index].username);

        return CustomTile(
          mini: false,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      receiver: searchedUser,
                    )));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.photoUrl),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            searchedUser.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
              searchedUser.displayName,
            style: TextStyle(color: UniversalVariables.greyColor),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
return
     Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        appBar: searchAppBar(context),
        body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: buildSuggestions(query),
        ),

    );
  }
}