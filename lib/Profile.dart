import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/chat_screen.dart';
import 'package:fashow/clientreview.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/page_view/online_dot_indicator.dart';
import 'package:fashow/post_screen.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:fashow/edit_profile.dart';
import 'package:fashow/post.dart';
import 'package:fashow/post_tile.dart';
import 'package:fashow/collsview.dart';
import 'package:fashow/blogsview.dart';

import 'package:fashow/progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fashow/product_tile.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Collscreen.dart';

class Profile extends StatefulWidget {
  final String profileId;
  final String currentUserId;

//  EditProfile({this.currentUserId});

  Profile({this.profileId,
    this.currentUserId});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String currentUserId = currentUser?.id;
  String postOrientation = "grid";
  String shopOrientation = "grid";
  bool isFollowing = false;
  bool isLoading = false;
  int postCount = 0;
  int shopCount = 0;
  int collCount = 0;
int blogCount = 0;
  int client = 0;

  int followerCount = 0;
  int followingCount = 0;
  List<Post> posts = [];
  List<Prod> products = [];
  List<Coll> collection = [];
List<Blog> blogs = [];
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
User peerUser;
String avatar;
SharedPreferences myPrefs;
String peerId;
String peerAvatar;
String peerName;
UserModel receiverId;

//  _ProfileState({@required this.id});

  @override
  void initState() {
    super.initState();
    getProducts();
    getProfilePosts();
//    getPosts();
    getFollowers();
    getFollowing();
    checkIfFollowing();
    writePeer();
readPeer();
  }

  writePeer() async {
    DocumentSnapshot doc = await usersRef.document(widget.profileId).get();
    peerUser = User.fromDocument(doc);
    print(peerUser.id);
    myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString('peerId', peerUser.id);
    await myPrefs.setString('peerAvatar', peerUser.photoUrl);
    await myPrefs.setString('peerName', peerUser.displayName);
    print(peerUser.displayName);
//    peerId = myPrefs.getString('peerId') ?? '';
//    peerAvatar = myPrefs.getString('peerAvatar') ?? '';
//    peerName = myPrefs.getString('peerName') ?? '';
  }
  readPeer() async{
    myPrefs = await SharedPreferences.getInstance();
        peerId = myPrefs.getString('peerId') ?? '';
    peerAvatar = myPrefs.getString('peerAvatar') ?? '';
    peerName = myPrefs.getString('peerName') ?? '';
    print(peerName);
    setState(() {
     receiverId = UserModel(
       id: peerId,
       displayName: peerName,
photoUrl: peerAvatar,

     );
    });

  }
  handleDeletePost({String OwnerId,String videoId}) {
    return showDialog(

        context: context,
        builder: (context) {
          return ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: SimpleDialog(

              backgroundColor: kSecondaryColor,
              title: Text("Remove this post?",style: TextStyle(color: kText),),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    deletePost(OwnerId: OwnerId,videoId: videoId);
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
  deletePost({String OwnerId,String videoId}) async {
    // delete post itself
    postsRef
        .document(OwnerId)
        .collection('userPosts')
        .document(videoId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
    storageRef.child("video_$videoId.mp4").delete();
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .document(OwnerId)
        .collection("feedItems")
        .where('postId', isEqualTo: videoId)
        .getDocuments();
    activityFeedSnapshot.documents.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await commentsRef
        .document(videoId)
        .collection('comments')
        .getDocuments();
    commentsSnapshot.documents.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleLikePost({String OwnerId,String videoId,String mediaUrl}) {
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      videoRef
          .document(OwnerId)
          .collection("userVideos")
          .document(videoId)
          .updateData({'likes.$currentUserId': false});
      removeLikeFromActivityFeed( OwnerId:OwnerId, videoId:videoId);
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      videoRef
          .document(OwnerId)
          .collection("userVideos")
          .document(videoId)
          .updateData({'likes.$currentUserId': true});
      addLikeToActivityFeed(OwnerId:OwnerId, videoId:videoId,mediaUrl: mediaUrl);
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

  addLikeToActivityFeed({String OwnerId,String videoId,String mediaUrl}) {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != OwnerId;
    if (isNotPostOwner) {
      activityFeedRef
          .document(OwnerId)
          .collection("feedItems")
          .document(videoId)
          .setData({
        "type": "like",
        "username": currentUser.username,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": videoId,
        "mediaUrl": mediaUrl,
        "timestamp": timestamp,
      });
    }
  }

  removeLikeFromActivityFeed({String OwnerId,String videoId}) {
    bool isNotPostOwner = currentUserId != OwnerId;
    if (isNotPostOwner) {
      activityFeedRef
          .document(OwnerId)
          .collection("feedItems")
          .document(videoId)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.delete();
        }
      });
    }
  }
  checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef
        .document(widget.profileId)
        .collection('userFollowers')
        .document(currentUserId)
        .get();
    setState(() {
      isFollowing = doc.exists;
    });
  }

  getFollowers() async {
    QuerySnapshot snapshot = await followersRef
        .document(widget.profileId)
        .collection('userFollowers')
        .getDocuments();
    setState(() {
      followerCount = snapshot.documents.length;
    });
//    usersRef.document(widget.currentUserId).updateData({
//      'followers':followerCount
//    });

  }

  getFollowing() async {
    QuerySnapshot snapshot = await followingRef
        .document(widget.profileId)
        .collection('userFollowing')
        .getDocuments();
    setState(() {
      followingCount = snapshot.documents.length;
    });
  }
  getProducts()async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await productsRef
        .document(widget.profileId)
        .collection('userProducts')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    setState(() {
      isLoading = false;
      shopCount = snapshot.documents.length;
      products = snapshot.documents.map((doc) => Prod.fromDocument(doc)).toList();
    });
  }
  getColls()async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await collRef
        .document(widget.profileId)
        .collection('userCollections')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    setState(() {
      isLoading = false;
      collCount = snapshot.documents.length;
      collection = snapshot.documents.map((doc) => Coll.fromDocument(doc)).toList();
    });
  }
   getEditorial()async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await blogRef
        .document(widget.profileId)
        .collection('userBlog')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    setState(() {
      isLoading = false;
      blogCount = snapshot.documents.length;
      blogs = snapshot.documents.map((doc) => Blog.fromDocument(doc)).toList();
    });
  }

getPosts(){

return
  StreamBuilder(
    stream: postsRef
        .document(widget.profileId)
        .collection('userPosts')
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostScreen(
                                      postId: docSnapshot["postId"],
                                      userId: docSnapshot["ownerId"],
                                    ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: docSnapshot["mediaUrl"],)
                      ),
                    )
                );
            });
        }

  );
}
getcollections(){
  // setState(() {
  //   isLoading = true;
  // });
return
  StreamBuilder(
    stream: collRef
        .document(widget.profileId)
        .collection('userCollections')
        .orderBy('timestamp', descending: true)
        .snapshots(),
//       ignore: missing_return
      builder:(context,snapshot) {
        // setState(() {
        //   isLoading = false;
        //   collCount = snapshot.data.length;
        //   collection = snapshot.data.map((doc) => Post.fromDocument(doc)).toList();
        // });
      return
        ListView.builder(

        primary: false,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot docSnapshot = snapshot.data.documents[index];
              return

                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CollScreen(
                                      collId: docSnapshot["collId"],
                                      userId: docSnapshot["ownerId"],
                                    ),
                              ),
                            );
                          },
                          child:   Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10.0),
                                height: MediaQuery.of(context).size.width/2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child:
                                  CachedNetworkImage(imageUrl: docSnapshot["headerImage"],)
                                // Carousel(
                                //
                                //     boxFit: BoxFit.cover,
                                //     images: docSnapshot["collmediaUrl"][index],
                                //     autoplay: false,
                                //     indicatorBgPadding: 5.0,
                                //     dotPosition: DotPosition.bottomCenter,
                                //     animationCurve: Curves.fastOutSlowIn,
                                //     animationDuration:
                                //     Duration(milliseconds: 2000)),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.red,
                              )
                            ],
                          ),
                      ),
                    )
                );
            });
        }

  );
}
geteditorial(){
  setState(() {
    isLoading = true;
  });
return
  StreamBuilder(
    stream: collRef
        .document(widget.profileId)
        .collection('userBlogs')
        .orderBy('timestamp', descending: true)
        .snapshots(),
//       ignore: missing_return
      builder:(context,snapshot) {
        setState(() {
          isLoading = false;
          collCount = snapshot.data.length;
          collection = snapshot.data.map((doc) => Post.fromDocument(doc)).toList();
        });
      return
        ListView.builder(

        primary: false,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot docSnapshot = snapshot.data.documents[index];
              return

                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BlogScreen(
                                      blogId: docSnapshot["blogId"],
                                      userId: docSnapshot["ownerId"],
                                    ),
                              ),
                            );
                          },
                          child:   Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10.0),
                                height: MediaQuery.of(context).size.width/2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child:
                                  CachedNetworkImage(imageUrl: docSnapshot["blogmediaUrl"],)
                                // Carousel(
                                //
                                //     boxFit: BoxFit.cover,
                                //     images: docSnapshot["collmediaUrl"][index],
                                //     autoplay: false,
                                //     indicatorBgPadding: 5.0,
                                //     dotPosition: DotPosition.bottomCenter,
                                //     animationCurve: Curves.fastOutSlowIn,
                                //     animationDuration:
                                //     Duration(milliseconds: 2000)),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.red,
                              )
                            ],
                          ),
                      ),
                    )
                );
            });
        }

  );
}

getProds(){

return
  StreamBuilder(
    stream: productsRef
        .document(widget.profileId)
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(
                                      prodId: docSnapshot["prodId"],
                                      userId: docSnapshot["ownerId"],
                                    ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: docSnapshot["shopmediaUrl"],)
                      ),
                    )
                );
            });
        }

  );
}
  getProfilePosts() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await postsRef
        .document(widget.profileId)
        .collection('userPosts')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    setState(() {
      isLoading = false;
      postCount = snapshot.documents.length;
      posts = snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
    });
  }
  Client(){
    StreamBuilder(
        stream:Firestore.instance.collection('users')
            .document(widget.profileId).snapshots(),
        builder:(context,snapshot){
          setState(() {
            client = snapshot.data['client'];

          });
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

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          count.toString(),
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,
          color: kIcon),
        ),

           Container(
            color: kPrimaryColor,
            margin: EdgeInsets.only(top: 4.0),
            child: Text(
              label,
              style: TextStyle(
                  color: kGrey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
    ],
        );
  }

  editProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfile(currentUserId: currentUserId)));
  }

  Container buildButton({String text, Function function}) {
    return Container(
      padding: EdgeInsets.only(top: 2.0),
      child: FloatingActionButton(

        onPressed: function,

      ),
    );
  }
  reviews()    {
  // QuerySnapshot query = await  Firestore.instance.collection('Reviews').document(widget.profileId)
  //       .collection('userReviews').get().then((query) {
  //         if(query.hasData)
  //   }
  //   )
  //   Container(
  //     height: 45,
  //     width: 45,
  //
  //     margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
  //       color: kblue,
  //       boxShadow: [BoxShadow(color: kblue)],
  //     ),
  //     child:Icon(EvaIcons.personDeleteOutline,color: kText,),
  //   ),
    GestureDetector(
    onTap: ()=>
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
    ClientReview(profileId: widget.profileId, ))),
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
    ],
    ),

    Text('Rating',style: TextStyle(color: Colors.white),),
    ],
    ),
    ),
    );
    // Container(
    //   child: FutureBuilder(
    //     future:      Firestore.instance.collection('users').document(widget.profileId)
    //         .collection('userReviews')
    //         .getDocuments(),
    //     builder: (context,snapshot){
    //   var rating = snapshot.data['rating'];
    //   var avg = rating.reduce((a,b)=>a+b)/rating;
    //   String review = snapshot.data['review'];
    //   return
    //   GestureDetector(
    //   onTap: ()=>
    //   Navigator.push(context, MaterialPageRoute(builder: (context) =>
    //   ClientReview(profileId: widget.profileId, ))),
    //   child: Container(
    //
    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
    //   color: kblue,
    //   boxShadow: [BoxShadow(color: kblue)],
    //   ),
    //   height: 60,
    //   width: 60,
    //   child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //   Row(
    //   children: [
    //   SizedBox(width: 6.0,),
    //   Icon(Icons.favorite,color: Colors.pink,),
    //   SizedBox(width: 3.0,),
    //   Text(avg ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
    //   ],
    //   ),
    //
    //   Text('Rating',style: TextStyle(color: Colors.white),),
    //   ],
    //   ),
    //   ),
    //   );
    //   }
    //
    //     // 'rating': rating,
    //     // 'review':reviewController.text,
    //   ),
    // );

}
Widget rev(){
    reviews();
}
  buildProfileButton() {
    // viewing your own profile should show edit profile button
    bool isProfileOwner = currentUserId == widget.profileId;
    if (isProfileOwner) {
      return
  //       Column(
  //         children: <Widget>[
  //
  //   FloatingActionButton.extended(
  //             onPressed: editProfile,
  //             backgroundColor: Colors.indigoAccent,
  //             icon: Icon(EvaIcons.edit2Outline),
  //             label: Text("Edit profile"),
  //           ),
  //           Row(
  //             children: <Widget>[
  //               GestureDetector(
  //                 onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) =>WalletPage())); },
  //                 child: Container(
  //                   height: 45,
  //                   width: 45,
  //
  //                   margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
  //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
  //                     color: kblue,
  // boxShadow: [BoxShadow(color: kblue)],
  //                   ),
  //                   child: Icon(EvaIcons.pantoneOutline,color: kText,),
  //                 ),),  GestureDetector(
  //                 onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) =>WalletPage())); },
  //                 child: Container(
  //                   height: 45,
  //                   width: 45,
  //
  //                   margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
  //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
  //                     color: kblue,
  // boxShadow: [BoxShadow(color: kblue)],
  //                   ),
  //                   child: Icon(Icons.account_balance_wallet,color: kText,),
  //                 ),),  GestureDetector(
  //                 onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) =>WalletPage())); },
  //                 child: Container(
  //                   height: 45,
  //                   width: 45,
  //
  //                   margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
  //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
  //                     color: kblue,
  // boxShadow: [BoxShadow(color: kblue)],
  //                   ),
  //                   child: Icon(EvaIcons.settings2Outline,color: kText,),
  //                 ),),
  //             ],
  //           )
  //         ],
  //       );
      Container();

    }

     if (isFollowing) {
      return

          Row(
            children: <Widget>[
              GestureDetector(
                onTap:
                  handleUnfollowUser,


                child: Column(
                  children: <Widget>[
                    Container(
                      height: 45,
                      width: 45,

                      margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                        color: kblue,
                        boxShadow: [BoxShadow(color: kblue)],
                      ),
                     child:Icon(EvaIcons.personDeleteOutline,color: kText,),
                    ),
                    Container(
                      child: Text('UnFollow',style: TextStyle(color: kGrey),),
                    )
                  ],
                ),
              ),
    SizedBox(width: 30.0,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            receiver: receiverId,

                          )));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 45,
                      width: 45,

                      margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                        color: kblue,
                        boxShadow: [BoxShadow(color: kblue)],
                      ),
                      child:Icon(EvaIcons.emailOutline,color: kText,),
                    ),
                    Container(
                      child: Text('Message',style: TextStyle(color: kGrey),),
                    )
                  ],
                ),
              ),

            ],
          );

    }
    else if (!isFollowing) {
      return
//
        GestureDetector(
          onTap:()=>handleFollowUser(),

          child: Container(child: Column(
            children: <Widget>[
              Icon(EvaIcons.personAddOutline,color: kIcon,size: 30.0,),
              Text('Follow',style: TextStyle(color: kGrey),),
            ],
          )),
        );
    }
  }

  handleUnfollowUser() {
    setState(() {
      isFollowing = false;
    });
    // remove follower
    followersRef
        .document(widget.profileId)
        .collection('userFollowers')
        .document(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // remove following
    followingRef
        .document(currentUserId)
        .collection('userFollowing')
        .document(widget.profileId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete activity feed item for them
    activityFeedRef
        .document(widget.profileId)
        .collection('feedItems')
        .document(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleFollowUser() {
    setState(() {
      isFollowing = true;
    });
    // Make auth user follower of ANOTHER user (update THEIR followers collection)
    followersRef
        .document(widget.profileId)
        .collection('userFollowers')
        .document(currentUserId)
        .setData({});
    // Put THAT user on YOUR following collection (update your following collection)
    followingRef
        .document(currentUserId)
        .collection('userFollowing')
        .document(widget.profileId)
        .setData({});
    // add activity feed item for that user to notify about new follower (us)
    activityFeedRef
        .document(widget.profileId)
        .collection('feedItems')
        .document(currentUserId)
        .setData({
      "type": "follow",
      "ownerId": widget.profileId,
      "username": currentUser.username,
      "userId": currentUserId,
      "userProfileImg": currentUser.photoUrl,
      "timestamp": timestamp,
    });
  }
 CoverPhoto(String image){
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1,
          child: CachedNetworkImage(
            imageUrl: image,
              fit: BoxFit.cover,
          ),
      );

 }
  buildProfileHeader() {
    return StreamBuilder(
      stream: usersRef.document(widget.profileId).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        User user = User.fromDocument(snapshot.data);
        // ignore: unnecessary_statements
        bool isProfileOwner = currentUserId == widget.profileId;

//        user.photoUrl == avatar;
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                 // CoverPhoto(user.coverPhoto),
                  Row(children:[
                    SizedBox(width: 65.0,),

                    GestureDetector(
                      onTap: () async
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ClientReview(profileId: widget.profileId, )));
                      },

                      child: Container(
                        alignment: Alignment.topLeft,

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: kblue,
                          boxShadow: [BoxShadow(color: kblue)],
                        ),
                        height: 55,
                        width: 55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite,color: Colors.pink,),

                            Text('Rating',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30.0,),

                    Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(maxHeight: 80, maxWidth: 80),
                      child: Stack(
                          children: [CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                          ),
                            OnlineDotIndicator(
                              uid: currentUser.id,
                            ),
                          ]
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    isProfileOwner ?
                    GestureDetector(
                      onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) =>EditProfile(currentUserId:widget.profileId))); },
                      child: Container(
                        height: 45,
                        width: 45,

                        margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
                          color: kblue,
                          boxShadow: [BoxShadow(color: kblue)],
                        ),
                        child: Icon(EvaIcons.settings2Outline,color: kText,),
                      ),):Container(),
                  ]),

          ]
              ),
              Container(color: kPrimaryColor,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  user.displayName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Container( color: kPrimaryColor,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  user.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kIcon,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                color: kPrimaryColor,

                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  user.bio,
                  style:TextStyle(color: kIcon,),
                ),
              ),
SizedBox(height: 10.0,),

                Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

  buildCountColumn("Clients", client),

                        buildCountColumn("followers", followerCount),

                        buildCountColumn("following", followingCount),
                        // reviews(),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildProfileButton(),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildCountColumn("posts", postCount),
                        buildCountColumn("shop", shopCount),
                        buildCountColumn("Collections", collCount),
                        buildCountColumn("Blogs", blogCount),


                      ],
                    ),
                    SizedBox(height: 10.0,),
                  ],
                ),
              SizedBox(height: 10.0,),
            ],
          ),
        );
      },
    );
  }
  buildProducts(){
    if (isLoading) {
      return circularProgress();
    } else if (products.isEmpty) {
      return Container(
//        color: kSecondaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: 150.0,left:110),
          child: Text(
            "No Products",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else if (shopOrientation == "grid") {
      List<GridTile> gridTiles = [];
      products.forEach((product) {
        gridTiles.add(GridTile(child: ProductTile(product)));
      });
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: gridTiles,
      );
    } else if (shopOrientation == "list") {
      return Column(
        children: products,
      );
    }
  }
buildColls(){
    if (isLoading) {
      return circularProgress();
    } else if (collection.isEmpty) {
      return Container(
//        color: kSecondaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: 150.0,left:110),
          child: Text(
            "No Collections",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else{
      return
      getcollections();
    }
  }
buildEditorial(){
    if (isLoading) {
      return circularProgress();
    } else if (blogs.isEmpty) {
      return Container(
//        color: kSecondaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: 150.0,left:110),
          child: Text(
            "No Blogs",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else{
      return
      geteditorial();
    }
  }

  setShopOrientation(String shopOrientation) {
    setState(() {
      this.shopOrientation = shopOrientation;
    });


  }
  buildToggleShopOrientation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: () => setShopOrientation("grid"),
          icon: Icon(Foundation.thumbnails,),
          color: postOrientation == 'grid'
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
        IconButton(
          onPressed: () => setShopOrientation("list"),
          icon: Icon(Icons.store),
          color: postOrientation == 'list'
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
      ],
    );
  }

  buildProfilePosts() {
    if (isLoading) {
      return circularProgress();
    } else if (posts.isEmpty) {
      return Container(
//        color: kSecondaryColor,

          child: Padding(
            padding: EdgeInsets.only(top: 150.0,left:130),
            child: Text(
              "No Posts",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

      );
    } else if (postOrientation == "grid") {
      List<GridTile> gridTiles = [];
      posts.forEach((post) {
        gridTiles.add(GridTile(child: PostTile(post)));
      });
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: gridTiles,
      );
    } else if (postOrientation == "list") {
      return  posts.toList();
      
    }
  }

  setPostOrientation(String postOrientation) {
    setState(() {
      this.postOrientation = postOrientation;
    });
  }

  buildTogglePostOrientation() {
    setState(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () => setPostOrientation("grid"),
            icon: Icon(Foundation.thumbnails,),
            color: postOrientation == 'grid'
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          IconButton(
            onPressed: () => setPostOrientation("list"),
            icon: Icon(Icons.store),
            color: postOrientation == 'list'
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        ],
      );

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Profile" ,
            style: TextStyle(color: Colors.white),
          ),
        ),),
      body:

      ListView(
        children: <Widget>[
          buildProfileHeader(),

          Divider(),
          DefaultTabController(
            length: 4,
            child: SizedBox(
              height: double.maxFinite,
              child: Column(
                children: <Widget>[
                  TabBar(
                    tabs: <Widget>[
Icon(Icons.weekend,color: Colors.white,),

                      Icon(Icons.store,color: Colors.white,),
                       Icon(Icons.self_improvement,color: Colors.white,),
Icon(Icons.create,color: Colors.white,),

                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          child:getPosts(),
                        ),  Container(
                          child: getProds(),
                        ),Container(
                          child: getcollections(),
                        ),Container(
                          child: buildEditorial(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


