import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Communities/EditCommunity.dart';
import 'package:fashow/Communities/Share_button.dart';
import 'package:fashow/Communities/Upload_community.dart';
import 'package:fashow/Communities/upload_poll.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fashow/Communities/comments.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/Support/SupportButton.dart';
import 'package:fashow/Timeline.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/post_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/comments.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:share/share.dart';
import 'package:simple_polls/models/poll_models.dart';
import 'package:simple_polls/widgets/polls_widget.dart';

class CommunityMainPage extends StatefulWidget {

  final String CommunityId;
 final String photoUrl;
final String description ;
final String title ;
final List members ;
final List admins ;
final List banned ;

  CommunityMainPage({this.CommunityId,this.photoUrl,this.description, this.title, this.members, this.banned, this.admins,});
  @override
  _CommunityMainPageState createState() => _CommunityMainPageState();
}

class _CommunityMainPageState extends State<CommunityMainPage> {
   String currentUserId = currentUser?.id;
   String postId;
   String ownerId;
   String username;
   String location;
   String description;
   List mediaUrl;
   DynamicLinkService _dynamicLinkService = DynamicLinkService();
   String photoUrl;
   String currency;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  List <Widget>listOfImages = <Widget>[];
  String media;
  int _current = 0;
   CarouselController _ccontroller = CarouselController();
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

  pics({String userid,String prodid}){
     print("postId:$prodid");
    return
      FutureBuilder<QuerySnapshot> (
          future:    FirebaseFirestore.instance.collection('Community')
              .doc(widget.CommunityId)
              .collection('communityPosts')
              .where('postId' ,isEqualTo: '$prodid')
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
                        snapshot.data.docs[index].data()['mediaUrl']
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
                                    height: 400,
                                    child:PhotoView(imageProvider: CachedNetworkImageProvider
                                      (snapshot
                                        .data.docs[index].data()['mediaUrl'][i])),),
                                );
                            },
                          );

                        },
                        child: CachedNetworkImage(imageUrl:snapshot
                            .data.docs[index].data()['mediaUrl'][i]),
                      ));
                    }
                    return Stack(
                      children: <Widget>[
                        Container(

                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child:
                            CarouselSlider(
                              //  items: listOfImages.map((e) { return Builder(builder: (BuildContext context){ return Container();});}),
                                items: listOfImages,
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  height: 300,

                                  aspectRatio: 16/9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  pauseAutoPlayOnManualNavigate: true,
                                  pauseAutoPlayOnTouch: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                )
                            )
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment:Alignment.bottomCenter,
                            child:  snapshot.data.docs[index].data()['mediaUrl']
                        .length==1?Container(): Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: mediaUrl.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => _ccontroller.animateToPage(entry.key),
                                  child: Container(
                                    width: 6.0,
                                    height: 6.0,
                                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
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


  pagiante(){
    return PaginateView(
      child: PaginateFirestore(
        isLive:true,
        itemBuilderType:
        PaginateBuilderType.listView, //Change types accordingly
        itemBuilder: (index, context, documentSnapshot) {

          bool isPostOwner = currentUserId == documentSnapshot.data()['ownerId'];
          String postId= documentSnapshot.data()['postId'];
          String ownerId= documentSnapshot.data()['ownerId'];
          String username= documentSnapshot.data()['username'];
          String location= documentSnapshot.data()['location'];
          String description= documentSnapshot.data()['description'];
          List mediaUrl= documentSnapshot.data()['mediaUrl'];

          Map likes= documentSnapshot.data()['likes'];
          bool isLiked = likes[currentUserId] == true;

          String currency= documentSnapshot.data()['currency'];
          String  photoUrl= documentSnapshot.data()['photoUrl'];
          String  communityId= documentSnapshot.data()['communityId'];


          var option1Total =  documentSnapshot.data()['option1Total'];
          var option2Total =  documentSnapshot.data()['option2Total'];
          var option3Total =  documentSnapshot.data()['option3Total'];
          var option4Total =  documentSnapshot.data()['option4Total'];
          var option5Total =  documentSnapshot.data()['option5Total'];
          var option6Total =  documentSnapshot.data()['option6Total'];
          List option1Voters =  documentSnapshot.data()['option1Voters'];
          List option2Voters =  documentSnapshot.data()['option2Voters'];
          List option3Voters =  documentSnapshot.data()['option3Voters'];
          List option4Voters =  documentSnapshot.data()['option4Voters'];
          List option5Voters =  documentSnapshot.data()['option5Voters'];
          List option6Voters =  documentSnapshot.data()['option6Voters'];
          List Voters =  documentSnapshot.data()['Voters'];
          var total =  documentSnapshot.data()['total'];
          String type =  documentSnapshot.data()['type'];
String image =  documentSnapshot.data()['image'];
String taggedId =  documentSnapshot.data()['taggedId'];
String taggedOwnerId =  documentSnapshot.data()['taggedOwnerId'];
String taggerId =  documentSnapshot.data()['taggerId'];
String taggerImg =  documentSnapshot.data()['taggerImg'];
String taggerName =  documentSnapshot.data()['taggerName'];
String taggerCurrency =  documentSnapshot.data()['taggerCurrency'];
String name =  documentSnapshot.data()['name'];
String inr =  documentSnapshot.data()['inr'];
String usd =  documentSnapshot.data()['usd'];
String gbp =  documentSnapshot.data()['gbp'];
String eur =  documentSnapshot.data()['eur'];
          isLiked = (likes[currentUserId] == true);

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

// Note: To delete post, ownerId and currentUserId must be equal, so they can be used interchangeably
          deletePost({String postId}) async {
            // delete post itself
            FirebaseFirestore.instance.collection('Community')
                .doc(communityId)
                .collection('communityPosts')
                .doc(postId)
                .get()
                .then((doc) {
              if (doc.exists) {
                doc.reference.delete();
              }
            });

            for ( var imageFile in mediaUrl) {
              var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
              await photo.delete();}
            // then delete all activity feed notifications
            QuerySnapshot activityFeedSnapshot = await activityFeedRef
                .doc(ownerId)
                .collection("feedItems")
                .where('postId', isEqualTo: postId)
                .get();
            activityFeedSnapshot.docs.forEach((doc) {
              if (doc.exists) {
                doc.reference.delete();
              }
            });
            // then delete all comments
            QuerySnapshot commentsSnapshot = await communitycommentsRef
                .doc(postId)
                .collection('comments')
                .get();
            commentsSnapshot.docs.forEach((doc) {
              if (doc.exists) {
                doc.reference.delete();
              }
            });
          }

          addLikeToActivityFeed() {
            // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
            bool isNotPostOwner = currentUserId != ownerId;
            if (isNotPostOwner) {
              activityFeedRef
                  .doc(ownerId)
                  .collection("feedItems")
                  .doc(postId)
                  .set({
                "type": "communitylike",
                "username": currentUser.displayName,
                "userId": currentUser.id,
                "userProfileImg": currentUser.photoUrl,
                "postId": postId,
                "mediaUrl": mediaUrl.first,
                "timestamp": timestamp,
                "read": 'false',
                "communityId": communityId,

              });
            }
          }

          removeLikeFromActivityFeed() {
            bool isNotPostOwner = currentUserId != ownerId;
            if (isNotPostOwner) {
              activityFeedRef
                  .doc(ownerId)
                  .collection("feedItems")
                  .doc(postId)
                  .get()
                  .then((doc) {
                if (doc.exists) {
                  doc.reference.delete();
                }
              });
            }
          }
          handleDeletePost(BuildContext parentContext,{String communityId,String ownerId}) {
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
                            deletePost(postId:postId);
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

          handleLikePost() {
            bool _isLiked = likes[currentUserId] == true;

            if (_isLiked) {
              FirebaseFirestore.instance.collection('Community')
                  .doc(communityId)
                  .collection('communityPosts')
                  .doc(postId)
                  .update({'likes.$currentUserId': false});
              removeLikeFromActivityFeed();
              setState(() {
                likeCount -= 1;
                isLiked = false;
                likes[currentUserId] = false;
              });
            } else if (!_isLiked) {
              FirebaseFirestore.instance.collection('Community')
                  .doc(communityId)
                  .collection('communityPosts')
                  .doc(postId)
                  .update({'likes.$currentUserId': true});
              addLikeToActivityFeed();
              setState(() {
                likeCount += 1;
                isLiked = true;
                likes[currentUserId] = true;
//        showHeart = true;
              });
            }
          }

          report({String postId,String ownerId}){
            Fluttertoast.showToast(
                msg: "Your report has been submitted", timeInSecForIos: 4);
            FirebaseFirestore.instance.collection('reports')
                .doc(ownerId)
                .collection("userReports")
                .doc(postId)
                .set({
              "type": "communityPost",
              "userId": ownerId,
              "postId": postId,
              "timestamp": timestamp,
            });
          }
          tagView({String postId}){
            return
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Community')
                    .doc(communityId)
                    .collection('communityPosts')
                    .doc(postId)
                    .collection("tags")
                    .orderBy('timestamp',descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data.docs.isEmpty){
                    return
                      Container();
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
                            prodId:postId,

                          );
                        }
                    );
                  }
                },
              );

          }
          viewProducts({String postId}){
            return  showMaterialModalBottomSheet(
                context: context,
                builder: (BuildContext context)
                {

                  return
                    Container(   color:Colors.black,    height: MediaQuery.of(context).size.height/2,child:tagView(postId:postId),);
                });
          }




          return    type == 'SharedProd'?Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
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

              ),SizedBox( height:0.0,),
              GestureDetector(
                  onDoubleTap: handleLikePost,
                  onTap: () {
                    TaggerId = taggerId;
                    TaggerImg = taggerImg ;
                    TaggerName = taggerName;
                    TaggerCurrency =  taggerCurrency;
                    TaggerOwnerId = taggedOwnerId;
                    TaggerProdId = taggedId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          prodId: taggedId,
                          userId: taggedOwnerId,
                        ),
                      ),
                    );},
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: CachedImage(image,height: 300,)),

//           products(),

                    ],
                  )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$name",
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),                    ),
                  ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                ],
              ),
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
              ):
              Row(
                children: [
                  Text("${cf.format(usd, CurrencyFormatter.usd)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                ],
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
                        // fontWeight: FontWeight.bold,
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
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
                    ),
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: 28.0,
                      color: kText,
                    ),

                  ),


                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          ) :
          type == 'SharedResale'?Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                    onPressed: () {
                      !isPostOwner||widget.admins.contains(currentUser.id)?showDialog(
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
                          }):widget.admins.contains(currentUser.id)?handleDeletePost(context):handleDeletePost(context);
                    }),

              ),
              SizedBox( height:0.0,),
              GestureDetector(
                  onDoubleTap: handleLikePost,
                  onTap: () {
                    TaggerId = taggerId;
                    TaggerImg = taggerImg ;
                    TaggerName = taggerName;
                    TaggerCurrency =  taggerCurrency;
                    TaggerOwnerId = taggedOwnerId;
                    TaggerProdId = taggedId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>ResaleScreen(
                          postId: taggedId,
                          userId: taggedOwnerId,
                        ),
                      ),
                    );},
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: CachedImage(image,height: 300,)),

//           products(),

                    ],
                  )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$name",
                      style: TextStyle(
                        color: kText,
                         fontWeight: FontWeight.bold,
                      ),                    ),
                  ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                ],
              ),
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
              ):
              Row(
                children: [
                  Text("${cf.format(usd, CurrencyFormatter.usd)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                ],
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
                        // fontWeight: FontWeight.bold,
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
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
                    ),
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: 28.0,
                      color: kText,
                    ),

                  ),


                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          ) :
          type == 'SharedPost'?Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                    onPressed: () {
                      !isPostOwner||widget.admins.contains(currentUser.id)?showDialog(
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
                          }):widget.admins.contains(currentUser.id)?handleDeletePost(context):handleDeletePost(context);
                    }),

              ),
              SizedBox( height:0.0,),
              GestureDetector(
                  onDoubleTap: handleLikePost,
                   onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>PostScreen( userId:taggedOwnerId,postId:taggedId)));
         },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: CachedImage(image,height: 300,)),

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
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
                    ),
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: 28.0,
                      color: kText,
                    ),

                  ),


                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          ):
           type == 'SharedBlog'?Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                    onPressed: () {
                      !isPostOwner||widget.admins.contains(currentUser.id)?showDialog(
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
                          }):widget.admins.contains(currentUser.id)?handleDeletePost(context):handleDeletePost(context);
                    }),

              ),
              SizedBox( height:0.0,),
              GestureDetector(
                  onDoubleTap: handleLikePost,
                   onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>BlogScreen( userId:taggedOwnerId,blogId:taggedId)));
         },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: CachedImage(image,height: 300,)),

//           products(),

                    ],
                  )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$name ",
                      style:  GoogleFonts.bellotaText(fontSize: 25.0,fontWeight: FontWeight.bold),
                    ),
                  ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                ],
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
                        // fontWeight: FontWeight.bold,
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
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
                    ),
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: 28.0,
                      color: kText,
                    ),

                  ),


                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          ):
         type == 'SharedColl'?Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                    onPressed: () {
                      !isPostOwner||widget.admins.contains(currentUser.id)?showDialog(
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
                          }):widget.admins.contains(currentUser.id)?handleDeletePost(context):handleDeletePost(context);
                    }),

              ),
              SizedBox( height:0.0,),
              GestureDetector(
                  onDoubleTap: handleLikePost,
                   onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>CollScreen( userId:taggedOwnerId,collId:taggedId)));
         },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: CachedImage(image,height: 300,)),

//           products(),

                    ],
                  )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$name ",
                      style:  GoogleFonts.bellotaText(fontSize: 25.0,fontWeight: FontWeight.bold),
                    ),
                  ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                ],
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
                        // fontWeight: FontWeight.bold,
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
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
                    ),
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: 28.0,
                      color: kText,
                    ),

                  ),


                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          ):
  type == 'SharedComm'?Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                    onPressed: () {
                      !isPostOwner||widget.admins.contains(currentUser.id)?showDialog(
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
                          }):widget.admins.contains(currentUser.id)?handleDeletePost(context):handleDeletePost(context);
                    }),

              ),
              SizedBox( height:0.0,),

              GestureDetector(
                  onDoubleTap: handleLikePost,
                   onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>CollScreen( userId:taggedOwnerId,collId:taggedId)));
         },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: CachedImage(image,height: 300,)),

//           products(),

                    ],
                  )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$name ",
                      style:  GoogleFonts.bellotaText(fontSize: 25.0,fontWeight: FontWeight.bold),
                    ),
                  ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                ],
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
                        // fontWeight: FontWeight.bold,
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
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
                    ),
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: 28.0,
                      color: kText,
                    ),

                  ),


                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          ):

          type == 'originalPoll'?Column(children:[
            ListTile(
              leading: GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),

                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(photoUrl),
                  backgroundColor: Colors.grey,
                ),
              ),
              title: GestureDetector(
                onTap: () => showProfile(context, profileId: ownerId),
                child: Text(
                  username,
                  style: TextStyle(
                    color: kText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
                  onPressed: () {
                    !isPostOwner||widget.admins.contains(currentUser.id)?showDialog(
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
                        }):widget.admins.contains(currentUser.id)?handleDeletePost(context):handleDeletePost(context);
                  }),

            ),SizedBox( height:0.0,),

            documentSnapshot.data()['optionNos'] == 2?
            SimplePollsWidget(
              onSelection: (PollFrameModel model, PollOptions selectedOptionModel) {
                print('Now total polls are : ' + model.totalPolls.toString());
                print('Selected option has label : ' + selectedOptionModel.label);
                selectedOptionModel.id == 1?
                option1Total ++ :
                option2Total ++ ;


                total ++ ;

                Voters.add(currentUser.id);
                selectedOptionModel.id == 1?
                option1Voters.add(currentUser.id):
                option2Voters.add(currentUser.id);

                 FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
                    .update({

                  "total": total,

                  "option1Total":option1Total,
                  "option2Total":option2Total,

                  "option1Voters": option1Voters,
                  "option2Voters": option2Voters,


                  "Voters": Voters,


                });
              },
              onReset: (PollFrameModel model) {
                print(
                    'Poll has been reset, this happens only in case of editable polls');
              },
              optionsBorderShape: StadiumBorder(), //Its Default so its not necessary to write this line
              model: PollFrameModel(
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    documentSnapshot.data()['description'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                totalPolls: documentSnapshot.data()['total'],
                endTime: DateTime.now().toUtc().add(Duration(days: 10)),
                hasVoted: Voters.contains(currentUser.id)? true:false,
                editablePoll: false,
                options:[
                  PollOptions(
                    label: documentSnapshot.data()['option1'],
                    pollsCount: option1Total,
                    isSelected: option1Voters.contains(currentUser.id)?true:false,
                    id: 1,
                  ),
                  PollOptions(
                    label: documentSnapshot.data()['option2'],
                    pollsCount:option2Total,
                    isSelected: option2Voters.contains(currentUser.id)?true:false,
                    id: 2,
                  ),

                ],
              ),
            ):
  documentSnapshot.data()['optionNos'] == 3?
  SimplePollsWidget(
    onSelection: (PollFrameModel model, PollOptions selectedOptionModel) {
      print('Now total polls are : ' + model.totalPolls.toString());
      print('Selected option has label : ' + selectedOptionModel.label);
      selectedOptionModel.id == 1?
      option1Total ++ :
      selectedOptionModel.id == 2?
      option2Total ++ :
      option3Total ++;


      total ++ ;

      Voters.add(currentUser.id);
      selectedOptionModel.id == 1?
      option1Voters.add(currentUser.id):
      selectedOptionModel.id == 2?
      option2Voters.add(currentUser.id):
      option3Voters.add(currentUser.id);

       FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
          .update({

        "total": total,

        "option1Total":option1Total,
        "option2Total":option2Total,
        "option3Total":option3Total,


        "option1Voters": option1Voters,
        "option2Voters": option2Voters,
        "option3Voters": option3Voters,


        "Voters": Voters,


      });
    },
    onReset: (PollFrameModel model) {
      print(
          'Poll has been reset, this happens only in case of editable polls');
    },
    optionsBorderShape: StadiumBorder(), //Its Default so its not necessary to write this line
    model: PollFrameModel(
      title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          documentSnapshot.data()['description'],
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      totalPolls: documentSnapshot.data()['total'],
      endTime: DateTime.now().toUtc().add(Duration(days: 10)),
      hasVoted: Voters.contains(currentUser.id)? true:false,
      editablePoll: false,
      options:[
        PollOptions(
          label: documentSnapshot.data()['option1'],
          pollsCount: option1Total,
          isSelected: option1Voters.contains(currentUser.id)?true:false,
          id: 1,
        ),
        PollOptions(
          label: documentSnapshot.data()['option2'],
          pollsCount:option2Total,
          isSelected: option2Voters.contains(currentUser.id)?true:false,
          id: 2,
        ),
    PollOptions(
          label: documentSnapshot.data()['option3'],
          pollsCount: option3Total,
          isSelected: option3Voters.contains(currentUser.id)?true:false,
          id: 3,
        ),

      ],
    ),
  ):
documentSnapshot.data()['optionNos'] == 4?
SimplePollsWidget(
  onSelection: (PollFrameModel model, PollOptions selectedOptionModel) {
    print('Now total polls are : ' + model.totalPolls.toString());
    print('Selected option has label : ' + selectedOptionModel.label);
    selectedOptionModel.id == 1?
    option1Total ++ :
    selectedOptionModel.id == 2?
    option2Total ++ :
    selectedOptionModel.id == 3?
    option3Total ++:
    option4Total ++;

    total ++ ;

    Voters.add(currentUser.id);
    selectedOptionModel.id == 1?
    option1Voters.add(currentUser.id):
    selectedOptionModel.id == 2?
    option2Voters.add(currentUser.id):
    selectedOptionModel.id == 3?
    option3Voters.add(currentUser.id):
    option4Voters.add(currentUser.id);

     FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
        .update({

      "total": total,

      "option1Total":option1Total,
      "option2Total":option2Total,
      "option3Total":option3Total,
      "option4Total":option4Total,


      "option1Voters": option1Voters,
      "option2Voters": option2Voters,
      "option3Voters": option3Voters,
      "option4Voters": option4Voters,


      "Voters": Voters,


    });
  },
  onReset: (PollFrameModel model) {
    print(
        'Poll has been reset, this happens only in case of editable polls');
  },
  optionsBorderShape: StadiumBorder(), //Its Default so its not necessary to write this line
  model: PollFrameModel(
    title: Container(
      alignment: Alignment.centerLeft,
      child: Text(
        documentSnapshot.data()['description'],
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    totalPolls: documentSnapshot.data()['total'],
    endTime: DateTime.now().toUtc().add(Duration(days: 10)),
    hasVoted: Voters.contains(currentUser.id)? true:false,
    editablePoll: false,
    options:[
      PollOptions(
        label: documentSnapshot.data()['option1'],
        pollsCount: option1Total,
        isSelected: option1Voters.contains(currentUser.id)?true:false,
        id: 1,
      ),
      PollOptions(
        label: documentSnapshot.data()['option2'],
        pollsCount:option2Total,
        isSelected: option2Voters.contains(currentUser.id)?true:false,
        id: 2,
      ),
 PollOptions(
        label: documentSnapshot.data()['option3'],
        pollsCount: option3Total,
        isSelected: option3Voters.contains(currentUser.id)?true:false,
        id: 3,
      ),
    PollOptions(
        label: documentSnapshot.data()['option4'],
        pollsCount: option4Total,
        isSelected: option4Voters.contains(currentUser.id)?true:false,
        id: 4,
      ),

    ],
  ),
):
documentSnapshot.data()['optionNos'] == 5?
SimplePollsWidget(
  onSelection: (PollFrameModel model, PollOptions selectedOptionModel) {
    print('Now total polls are : ' + model.totalPolls.toString());
    print('Selected option has label : ' + selectedOptionModel.label);
    selectedOptionModel.id == 1?
    option1Total ++ :
    selectedOptionModel.id == 2?
    option2Total ++ :
    selectedOptionModel.id == 3?
    option3Total ++:
    selectedOptionModel.id == 4?
    option4Total ++:
    option5Total ++;

    total ++ ;

    Voters.add(currentUser.id);
    selectedOptionModel.id == 1?
    option1Voters.add(currentUser.id):
    selectedOptionModel.id == 2?
    option2Voters.add(currentUser.id):
    selectedOptionModel.id == 3?
    option3Voters.add(currentUser.id):
    selectedOptionModel.id == 4?
    option4Voters.add(currentUser.id):
    option5Voters.add(currentUser.id);
     FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
        .update({

      "total": total,

      "option1Total":option1Total,
      "option2Total":option2Total,
      "option3Total":option3Total,
      "option4Total":option4Total,
      "option5Total":option5Total,


      "option1Voters": option1Voters,
      "option2Voters": option2Voters,
      "option3Voters": option3Voters,
      "option4Voters": option4Voters,
      "option5Voters": option5Voters,

      "Voters": Voters,


    });
  },
  onReset: (PollFrameModel model) {
    print(
        'Poll has been reset, this happens only in case of editable polls');
  },
  optionsBorderShape: StadiumBorder(), //Its Default so its not necessary to write this line
  model: PollFrameModel(
    title: Container(
      alignment: Alignment.centerLeft,
      child: Text(
        documentSnapshot.data()['description'],
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    totalPolls: documentSnapshot.data()['total'],
    endTime: DateTime.now().toUtc().add(Duration(days: 10)),
    hasVoted: Voters.contains(currentUser.id)? true:false,
    editablePoll: false,
    options:[
      PollOptions(
        label: documentSnapshot.data()['option1'],
        pollsCount: option1Total,
        isSelected: option1Voters.contains(currentUser.id)?true:false,
        id: 1,
      ),
      PollOptions(
        label: documentSnapshot.data()['option2'],
        pollsCount:option2Total,
        isSelected: option2Voters.contains(currentUser.id)?true:false,
        id: 2,
      ),
      PollOptions(
        label: documentSnapshot.data()['option3'],
        pollsCount: option3Total,
        isSelected: option3Voters.contains(currentUser.id)?true:false,
        id: 3,
      ),
  PollOptions(
        label: documentSnapshot.data()['option4'],
        pollsCount: option4Total,
        isSelected: option4Voters.contains(currentUser.id)?true:false,
        id: 4,
      ),
   PollOptions(
        label: documentSnapshot.data()['option5'],
        pollsCount: option5Total,
        isSelected: option5Voters.contains(currentUser.id)?true:false,
        id: 5,
      ),
    ],
  ),
):

            SimplePollsWidget(
              onSelection: (PollFrameModel model, PollOptions selectedOptionModel) {
                print('Now total polls are : ' + model.totalPolls.toString());
                print('Selected option has label : ' + selectedOptionModel.label);
                selectedOptionModel.id == 1?
                option1Total ++ :
                selectedOptionModel.id == 2?
                option2Total ++ :
                selectedOptionModel.id == 3?
                option3Total ++:
                selectedOptionModel.id == 4?
                option4Total ++:
                selectedOptionModel.id == 5?
                option5Total ++:
                option6Total ++;

                total ++ ;

                Voters.add(currentUser.id);
                selectedOptionModel.id == 1?
                option1Voters.add(currentUser.id):
                selectedOptionModel.id == 2?
                option2Voters.add(currentUser.id):
                selectedOptionModel.id == 3?
                option3Voters.add(currentUser.id):
                selectedOptionModel.id == 4?
                option4Voters.add(currentUser.id):
                selectedOptionModel.id == 5?
                option5Voters.add(currentUser.id):
                option6Voters.add(currentUser.id);
                 FirebaseFirestore.instance.collection('Community')
          .doc(communityId)
          .collection('communityPosts')
          .doc(postId)
                    .update({

                  "total": total,

                  "option1Total":option1Total,
                  "option2Total":option2Total,
                  "option3Total":option3Total,
                  "option4Total":option4Total,
                  "option5Total":option5Total,
                  "option6Total":option6Total,

                  "option1Voters": option1Voters,
                  "option2Voters": option2Voters,
                  "option3Voters": option3Voters,
                  "option4Voters": option4Voters,
                  "option5Voters": option5Voters,
                  "option6Voters": option6Voters,

                  "Voters": Voters,


                });
              },
              onReset: (PollFrameModel model) {
                print(
                    'Poll has been reset, this happens only in case of editable polls');
              },
              optionsBorderShape: StadiumBorder(), //Its Default so its not necessary to write this line
              model: PollFrameModel(
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    documentSnapshot.data()['description'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                totalPolls: documentSnapshot.data()['total'],
                endTime: DateTime.now().toUtc().add(Duration(days: 10)),
                hasVoted: Voters.contains(currentUser.id)? true:false,
                editablePoll: false,
                options:[
                  PollOptions(
                    label: documentSnapshot.data()['option1'],
                    pollsCount: option1Total,
                    isSelected: option1Voters.contains(currentUser.id)?true:false,
                    id: 1,
                  ),
                  PollOptions(
                    label: documentSnapshot.data()['option2'],
                    pollsCount:option2Total,
                    isSelected: option2Voters.contains(currentUser.id)?true:false,
                    id: 2,
                  ),
                PollOptions(
                    label: documentSnapshot.data()['option3'],
                    pollsCount: option3Total,
                    isSelected: option3Voters.contains(currentUser.id)?true:false,
                    id: 3,
                  ),
                  PollOptions(
                    label: documentSnapshot.data()['option4'],
                    pollsCount: option4Total,
                    isSelected: option4Voters.contains(currentUser.id)?true:false,
                    id: 4,
                  ),
                  // null,
                 PollOptions(
                    label: documentSnapshot.data()['option5'],
                    pollsCount: option5Total,
                    isSelected: option5Voters.contains(currentUser.id)?true:false,
                    id: 5,
                  ),
                  PollOptions(
                    label: documentSnapshot.data()['option6'],
                    pollsCount: option6Total,
                    isSelected: option6Voters.contains(currentUser.id)?true:false,
                    id: 6,
                  ),
                ],
              ),
            )
          ]):
          Column(
            children:  <Widget> [
              ListTile(
                leading: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),

                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                    backgroundColor: Colors.grey,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Text(location,
                  style: TextStyle(color: kText),),
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
                                onTap: (){report(postId:postId,ownerId:ownerId);
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
                          }):handleDeletePost(context,ownerId:ownerId);
                    }),

              ),
              SizedBox( height:0.0,),
              GestureDetector(
                  onDoubleTap: (){handleLikePost();},
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
//          Text('text',style: TextStyle(color: kText),),
                      ClipRRect(borderRadius: BorderRadius.circular(20.0),
                          child: pics(userid:ownerId,prodid: postId)),

//           products(),

                    ],
                  )
              ),
              FutureBuilder(
                future:   FirebaseFirestore.instance.collection('Community')
                    .doc(widget.CommunityId)
                    .collection('communityPosts')
                    .doc(postId)
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
                        GFButton(
                          color: Colors.black,
                          shape:  GFButtonShape.pills,
                          textColor: Colors.black,
                          type : GFButtonType.outline,
                          onPressed:(){ viewProducts(postId:postId);},
                          text:"View Products",
                          icon: Icon(
                            Icons.add_shopping_cart,
                            // color: Colors.white,
                            size: 20.0,
                          ),

                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox( height:3.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: ExpandableText(
                      text:"$description ",
                      color: Colors.black,
                      size:15.0
                    ),
                  ),
//                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only( left: 20.0)),

                  GestureDetector(
                    onTap:()=>handleLikePost(),

                    child: ImageIcon(
                      isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                      color: kText,
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  GestureDetector(
                    onTap: () => showComments(
                      context,
                      postId: postId,
                      ownerId: ownerId,
                      mediaUrl: mediaUrl.first,
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
                      showModalBottomSheet(context: context, builder:(context) {
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
                                        postId:postId,
                                        ownerId:ownerId,
                                        type:"SharedComm",
                                        imageURL:mediaUrl.first,
                                        productname:description,

                                      ),
                                  ));
                                },
                                child: Text("Share to community",style: TextStyle(color: kText),),
                              ),
                              FutureBuilder<Uri>(
                                  future: _dynamicLinkService.createDynamicLink( postId:postId,ownerId: ownerId,Description: description,type: "communityPost",imageURL:mediaUrl.first),
                                  builder: (context, snapshot) {
                                    if(snapshot.hasData) {
                                      Uri uri = snapshot.data;
                                      return ElevatedButton(
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
                    child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only( left: 20.0)),

                  Container(
//                  margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${getLikeCount(likes)} likes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

//            SizedBox( height:10.0,),

            ],


          );


        },


        query: FirebaseFirestore.instance.collection('Community')
            .doc(widget.CommunityId)
            .collection('communityPosts')
            .orderBy('timestamp',descending: true),

      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(

          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return[
              SliverStickyHeader(
                header:Container(

                  color:Colors.black,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: CachedImage(
                              widget.photoUrl, width: MediaQuery
                                .of(context)
                                .size
                                .width ,height: MediaQuery
                                .of(context)
                                .size
                                .height / 3,fit: BoxFit.cover,),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment:Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    InkWell(
                                      onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context) =>ViewMembers(

                                        id:widget.CommunityId,

                                        members:   widget.members ,
                                        admins: widget.admins,
                                        banned:widget.banned,
                                      ))),
                                      child: Row(

                                        children: [
                                          Icon(Icons.group,color: Colors.white,),
                                          Text("${widget.members.length} members", softWrap: true,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
 Positioned.fill(
                            child: Align(
                              alignment:Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:IconButton(icon:Icon(Icons.arrow_back_ios),
                                color:Colors.white,
                                  onPressed: ()=>Navigator.pop(context),
                                ),
                              ),
                            ),
                          ),
                          widget.admins.contains(currentUser.id)? Positioned.fill(
                            child: Align(
                              alignment:Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:IconButton(icon:Icon(Icons.settings),
                                color:Colors.white,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>EditCommunity(

                                      CommunityId:widget.CommunityId,
                                      photoUrl:widget.photoUrl,
                                      description :widget.description,
                                      title :widget.title,
                                      members:   widget.members ,
                                      admins: widget.admins,
                                    )));
                                  },
                                ),
                              ),
                            ),
                          ):widget.members.contains(currentUser.id)? Align(
                                alignment:Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:ElevatedButton(child: Text("leave community"),
                                    onPressed: () {
                                      FirebaseFirestore.instance.collection('Community').doc(widget.CommunityId).update({
                                        "members":FieldValue.arrayRemove([currentUser.id])

                                      });
                                      Navigator.pop(context);},
                                  ),
                                ),
                              ):Container(),


                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                          children: [
                            Text(widget.title, softWrap: true,
                                overflow: TextOverflow.fade,
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                            SizedBox(height:15),
                             ExpandableText(text:widget.description,color:Colors.white70,size:15.0),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

              ),
            ];
          } ,



          body:                pagiante(),

        ),
floatingActionButton:widget.members.contains(currentUser.id)?SpeedDial(
    child:Icon(Icons.add),
    children:<SpeedDialChild>[
  SpeedDialChild(
child:Icon(Icons.dynamic_feed_outlined),
    label:'Upload a post',
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadCommunityPost(CommunityId:widget.CommunityId)));

    },
  ),
    SpeedDialChild(
child:Icon(Icons.poll),
    label:'Upload a poll',
      onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadCommunityPoll(CommunityId:widget.CommunityId)));

    },
  ),

]
):FloatingActionButton.extended(onPressed: (){
  FirebaseFirestore.instance.collection('Community').doc(widget.CommunityId).update({
    "members":FieldValue.arrayUnion([currentUser.id])

  });
  FirebaseFirestore.instance.collection('users')
      .doc(currentUser.id)
      .update({

    'communityId':FieldValue.arrayUnion([widget.CommunityId]),

  });
}, label: Text("Join")),
      ),
    );
  }

}


showComments(BuildContext context,
    {String postId, String ownerId, String mediaUrl, String communityId}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return CommunityComments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
      communityId: communityId,

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
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "EUR"?Row(
                    children: [
                      Text("${cf.format(eur, CurrencyFormatter.eur)}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):
                  currentUser.currency == "GBP"?Row(
                    children: [
                      Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ],
                  ):Row(
                    children: [
                      Text("${cf.format(usd, CurrencyFormatter.usd)}",
                          style: TextStyle(
                            color: Colors.white70,
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
