import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashow/Blogcomments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Profile.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:zefyrka/zefyrka.dart';

import 'chatcached_image.dart';
//import 'package:zefyr/zefyr.dart';


List <Widget>listOfImages = <Widget>[];

pics({String userid,String prodid,parentContext}){
  return
    FutureBuilder<QuerySnapshot> (
        future:    blogRef
            .doc(userid)
            .collection("userBlog")
            .where('blogId' ,isEqualTo: '$prodid')
        // .where('ownerId' ,isEqualTo: '$ownerId')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                physics:NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection:Axis.vertical,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  // List<String> images = List.from(snapshot.data.docs[index].data()['collmediaUrl']);
                  listOfImages = [];
                  for (int i = 0;
                  i <
                      snapshot.data.docs[index].data()['blogmediaUrl']
                          .length;
                  i++) {
                    listOfImages.add(GestureDetector(
                      onTap: (){
                        showDialog<void>(
                          context: context,
                          // useRootNavigator:true,

                          barrierDismissible: true,
                          // false = user must tap button, true = tap outside dialog
                          builder: (BuildContext dialogContext) {
                            return
                              Dialog(

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),),
                                child: Container(
                                  child:PhotoView(imageProvider: CachedNetworkImageProvider
                                    (snapshot
                                      .data.docs[index].data()['blogmediaUrl'][i])),),
                              );
                          },
                        );
                      },
                      child: CachedNetworkImage(imageUrl:snapshot
                          .data.docs[index].data()['blogmediaUrl'][i]),
                    ));
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10.0),

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery.of(context).size.height * 0.4,

                          child:
                          CarouselSlider(

                              items: listOfImages,
                              options: CarouselOptions(
                                height: 400,
                                pauseAutoPlayOnManualNavigate: true,
                                pauseAutoPlayOnTouch: true,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                // onPageChanged: callbackFunction,
                                scrollDirection: Axis.horizontal,
                              )
                          )
                      ),

                    ],
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );

        });

}

class Blog extends StatefulWidget {
  final String blogId;
  final String ownerId;
  final String username;
  final List blogmediaUrl;
  final String title;
  final String content;
  final String source;
    final String photoUrl;

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
     this.photoUrl,

  });

  factory Blog.fromDocument(DocumentSnapshot doc) {
//    var ret = new List();
//         _listOfImages = [];
//         for (int i = 0;
//         i <
//         doc.data()['blogmediaUrl']
//         .length;
//         i++) {
//           _listOfImages.add(NetworkImage(doc.data()['blogmediaUrl'][i]));
//     }
    return Blog(

      blogId: doc.data()['blogId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      blogmediaUrl:   doc.data()['blogmediaUrl'],
      title: doc.data()['title'],
      content: doc.data()['content'],
      source:doc.data()['source'],
      likes: doc.data()['claps'],
      photoUrl: doc.data()['photoUrl'],

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
    photoUrl: this.photoUrl,

    likeCount: getLikeCount(this.likes),

  );
}

class _BlogState extends State<Blog> {
  final String currentUserId = currentUser?.id;
  final String blogId;
  final String ownerId;
  final String username;
  final List blogmediaUrl;
  final String title;
  final String source;
  final String content;
    final String photoUrl;
  var contents ;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
   bool tags = false;

  ZefyrController _controller;
  //ZefyrImageDelegate _imageDelegate;
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
      this.photoUrl,

  });
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadFromAssets();
  }

  carousel(){

    return
      CarouselSlider(
          options: CarouselOptions(
            height:500,
            enableInfiniteScroll: false,
          ),
          items: blogmediaUrl.map((e) => Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: e,
                width: 500,
                height: 400,
              ),
            ),
          ), ).toList()

      );

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
  deletePost() async {
    // delete post itself
    blogRef
        .doc(ownerId)
        .collection('userBlog')
        .doc(blogId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
//    storageRef.child("postnow${postId}").delete();

    for ( var imageFile in blogmediaUrl) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .doc(ownerId)
        .collection("feedItems")
        .where('blogId', isEqualTo: blogId)
        .get();
    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await blogcommentsRef
        .doc(blogId)
        .collection('comments')
        .get();
    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably

  handleLikePost() {
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      blogRef
          .doc(ownerId)
          .collection('userBlog')
          .doc(blogId)
          .update({'claps.$currentUserId': false});
     removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      blogRef
          .doc(ownerId)
          .collection('userBlog')
          .doc(blogId)
          .update({'claps.$currentUserId': true});
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
          .doc(ownerId)
          .collection("feedItems")
          .doc(blogId)
          .set({
        "type": "bloglike",
        "username": currentUser.displayName,
        "userId": ownerId,
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
          .doc(ownerId)
          .collection("feedItems")
          .doc(blogId)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    }
  }
  // final defaultStyle = DefaultTextStyle.of(context);
  void addProduct() {
    setState(() {
      tags = !tags;
    });
  }
  tagView(){
    return
      StreamBuilder(
        stream:  blogRef
            .doc(ownerId)
            .collection("userBlog")
        .doc(blogId)
            .collection("tags")
            .orderBy('timestamp',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return new ListView.builder(
                scrollDirection :Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return TagItem(
                    Id: ds['prodId'],
                    ownerId: ds['ownerId'],
                    name: ds['name'],
                    usd: ds['usd'],
                    image: ds['image'],
                    prodId: blogId,

                  );
                }
            );
          }
        },
      );

  }
viewProducts(){
return  showMaterialModalBottomSheet(
      context: context,
      builder: (BuildContext context)
      {
        SizeConfig().init(context);

        return
          Container(      height: MediaQuery.of(context).size.height/2 -30,child:tagView(),);
      });
}
  Widget adddProduct(){
    return Container(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 2*MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
          ),
        ),
        child:  Stack(
            children: <Widget>[
              Container(
                height: 2*MediaQuery.of(context).size.height/3 -50,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),

                    Container(      height: MediaQuery.of(context).size.height/2 -30,child:tagView(),),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      tags= !tags;
                    });
                  },
                  child: Container(
                    color: Colors.grey[850],
                    alignment: Alignment.bottomCenter,
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        Container(
                            height: double.maxFinite,
                            alignment: Alignment.center ,
                            child: Text('Close',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),

    );

  }
  report(){
    Fluttertoast.showToast(
        msg: "Your report has been submitted", timeInSecForIos: 4);
    FirebaseFirestore.instance.collection('reports')
        .doc(ownerId)
        .collection("userReports")
        .doc(blogId)
        .set({
      "type": "shop",
      "userId": ownerId,
      "postId": blogId,
      "timestamp": timestamp,
    });
  }
  Future<void> _loadFromAssets() async {
    try {
      final result = content;
      final doc = NotusDocument.fromJson(jsonDecode(result));
      setState(() {
        _controller = ZefyrController(doc);
      });
    } catch (error) {
      final doc = NotusDocument()..insert(0, 'Empty asset');
      setState(() {
        _controller = ZefyrController(doc);
      });
    }
  }
  buildPostHeader() {
    bool isPostOwner = currentUserId == ownerId;


    return   Column(children: <Widget>[
      GestureDetector(
        onTap: () => showProfile(context, profileId: ownerId),
        child:    ListTileTheme(

          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(photoUrl),
              backgroundColor: Colors.grey,
            ),
            title: Text(
              username,
              style: TextStyle(
                color:  kText,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                onPressed: () {
                  !isPostOwner?showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: kSecondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                          child: GestureDetector(
                            onTap: (){report();
                            Navigator.pop(context);},
                            child: Container(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(

                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text('Report this post?',style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),)),),


                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        // ignore: unnecessary_statements
                      }):handleDeletePost(context);
                }),

          ),
        ),
      ),
      ClipRRect(
          borderRadius: BorderRadius.only
            (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.4,

              width:     MediaQuery.of(context).size.width,
              child: pics(userid:ownerId,prodid:blogId,))),
      FutureBuilder(
        future:  blogRef
            .doc(ownerId)
            .collection("userBlog")
            .doc(blogId)
            .collection("tags")
            .orderBy('timestamp',descending: true).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return new                 Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
              child: MaterialButton(
                minWidth: 0,
                onPressed: viewProducts,
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: 20.0,
                ),
                shape: CircleBorder(),
                elevation: 2.0,
                color:Colors.blue[400] ,
                padding: const EdgeInsets.all(12.0),
              ),
            );
          }
        },
      ),
      SizedBox(height:10.0),
      ListTile(
        title: Text(title,
          style: TextStyle(
            color:kText,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),),
      ),
      SizedBox(height:10.0),


      Container(
          child: ZefyrEditor(

            controller: _controller,
            focusNode: _focusNode,
            autofocus: false,
            readOnly: true,
          )
      ),
//            Divider(color: kGrey,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
          FloatingActionButton(
            heroTag: 'sga',
            mini: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
            onPressed: handleLikePost,
            child:
            ImageIcon(
              isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
              color: kGrey,
            ),

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
          FloatingActionButton(
            heroTag: null,
            mini: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
            onPressed:() => showComments(
              context,
              blogId: blogId,
              ownerId: ownerId,
              mediaUrl: blogmediaUrl.first,
            ),
            child: Icon(
              Icons.chat,
              size: 28.0,
              color: kText,
            ),
          ),//
        ],
      ),
    ],

    );
  }
//  NotusDocument _loadDocument() {
 //   return NotusDocument.fromJson(jsonDecode(content));
//  }
   _saveDocument() {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly:
    final contents = jsonDecode(content);
    // For this example we save our document to a temporary file.
    return contents;
  }  @override
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
class TagItem extends StatelessWidget {
  final String ownerId ;
  final String prodId ;

  final String Id ;
  final String image ;
  final String name;
  final usd ;
  var currencyFormatter = NumberFormat('#,##0.00', );

  TagItem({this.ownerId,this.prodId,this.Id,this.image,this.name,this.usd});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:[
              Container(
                height: MediaQuery.of(context).size.height/3 * 1.2,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        prodId: Id,
                        userId: ownerId,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedImage(image)),
                ),
              ),
              Row(
                children: [
                  Text(name,
                      style: TextStyle(color: kText,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                children: [
                  Text("\u0024 ${currencyFormatter.format(usd)}",),
                ],
              ),

            ]),
          ),
        ]
    );
  }
}