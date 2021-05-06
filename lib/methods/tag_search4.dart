import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashow/ActivityFeed.dart';
class TagSearch4 extends StatefulWidget {
  @override
  _TagSearch4State createState() => _TagSearch4State();
}

class _TagSearch4State extends State<TagSearch4>
    with AutomaticKeepAliveClientMixin<TagSearch4> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot> searchResultsFuture;


  handleSearch(String query) {
    Future<QuerySnapshot> users = usersRef
        .where("displayName", isGreaterThanOrEqualTo: query)
        .getDocuments();
    setState(() {
      searchResultsFuture = users;
    });
  }

  clearSearch() {
    searchController.clear();
  }

  AppBar buildSearchField() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: clearSearch,
          ),
        ),
        onFieldSubmitted: handleSearch,
      ),
    );
  }

  Container buildNoContent() {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SvgPicture.asset(
              'assets/img/SEARCH.svg',
              height:orientation == Orientation.portrait ? 300.0 : 150.0,
            ),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildSearchResults() {
    return FutureBuilder(
        future: searchResultsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          List<UserResult> searchResults = [];
          snapshot.data.documents.forEach((doc) {
            User user = User.fromDocument(doc);
            UserResult searchResult = UserResult(user);
            searchResults.add(searchResult);
          });
          return  ListView(
            shrinkWrap: true,
            children: searchResults,
          );
        });
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      shrinkWrap: true,
      children: [
        TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search for a user...",
            hintStyle:  TextStyle(color: kText),
            filled: true,
            prefixIcon: Icon(
              Icons.account_box,
              size: 28.0,
              color: kText,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: clearSearch,
            ),
          ),
          onFieldSubmitted: handleSearch,
        ),
        searchResultsFuture == null ? buildNoContent() : buildSearchResults(),
//        Scaffold(
//          backgroundColor: kSecondaryColor,
//          appBar: buildSearchField(),
//          body:
//          searchResultsFuture == null ? buildNoContent() : buildSearchResults(),
//        ),
      ],
    );
  }
}

class UserResult extends StatelessWidget {
  final User user;

  UserResult(this.user);

  SharedPreferences tag4Prefs;


  @override
  Widget build(BuildContext context) {
    return  Container(
        color: kSecondaryColor,
        child: Column(
        children: <Widget>[
        InkWell(
        onTap: (){

      print(user.id);

      showModalBottomSheet(
          backgroundColor:kSecondaryColor,
        context:context,
        builder: (BuildContext context){
          return
            Column(
                children: [
              StreamBuilder(
                  stream: productsRef
                      .document(user.id)
                      .collection('userProducts')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
//       ignore: missing_return
                  builder:(context,snapshot) {

                    return
                      GridView.builder(
                          primary: false,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 3 : 3),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot docSnapshot = snapshot.data.documents[index];
                            return

                              Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: GestureDetector(
                                        onTap: () async {
                                          print(docSnapshot['prodID']);
                                          Fluttertoast.showToast(
                                              msg: "Product Tag added!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIos: 1,
                                              backgroundColor:  Colors.black38,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                          tag4Prefs = await SharedPreferences.getInstance();
                                          await tag4Prefs.setString('prodId4',docSnapshot['prodId']);
                                          await tag4Prefs.setString('ownerId4',docSnapshot['ownerId']);
                                          await tag4Prefs.setString('productname4',docSnapshot['productname']);
                                          await tag4Prefs.setString('price4',docSnapshot['price']);
                                          await tag4Prefs.setString('shopmediaUrl4',docSnapshot['shopmediaUrl']);
                                          await tag4Prefs.setString('displayName4', docSnapshot['displayName']);
                                          await tag4Prefs.setString('photoUrl4', docSnapshot['photoUrl']);
                                          Navigator.pop(context);
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: docSnapshot["shopmediaUrl"],)
                                    ),
                                  )
                              );
                          });
                  }

              ),
                ],
            );
        }
      );
        },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(
                user.displayName,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                user.username,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}