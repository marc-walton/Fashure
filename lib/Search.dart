import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/model/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/methods/card_user.dart';

import 'package:fashow/model/user_model.dart';
import 'package:fashow/Constants.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
TextEditingController _searchController = TextEditingController();

class SearchU extends StatefulWidget {
  @override
  _SearchUState createState() => _SearchUState();
}

class _SearchUState extends State<SearchU>
    with AutomaticKeepAliveClientMixin<SearchU> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot> searchResultsFuture;
  List<UserResult> searchResults = [];
  handleSearch(String query) {
    Future<QuerySnapshot> users = usersRef
        .where("displayName", isGreaterThanOrEqualTo: query)
        .get();
    setState(() {
      searchResultsFuture = users;
    });
  }

  clearSearch() {
    searchController.clear();
  }
  void initState() {
    super.initState();
    buildSearchResults();
  }
  AppBar buildSearchField() {
    return AppBar(
      backgroundColor:kPrimaryColor,
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
      decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
      alignment: Alignment.center,
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
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            UserResult searchResult = UserResult(user);
            searchResults.add(searchResult);
          });

          return Container(
            decoration: BoxDecoration(
                gradient: fabGradient
            ) ,
            alignment: Alignment.center,
            child: ListView(
              children: searchResults,
            ),
          );
        });
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: buildSearchField(),
      body:
        searchResultsFuture ==null? buildNoContent():buildSearchResults(),
    );

  }
}

class UserResult extends StatelessWidget {
  final Users user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(
                user.displayName,
                style:
                TextStyle(color:kText, fontWeight: FontWeight.bold),
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
// class SearchFeed extends StatefulWidget {
//   @override
//   _SearchFeedState createState() => _SearchFeedState();
// }
//
// class _SearchFeedState extends State<SearchFeed> {
//   @override
//   Widget build(BuildContext context) {
//     return FirestoreSearchScaffold(
//       firestoreCollectionName: 'users',
//       searchBy: 'displayName',
//       dataListFromSnapshot: DataModel().dataListFromSnapshot,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final List<DataModel> dataList = snapshot.data;
//
//           return ListView.builder(
//               itemCount: dataList?.length ?? 0,
//               itemBuilder: (context, index) {
//                 final DataModel data = dataList[index];
//
//                 return GestureDetector(
//                   onTap: () => showProfile(context, profileId: data?.id),
//                   child: Container(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('${data?.name ?? ''}'),
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var title = Users.fromDocument(tripSnapshot).displayName.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    final uid = currentUser.id;
    var data = await FirebaseFirestore.instance
        .collection('users')
        // .doc(uid)
        // .collection('trips')
        // .where("endDate", isLessThanOrEqualTo: DateTime.now())
        // .orderBy('endDate')
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }
  clearSearch() {
    _searchController.clear();
  }
  AppBar buildSearchField() {
    return AppBar(
      backgroundColor:kPrimaryColor,
      title: TextFormField(
        style:  TextStyle(color: Colors.white),
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          hintStyle: TextStyle(color: Colors.white),

          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear,
                color: Colors.white),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    tags.shuffle();
    return Scaffold(
      appBar: buildSearchField(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child:
       tags.isEmpty? ListView.builder(
          itemCount: _resultsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildCard(context, _resultsList[index]),
        ):_searchController.text ==""? Container(
         height:MediaQuery.of(context).size.height,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
              itemCount: tags.length,
              itemBuilder:( context,index){
                return LazyLoadingList( child: ListView(children: [tags[index]],), index: index,);
              } ),
        ):ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCard(context, _resultsList[index]),
                )

            ),
          ],
        ),
      ),
    );
  }
}
