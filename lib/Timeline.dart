import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/CollectionsUplaod.dart';
import 'package:fashow/custom_image.dart';
import 'package:fashow/upload_editorial.dart';
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
import 'package:fashow/Constants.dart';
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
    List<String> followingList = [];
    List<String> foollowingList = [];
    List<NetworkImage> _listOfImages = <NetworkImage>[];
    List<DocumentSnapshot> products = []; // stores fetched products
    bool isLoading = true; // track if products fetching
    bool hasMore = true; // flag for more products available or not
    int documentLimit = 10; // documents to be fetched per request
    DocumentSnapshot lastDocument; // flag for last document from where next 10 records to be fetched
    ScrollController _scrollController = ScrollController();
    final String currentUserId = currentUser?.id;
// PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();
    String postId;
     String ownerId;
     String username;
     String location;
     String description;
     String mediaUrl;
    int likeCount;
    Map likes;
    bool isLiked;
    bool showHeart = false;
   List timelinePosts = [];
   var _isVisible;
    ScrollController _hideButtonController;
//  _TimelineState();
//
//   _TimelineState({
//     this.postId,
//     this.ownerId,
//     this.username,
//     this.location,
//     this.description,
//     this.mediaUrl,
//     this.likes,
//     this.likeCount,
//   } ); // listener for listview scrolling
    @override
    void initState() {
      super.initState();
      getFfollowing();
      getTimeLine();
      post();
      _scrollController.addListener(() {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.position.pixels;
        double delta = MediaQuery.of(context).size.height * 0.20;
        if (maxScroll - currentScroll <= delta) {
        }
      });
//      _isVisible = true;
//      _hideButtonController = new ScrollController();
//      _hideButtonController.addListener((){
//        if(_hideButtonController.position.userScrollDirection == ScrollDirection.reverse){
//          if(_isVisible == true) {
//            /* only set when the previous state is false
//             * Less widget rebuilds
//             */
//            print("**** ${_isVisible} up"); //Move IO away from setState
//            setState((){
//              _isVisible = false;
//            });
//          }
//        } else {
//          if(_hideButtonController.position.userScrollDirection == ScrollDirection.forward){
//            if(_isVisible == false) {
//              /* only set when the previous state is false
//               * Less widget rebuilds
//               */
//              print("**** ${_isVisible} down"); //Move IO away from setState
//              setState((){
//                _isVisible = true;
//              });
//            }
//          }
//        }});
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

    handleDeletePost(BuildContext parentContext) {
      return showDialog(

          context: parentContext,
          builder: (context) {
            return ClipRRect(borderRadius: BorderRadius.circular(20.0),
              child: SimpleDialog(

                backgroundColor: kSecondaryColor,
                title: Text("Remove this post?",style: TextStyle(color: kText),),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                      deletePost();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel',
                      style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            );
          });
    }

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably
    deletePost() async {
      // delete post itself
      postsRef
          .document(ownerId)
          .collection('userPosts')
          .document(postId)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
      // delete uploaded image for the post
      storageRef.child("post_$postId.jpg").delete();
      // then delete all activity feed notifications
      QuerySnapshot activityFeedSnapshot = await activityFeedRef
          .document(ownerId)
          .collection("feedItems")
          .where('postId', isEqualTo: postId)
          .getDocuments();
      activityFeedSnapshot.documents.forEach((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
      // then delete all comments
      QuerySnapshot commentsSnapshot = await commentsRef
          .document(postId)
          .collection('comments')
          .getDocuments();
      commentsSnapshot.documents.forEach((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    }
    getProducts() async {
      if (!hasMore) {
        print('No More Products');
        return;
      }
      if (isLoading) {
        return;
      }
      setState(() {
        isLoading = true;
      });
      QuerySnapshot querySnapshot;
      List <Post> pos =[] ;
      if (lastDocument == null) {
        for( int i=0; i< foollowingList.length; i++)
        {
          querySnapshot = await Firestore.instance
              .collection('posts/${foollowingList[i]}/userPosts')
              .orderBy('timestamp', descending: true)
              .limit(documentLimit)
              .getDocuments();
//          Posts+=  snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();

        }
      } else {
        for( int i=0; i< foollowingList.length; i++)
        {
         querySnapshot = await Firestore.instance
              .collection('posts/${foollowingList[i]}/userPosts')
              .orderBy('timestamp', descending: true)
             .startAfterDocument(lastDocument)
             .limit(documentLimit)
              .getDocuments();
//          Posts+=  snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();

        }
//        querySnapshot = await firestore
//            .collection('products')
//            .orderBy('name')
//            .startAfterDocument(lastDocument)
//            .limit(documentLimit)
//            .getDocuments();
        print(1);
      }
      if (querySnapshot.documents.length == 0) {
        hasMore = false;
      }
      lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
      posts = querySnapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
      products.addAll(querySnapshot.documents);

      setState(() {
//        this.posts = pos;
        this.posts = querySnapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
        isLoading = false;
      });
    }
    handleLikePost() {
      bool _isLiked = likes[currentUserId] == true;

      if (_isLiked) {
        postsRef
            .document(ownerId)
            .collection('userPosts')
            .document(postId)
            .updateData({'likes.$currentUserId': false});
        removeLikeFromActivityFeed();
        setState(() {
          likeCount -= 1;
          isLiked = false;
          likes[currentUserId] = false;
        });
      } else if (!_isLiked) {
        postsRef
            .document(ownerId)
            .collection('userPosts')
            .document(postId)
            .updateData({'likes.$currentUserId': true});
        addLikeToActivityFeed();
        setState(() {
          likeCount += 1;
          isLiked = true;
          likes[currentUserId] = true;
//        showHeart = true;
        });
//      Timer(Duration(milliseconds: 500), () {
//        setState(() {
//          showHeart = false;
//        });
//      });
      }
    }

    addLikeToActivityFeed() {
      // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
      bool isNotPostOwner = currentUserId != ownerId;
      if (isNotPostOwner) {
        activityFeedRef
            .document(ownerId)
            .collection("feedItems")
            .document(postId)
            .setData({
          "type": "like",
          "username": currentUser.username,
          "userId": currentUser.id,
          "userProfileImg": currentUser.photoUrl,
          "postId": postId,
          "mediaUrl": mediaUrl,
          "timestamp": timestamp,
          "read":'false',
        });
      }
    }

    removeLikeFromActivityFeed() {
      bool isNotPostOwner = currentUserId != ownerId;
      if (isNotPostOwner) {
        activityFeedRef
            .document(ownerId)
            .collection("feedItems")
            .document(postId)
            .get()
            .then((doc) {
          if (doc.exists) {
            doc.reference.delete();
          }
        });
      }
    }
    List <Post>Posts = [];
//    getTimeline()async{
////      List <Post>Posts = [];
//      for( int i=0; i< followingList.length; i++)
//      {
//        QuerySnapshot snapshot = await Firestore.instance
//            .collection('posts/${followingList[i]}/userPosts')
//            .orderBy('timestamp', descending: true)
//            .getDocuments();
//        Posts+=  snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
//
//    }
//      setState(() {
//        this.posts =  Posts;
//      });
//    }



    getFfollowing() async {
      QuerySnapshot snapshot = await followingRef
          .document(currentUser.id)
          .collection('userFollowing')
          .getDocuments();
      setState(() {
        foollowingList = snapshot.documents.map((doc) => doc.documentID).toList();
      });
      // print(foollowingList);
    }


    buildTimeline() {
      if (foollowingList == null) {
        return circularProgress();
      } else if (foollowingList.isEmpty) {
        return buildUsersToFollow();
      } else {
        return
        getTimeLine();
      }
    }

quer(){

    for( int i=0; i< foollowingList.length; i++) {
   Firestore.instance
           .collection('posts/${followingList[i]}/userPosts')
           .orderBy('timestamp', descending: true);
}
}
getTimeLine(){
//   for( int i=0; i< foollowingList.length; i++) {

// }
//   getFfollowing();
return
    post();
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
            final bool isFollowingUser = followingList.contains(user.id);
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
            color: kSecondaryColor,
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
Blogs(){
  return  PaginateFirestore(
    itemBuilderType:
    PaginateBuilderType.listView, //Change types accordingly
    itemBuilder: (index, context, documentSnapshot) {
              _listOfImages = [];
        for (int i = 0;
        i <
            documentSnapshot.data['blogmediaUrl']
                .length;
        i++) {
          _listOfImages.add(NetworkImage( documentSnapshot.data['blogmediaUrl'][i]));
        }
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
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ),),
              Text(documentSnapshot.data['title'],
                  maxLines: 3,
                  style: new TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18.0)),
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
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width,

                      child:  CachedNetworkImage( imageUrl: documentSnapshot.data['blogmediaUrl']),
                    ),
                  ),
                ],
              ),
              GFButton(
                onPressed: ()  {
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
                text: "View Blog-",
                shape: GFButtonShape.pills,

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
Widget post(){
return Text('text');
//     return  new PaginateFirestore(
//       itemBuilderType:
//       PaginateBuilderType.listView,
//       itemBuilder: (index, context, documentSnapshot) {
//        DocumentSnapshot ds = documentSnapshot.data[index];
//        // setState(() {
//        //
//        //   // ownerId = ds['ownerId'];
//        //   // username = ds['username'];
//        //   // location = ds['location'];
//        //   // description = ds['description'];
//        //   // mediaUrl = ds['mediaUrl'];
//        //   // postId = ds['postId'];
//        // });
//        // ownerId = ds['ownerId'];
//          // username = ds['username'];
//          // location = ds['location'];
//          // description = ds['description'];
//          // mediaUrl = ds['mediaUrl'];
//          // postId = ds['postId'];
//        print(ds['ownerId']);
//
// //    Post posts = Post.fromDocument(documentSnapshot.data);
// //         return new FutureBuilder(
// //           future: usersRef.document(ds['ownerId']).get(),
// //           builder: (context, snapshot) {
// //             if (!snapshot.hasData) {
// //               return circularProgress();
// //             }
// //             User user = User.fromDocument(snapshot.data);
// //             bool isPostOwner = currentUserId == ownerId;
// //             snapshot.data.documents.map((doc) => Post.fromDocument(doc)).toList();
// //             return new
// //
// // Expanded(
// //               child: ListView(
// //                 scrollDirection: Axis.vertical,
// //                 shrinkWrap:true,
// //                 children: <Widget>[
// //                 ListTile(
// //                   leading: GestureDetector(
// //                     onTap: () => showProfile(context, profileId: user.id),
// //                     child: CircleAvatar(
// //                       backgroundImage: CachedNetworkImageProvider(user.photoUrl),
// //                       backgroundColor: Colors.grey,
// //                     ),
// //                   ),
// //                   title: GestureDetector(
// //                     onTap: () => showProfile(context, profileId: user.id),
// //                     child: Column(
// //                       children: [
// //                         Text(
// //                           user.displayName,
// //                           style: TextStyle(
// //                             color: kText,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         Text(user.username,
// //                           style: TextStyle(color: kIcon),),
// //                       ],
// //                     ),
// //                   ),
// //
// //                   subtitle: Text(location,
// //                     style: TextStyle(color: kText),),
// //
// //                   trailing: IconButton(
// //                       icon: Icon(Icons.more_horiz, color: Colors.white,),
// //                       onPressed: () {
// //                         !isPostOwner ? showDialog(
// //                             context: context,
// //                             builder: (BuildContext context) {
// //                               return Dialog(
// //                                 backgroundColor: kSecondaryColor,
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius:
// //                                     BorderRadius.circular(20.0)),
// //                                 //this right here
// //                                 child: Container(
// //                                   height: 100,
// //                                   child: Padding(
// //                                     padding: const EdgeInsets.all(12.0),
// //                                     child: Column(
// //                                       mainAxisAlignment: MainAxisAlignment.center,
// //                                       crossAxisAlignment: CrossAxisAlignment
// //                                           .start,
// //                                       children: [
// //                                         Container(
// //
// //                                           child: Align(
// //                                               alignment: Alignment.center,
// //                                               child: Text('Report this post?',
// //                                                 style: TextStyle(
// //                                                     color: Colors.blueAccent,
// //                                                     fontWeight: FontWeight.bold,
// //                                                     fontSize: 20.0),)),),
// //
// //
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //                               );
// //                               // ignore: unnecessary_statements
// //                             }) : handleDeletePost(context);
// //                       }),
// //
// //                 ),
// //                 SizedBox(height: 0.0,),
// //                 GestureDetector(
// //                     onDoubleTap: handleLikePost,
// //                     child: Stack(
// //                       alignment: Alignment.center,
// //                       children: <Widget>[
// //                         ClipRRect(borderRadius: BorderRadius.circular(20.0),
// //                             child: cachedNetworkImage(
// //                                 documentSnapshot.data['mediaUrl'])),
// //                         SizedBox(height: 3.0,),
// //                         Row(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: <Widget>[
// //                             Container(
// //                               padding: EdgeInsets.only(bottom: 10.0),
// //                               margin: EdgeInsets.only(left: 20.0),
// //                               child: Text(
// //                                 "$description ",
// //                                 style: TextStyle(
// //                                   color: kText,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                             ),
// // //                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
// //                           ],
// //                         ),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           children: <Widget>[
// //                             Padding(
// //                                 padding: EdgeInsets.only(top: 40.0, left: 20.0)),
// //                             FloatingActionButton(
// //                               mini: true,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.all(
// //                                       Radius.circular(16.0))),
// //                               onPressed: handleLikePost,
// //                               child:
// //                               ImageIcon(
// //                                 isLiked
// //                                     ? AssetImage("assets/img/clap-hands.png")
// //                                     : AssetImage("assets/img/clap.png"),
// //                                 color: kText,
// //                               ),
// // //                    ),Icon(
// // //                      isLiked ?   Icons.favorite_border:Icons.favorite ,
// // //                      size: 28.0,
// // //                      color: kText,
// // //                    ),
// //                             ),
// // //                Padding(padding: EdgeInsets.only(right: 1.0)),
// //                             Container(
// // //                  margin: EdgeInsets.only(left: 20.0),
// //                               child: Text(
// //                                 "$likeCount ",
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 15.0,
// // //                      fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                             ),
// //                             Padding(padding: EdgeInsets.only(right: 20.0)),
// //                             GestureDetector(
// //                               onTap: () =>
// //                                   showComments(
// //                                     context,
// //                                     postId: postId,
// //                                     ownerId: ownerId,
// //                                     mediaUrl: mediaUrl,
// //                                   ),
// //                               child: Icon(
// //                                 Icons.chat,
// //                                 size: 28.0,
// //                                 color: kText,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         Container(
// //                           height: 400,
// //                           child: Column(
// // //                 shrinkWrap: true,
// //                             children: <Widget>[
// //                               Comments(postId: postId,
// //                                 postMediaUrl: mediaUrl,
// //                                 postOwnerId: ownerId,)
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     )
// //                 ),
// //
// //                 Divider(color: kGrey,),
// //               ],
// //
// //               ),
// //             );
// //           },
// //         );
//       return
//         Text('text');
//       },
//       query: quer()
//
//     );

}
collectionGroup(){
  return  PaginateFirestore(
    itemBuilderType:
    PaginateBuilderType.listView,
    itemBuilder: (index, context, documentSnapshot)  {
//        DocumentSnapshot ds = snapshot.data.documents[index];
//    Post posts = Post.fromDocument(documentSnapshot.data);
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
                subtitle: GestureDetector(
                  onTap: () => showProfile(context, profileId: user.id),
                  child: Text(user.username,
                    style: TextStyle(color: kIcon),),
                ),),
              Text(documentSnapshot.data['title'],
                  maxLines: 3,
                  style: new TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18.0)),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child:
                          CachedNetworkImage(
                            imageUrl:  documentSnapshot.data['headerImage'],
                          )
                    ),
                  ),
                ],
              ),
              GFButton(
                onPressed: ()  {
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
                text: "View Collection",
                shape: GFButtonShape.pills,

              ),
              Divider(color: kGrey,),
            ],

            );
          },
        );
  },
  query:  collRef.orderBy('timestamp',descending: true),

  );
}



    @override
    Widget build(BuildContext context) {
          return Scaffold( backgroundColor: kPrimaryColor,
            appBar: AppBar(backgroundColor: appbar,
                automaticallyImplyLeading: false,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
                // ),
                title: FittedBox(
                  fit:BoxFit.cover,
                  child: Text(   'FASHURE',
                    style: TextStyle(
                        fontFamily :"MajorMonoDisplay",

                        color: Colors.white),),
                ),
                iconTheme: new IconThemeData(color: kIcon),
//            leading:IconButton(  icon: Icon(
//              Icons.menu,
//              color: Colors.blue,),
            bottom: TabBar(
              controller: _tabController,
              tabs: <Widget>[
//                  Icon(Icons.weekend,color: Colors.white,),
//                  Icon(Icons.store,color: Colors.white, Text('text'),),

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
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(child: Image.network(currentUser.photoUrl),)),
                  ),

                ]
            ),

      body:
      Container(
        decoration: BoxDecoration(
            gradient: fabGradient
        ) ,
        alignment: Alignment.center,
        child: RefreshIndicator(
                onRefresh: () => getTimeLine(), child: TabBarView(controller: _tabController, children: [
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
          heroTag:'uploadEdit',

          backgroundColor: Colors.black38,
          onPressed: (){
            WidgetsBinding.instance.addPostFrameCallback((_){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadEdit(currentUser: currentUser, )));
            },) ;
            // Get.to(UploadEdit(currentUser: currentUser));
          },
          // async{ Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadEdit(currentUser: currentUser)));
          // },
          child: Icon(Icons.add_box),
        );}

    }
  }
showComments(BuildContext context,
    {String postId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Comments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
    );
  }));
}

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  PaginateFirestore(
      itemBuilderType:
      PaginateBuilderType.listView,
      itemBuilder: (index, context, documentSnapshot)  {
//        DocumentSnapshot ds = snapshot.data.documents[index];
//    Post posts = Post.fromDocument(documentSnapshot.data);
        return new  FutureBuilder(
          future: usersRef.document( documentSnapshot.data['ownerId']).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
            return Card(
              color: trans,
              child: Column(children: <Widget>[
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
                  ],
                ),

              ],

              ),
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
                  subtitle: GestureDetector(
                    onTap: () => showProfile(context, profileId: user.id),
                    child: Text(user.username,
                      style: TextStyle(color: kIcon),),
                  ),),
                Text(documentSnapshot.data['title'],
                    maxLines: 3,
                    style: new TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18.0)),
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
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,

                        child:  CachedNetworkImage( imageUrl: documentSnapshot.data['blogmediaUrl']),

                      ),
                    ),
                  ],
                ),
                GFButton(
                  onPressed: ()  {
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
                  text: "View Blog-",
                  shape: GFButtonShape.pills,

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
