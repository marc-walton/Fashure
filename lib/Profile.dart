import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/chat_screen.dart';
import 'package:fashow/clientreview.dart';
import 'package:fashow/colltile.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/Constants.dart';
import 'package:sizer/sizer.dart';
import 'package:fashow/post_screen.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:fashow/edit_profile.dart';
import 'package:fashow/post.dart';
import 'package:fashow/post_tile.dart';
import 'package:fashow/collsview.dart';
import 'package:fashow/blogsview.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
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
Users peerUser;
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

    getFollowers();
    getFollowing();
    checkIfFollowing();
    writePeer();
readPeer();
  }

  writePeer() async {
    DocumentSnapshot doc = await usersRef.doc(widget.profileId).get();
    peerUser = Users.fromDocument(doc);
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

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably

  checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId)
        .get();
    setState(() {
      isFollowing = doc.exists;
    });
  }

  getFollowers() async {
    QuerySnapshot snapshot = await followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .get();
    setState(() {
      followerCount = snapshot.docs.length;
    });
//    usersRef.doc(widget.currentUserId).update({
//      'followers':followerCount
//    });

  }

  getFollowing() async {
    QuerySnapshot snapshot = await followingRef
        .doc(widget.profileId)
        .collection('userFollowing')
        .get();
    setState(() {
      followingCount = snapshot.docs.length;
    });
  }


getPosts(){

return
  StreamBuilder(
    stream: postsRef
        .doc(widget.profileId)
        .collection('userPosts')
        .orderBy('timestamp', descending: true)
        .snapshots(),
//       ignore: missing_return
      builder:(context,snapshot) {
      if(!snapshot.hasData){ return Container(
//        color: kSecondaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: 150.0,left:110),
          child: Text(
            "No Posts",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );}
      else {
        return
          Container(
            height: 400,
            child: GridView.builder(

                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery
                        .of(context)
                        .orientation == Orientation.portrait) ? 3 : 3),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot docSnapshot = snapshot.data.docs[index];
                  List image = snapshot.data.docs[index]["mediaUrl"];
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
                                imageUrl: image.first,)
                          ),
                        )
                    );
                }),
          );
      }
        }

  );
}
getcollections(){

return
  StreamBuilder(
    stream: collRef
        .doc(widget.profileId)
        .collection('userCollections')
        .orderBy('timestamp', descending: true)
        .snapshots(),
//       ignore: missing_return
      builder:(context,snapshot) {
        if (!snapshot.hasData) {
          return Container(
//        color: kSecondaryColor,
            child: Padding(
              padding: EdgeInsets.only(top: 150.0, left: 110),
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
        }
        else {
          return
            ListView.builder(

                primary: false,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot docSnapshot = snapshot.data.docs[index];
                  List image = snapshot.data.docs[index]["collmediaUrl"];

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
                            child: Column(
                              children: <Widget>[
                                Text(docSnapshot["title"]),
                                Container(
                                    margin: EdgeInsets.all(10.0),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child:
                                    CachedNetworkImage(
                                      imageUrl: image.first,)

                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        )
                    );
                });
        }
      }
  );
}
geteditorial(){

return
  StreamBuilder(
    stream: blogRef
        .doc(widget.profileId)
        .collection('userBlog')
        .orderBy('timestamp', descending: true)
        .snapshots(),
//       ignore: missing_return
      builder:(context,snapshot) {
        if (!snapshot.hasData) {
          return Container(
//        color: kSecondaryColor,
            child: Padding(
              padding: EdgeInsets.only(top: 150.0, left: 110),
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
        }
        else {
          return
            ListView.builder(

                primary: false,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot docSnapshot = snapshot.data.docs[index];
                  List IM = docSnapshot["blogmediaUrl"];
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
                            child: Column(
                              children: <Widget>[
                                Text(docSnapshot["title"]),
                                Container(
                                    margin: EdgeInsets.all(10.0),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 2,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child:
                                    CachedNetworkImage(
                                      imageUrl: IM.first,)
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
                                Divider(),
                              ],
                            ),
                          ),
                        )
                    );
                });
        }
      }
  );
}

getProds(){

return
  StreamBuilder(
    stream: productsRef
        .doc(widget.profileId)
        .collection('userProducts')
        .orderBy('timestamp', descending: true)
        .snapshots(),
//       ignore: missing_return
      builder:(context,snapshot) {
        if(!snapshot.hasData){ return Container(
//        color: kSecondaryColor,
          child: Padding(
            padding: EdgeInsets.only(top: 150.0,left:110),
            child: Text(
              "No Posts",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );}
else{
      return
        GridView.builder(

        primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 3 : 3),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot docSnapshot = snapshot.data.docs[index];
              List shop = snapshot.data.docs[index]["collmediaUrl"];
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
                            imageUrl:shop.first,)
                      ),
                    )
                );
            });}
        }

  );
}
  Client(){
    StreamBuilder(
        stream:FirebaseFirestore.instance.collection('users')
            .doc(widget.profileId).snapshots(),
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
  getProfilePosts() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await postsRef
        .doc(widget.profileId)
        .collection('userPosts')
        .orderBy('timestamp', descending: true)
        .get();
    setState(() {
      postCount = snapshot.docs.length;
      posts = snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
      isLoading = false;

    });
  }
  getProfileProds() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await productsRef
        .doc(widget.profileId)
        .collection('userProducts')
        .orderBy('timestamp', descending: true)
        .get();
    setState(() {
      //  proCount = snapshot.documents.length;
      products = snapshot.docs.map((doc) => Prod.fromDocument(doc)).toList();
      isLoading = false;

    });
  }
  getProfileColl() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await collRef
        .doc(widget.profileId)
        .collection('userCollections')
        .orderBy('timestamp', descending: true)
        .get();
    setState(() {
      //  proCount = snapshot.documents.length;
      collection = snapshot.docs.map((doc) => Coll.fromDocument(doc)).toList();
      isLoading = false;

    });
  }
  getProfileBlog() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await blogRef
        .doc(widget.profileId)
        .collection('userBlog')
        .orderBy('timestamp', descending: true)
        .get();
    setState(() {
      //  proCount = snapshot.documents.length;
      blogs= snapshot.docs.map((doc) => Blog.fromDocument(doc)).toList();
      isLoading = false;

    });
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
    } else  {
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
    }
  }
  buildPosts(){
    if (isLoading) {
      return circularProgress();
    } else if (posts.isEmpty) {
      return Container(
//        color: kSecondaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: 150.0,left:110),
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
    } else getPosts();
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
      List<GridTile> gridTiles = [];
      collection.forEach((collection) {
        gridTiles.add(GridTile(child: CollTile(collection)));
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
  // QuerySnapshot query = await  FirebaseFirestore.instance.collection('Reviews').doc(widget.profileId)
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
    //     future:      FirebaseFirestore.instance.collection('users').doc(widget.profileId)
    //         .collection('userReviews')
    //         .get(),
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
                     child:Icon(EvaIcons.personDeleteOutline,color: Colors.white,),
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
                      child:Icon(EvaIcons.emailOutline,color: Colors.white,),
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

          child:Column(
            children: <Widget>[
              Container(
                height: 45,
                width: 45,

                margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                  color: kblue,
                  boxShadow: [BoxShadow(color: kblue)],
                ),
                child:     Icon(EvaIcons.personAddOutline,color: Colors.white,size: 30.0,),

              ),
              Container(
                child: Text('Follow',style: TextStyle(color: kGrey),),
              )
            ],
          ),
        );
    }
  }

  handleUnfollowUser() {
    setState(() {
      isFollowing = false;
    });
    // remove follower
    followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // remove following
    followingRef
        .doc(currentUserId)
        .collection('userFollowing')
        .doc(widget.profileId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete activity feed item for them
    activityFeedRef
        .doc(widget.profileId)
        .collection('feedItems')
        .doc(currentUserId)
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
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId)
        .set({});
    // Put THAT user on YOUR following collection (update your following collection)
    followingRef
        .doc(currentUserId)
        .collection('userFollowing')
        .doc(widget.profileId)
        .set({});
    // add activity feed item for that user to notify about new follower (us)
    activityFeedRef
        .doc(widget.profileId)
        .collection('feedItems')
        .doc(currentUserId)
        .set({
      "type": "follow",
      "ownerId": widget.profileId,
      "username": currentUser.displayName,
      "userId": currentUserId,
      "userProfileImg": currentUser.photoUrl,
      "timestamp": timestamp,
    });
  }
  buildProfileHeader() {
    return StreamBuilder(
      stream: usersRef.doc(widget.profileId).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
         Users user = Users.fromDocument(snapshot.data);
        // ignore: unnecessary_statements
        bool isProfileOwner = currentUserId == widget.profileId;

//        user.photoUrl == avatar;
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row( mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                CachedNetworkImage(
                  imageUrl: user.photoUrl,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius:BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      width: 92.0,
                      height: 92.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Row(   mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCountColumn("Clients", client),
                    SizedBox(width: 10.0,),

                  buildCountColumn("followers", followerCount),
                    SizedBox(width: 10.0,),

                  buildCountColumn("following", followingCount),
                ],),
              ]),
          ListTile(
            title:     Text(
              user.displayName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                color:kText,
              ),
            ),
            subtitle:                   Container(

              padding: EdgeInsets.only(top: 2.0),
              child: Text(
                user.bio,
                style:TextStyle(color: kGrey,),
              ),
            ),

            trailing:GestureDetector(
              onTap: () async
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ClientReview(profileId: widget.profileId, )));
              },

              child: Container(
                alignment: Alignment.center,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                  color: kText,
                  boxShadow: [BoxShadow(color: kText)],
                ),
                height: 45,
                width: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite,color: Colors.pink,),

                    Text('Rating',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
          ),
SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildProfileButton(),
                ],
              ),

              SizedBox(height: 10.0,),
            ],
          ),
        );
      },
    );
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
    bool isProfileOwner = currentUserId == widget.profileId;

    return Scaffold(
      backgroundColor:  Color(0xff70e1f5),

      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          isProfileOwner ?
              IconButton(            onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context) =>EditProfile(currentUserId:widget.profileId))); },
                  icon:Icon(EvaIcons.settings2Outline,color: Colors.white,))
        :Container(),        ],
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Profile" ,
              style: TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  // fontSizfit: e:  35.0 ,
                  color: Colors.white)          ),
        ),),
      body:

      Container(            decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            buildProfileHeader(),

            Divider(),
            Container(
              child: DefaultTabController(
                length: 4,
                child: SizedBox(
                  height: double.maxFinite,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        backgroundColor: kPrimaryColor,
                        radius: 12,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        borderWidth: 2,
                        borderColor: Colors.transparent,
                        unselectedLabelStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.white),
                        height: 56,
                        tabs: [
                          Tab( icon: Icon(Icons.weekend,color: Colors.white,)),
                          Tab(  icon:Icon(Icons.store,color: Colors.white,)),
                          Tab( icon: Icon(Icons.self_improvement,color: Colors.white,)),
                          Tab( icon: Icon(Icons.create,color: Colors.white,)),

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
                              child: geteditorial(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),            ),

          ],
        ),
      ),
    );
  }
}


