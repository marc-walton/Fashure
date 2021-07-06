import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/chat_screen.dart';
import 'package:fashow/clientreview.dart';
import 'package:fashow/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fashow/edit_profile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:fashow/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashow/post_screen.dart';
import 'package:fashow/Profile.dart';
class Designer extends StatefulWidget {

  @override
  _DesignerState createState() => _DesignerState();
}

class _DesignerState extends State<Designer>  with  TickerProviderStateMixin{


  final List<MyTabs> _tabs = [new MyTabs(title: "Hire Designer",color: kPrimaryColor),
    new MyTabs(title: "Hire Illustrator",color: kPrimaryColor),
    new MyTabs(title: "Hire Stylist",color:kPrimaryColor),
    new MyTabs(title: "Hire Content writer",color:kPrimaryColor),

    new MyTabs(title: "Hire Model",color: kPrimaryColor),
    new MyTabs(title: "Hire Makeup Artist",color: kPrimaryColor),
    new MyTabs(title: "Hire Hair Dresser",color: kPrimaryColor),
    new MyTabs(title: "Hire Photographer",color:kPrimaryColor),
    new MyTabs(title: "Hire Choreographer",color: kPrimaryColor)
  ];
  MyTabs _myHandler ;
  TabController _controller ;
  void initState() {
    super.initState();
    _controller = new TabController(length: 9, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }
  void _handleSelected() {
    setState(() {
      _myHandler= _tabs[_controller.index];
    });
  }

  final String currentUserId = currentUser?.id;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  int followerCount = 0;

  editProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfile(currentUserId: currentUserId)));
  }
  buildPostDesigner() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('designer',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
        } buildPostIllustrator() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('illustrator',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
        }
        buildPostStylist() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('stylist',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
        }
 buildPostBlogger() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('blogger',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
        }

  buildPostPhotographer() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('photographer',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
  }
  buildPostModel() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('model',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
  }
  buildPostMakeup() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('makeup',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
  }
  buildPostHair() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('hair',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
  }
  buildPostChoreographer() {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').where('choreographer',isEqualTo:true).get(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }

          List<DItem> searchResults = [];
          snapshot.data.docs.forEach((doc) {
             Users user = Users.fromDocument(doc);
            DItem searchResult = DItem(user);
            searchResults.add(searchResult);
          });
          return ListView(
            children: searchResults,
          );
        });
  }
        @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(title:  FittedBox(fit:BoxFit.contain,
            child: Text("FREELANCERS",style: TextStyle(fontSize: 40,fontFamily: 'Halfomania'),)),
            backgroundColor: kPrimaryColor,

            bottom: new TabBar(
              ///filled
              labelStyle:TextStyle(fontFamily: "AlteroDCURegular" ),
              ///outline
              unselectedLabelStyle:TextStyle(fontFamily:"AlteroDCU" ),
isScrollable: true,
              controller: _controller,
              tabs: <Widget>[
           Text(' DESIGNER ',style: TextStyle(
               fontWeight: FontWeight.bold,
                fontSize: 30),),
                Text(' ILLUSTRATOR ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                Text(' CONTENT WRITER ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
          Text(' STYLIST ',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30),),

                Text(' MODEL ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                Text(' MAKEUP ARTIST ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                Text(' HAIR DRESSER ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                Text(' PHOTOGRAPHER ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                Text(' CHOREOGRAPHER ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),

              ],
            ),
            iconTheme: new IconThemeData(color: kSecondaryColor),
            actions: <Widget>[


            ]
        ),
      ),
      body:
              Container(  decoration: BoxDecoration(
                  gradient: fabGradient
              ) ,
                alignment: Alignment.center,
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    buildPostDesigner(),
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
          heroTag:'editProfile',

          backgroundColor: Colors.black38,
          onPressed:
              editProfile,

          child: Icon(Icons.add_circle_outline),
        ),
      ),
    );

  }
}
class MyTabs {
  final String title;
  final Color color;
  MyTabs({this.title,this.color});
}

class DItem extends StatefulWidget {
  final Users user;
  UserModel receiver;
  String products;
  DItem(this.user
      );
  @override
  _DItemState createState() => _DItemState(
this.user

  );
}

class _DItemState extends State<DItem> {
  final Users user;
  UserModel receiver;
  String products;
  int followerCount = 0;
  final String currentUserId = currentUser?.id;

  _DItemState(this.user);
  @override
  void initState(){
    super.initState();
    setState(() {
      receiver =UserModel(
        id: user.id,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
      );
    });
    getFollowers();
  }

  getPost(){
    return StreamBuilder(
        stream:  FirebaseFirestore.instance.collection('posts').doc(user.id
        ).collection('userPosts').snapshots(),

        // ignore: missing_return
        builder: (context,snapshot) {
          if(!snapshot.hasData){
            return Text('text');
          }
          return
            Container(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {

                    DocumentSnapshot docSnapshot = snapshot.data.docs[index];
                    return



                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                                onTap: (){
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
                                child: CachedNetworkImage( imageUrl: docSnapshot["mediaUrl"],)
                            ),
                          )
                      );
                  }
              ),
            );




        }
    );
  }
  reviews() {
    StreamBuilder(
      stream:      FirebaseFirestore.instance.collection('Reviews').doc(user.id)
          .collection('userReviews')
          .snapshots(),
      builder: (context,snapshot){
        var rating =   snapshot.data()['rating'];
        var avg = rating.reduce((a,b)=>a+b)/rating.length;
        String review  = snapshot.data['review'];
        return
          GestureDetector(
            onTap: ()=>
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ClientReview(profileId: user.id, ))),
            child: Container(

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
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
                      SizedBox(width: 6.0,),
                      Icon(Icons.favorite,color: Colors.pink,),
                      SizedBox(width: 3.0,),
                      Text(avg ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                    ],
                  ),

                  Text('Rating',style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          );

      },
      // 'rating': rating,
      // 'review':reviewController.text,
    );
  }
  Client(){
    return
    StreamBuilder(
      stream:FirebaseFirestore.instance.collection('users')
          .doc(user.id).snapshots(),
      builder:(context,snapshot){
       int client = snapshot.data['client'];
        return
          Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
                ,borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$client',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                Text('Clients',style: TextStyle(color: Colors.white),),
              ],
            ),
          );
  }
    );
  }
  hireme(){
    bool isProfileOwner = currentUserId == user.id;
    if(isProfileOwner == true){
      return
       Container();
    }
    else{
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children:[
            GestureDetector(

              onTap: () => showProfile(context, profileId: user.id),
              child: Container(

                height: 40.0,
                width: 100.0,
//
                decoration: BoxDecoration(
                    color: kblue,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(EvaIcons.personOutline                ,          color: Colors.white,
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
            onTap: () =>
                Navigator.push(
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
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(EvaIcons.emailOutline,                          color: Colors.white,
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
    QuerySnapshot snapshot = await followersRef
        .doc(user.id)
        .collection('userFollowers')
        .get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });


  }
followerstile(){
    return
  Container(
    decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),]
        ,borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    height: 60,
    width: 60,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$followerCount',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
        FittedBox(child: Text('Followers',style: TextStyle(color: Colors.white),)),
      ],
    ),
  );
}
  @override

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  <Widget> [
              Divider(color: Colors.grey,),
          GestureDetector(
            onTap: () => showProfile(context, profileId: user.id),

                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                  title: Text(user.displayName,style: TextStyle(color: kText),),

                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    followerstile(),
                    Client(),

                    GestureDetector(
                      onTap: () async
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ClientReview(profileId: user.id, )));
                      },

                      child:  Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),]
                            ,borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        height: 60,
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite,color: Colors.pink,),

                            Text('Rating',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              hireme(),

            ],
          ),

        ),
        Container(
          child:  getPost(),
        )

      ],
    );

  }
}




