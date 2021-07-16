import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/chat_screen.dart';
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
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:get/get.dart';
import 'package:fashow/Products.dart';
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
  String priceQuery = "1";
  String desQuery = "des0";
  String illQuery = "ill0";
  String stylQuery = "styl0";
  String blogQuery = "blog0";
  String phoQuery = "pho0";
  String modQuery = "mod0";
  String makeQuery = "make0";
  String hairQuery = "hair0";
  String choQuery = "cho0";
  String artQuery = "art0";
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

      query: priceQuery == "low"
          ? FirebaseFirestore.instance
              .collection('users')
          .orderBy('designerrounded',descending: false)
              .where('designer', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
              .collection('users')
          .orderBy('designerrounded',descending: true)

          .where('designer', isEqualTo: true)
          : FirebaseFirestore.instance
              .collection('users')
              .where('designer', isEqualTo: true)
              .where('designerrounded', isGreaterThan: 1),
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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('illustratorrounded',descending: false)
          .where('illustrator', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('illustratorrounded',descending: true)

          .where('illustrator', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('illustrator', isEqualTo: true)
          .where('illustratorrounded', isGreaterThan: 1),
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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('stylistrounded',descending: false)
          .where('stylist', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('stylistrounded',descending: true)

          .where('stylist', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('stylist', isEqualTo: true)
          .where('stylistrounded', isGreaterThan: 1),

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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('bloggerrounded',descending: false)
          .where('blogger', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('bloggerrounded',descending: true)

          .where('blogger', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('blogger', isEqualTo: true)
          .where('bloggerrounded', isGreaterThan: 1),


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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('photographerrounded',descending: false)
          .where('photographer', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('photographerrounded',descending: true)

          .where('photographer', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('photographer', isEqualTo: true)
          .where('photographerrounded', isGreaterThan: 1),

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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('modelrounded',descending: false)
          .where('model', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('modelrounded',descending: true)

          .where('model', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('model', isEqualTo: true)
          .where('modelrounded', isGreaterThan: 1),

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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('makeuprounded',descending: false)
          .where('makeup', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('makeuprounded',descending: true)

          .where('makeup', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('makeup', isEqualTo: true)
          .where('makeuprounded', isGreaterThan: 1),

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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('hairrounded',descending: false)
          .where('hair', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('hairrounded',descending: true)

          .where('hair', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('hair', isEqualTo: true)
          .where('hairrounded', isGreaterThan: 1),


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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('choreographerrounded',descending: false)
          .where('choreographer', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('choreographerrounded',descending: true)

          .where('choreographer', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('choreographer', isEqualTo: true)
          .where('choreographerrounded', isGreaterThan: 1),

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
      query: priceQuery == "low"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('artisanrounded',descending: false)
          .where('artisan', isEqualTo: true)
          :priceQuery == "high"
          ? FirebaseFirestore.instance
          .collection('users')
          .orderBy('artisanrounded',descending: true)

          .where('artisan', isEqualTo: true)
          : FirebaseFirestore.instance
          .collection('users')
          .where('artisan', isEqualTo: true)
          .where('artisanrounded', isGreaterThan: 1),

    );
  }
  all() {
    return InkWell(
      onTap: () {
        priceQuery = "1";
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

        setState(() {});

        Get.back();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
            FittedBox(
                child: Text(
              'All',
            )),
          ],
        ),
      ),
    );
  }
  low() {
    return InkWell(
      onTap: () {
        priceQuery = "low";
        desQuery = "des100";
        illQuery = "ill100";
        stylQuery = "styl100";
        blogQuery = "blog100";
        phoQuery = "pho100";
        modQuery = "mod100";
        makeQuery = "make100";
        hairQuery = "hair100";
        choQuery = "cho100";
 artQuery = "art100";

        setState(() {});

        Get.back();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//    Text(user.followers,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
            FittedBox(
                child: Text(
              'Low to high',
            )),
          ],
        ),
      ),
    );
  }
 high() {
    return InkWell(
      onTap: () {
        priceQuery = "high";
        desQuery = "des100-500";
        illQuery = "ill100-500";
        stylQuery = "styl100-500";
        blogQuery = "blog100-500";
        phoQuery = "pho100-500";
        modQuery = "mod100-500";
        makeQuery = "make100-500";
        hairQuery = "hair100-500";
        choQuery = "cho100-500";
        artQuery = "art100-500";

        setState(() {});

        Get.back();
      },
      child: Container(
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
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
              title: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "FREELANCERS",
                    style: TextStyle(fontSize: 40, fontFamily: 'Halfomania'),
                  )),
              backgroundColor: kPrimaryColor,
              bottom: new TabBar(
                ///filled
                labelStyle: TextStyle(fontFamily: "AlteroDCURegular"),

                ///outline
                unselectedLabelStyle: TextStyle(fontFamily: "AlteroDCU"),
                isScrollable: true,
                controller: _controller,
                tabs: <Widget>[
                  Text(
                    ' Artisans ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ), Text(
                    ' DESIGNER ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' ILLUSTRATOR ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' CONTENT WRITER ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' STYLIST ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' MODEL ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' MAKEUP ARTIST ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' HAIR DRESSER ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' PHOTOGRAPHER ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    ' CHOREOGRAPHER ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              iconTheme: new IconThemeData(color: kSecondaryColor),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      // useRootNavigator:true,

                      barrierDismissible: true,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height:400,
                            child: ExpansionTile(
                                title: Text(""),
                                children: [Column(
                                  children: [
                                    all(),
                                    low(),
                                    high(),

                                  ],
                                ),
                                ]
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ]),
        ),
        body: Container(
          decoration: BoxDecoration(gradient: fabGradient),
          alignment: Alignment.center,
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
 String price;

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
  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  var resultUSD1 = await Currency.getConversion(
      from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.designerAvg  );
setState((){  var c1 = resultUSD1.rate;
price =c1.toStringAsFixed(2);

print(price);
});

}
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
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
                Divider(
                  color: Colors.grey,
                ),
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
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      followerstile(),
                      Client(),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientReview(
                                        profileId: user.id,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          height: 60,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              ),
                              Text(
                                'Rating',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text("Average cost", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 5
                    ),),
                  ],
                ),

                Row(
                  children: [
                    Text("$price" ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 7

                    ),),
                  ],
                ),

                SizedBox(
                  height: 10.0,
                ),
                hireme(),
              ],
            ),
          ),
          Container(
            child: getPost(),
          )
        ],
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
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.illustratorAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.stylistAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
    );
  }
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.bloggerAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.photographerAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.makeupAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.modelAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.hairAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.artisansAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
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

  UserModel receiver;
  String products;
  int client;
 String price;

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
    var resultUSD1 = await Currency.getConversion(
        from: '${user.currencyISO}', to: '${currentUser.currencyISO}', amount: user.choreographerAvg  );
    setState((){  var c1 = resultUSD1.rate;
    price =c1.toStringAsFixed(2);

    print(price);
    });

  }

  getPost() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(user.id)
            .collection('userPosts')
            .snapshots(),

        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('text');
          }
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot docSnapshot = snapshot.data.docs[index];
             List  url = snapshot.data.docs[index]["mediaUrl"];
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(
                                  postId: docSnapshot["postId"],
                                  userId: docSnapshot["ownerId"],
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: url.first,
                          )),
                    ));
              },
            ),
          );
        });
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

  hireme() {
    bool isProfileOwner = currentUserId == user.id;
    if (isProfileOwner == true) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.personOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          receiver: receiver,
                        ))),
            child: Container(
              height: 40.0,
              width: 100.0,
//
              decoration: BoxDecoration(
                  color: kblue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      EvaIcons.emailOutline,
                      color: Colors.white,
                    ),
                    Text(
                      'Hire me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
  followerstile() {
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
            '$followerCount',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
              child: Text(
            'Followers',
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
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
              Divider(
                color: Colors.grey,
              ),
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientReview(
                                      profileId: user.id,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text("Average cost", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 5
                  ),),
                ],
              ),

              Row(
                children: [
                  Text("$price" ,style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 7

                  ),),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),
              hireme(),
            ],
          ),
        ),
        Container(
          child: getPost(),
        )
      ],
    );
  }
}
