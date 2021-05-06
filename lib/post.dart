import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Products.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/Cart.dart';
import 'package:fashow/comments.dart';
class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  final dynamic likes;

  Post({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      location: doc['location'],
      description: doc['description'],
      mediaUrl: doc['mediaUrl'],
      likes: doc['likes'],
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
  _PostState createState() => _PostState(
    postId: this.postId,
    ownerId: this.ownerId,
    username: this.username,
    location: this.location,
    description: this.description,
    mediaUrl: this.mediaUrl,
    likes: this.likes,
    likeCount: getLikeCount(this.likes),
  );
}

class _PostState extends State<Post> {
  final String currentUserId = currentUser?.id;
  final String postId;
  final String ownerId;
  final String username;
  final String location;
  final String description;
  final String mediaUrl;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;

  _PostState({
    this.postId,
    this.ownerId,
    this.username,
    this.location,
    this.description,
    this.mediaUrl,
    this.likes,
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
        "read": 'false',
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
  buildPostHeader() {
    return FutureBuilder(
      future: usersRef.document(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        User user = User.fromDocument(snapshot.data);
        bool isPostOwner = currentUserId == ownerId;
        return  Container(
          margin: EdgeInsets.only(top:1.0,left: 10.0,right: 10.0, bottom: 1.0 ),
         child: Column(
           children:  <Widget> [
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
                   user.username,
                   style: TextStyle(
                     color: kText,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               subtitle: Text(location,
                 style: TextStyle(color: kText),),
               trailing: IconButton(icon: Icon(Icons.more_horiz,color: Colors.white,),
        onPressed: () {
          !isPostOwner?showDialog(
        context: context,
        builder: (BuildContext context) {
        return Dialog(
        backgroundColor: kSecondaryColor,
        shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(20.0)), //this right here
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
//        ),FlatButton(
//        onPressed: () {Navigator.pop(context);  Navigator.push(context, MaterialPageRoute(builder: (context) =>Profile( profileId: currentUser?.id)));
//        },
//
//        child: Text('Delete this post?',style: TextStyle(
//            color: Colors.blueAccent,
//            fontWeight: FontWeight.bold,
//            fontSize: 20.0),),
//        ),

        ],
        ),
        ),
        ),
        );
        // ignore: unnecessary_statements
        }):handleDeletePost(context);
        }),

             ),SizedBox( height:0.0,),
        GestureDetector(
        onDoubleTap: handleLikePost,
        child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
        ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: cachedNetworkImage(mediaUrl)),

//           products(),

        ],
        )
        ),
             SizedBox( height:3.0,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.only(bottom: 10.0),
                   margin: EdgeInsets.only(left: 20.0),
                   child: Text(
                     "$description ",
                     style: TextStyle(
                       color: kText,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
               ],
             ),
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
                     color: kText,
                   ),
//                    ),Icon(
//                      isLiked ?   Icons.favorite_border:Icons.favorite ,
//                      size: 28.0,
//                      color: kText,
//                    ),
                 ),
//                Padding(padding: EdgeInsets.only(right: 1.0)),
                 Container(
//                  margin: EdgeInsets.only(left: 20.0),
                   child: Text(
                     "$likeCount ",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 15.0,
//                      fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 Padding(padding: EdgeInsets.only(right: 20.0)),
                 GestureDetector(
                   onTap: () => showComments(
                     context,
                     postId: postId,
                     ownerId: ownerId,
                     mediaUrl: mediaUrl,
                   ),
                   child: Icon(
                     Icons.chat,
                     size: 28.0,
                     color: kText,
                   ),
                 ),
               ],
             ),
             Container(
               height: 400,
               child: Column(
//                 shrinkWrap: true,
                 children: <Widget>[
Comments(postId: postId,postMediaUrl: mediaUrl,postOwnerId: ownerId,)
                 ],
               ),
             ),
//            SizedBox( height:10.0,),

           ],
         ) ,


        );
      },
    );
  }
//   img1({String imgUrl,
//     String prodId,
//     String ownerId,
//     String photoUrl,
//     String userId,
//     String username,
//     String price,
//     String prodname,}){
//     if(imgUrl == null){
//       return Container() ;
//     }else
//       return Column(
//         children: [
//           GestureDetector(
//             onTap: ()  => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ProductScreen(
//                   prodId: prodId,
//                   userId: ownerId,
//                 ),
//               ),
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular
//                       (20),
//                     child: Container(
//                         height: 300.0,
//                         width: 300.0,
//                         child: AspectRatio(
//                             aspectRatio: 16 / 9,
//                             child: FadeInImage.memoryNetwork(
//                                 placeholder: kTransparentImage,image:imgUrl)))),
//                 Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child:    GestureDetector(
//                       onTap: () => showProfile(context, profileId:userId ),
//                       child: ListTile(
//                         leading: ClipOval(
//                           child: CircleAvatar(
//                             backgroundImage:
//                             CachedNetworkImageProvider(photoUrl),
//                             backgroundColor: Colors.grey,
//                           ),
//                         ),
//                         title: Text(
//                           username,
//                           style: TextStyle(
//                             color: kText,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
// //                  Positioned.fill(
// //                    child: Align(
// //                      alignment: Alignment.bottomRight,
// //                      child: FloatingActionButton(
// //                        mini: true,
// //                        backgroundColor:kText.withOpacity(0.5),
// //                        child:Icon(Icons.shopping_cart,color:kText,),
// //                        onPressed: () {
// //                          addToCart();
// //
// //                          // do something
// //                        },
// //                      ),
// //                    ),
// //                  ),
//               ],
//             ),
//           ),
//           Container( decoration: new BoxDecoration(
//               color: kGrey,
//               borderRadius: new BorderRadius.only(
//                 bottomLeft: const Radius.circular(40.0),
//                 bottomRight: const Radius.circular(40.0),
//               )
//           ),
//
//             child: ListTile(
//               title: Text(price,style: TextStyle(color: kText,fontSize: 30),),
//               subtitle: Text(prodname,style: TextStyle(color: kText,fontSize: 20),),
//             ),
//           ),
//         ],
//       );
//   }
//   img2({  String imgUrl2,
//     String prodId2,
//     String ownerId2,
//     String photoUrl2,
//     String userId2,
//     String username2,
//     String price2,
//     String prodname2,}){
//
// if( imgUrl2 == null ){
//   return Container();}else
//     {
// return
//     Column(
//       children: [
//         GestureDetector(
//           onTap: ()  => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ProductScreen(
//                 prodId: prodId2,
//                 userId: ownerId2,
//               ),
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               ClipRRect(
//                   borderRadius: BorderRadius.circular
//                     (20),
//                   child: Container(
//                       height: 300.0,
//                       width: 300.0,
//                       child: AspectRatio(
//                           aspectRatio: 16 / 9,
//                           child: cachedNetworkImage(imgUrl2)))),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child:    GestureDetector(
//                     onTap: () => showProfile(context, profileId:userId2 ),
//                     child: ListTile(
//                       leading: ClipOval(
//                         child: CircleAvatar(
//                           backgroundImage:
//                           CachedNetworkImageProvider(photoUrl2),
//                           backgroundColor: Colors.grey,
//                         ),
//                       ),
//                       title: Text(
//                         username2,
//                         style: TextStyle(
//                           color: kText,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
// //                  Positioned.fill(
// //                    child: Align(
// //                      alignment: Alignment.bottomRight,
// //                      child: FloatingActionButton(
// //                        mini: true,
// //                        backgroundColor:kText.withOpacity(0.5),
// //                        child:Icon(Icons.shopping_cart,color:kText,),
// //                        onPressed: () {
// //                          addToCart();
// //
// //                          // do something
// //                        },
// //                      ),
// //                    ),
// //                  ),
//             ],
//           ),
//         ),
//           Container( decoration: new BoxDecoration(
//     color: kGrey,
//     borderRadius: new BorderRadius.only(
//     bottomLeft: const Radius.circular(40.0),
//     bottomRight: const Radius.circular(40.0),
//     )
//     ),
//
//     child: ListTile(
//     subtitle: Text(price2,style: TextStyle(color: kText,fontSize: 30),),
//     title: Text(prodname2,style: TextStyle(color: kText,fontSize: 20),),
//     ),
//     ),
//       ],
//     );
//
//   }}
//   img3({  String imgUrl3,
//     String prodId3,
//     String ownerId3,
//     String photoUrl3,
//     String userId3,
//     String username3,
//     String price3,
//     String prodname3,}){
//
// if( imgUrl3 == null ){
//   return Container();}else
//     {
// return
//     Column(
//       children: [
//         GestureDetector(
//           onTap: ()  => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ProductScreen(
//                 prodId: prodId3,
//                 userId: ownerId3,
//               ),
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               ClipRRect(
//                   borderRadius: BorderRadius.circular
//                     (20),
//                   child: Container(
//                       height: 300.0,
//                       width: 300.0,
//                       child: AspectRatio(
//                           aspectRatio: 16 / 9,
//                           child: cachedNetworkImage(imgUrl3)))),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child:    GestureDetector(
//                     onTap: () => showProfile(context, profileId:userId3 ),
//                     child: ListTile(
//                       leading: ClipOval(
//                         child: CircleAvatar(
//                           backgroundImage:
//                           CachedNetworkImageProvider(photoUrl3),
//                           backgroundColor: Colors.grey,
//                         ),
//                       ),
//                       title: Text(
//                         username3,
//                         style: TextStyle(
//                           color: kText,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
// //                  Positioned.fill(
// //                    child: Align(
// //                      alignment: Alignment.bottomRight,
// //                      child: FloatingActionButton(
// //                        mini: true,
// //                        backgroundColor:kText.withOpacity(0.5),
// //                        child:Icon(Icons.shopping_cart,color:kText,),
// //                        onPressed: () {
// //                          addToCart();
// //
// //                          // do something
// //                        },
// //                      ),
// //                    ),
// //                  ),
//             ],
//           ),
//         ),
//           Container( decoration: new BoxDecoration(
//     color: kGrey,
//     borderRadius: new BorderRadius.only(
//     bottomLeft: const Radius.circular(40.0),
//     bottomRight: const Radius.circular(40.0),
//     )
//     ),
//
//     child: ListTile(
//     subtitle: Text(price3,style: TextStyle(color: kText,fontSize: 30),),
//     title: Text(prodname3,style: TextStyle(color: kText,fontSize: 20),),
//     ),
//     ),
//       ],
//     );
//
//   }}
//   img4({  String imgUrl4,
//     String prodId4,
//     String ownerId4,
//     String photoUrl4,
//     String userId4,
//     String username4,
//     String price4,
//     String prodname4,}){
//
// if( imgUrl4 == null ){
//   return Container();}else
//     {
// return
//     Column(
//       children: [
//         GestureDetector(
//           onTap: ()  => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ProductScreen(
//                 prodId: prodId4,
//                 userId: ownerId4,
//               ),
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               ClipRRect(
//                   borderRadius: BorderRadius.circular
//                     (20),
//                   child: Container(
//                       height: 300.0,
//                       width: 300.0,
//                       child: AspectRatio(
//                           aspectRatio: 16 / 9,
//                           child: cachedNetworkImage(imgUrl4)))),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child:    GestureDetector(
//                     onTap: () => showProfile(context, profileId:userId4 ),
//                     child: ListTile(
//                       leading: ClipOval(
//                         child: CircleAvatar(
//                           backgroundImage:
//                           CachedNetworkImageProvider(photoUrl4),
//                           backgroundColor: Colors.grey,
//                         ),
//                       ),
//                       title: Text(
//                         username4,
//                         style: TextStyle(
//                           color: kText,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
// //                  Positioned.fill(
// //                    child: Align(
// //                      alignment: Alignment.bottomRight,
// //                      child: FloatingActionButton(
// //                        mini: true,
// //                        backgroundColor:kText.withOpacity(0.5),
// //                        child:Icon(Icons.shopping_cart,color:kText,),
// //                        onPressed: () {
// //                          addToCart();
// //
// //                          // do something
// //                        },
// //                      ),
// //                    ),
// //                  ),
//             ],
//           ),
//         ),
//           Container( decoration: new BoxDecoration(
//     color: kGrey,
//     borderRadius: new BorderRadius.only(
//     bottomLeft: const Radius.circular(40.0),
//     bottomRight: const Radius.circular(40.0),
//     )
//     ),
//
//     child: ListTile(
//     subtitle: Text(price4,style: TextStyle(color: kText,fontSize: 30),),
//     title: Text(prodname4,style: TextStyle(color: kText,fontSize: 20),),
//     ),
//     ),
//       ],
//     );
//
//   }}
//   img5({  String imgUrl5,
//     String prodId5,
//     String ownerId5,
//     String photoUrl5,
//     String userId5,
//     String username5,
//     String price5,
//     String prodname5,}){
//
// if( imgUrl5 == null ){
//   return Container();}else
//     {
// return
//     Column(
//       children: [
//         GestureDetector(
//           onTap: ()  => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ProductScreen(
//                 prodId: prodId5,
//                 userId: ownerId5,
//               ),
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               ClipRRect(
//                   borderRadius: BorderRadius.circular
//                     (20),
//                   child: Container(
//                       height: 300.0,
//                       width: 300.0,
//                       child: AspectRatio(
//                           aspectRatio: 16 / 9,
//                           child: cachedNetworkImage(imgUrl5)))),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child:    GestureDetector(
//                     onTap: () => showProfile(context, profileId:userId5),
//                     child: ListTile(
//                       leading: ClipOval(
//                         child: CircleAvatar(
//                           backgroundImage:
//                           CachedNetworkImageProvider(photoUrl5),
//                           backgroundColor: Colors.grey,
//                         ),
//                       ),
//                       title: Text(
//                         username5,
//                         style: TextStyle(
//                           color: kText,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
// //                  Positioned.fill(
// //                    child: Align(
// //                      alignment: Alignment.bottomRight,
// //                      child: FloatingActionButton(
// //                        mini: true,
// //                        backgroundColor:kText.withOpacity(0.5),
// //                        child:Icon(Icons.shopping_cart,color:kText,),
// //                        onPressed: () {
// //                          addToCart();
// //
// //                          // do something
// //                        },
// //                      ),
// //                    ),
// //                  ),
//             ],
//           ),
//         ),
//           Container( decoration: new BoxDecoration(
//     color: kGrey,
//     borderRadius: new BorderRadius.only(
//     bottomLeft: const Radius.circular(40.0),
//     bottomRight: const Radius.circular(40.0),
//     )
//     ),
//
//     child: ListTile(
//     subtitle: Text(price5,style: TextStyle(color: kText,fontSize: 30),),
//     title: Text(prodname5,style: TextStyle(color: kText,fontSize: 20),),
//     ),
//     ),
//       ],
//     );
//
//   }}
//   // ignore: non_constant_identifier_names
//   ModalTile({String imgUrl,
//     String prodId,
//     String ownerId,
//     String photoUrl,
//     String userId,
//     String username,
//     String price,
//     String prodname,
//     String imgUrl2,
//     String prodId2,
//     String ownerId2,
//     String photoUrl2,
//     String userId2,
//     String username2,
//     String price2,
//     String prodname2,
//     String imgUrl3,
//     String prodId3,
//     String ownerId3,
//     String photoUrl3,
//     String userId3,
//     String username3,
//     String price3,
//     String prodname3,
//       String imgUrl5,
//     String prodId5,
//     String ownerId5,
//     String photoUrl5,
//     String userId5,
//     String username5,
//     String price5,
//     String prodname5,
//       String imgUrl4,
//     String prodId4,
//     String ownerId4,
//     String photoUrl4,
//     String userId4,
//     String username4,
//     String price4,
//     String prodname4,
//
//   }){
//     return
//       showModalBottomSheet(
//           backgroundColor: kSecondaryColor,
// //          isScrollControlled: true,
//           context: context,
//           builder: (BuildContext context) {
//
//             return ListView(
// //              shrinkWrap: true,
//               children: [
//                 SizedBox(height: 12.0,),
//                 img1(imgUrl: imgUrl,photoUrl: photoUrl,price: price,prodId: prodId,prodname: prodname,
//                     ownerId: ownerId,
//                     userId: userId2,username: username),
//                 SizedBox(height: 12.0,),
//               img2(imgUrl2: imgUrl2,photoUrl2: photoUrl2,price2: price2,prodId2: prodId2,prodname2: prodname2,
//               ownerId2: ownerId2,
//               userId2: userId2,username2: username2),
//                 SizedBox(height: 12.0,),
//
//                 img3(imgUrl3: imgUrl3,photoUrl3: photoUrl3,price3: price3,prodId3: prodId3,prodname3: prodname3,
//                     ownerId3: ownerId3,
//                     userId3: userId3,username3: username3), SizedBox(height: 12.0,),
//
//                 img4(imgUrl4: imgUrl4,photoUrl4: photoUrl4,price4: price4,prodId4: prodId4,prodname4: prodname4,
//                     ownerId4: ownerId4,
//                     userId4: userId4,username4: username4), SizedBox(height: 12.0,),
//
//                 img5(imgUrl5: imgUrl5,photoUrl5: photoUrl5,price5: price5,prodId5: prodId5,prodname5: prodname5,
//                     ownerId5: ownerId5,
//                     userId5: userId5,username5: username5),
//               ],
//             );
//                 // ignore: unnecessary_statements
//
//
//           }
//
//       );
//   }
// products(){
//     return
//         FutureBuilder(
//           future:  tagsRef.document(postId).get(),
//             builder: (context,snapshot)
//
//         {
//           if(!snapshot.hasData){
//             print(postId);
//             return Text('hhh',style: TextStyle(color: kText),);
//           }
//
//           return
//
//             Positioned.fill(
//
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: FloatingActionButton.extended(
// //                  mini: true,
//                   backgroundColor: Colors.black38,
//                   onPressed: () {
//                     print(snapshot.data["prodId"]);
//                     ModalTile(imgUrl: snapshot.data["shopmediaUrl"],
//                       prodId:snapshot.data["prodId1"],
//                       ownerId:snapshot.data["ownerId1"],
//                       photoUrl:snapshot.data["photoUrl"],
//                             userId:snapshot.data["ownerId1"],
//                       username: snapshot.data['displayName'],
//                       price:snapshot.data["price1"],
//                       prodname:snapshot.data["productname"],
//
//                       imgUrl2: snapshot.data["shopmediaUrl2"],
//                       prodId2:snapshot.data["prodId2"],
//                       ownerId2:snapshot.data["ownerId2"],
//                       photoUrl2:snapshot.data["photoUrl2"],
//                             userId2:snapshot.data["ownerId2"],
//                       username2: snapshot.data['displayName2'],
//                       price2:snapshot.data["price2"],
//                       prodname2:snapshot.data["productname2"],
//
//                       imgUrl3: snapshot.data["shopmediaUrl3"],
//                       prodId3:snapshot.data["prodId3"],
//                       ownerId3:snapshot.data["ownerId3"],
//                       photoUrl3:snapshot.data["photoUrl3"],
//                             userId3:snapshot.data["ownerId3"],
//                       username3: snapshot.data['displayName3'],
//                       price3:snapshot.data["price3"],
//                       prodname3:snapshot.data["productname3"],
//
//                       imgUrl4: snapshot.data["shopmediaUrl4"],
//                       prodId4:snapshot.data["prodId4"],
//                       ownerId4:snapshot.data["ownerId4"],
//                       photoUrl4:snapshot.data["photoUrl4"],
//                             userId4:snapshot.data["ownerId4"],
//                       username4: snapshot.data['displayName4'],
//                       price4:snapshot.data["price4"],
//                       prodname4:snapshot.data["productname4"],
//
//                       imgUrl5: snapshot.data["shopmediaUrl5"],
//                       prodId5:snapshot.data["prodId5"],
//                       ownerId5:snapshot.data["ownerId5"],
//                       photoUrl5:snapshot.data["photoUrl5"],
//                             userId5:snapshot.data["ownerId5"],
//                       username5: snapshot.data['displayName5'],
//                       price5:snapshot.data["price5"],
//                       prodname5:snapshot.data["productname5"],
//
//                     );
//                   },
//                   icon: Icon(Icons.shopping_cart,
//                   ),
//                   label: Text('View products'),
//                 ),
//               ),
//             );
// //            ListView.builder(
// ////              itemCount: snapshot.data.documents.length,
// //              itemBuilder:(
// //              context,index){
// //
// //                DocumentSnapshot ds  = snapshot.data.documents[index];
// //                print("nhg${ds['prodId']}");
// //           return
// //              Positioned.fill(
// //
// //                child: Align(
// //                  alignment: Alignment.bottomLeft,
// //                  child: FloatingActionButton.extended(
// ////                  mini: true,
// //                    backgroundColor: Colors.black38,
// //                    onPressed: () {
// //                      ModalTile(imgUrl: ds["shopmediaUrl"],
// //                        prodId:ds["prodId"],
// //                        ownerId:ds["ownerId"],
// //                        photoUrl:ds["photoUrl"],
// ////                            userId:ds["ownerId"],
// //                        username: ds['displayName'],
// //                        price:ds["price"],
// //                        prodname:ds["productname"],
// //                      );
// //                    },
// //                    icon: Icon(Icons.shopping_cart,
// //                    ),
// //label: Text('View products'),
// //                  ),
// //                ),
// //              );
// //              }
// //            );
// //            Container(
// //              height: 100,
// //              child: ListView.builder(
// ////                  itemCount: snapshot.data.documents.length,
// //                  itemBuilder: (context,index)
// //                  {
// //           DocumentSnapshot ds = snapshot.data;
// //              return
// ////                  Container();
// //
// ////
// ////                FutureBuilder(
// ////                    future: usersRef.document(ds["ownerId"]).get(),
// ////                    builder: (context, snapshot) {
// ////                      if (!snapshot.hasData) {
// ////                        return circularProgress();
// ////                      }
// ////                      User user = User.fromDocument(snapshot.data);
// ////
// ////                      return
// ////
// ////
// ////                    }
// ////                );
// //          }
// //          ),
// //            );
//
//         },
//         );
// }
// //  buildPostImage() {
// //    return
// //  }
//
// //  buildPostFooter() {
// //    return Container(
// //      margin: EdgeInsets.only(top:0.0,left: 10.0,right: 10.0, bottom: 10.0 ),
// //      decoration: BoxDecoration(
// //        color: kPrimaryColor,
// //
// //        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0),),
// //        boxShadow: [
// //          BoxShadow(
// //            color: Colors.grey,
// //            offset: Offset(0.0,0.1),
// //            blurRadius: 10.0,
// //          )
// //        ]
// //    ),
// //      child: Column(
// //        children: <Widget>[
// //
// //        ],
// //      ),
// //    );
// //  }

  @override
  Widget build(BuildContext context) {
    isLiked = (likes[currentUserId] == true);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
//        buildPostImage(),
//        buildPostFooter(),
      ],
    );
  }
}
//getFollowers({String postId, String ownerId, String mediaUrl}) async {
//  QuerySnapshot snapshot = await followersRef
//      .document(ownerId)
//      .collection('userFollowers')
//      .getDocuments();
//  }

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