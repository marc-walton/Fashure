import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Timeline.dart';
import 'package:fashow/chat_screen.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/clientreview.dart';
import 'package:fashow/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/flutter_currencies_tracker.dart';
import 'package:get/get.dart';
import 'package:fashow/edit_profile.dart';
import 'package:fashow/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashow/post_screen.dart';
import 'package:fashow/Profile.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fashow/enum/Variables.dart';

class Designer extends StatefulWidget {
  @override
  _DesignerState createState() => _DesignerState();
}

class _DesignerState extends State<Designer> with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    new MyTabs(title: "Hire Designer", color: kPrimaryColor),
    new MyTabs(title: "Hire Illustrator", color: kPrimaryColor),
    new MyTabs(title: "Hire Stylist", color: kPrimaryColor),
    new MyTabs(title: "Hire Content writer", color: kPrimaryColor),
    new MyTabs(title: "Hire Model", color: kPrimaryColor),
    new MyTabs(title: "Hire Makeup Artist", color: kPrimaryColor),
    new MyTabs(title: "Hire Hair Dresser", color: kPrimaryColor),
    new MyTabs(title: "Hire Photographer", color: kPrimaryColor),
    new MyTabs(title: "Hire Choreographer", color: kPrimaryColor)
  ];
  MyTabs _myHandler;
  TabController _controller;

  void initState() {
    super.initState();
    _controller = new TabController(length: 10, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  final String currentUserId = currentUser?.id;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  int followerCount = 0;

  int value = 0;
  editProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfile(currentUserId: currentUserId)));
  }

  designer() {
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("No designers found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(desQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<DItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        DItem searchResult = DItem(user);
        searchResults.add(searchResult);

        return Expanded(
          child: Column(
            children: searchResults,
          ),
        );
      },
        query: priceQuery == "low"?
        FirebaseFirestore.instance
            .collection('users')
            .orderBy('designerUsd',descending: false)
            .where('designer', isEqualTo: true)
            :
        priceQuery == "high"?
        FirebaseFirestore.instance
            .collection('users')
            .orderBy('designerUsd',descending: true)
            .where('designer', isEqualTo: true)
            :priceQuery == "0D"?
        FirebaseFirestore.instance
            .collection('users')
            .where('designer', isEqualTo: true)
            .where('country',isEqualTo: '${currentUser.country}')
            :priceQuery == "lowD"?
        FirebaseFirestore.instance
            .collection('users')
            .orderBy('designerUsd',descending: false)
            .where('designer', isEqualTo: true)
            .where('country',isEqualTo: '${currentUser.country}')

            :priceQuery == "highD"?
        FirebaseFirestore.instance
            .collection('users')
            .orderBy('designerUsd',descending: true)
            .where('designer', isEqualTo: true)
            .where('country',isEqualTo: '${currentUser.country}')

            :
        FirebaseFirestore.instance
            .collection('users')
            .where('designer', isEqualTo: true)
            .where('designerUsd', isGreaterThan: 1),


    );
  }
  buildPostIllustrator() {
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("No illustrator found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(illQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<IItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        IItem searchResult = IItem(user);
        searchResults.add(searchResult);

        return Expanded(
          child: Column(
            children: searchResults,
          ),
        );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('illustratorUsd',descending: false)
          .where('illustrator', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('illustratorUsd',descending: true)
          .where('illustrator', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('illustrator', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('illustratorUsd',descending: false)
          .where('illustrator', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('illustratorUsd',descending: true)
          .where('illustrator', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('illustrator', isEqualTo: true)
          .where('illustratorUsd', isGreaterThan: 1),



    );
  }

  buildPostStylist() {
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("No stylist found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
        key:ValueKey<String>(stylQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<SItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        SItem searchResult = SItem(user);
        searchResults.add(searchResult);

        return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('stylistUsd',descending: false)
          .where('stylist', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('stylistUsd',descending: true)
          .where('stylist', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('stylist', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('stylistUsd',descending: false)
          .where('stylist', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('stylistUsd',descending: true)
          .where('stylist', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('stylist', isEqualTo: true)
          .where('stylistUsd', isGreaterThan: 1),


    );
  }
  buildPostBlogger() {
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("No content writer found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
        key:ValueKey<String>(blogQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<BItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        BItem searchResult = BItem(user);
        searchResults.add(searchResult);

        return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('bloggerUsd',descending: false)
          .where('blogger', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('bloggerUsd',descending: true)
          .where('blogger', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('blogger', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('bloggerUsd',descending: false)
          .where('blogger', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('bloggerUsd',descending: true)
          .where('blogger', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('blogger', isEqualTo: true)
          .where('bloggerUsd', isGreaterThan: 1),

    );
  }
  buildPostPhotographer() {
    return PaginateFirestore(
      emptyDisplay:Center(child: Text("No photographer found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(phoQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<PItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        PItem searchResult = PItem(user);
        searchResults.add(searchResult);

        return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );
      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('photographerUsd',descending: false)
          .where('photographer', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('photographerUsd',descending: true)
          .where('photographer', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('photographer', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('photographerUsd',descending: false)
          .where('photographer', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('photographerUsd',descending: true)
          .where('photographer', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('photographer', isEqualTo: true)
          .where('photographerUsd', isGreaterThan: 1),

    );
  }
  buildPostModel() {
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("No model found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(modQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<MItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        MItem searchResult = MItem(user);
        searchResults.add(searchResult);

             return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );

      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('modelUsd',descending: false)
          .where('model', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('modelUsd',descending: true)
          .where('model', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('model', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('modelUsd',descending: false)
          .where('model', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('modelUsd',descending: true)
          .where('model', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('model', isEqualTo: true)
          .where('modelUsd', isGreaterThan: 1),


    );
  }
  buildPostMakeup() {
    return PaginateFirestore(
      emptyDisplay: Center(child: Text("No makeup artist found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(makeQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<MAItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        MAItem searchResult = MAItem(user);
        searchResults.add(searchResult);

             return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );

      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('makeupUsd',descending: false)
          .where('makeup', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('makeupUsd',descending: true)
          .where('makeup', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('makeup', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('makeupUsd',descending: false)
          .where('makeup', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('makeupUsd',descending: true)
          .where('makeup', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('makeup', isEqualTo: true)
          .where('makeupUsd', isGreaterThan: 1),


    );
  }
  buildPostHair() {
    return PaginateFirestore(
      emptyDisplay: Center(child:Text("No hairdressser found",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),)),
        key:ValueKey<String>(hairQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<HItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        HItem searchResult = HItem(user);
        searchResults.add(searchResult);

             return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );

      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('hairUsd',descending: false)
          .where('hair', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('hairUsd',descending: true)
          .where('hair', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('hair', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('hairUsd',descending: false)
          .where('hair', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('hairUsd',descending: true)
          .where('hair', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('hair', isEqualTo: true)
          .where('hairUsd', isGreaterThan: 1),



    );
  }
  buildPostChoreographer() {
    return PaginateFirestore(
      emptyDisplay: Center(child:Text("No choreographer found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
     key:ValueKey<String>(choQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<CItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        CItem searchResult = CItem(user);
        searchResults.add(searchResult);

             return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );

      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('choreographerUsd',descending: false)
          .where('choreographer', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('choreographerUsd',descending: true)
          .where('choreographer', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('choreographer', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('choreographerUsd',descending: false)
          .where('choreographer', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('choreographerUsd',descending: true)
          .where('choreographer', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('choreographer', isEqualTo: true)
          .where('choreographerUsd', isGreaterThan: 1),


    );
  }
 buildPostArtisans() {
    return PaginateFirestore(
      emptyDisplay: Center(child:Text("No artisans found",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),)),
      key:ValueKey<String>(artQuery),
      isLive: true,
      itemBuilderType: PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot) {
        List<AItem> searchResults = [];

        Users user = Users.fromDocument(documentSnapshot);
        AItem searchResult = AItem(user);
        searchResults.add(searchResult);

             return Expanded(
          child:  Column(
            children: searchResults,
          ),
        );

      },
      query: priceQuery == "low"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('artisanUsd',descending: false)
          .where('artisan', isEqualTo: true)
          :
      priceQuery == "high"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('artisanUsd',descending: true)
          .where('artisan', isEqualTo: true)
          :priceQuery == "0D"?
      FirebaseFirestore.instance
          .collection('users')
          .where('artisan', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')
          :priceQuery == "lowD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('artisanUsd',descending: false)
          .where('artisan', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :priceQuery == "highD"?
      FirebaseFirestore.instance
          .collection('users')
          .orderBy('artisanUsd',descending: true)
          .where('artisan', isEqualTo: true)
          .where('country',isEqualTo: '${currentUser.country}')

          :
      FirebaseFirestore.instance
          .collection('users')
          .where('artisan', isEqualTo: true)
          .where('artisanUsd', isGreaterThan: 1),

    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/9),
          child: AppBar(
              title: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Freelancers",
                    style: TextStyle( fontFamily: 'MajorMonoDisplay'),
                  )),
              backgroundColor: kPrimaryColor,
              bottom: new TabBar(
                ///filled
                labelStyle: TextStyle(fontFamily: "AlteroDCURegular",fontWeight: FontWeight.bold, ),

                ///outline
                unselectedLabelStyle: TextStyle(fontFamily: "AlteroDCU"),
                isScrollable: true,
                indicatorWeight: 0.1,
                controller: _controller,
                tabs: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' Artisans ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' DESIGNER ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' ILLUSTRATOR ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' CONTENT WRITER ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' STYLIST ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' MODEL ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' MAKEUP ARTIST ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' HAIR DRESSER ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' PHOTOGRAPHER ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' CHOREOGRAPHER ',
                      style: TextStyle( fontSize: 15),
                    ),
                  ),
                ],
              ),
              iconTheme: new IconThemeData(color: kSecondaryColor),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.filter_alt_outlined),
                    onPressed: (){

                      showDialog<void>(
                      context: context,
                      // useRootNavigator:true,

                      barrierDismissible: true,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return Builder(builder: (BuildContext context) {
                          return StatefulBuilder(builder: (BuildContext context, State){
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(

                                height:400,
                                child: Column(
                                  children: [
                                    ExpansionTile(
                                        title: Text("Sort by price"),
                                        children: [Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                State((){});
                                                priceQuery = "0";
                                                desQuery = "des0";
                                                illQuery = "ill0";
                                                stylQuery = "styl0";
                                                blogQuery = "blog0";
                                                phoQuery = "pho0";
                                                modQuery = "mod0";
                                                makeQuery = "make0";
                                                hairQuery = "hair0";
                                                choQuery = "cho0";
                                                artQuery = "art0";

                                              },
                                              child: Container(
                                                color: priceQuery == "0"||priceQuery == "0D"?Colors.pink.shade50:Colors.white,

                                                height: 50,
                                                width: MediaQuery.of(context).size.width,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                        child: Text(
                                                          'All',
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                State((){});

                                                priceQuery = "low";
                                                desQuery = "deslow";
                                                illQuery = "illlow";
                                                stylQuery = "styllow";
                                                blogQuery = "bloglow";
                                                phoQuery = "pholow";
                                                modQuery = "modlow";
                                                makeQuery = "makelow";
                                                hairQuery = "hairlow";
                                                choQuery = "cholow";
                                                artQuery = "artlow";

                                              },
                                              child: Container(
                                                color: priceQuery == "low"||priceQuery == "lowD"?Colors.pink.shade50:Colors.white,

                                                height: 50,
                                                width: MediaQuery.of(context).size.width,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                        child: Text(
                                                          'Low to high',
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                State((){});

                                                priceQuery = "high";
                                                desQuery = "deshigh";
                                                illQuery = "illhigh";
                                                stylQuery = "stylhigh";
                                                blogQuery = "bloghigh";
                                                phoQuery = "phohigh";
                                                modQuery = "modhigh";
                                                makeQuery = "makehigh";
                                                hairQuery = "hairhigh";
                                                choQuery = "chohigh";
                                                artQuery = "arthigh";

                                              },
                                              child: Container(
                                                color: priceQuery == "high"||priceQuery == "highD"?Colors.pink.shade50:Colors.white,

                                                height: 50,
                                                width: MediaQuery.of(context).size.width,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                        child: Text(
                                                          'High to low',
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                        ]
                                    ),
                                    ExpansionTile(
                                        title: Text("Avoid Duties & Taxes"),
                                        children: [Column(
                                          children: [
                                            Text("(Shop within your country)"),
                                            GFToggle(
                                              onChanged: (val){
                                                setState(() {
                                                  duties = val;
                                                });
                                              },
                                              value: duties,
                                              type: GFToggleType.custom,
                                            ),
                                          ],
                                        ),
                                        ]
                                    ),
                                    FloatingActionButton.extended(onPressed: (){
                                      duties? setState((){
                                        priceQuery = priceQuery.replaceAll("D","");
                                         desQuery = desQuery.replaceAll("D","");
                                         illQuery = illQuery.replaceAll("D","");
                                         stylQuery = stylQuery.replaceAll("D","");
                                         blogQuery = blogQuery.replaceAll("D","");
                                         phoQuery = phoQuery.replaceAll("D","");
                                         modQuery = modQuery.replaceAll("D","");
                                         makeQuery = makeQuery.replaceAll("D","");
                                         hairQuery = hairQuery.replaceAll("D","");
                                         choQuery = choQuery.replaceAll("D","");
                                         artQuery = artQuery.replaceAll("D","");

                                        priceQuery = priceQuery + "D";
                                      desQuery = desQuery + "D";
                                      illQuery = illQuery + "D";
                                      stylQuery = stylQuery + "D";
                                      blogQuery = blogQuery + "D";
                                      phoQuery = phoQuery + "D";
                                      modQuery = modQuery + "D";
                                      makeQuery = makeQuery + "D";
                                      hairQuery = hairQuery + "D";
                                      choQuery = choQuery + "D";
                                      artQuery = artQuery + "D";



                                      }):
                                      setState((){
                                        priceQuery = priceQuery.replaceAll("D","");
                                        desQuery = desQuery.replaceAll("D","");
                                        illQuery = illQuery.replaceAll("D","");
                                        stylQuery = stylQuery.replaceAll("D","");
                                        blogQuery = blogQuery.replaceAll("D","");
                                        phoQuery = phoQuery.replaceAll("D","");
                                        modQuery = modQuery.replaceAll("D","");
                                        makeQuery = makeQuery.replaceAll("D","");
                                        hairQuery = hairQuery.replaceAll("D","");
                                        choQuery = choQuery.replaceAll("D","");
                                        artQuery = artQuery.replaceAll("D","");

                                      });
Get.back();
                                    }, label: Text("Apply"))
                                  ],
                                ),
                              ),
                            );
                          });
                        });
                      },
                    );},
                  ),
                )
              ]),
        ),
        body: Container(
      
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              buildPostArtisans(),
              designer(),
              buildPostIllustrator(),
              buildPostBlogger(),
              buildPostStylist(),
              buildPostModel(),
              buildPostMakeup(),
              buildPostHair(),
              buildPostPhotographer(),
              buildPostChoreographer(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'editProfile',
          backgroundColor: Colors.black38,
          onPressed: editProfile,
          child: Icon(Icons.add_circle_outline),
        ),
      ),
    );
  }
}

class MyTabs {
  final String title;
  final Color color;
  MyTabs({this.title, this.color});
}


class BItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  BItem(this.user);
  @override
  _BItemState createState() => _BItemState(this.user);
}
class _BItemState extends State<BItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _BItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.bloggerInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.bloggerEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.bloggerGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.bloggerUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }


  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing: Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class DItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  DItem(this.user);
  @override
  _DItemState createState() => _DItemState(this.user);
}
class _DItemState extends State<DItem> {
  final Users user;

  UserModel receiver;
  String products;
  int client;
  var price = 0.0;
  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _DItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
    reviews();
  }


  reviews() {
    return
      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Reviews')
            .doc(user.id)
            .collection('userReviews')
            .snapshots(),
        builder: (context, snapshot) {
          var rating = snapshot.data()['rating'];
          List mean = rating.toList();
          print(mean);
          var avg = mean.reduce((a, b) => a + b) / mean.length;
          print(avg);

          String review = snapshot.data['review'];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClientReview(
                      profileId: user.id,
                    ))),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kblue,
                boxShadow: [BoxShadow(color: kblue)],
              ),
              height: 60,
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        avg,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$avg',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
        // 'rating': rating,
        // 'review':reviewController.text,
      );
  }


  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  getFollowers() async {
    QuerySnapshot snapshot =
    await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.designerInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.designerEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.designerGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.designerUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                         Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  IItem(this.user);
  @override
  _IItemState createState() => _IItemState(this.user);
}
class _IItemState extends State<IItem> {
  final Users user;

  UserModel receiver;
  String products;
  int client;
  var price = 0.0;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _IItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.illustratorInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.illustratorEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.illustratorGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.illustratorUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                    profileId: user.id,
                  ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
    await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                         Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  SItem(this.user);
  @override
  _SItemState createState() => _SItemState(this.user);
}
class _SItemState extends State<SItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _SItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.stylistInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.stylistEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.stylistGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.stylistUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }
  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                    profileId: user.id,
                  ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
    await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                         Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class PItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  PItem(this.user);
  @override
  _PItemState createState() => _PItemState(this.user);
}
class _PItemState extends State<PItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _PItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.photographerInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.photographerEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.photographerGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.photographerUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                          Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MAItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  MAItem(this.user);
  @override
  _MAItemState createState() => _MAItemState(this.user);
}
class _MAItemState extends State<MAItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _MAItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.makeupInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.makeupEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.makeupGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.makeupUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                          Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  MItem(this.user);
  @override
  _MItemState createState() => _MItemState(this.user);
}
class _MItemState extends State<MItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _MItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.modelInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.modelEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.modelGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.modelUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }


  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                          Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  HItem(this.user);
  @override
  _HItemState createState() => _HItemState(this.user);
}
class _HItemState extends State<HItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _HItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.hairInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.hairEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.hairGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.hairUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                          Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  AItem(this.user);
  @override
  _AItemState createState() => _AItemState(this.user);
}
class _AItemState extends State<AItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _AItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.artisansInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.artisansEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.artisansGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.artisansUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }



  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                       
                        Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  CItem(this.user);
  @override
  _CItemState createState() => _CItemState(this.user);
}
class _CItemState extends State<CItem> {
  final Users user;
  var price = 0.0;

  UserModel receiver;
  String products;
  int client;

  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _CItemState(this.user);
  @override
  void initState() {
    super.initState();
    setState(() {
      receiver = UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    conversion();
    getFollowers();
    g();
  }
  conversion()async{
    var convertor;

    if(currentUser.currency == "INR") {
      convertor = user.choreographerInr.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "EUR") {
      convertor = user.choreographerEur.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }
    if(currentUser.currency == "GBP") {
      convertor = user.choreographerGbp.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }

    else {
      convertor = user.choreographerUsd.toStringAsFixed(2);
      price = double.tryParse(convertor);
    }


  }

  hireMe() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {

      return
        FloatingActionButton(
          backgroundColor:Colors.white.withOpacity(0.5),
          mini:true,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    receiver: receiver,
                  ))),
          child:  Icon(
            EvaIcons.emailOutline,
            color: Colors.black,
          ),

        );
    }
  }

  reviews() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Reviews')
          .doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context, snapshot) {
        var rating = snapshot.data()['rating'];
        var avg = rating.reduce((a, b) => a + b) / rating.length;
        String review = snapshot.data['review'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientReview(
                        profileId: user.id,
                      ))),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kblue,
              boxShadow: [BoxShadow(color: kblue)],
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      avg,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }

  Client() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${client}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            'clients',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  g() async {
    DocumentSnapshot doc = await usersRef.doc(user.id).get();
    Users ser = Users.fromDocument(doc);
    setState(() {
      client = ser.client;
    });
  }


  getFollowers() async {
    QuerySnapshot snapshot =
        await followersRef.doc(user.id).collection('userFollowers').get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                margin:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          user.displayName,
                          style: TextStyle(color: kText),
                        ),
                        subtitle:Text(
                          user.country,
                          style: TextStyle(color: kText),
                        ),
                        trailing:                          Column(children:[
                            currentUser.currency == "INR"?
                          Text( "${cf.format(price, CurrencyFormatter.inr)}",style: TextStyle(color: kText,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "EUR"?
                          Text( "${cf.format(price, CurrencyFormatter.eur)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)):
                          currentUser.currency == "GBP"?
                          Text( "${cf.format(price, CurrencyFormatter.gbp)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold))
                              :   Text( "${cf.format(price, CurrencyFormatter.usd)}",style: TextStyle(color: kText,
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
                              fontWeight: FontWeight.bold)),
                          Text("Average cost", style: TextStyle(
                            color: Colors.grey,
                          ),),

                        ]),


                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            followerTile(followerCount),
                            clients(client),
                            VerticalDivider(),
                            Column(children:[
                              hireMe(),
                              SizedBox(
                                height: 10.0,
                              ),

                              InkWell(
                                onTap:() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientReview(
                                            profileId: user.id,
                                          )));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      color:  Colors.grey,
                                    ),
                                    Text("Reviews",style:TextStyle(color:Colors.grey)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color:  Colors.black,
                                    ),



                                  ],
                                ),
                              ),
                            ]),

                          ],
                        ),
                      ),
                    ),




                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height/4 ,
                child: getPost(user.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}
followerTile(followerCount) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$followerCount',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        FittedBox(
            child: Text(
              'Followers',
              style: TextStyle(color: Colors.grey),
            )),
      ],
    ),
  );
}
clients(client) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${client}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'clients',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
getPost(id){
  return  PaginateView(
    child: PaginateFirestore(
        itemBuilderType:
        PaginateBuilderType.listView,
        scrollDirection: Axis.horizontal,//Change types accordingly
        itemBuilder: (index, context, documentSnapshot) {
          List  url =documentSnapshot.data()["mediaUrl"];

          return    Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(
                          postId: documentSnapshot.data()["postId"],
                          userId: documentSnapshot.data()["ownerId"],
                        ),
                      ),
                    );
                  },
                  child: CachedImage(
                    url.first,


                  )
              ),
            ),
          );


        },


        query: postsRef
            .doc(id)
            .collection('userPosts')
            .orderBy('timestamp', descending: true)

    ),
  );

}
