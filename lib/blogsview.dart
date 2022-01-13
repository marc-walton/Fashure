import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Blogcomments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Communities/Share_button.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Support/SupportButton.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/methods/Empty_image.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Profile.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share/share.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:zefyrka/zefyrka.dart';

import 'chatcached_image.dart';
//import 'package:zefyr/zefyr.dart';


class Blog extends StatefulWidget {
  final String blogId;
  final String ownerId;
  final String username;
  final String blogmediaUrl;
  final String title;
  final String body;
    final String photoUrl;
final String currency;

  final dynamic likes;

  Blog({
    this.blogId,
    this.ownerId,
    this.username,
    this.blogmediaUrl,
    this.currency,

    this.title,
    this.body,
    this.likes,
     this.photoUrl,

  });

  factory Blog.fromDocument(DocumentSnapshot doc) {
    return Blog(

      blogId: doc.data()['blogId'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      blogmediaUrl:   doc.data()['blogmediaUrl'],
      title: doc.data()['title'],
      body: doc.data()['body'],
      likes: doc.data()['claps'],
      photoUrl: doc.data()['photoUrl'],
      currency: doc.data()['currency'],

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
    body: this.body,
    likes: this.likes,
    photoUrl: this.photoUrl,
    currency: this.currency,

    likeCount: getLikeCount(this.likes),

  );
}

class _BlogState extends State<Blog> {
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();

  final String currentUserId = currentUser?.id;
  final String blogId;
  final String ownerId;
  final String username;
  final String blogmediaUrl;
  final String title;
  final String body;
    final String photoUrl;
     final String currency;

  var contents ;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
   bool tags = false;
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();

  List <Widget>listOfImages = <Widget>[];
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
    this.likes,
    this.body,
    this.likeCount,
      this.photoUrl,
 this.currency,

  });


  void initState() {
    super.initState();

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

      var photo =  FirebaseStorage.instance.refFromURL(blogmediaUrl) ;
      await photo.delete();
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
    QuerySnapshot snapshot = await  blogRef
        .doc(currentUser.id)
        .collection('userBlog')
        .doc(blogId)
        .collection('content').get();
    commentsSnapshot.docs.forEach((doc) async {
      if (doc.exists) {
        for ( var imageFile in doc.data()["Id"]) {
         await blogRef
              .doc(currentUser.id)
              .collection('userBlog')
              .doc(blogId)
              .collection('content')
              .doc(imageFile) .collection('tags').get().then((snapshot) {
            for(DocumentSnapshot doc in snapshot.docs ){
              doc.reference.delete();

            }
          });         }
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
  contentView(){
    return
      StreamBuilder(
        stream:  blogRef
            .doc(currentUser.id)
            .collection('userBlog')
            .doc(blogId)
            .collection('content')
            .orderBy('timestamp',descending: false).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.isEmpty){
            return
              Container();
          } else {
            return new ListView.builder(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return contentItem(

                    Id: ds['Id'],
                    title: ds['title'],
                    body: ds['body'],

                    blogId: blogId,

                    image: ds['image'],

                  );
                }
            );
          }
        },
      );

  }

  buildPostHeader(CTX) {
    bool isPostOwner = currentUserId == ownerId;
    return   ListView(
      children: (<Widget>[
      GestureDetector(
        onTap: () => showProfile(context, profileId: ownerId),
        child:    ListTile(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
            style:  GoogleFonts.playfairDisplay(fontSize: MediaQuery.of(context).size.width/9,fontWeight: FontWeight.bold),),
        ) ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only
              (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
            child: Container(

                width:     MediaQuery.of(context).size.width,
                child: CachedImage(blogmediaUrl,height:MediaQuery.of(context).size.height/3))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(body,
            style:  TextStyle(fontSize: MediaQuery.of(context).size.width/18,),),
        ) ,
        Expanded(
          child: Container(
              child: contentView()),
        ),


      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
          GestureDetector(
            onTap: handleLikePost,

            child: ImageIcon(
              isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
              color: kText,
            ),
          ),
          SizedBox(width: 15.0,),
          GestureDetector(
            onTap: () => showComments(
              context,
              blogId: blogId,
              ownerId: ownerId,
              mediaUrl: blogmediaUrl,
            ),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 28.0,
              color: kText,
            ),

          ),
          SizedBox(width: 15.0,),
          IconButton(
            color: Colors.black,
            onPressed: () {
              showModalBottomSheet(context: CTX, builder:(CTX) {
                return Center(child:
                Column(

                    children:[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation : 0.1,
                          side: BorderSide.none,

                          primary:  Colors.black, // background
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ShareButton(
                                postId:blogId,
                                ownerId:ownerId,
                                type:"SharedBlog",
                                imageURL:blogmediaUrl,
                                productname:title,

                              ),
                          ));
                        },
                        child: Text("Share to community",style: TextStyle(color: kText),),
                      ),
                      FutureBuilder<Uri>(
                          future: _dynamicLinkService.createDynamicLink( postId:blogId,ownerId: ownerId,Description: title,type: "blog",imageURL:blogmediaUrl),
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              Uri uri = snapshot.data;
                              return  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation : 0.1,
                                  side: BorderSide.none,

                                  primary:  Colors.black, // background
                                ),
                                onPressed: () {
                                  Share.share(uri.toString());},
                                child: Text("Share to External Apps",style: TextStyle(color: kText),),
                              );

                            } else {
                              return Container();
                            }

                          }
                      ),



                    ])
                );
              });
            },
            // Share.shareFiles(["${shopmediaUrl.first}"],text:"$productname",subject:"${uri.toString()}");},
            icon: Icon(Icons.send),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: blogmediaUrl,),
          ),//
        ],
      ),
        Row(
          children: [
            Container(
//                  margin: EdgeInsets.only(left: 20.0),
              child: Text(
                "$likeCount ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                 fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
    ]),

    );
  }

  @override
  Widget build(BuildContext context) {
    isLiked = (likes[currentUserId] == true);
    return         buildPostHeader(context);
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
  final inr ;
  final gbp ;
  final eur ;
  String taggerId;
  String  taggerImg;
  String taggerName;
  String taggerCurrency;
  String TaggerOwnerId;
  String TaggerProdId;

  TagItem({
    this.ownerId,
    this.taggerId,
    this.taggerImg,
    this.taggerName,
    this.taggerCurrency,
    this.TaggerOwnerId,
    this.TaggerProdId,

    this.prodId,this.Id,this.image,this.name,this.usd, this.inr, this.gbp, this.eur});

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
                  onTap: () {
                    TaggerId = taggerId;
                    TaggerImg = taggerImg ;
                    TaggerName = taggerName;
                    TaggerCurrency =  taggerCurrency;
                    TaggerOwnerId = TaggerOwnerId;
                    TaggerProdId = TaggerProdId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: Id,
                          userId: ownerId,
                        ),
                      ),
                    );},
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
                  currentUser.currency == "INR"? Row(
                    children: [
                      Text("${cf.format(inr, CurrencyFormatter.inr)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "EUR"?Row(
                    children: [
                      Text("${cf.format(eur, CurrencyFormatter.eur)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "GBP"?Row(
                    children: [
                      Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):Row(
                    children: [
                      Text("${cf.format(usd, CurrencyFormatter.usd)}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ),
                ],
              ),

            ]),
          ),
        ]
    );
  }
}
class contentItem extends StatelessWidget {
  final String image;
  final String title;
  final String body;

  final String blogId;
  final String Id;


  contentItem({ this.image, this.title, this.body,this.blogId, this.Id,  });




  tags(ctx){
    return
      showMaterialModalBottomSheet(

        context: ctx,
        builder: (BuildContext context)
        {
          SizeConfig().init(context);

          return
            Container(height:MediaQuery.of(context).size.height/1.5,
                child:tagView());
        },
      );

  }
tag(){
    return
      FutureBuilder(
        future: blogRef
            .doc(currentUser.id)
            .collection('userBlog')
            .doc(blogId)
            .collection('content')
            .doc(Id)
            .collection("tags")
            .orderBy('timestamp',descending: true).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData||snapshot.data.docs.isEmpty) {
            return Container();
          }
          else {
            return  Row(
              children: [
                SizedBox(width:12.0),
                FloatingActionButton(
                  mini:true,
                  backgroundColor:Colors.white.withOpacity(0.5),
                  onPressed:()=> tags(context),
                  elevation:0.1,
                  child: Icon(Icons.shopping_cart_outlined,color:Colors.black),


                ),
              ],
            );
          }
        },
      );
}
  tagView(){
    return
      StreamBuilder(
        stream:blogRef
            .doc(currentUser.id)
            .collection('userBlog')
            .doc(blogId)
            .collection('content')
            .doc(Id)
            .collection("tags")
            .orderBy('timestamp',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.isEmpty){
            return
              Container();
          } else {
            return new ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return TagItem(
                    Id: ds['prodId'],
                    ownerId: ds['ownerId'],
                    name: ds['name'],
                    usd: ds['usd'],
                    inr: ds['inr'],
                    eur: ds['eur'],
                    gbp: ds['gbp'],
                    taggerId : ds['taggerId'],
                    taggerImg : ds['taggerImg'],
                    taggerName : ds['taggerName'],
                    taggerCurrency : ds['taggerCurrency'],
                    TaggerProdId: ds['prodId'],
                    TaggerOwnerId: ds['ownerId'],
                    image: ds['image'],
                    prodId: blogId,

                  );
                }
            );
          }
        },
      );

  }

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text(title,
              style:  GoogleFonts.notoSerif(fontSize: MediaQuery.of(context).size.width/13,fontWeight: FontWeight.bold),
            ),
            SizedBox(height:10),
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: EmptyImage(image)),
Positioned(
  bottom: 10.0,
  left:10.0,
  child: tag(),
)
              ],
            ),

            SizedBox(height:10),
            Text(body,
                style: TextStyle(color: kText,
                  fontSize:MediaQuery.of(context).size.width/18,
                )),


          ],
        ),
      ),
    );
  }
}