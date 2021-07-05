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
import 'package:fashow/chat_screen.dart';

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
    await usersRef.get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.id) {
        userList.add(UserModel.fromMap(querySnapshot.docs[i].data()));
      }
    }
    setState(() {
      ist = userList;
      print(ist);
    });

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
        body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: buildSuggestions(query),
        ),

      );
  }
}