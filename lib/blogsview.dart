import 'dart:convert';
import 'package:fashow/Blogcomments.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Profile.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/Product_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zefyr/zefyr.dart';
List<NetworkImage> _listOfImages = <NetworkImage>[];
class Blog extends StatefulWidget {
  final String blogId;
  final String ownerId;
  final String username;
  final String blogmediaUrl;
  final String title;
  final String content;
  final String source;
  final dynamic likes;

  Blog({
    this.blogId,
    this.ownerId,
    this.username,
    this.blogmediaUrl,
    this.title,
    this.content,
    this.source,
    this.likes,
  });

  factory Blog.fromDocument(DocumentSnapshot doc) {
//    var ret = new List();
        _listOfImages = [];
        for (int i = 0;
        i <
        doc['blogmediaUrl']
        .length;
        i++) {
          _listOfImages.add(NetworkImage(doc['blogmediaUrl'][i]));
    }
    return Blog(

      blogId: doc['blogId'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      blogmediaUrl:   doc['blogmediaUrl'],
      title: doc['title'],
      content: doc['content'],
      source:doc['source'],
      likes: doc['claps'],
    );
  }

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
  _BlogState createState() => _BlogState(
    blogId: this.blogId,
    ownerId: this.ownerId,
    username: this.username,
    blogmediaUrl: this.blogmediaUrl,
    title: this.title,
    content: this.content,
    source:this.source,
    likes: this.likes,
    likeCount: getLikeCount(this.likes),
  );
}

class _BlogState extends State<Blog> {
  final String currentUserId = currentUser?.id;
  final String blogId;
  final String ownerId;
  final String username;
  final String blogmediaUrl;
  final String title;
  final String source;
  final String content;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  ZefyrController _controller;
  ZefyrImageDelegate _imageDelegate;
  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;
  _BlogState({
    this.blogId,
    this.ownerId,
    this.username,
    this.blogmediaUrl,
    this.title,
    this.content,
    this.likes,
    this.source,
    this.likeCount,
  });



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
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));
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
    blogRef
        .document(ownerId)
        .collection('userBlog')
        .document(blogId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
    storageRef.child("blog_$blogId.jpg").delete();
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .document(ownerId)
        .collection("feedItems")
        .where('blogId', isEqualTo: blogId)
        .getDocuments();
    activityFeedSnapshot.documents.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await blogcommentsRef
        .document(blogId)
        .collection('comments')
        .getDocuments();
    commentsSnapshot.documents.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleLikePost() {
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      blogRef
          .document(ownerId)
          .collection('userBlog')
          .document(blogId)
          .updateData({'claps.$currentUserId': false});
     removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      blogRef
          .document(ownerId)
          .collection('userBlog')
          .document(blogId)
          .updateData({'claps.$currentUserId': false});
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
          .document(blogId)
          .setData({
        "type": "bloglike",
        "username": currentUser.username,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": blogId,
       "mediaUrl": blogmediaUrl,
        "timestamp": timestamp,
        "read": "false"
      });
    }
  }

  removeLikeFromActivityFeed() {
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .document(ownerId)
          .collection("feedItems")
          .document(blogId)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    }
  }
  // final defaultStyle = DefaultTextStyle.of(context);
  final defaultLineTheme = LineTheme(
    textStyle: TextStyle(    color: Colors.white,),
        // fontSize: 12.0,

        // fontWeight: FontWeight.normal

    padding: EdgeInsets.symmetric(vertical: 8.0),
  );
  final theme =  ZefyrThemeData(
    defaultLineTheme: LineTheme(
      textStyle: TextStyle(    color: Colors.white,),
      // fontSize: 12.0,

      // fontWeight: FontWeight.normal

      padding: EdgeInsets.symmetric(vertical: 8.0),
    ),
    // attributeTheme: AttributeTheme.fallback(context, defaultLineTheme),
    // indentWidth: 12.0,
    // toolbarTheme: ToolbarTheme.fallback(context),
  );


  buildPostHeader() {

    return
      FutureBuilder(
        future: usersRef.document(ownerId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
          return  Column(children: <Widget>[
              GestureDetector(
                onTap: () => showProfile(context, profileId: user.id),
                child:    ListTileTheme(
                  tileColor:kSecondaryColor,

                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      user.displayName,
                      style: TextStyle(
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(user.username,
                      style: TextStyle(color: kIcon),),),
                ),
              ),
              SizedBox(height:10.0),
              Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),),
            SizedBox(height:10.0),

            ClipRRect(
                borderRadius: BorderRadius.only
                  (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,

                    width:     MediaQuery.of(context).size.width,
                    child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: cachedNetworkImage(blogmediaUrl)))),



            Container(
              color: kText,
                  child: ZefyrView(

                    document: _loadDocument(),
                      // imageDelegate:_loadDocument(),
                  )),
//            Divider(color: kGrey,),
              Text(source,
                style: TextStyle(
                  color:  Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: handleLikePost,
                    child:
                    ImageIcon(
                      isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                      color: kGrey,
                    ),
//                    ),Icon(
//                      isLiked ?   Icons.favorite_border:Icons.favorite ,
//                      size: 28.0,
//                      color: kText,
//                    ),
                  ),//                Padding(padding: EdgeInsets.only(right: 1.0)),
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$likeCount ",
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 15.0,
//                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  GestureDetector(
                    onTap: () => showComments(
                      context,
                      blogId: blogId,
                      ownerId: ownerId,
                   mediaUrl: blogmediaUrl,
                    ),
                    child: Icon(
                      Icons.chat,
                      size: 28.0,
                      color: kText,
                    ),
                  ),
                ],
              ),
//             Container(
//               height: 400,
//               child: Column(
// //                 shrinkWrap: true,
//                 children: <Widget>[
//                   BlogComments(blogId: blogId,blogMediaUrl: blogmediaUrl,blogOwnerId: ownerId,)
//                 ],
//               ),
//             ),
            ],

            );

        },
      );
  }
  NotusDocument _loadDocument() {
    return NotusDocument.fromJson(jsonDecode(content));
  }
  @override
  Widget build(BuildContext context) {
    isLiked = (likes[currentUserId] == true);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
      ],
    );
  }
}

showComments(BuildContext context,
    {String blogId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return BlogComments(
      blogId: blogId,
      blogOwnerId: ownerId,
     blogMediaUrl: mediaUrl,
    );
  }));
}
