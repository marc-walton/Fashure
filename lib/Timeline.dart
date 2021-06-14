import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/CollectionsUplaod.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/upload_editorial.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/post.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/comments.dart';
import 'package:fashow/user.dart';
import 'package:fashow/Search.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fashow/Profile.dart';
import 'package:fashow/upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:get/get.dart';
final CollectionReference usersRef = Firestore.instance.collection('users');

  class Timeline extends StatefulWidget {
    // final String postId;
    // final String ownerId;
    // final String username;
    // final String location;
    // final String description;
    // final String mediaUrl;
    // final dynamic likes;


    final User currentUser;

    Timeline({this.currentUser,
    // this.postId,
    //   this.ownerId,
    //   this.username,
    //   this.location,
    //   this.description,
    //   this.mediaUrl,
    //   this.likes,
    });
    int getLikeCount(likes) {
      //if no likesm return 0
      if (likes == null) {
        return 0;
      }
      int count = 0;
      // if the key is explicitly set to true, add a like
      likes.values.forEach((val) {
        if (val == true) {
          count += 1;
        }
      });
      return count;
    }

    @override
    _TimelineState createState() => _TimelineState(
      // postId: this.postId,
      // ownerId: this.ownerId,
      // username: this.username,
      // location: this.location,
      // description: this.description,
      // mediaUrl: this.mediaUrl,
      // likes: this.likes,
      // likeCount: getLikeCount(this.likes),
    );

  }

  class _TimelineState extends State<Timeline>
      with SingleTickerProviderStateMixin {
TabController _tabController;
    List<Post> posts;
    List<String> foollowingList = [];

   List timelinePosts = [];

    @override
    void initState() {
      super.initState();
      getFfollowing();


      _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
      _tabController.addListener(_handleTabIndex);
    }

    @override
    void dispose() {
      _tabController.removeListener(_handleTabIndex);
      _tabController.dispose();
      super.dispose();
    }

    void _handleTabIndex() {
      setState(() {});
    }

    List <Post>Posts = [];


    ///1
    getTimeline() async {
      QuerySnapshot snapshot = await timelineRef
          .document(widget.currentUser.id)
          .collection('timelinePosts')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      List<Post> posts =
      snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
      setState(() {
        this.posts = posts;
      });
    }
///2
    buildTimeline() {
      if (posts == null) {
        return circularProgress();
      } else if (posts.isEmpty) {
        return buildUsersToFollow();
      } else {
        return ListView(children: posts);
      }
    }

    getFfollowing() async {
      QuerySnapshot snapshot = await followingRef
          .document(currentUser.id)
          .collection('userFollowing')
          .getDocuments();
      setState(() {
        foollowingList = snapshot.documents.map((doc) => doc.documentID).toList();
      });
    }





    buildUsersToFollow() {
      return StreamBuilder(
        stream:
        usersRef.orderBy('timestamp', descending: true).limit(30).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          List<UserResult> userResults = [];
          snapshot.data.documents.forEach((doc) {
            User user = User.fromDocument(doc);
            final bool isAuthUser = currentUser.id == user.id;
            final bool isFollowingUser = foollowingList.contains(user.id);
            // remove auth user from recommended list
            if (isAuthUser) {
              return;
            } else if (isFollowingUser) {
              return;
            } else {
              UserResult userResult = UserResult(user);
              userResults.add(userResult);
            }
          });
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person_add,
                        color: kblue,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Users to Follow",
                        style: TextStyle(
                          color: kblue,
                          fontSize: 30.0,
                        ),
                      )
                    ],
                  ),
                ),
                Column(children: userResults),
              ],
            ),
          );
        },
      );
    }



    @override
    Widget build(BuildContext context) {
          return Scaffold( backgroundColor: kPrimaryColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130.0),
              child: AppBar(backgroundColor: appbar,
                  automaticallyImplyLeading: false,

                  title: FittedBox(
                    fit:BoxFit.cover,
                    child: Text(   'FASHURE',
                      style: TextStyle(
                          fontFamily :"MajorMonoDisplay",

                          color: Colors.white),),
                  ),
                  iconTheme: new IconThemeData(color: kIcon),

              bottom:  PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Container(
                  height: 80.0,
                  child: TabBar(
                    indicatorSize:TabBarIndicatorSize.tab,
                    indicator:BubbleTabIndicator(indicatorHeight:40.0,
                      indicatorColor: kblue,
                    ),
                    controller: _tabController,
                    tabs: <Widget>[


                      FittedBox(
                        fit:BoxFit.fitWidth,
                        child: Text(   'Posts',
                          style: TextStyle(
                              fontFamily :"MajorMonoDisplay",

                              color: Colors.white),),
                      ),  FittedBox(
                        fit:BoxFit.fitWidth,
                        child: Text(   'Collections',
                          style: TextStyle(
                              fontFamily :"MajorMonoDisplay",

                              color: Colors.white),),
                      ), FittedBox(
                        fit:BoxFit.fitWidth,
                        child: Text(   'Editorial',
                          style: TextStyle(
                              fontFamily :"MajorMonoDisplay",

                              color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
                  actions: <Widget>[



                    IconButton(
                      icon: Icon(
                        Icons.search,

                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Search()));

                        // do something
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));

                        // do something
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(child: Image.network(currentUser.photoUrl),)),
                      ),
                    ),

                  ]
              ),
            ),

      body:
      Container(
        decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
        alignment: Alignment.center,
        child: RefreshIndicator(
                onRefresh: () => getTimeline(), child: TabBarView(controller: _tabController, children: [
          buildTimeline(),
          Collection(),
          Blog(),

        ]),
        ),
      ),
            floatingActionButton: _bottomButtons()
          );
    }
    Widget _bottomButtons() {
      if(_tabController.index == 0){return
        FloatingActionButton(
          heroTag:'upload',
          backgroundColor: Colors.black38,
          onPressed: () async{ Navigator.push(context, MaterialPageRoute(builder: (context) =>Upload(currentUser: currentUser, )));
// Add your onPressed code here!
          },
          child: Icon(Icons.add_a_photo),
        );}
     else if(_tabController.index == 1){return
        FloatingActionButton(
          heroTag:'uploadcoll',

          backgroundColor: Colors.black38,
          onPressed: ()
          async{ Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadColl(currentUser: currentUser)));
          },
          child: Icon(Icons.add_box),
        );}
       else if(_tabController.index == 2){return
        FloatingActionButton(
          heroTag:'uploadblog',

          backgroundColor: Colors.black38,
          onPressed: ()async{
            { Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadEdit(currentUser: currentUser)));
            };

            // Get.to(UploadEdit(currentUser: currentUser));
          },
          // async{ Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadEdit(currentUser: currentUser)));
          // },
          child: Icon(Icons.add_box),
        );}

    }
  }


class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  PaginateFirestore(
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)  {
        return new  FutureBuilder(
          future: usersRef.document( documentSnapshot.data['ownerId']).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
            return Column(children: <Widget>[
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(
                    user.displayName,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
               ),
              ListTile(
                title: Text(documentSnapshot.data['title'],
                    maxLines: 3,
                    style: new TextStyle(
                        fontWeight: FontWeight.w500,
                        color:kText,
                        fontSize: 18.0)),
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollScreen(
                            collId: documentSnapshot.data['collId'],
                            userId:  documentSnapshot.data['ownerId'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: MediaQuery.of(context).size.height/2,
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        // ),
                        width: MediaQuery.of(context).size.width,
                        child:
                        CachedNetworkImage(
                          imageUrl:  documentSnapshot.data['headerImage'],
                        )
                    ),
                  ),
                  Divider(color:kGrey),
                ],
              ),

            ],

            );
          },
        );
      },
      query:  collRef.orderBy('timestamp',descending: true),

    );

  }
}

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return  PaginateFirestore(
        itemBuilderType:
        PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (index, context, documentSnapshot) {

          return new  FutureBuilder(
            future: usersRef.document( documentSnapshot.data['ownerId']).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
              return Column(children: <Widget>[
                GestureDetector(                      onTap: () => showProfile(context, profileId: user.id),

                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () => showProfile(context, profileId: user.id),
                      child: Text(
                        user.displayName,
                        style: TextStyle(
                          color: kText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
         ),
                ),
                ListTile(

                  title: Text(documentSnapshot.data['title'],
                      maxLines: 3,
                      style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kText,
                          fontSize: 18.0)),
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogScreen(
                              blogId: documentSnapshot.data['blogId'],
                              userId:  documentSnapshot.data['ownerId'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: MediaQuery.of(context).size.height/2,

                        decoration: BoxDecoration(
                        ),
                        width: MediaQuery.of(context).size.width,

                        child:  CachedNetworkImage( imageUrl: documentSnapshot.data['blogmediaUrl']),

                      ),
                    ),
                  ],
                ),
                Divider(color: kGrey,),

              ],

              );
            },
          );

        },


        query: Firestore.instance.collectionGroup('userBlog').orderBy('timestamp',descending: true),

      );


  }
}
