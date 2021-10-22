import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashow/Categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Categories/Men/Men.dart';
import 'package:fashow/Categories/Women/Women.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Resale/upload_resale.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/fav.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:fashow/shop_search.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/upload_Ecommerce.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view.dart';


class Resale extends StatefulWidget {
  final String condition;
  final String ownerId;
  final String username;
  final String photoUrl;
  final String currency;

  final String resaleId;
  final String description;
   final String shipment;
   final String country;
   final String color;
    final String title;
    final String size;

  final bool worldship;
  final bool freeworldship;
  final bool freeship;
  var usd;
   var eur;
   var gbp;
   var inr;
    var shipcostusd;
   var shipcosteur;
   var shipcostgbp;
   var shipcostinr;
     var shipcostinternusd;
   var shipcostinterneur;
   var shipcostinterngbp;
   var shipcostinterninr;
   var round;
  var shipfrom;
  var shipto;
  var shipinterfrom;
  var shipinterto;

  final List images;
  final dynamic likes;

   Resale({
    this.condition, this.ownerId, this.username, this.photoUrl,
    this.currency, this.resaleId, this.description, this.shipment,
    this.country, this.color, this.title, this.size, this.worldship,
    this.freeworldship, this.freeship, this.images, this.likes,
     this.usd,
     this.eur,
     this.gbp,
     this.inr,
     this.shipcostusd,
     this.shipcosteur,
     this.shipcostgbp,
     this.shipcostinr,
     this.shipcostinternusd,
     this.shipcostinterneur,
     this.shipcostinterngbp,
     this.shipcostinterninr,
     this.round,
     this.shipfrom,
     this.shipto,
     this.shipinterfrom,
     this.shipinterto,
   }) ;

  factory Resale.fromDocument(DocumentSnapshot doc) {
    return Resale(
        condition: doc.data()['condition'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
        currency: doc.data()['currency'],
      description: doc.data()['description'],
        resaleId: doc.data()['resaleId'],
      likes: doc.data()['likes'],
      photoUrl: doc.data()['photoUrl'],
        country: doc.data()['country'],
        shipment: doc.data()['shipment'],
        color: doc.data()['color'],
        title: doc.data()['title'],
        size: doc.data()['size'],
        worldship: doc.data()['worldship'],
        freeworldship: doc.data()['freeworldship'],
        freeship: doc.data()['freeship'],
        usd: doc.data()['usd'],
        eur: doc.data()['eur'],
        gbp: doc.data()['gbp'],
        inr: doc.data()['inr'],
        shipcostusd: doc.data()['shipcostusd'],
        shipcosteur: doc.data()['shipcosteur'],
        shipcostgbp: doc.data()['shipcostgbp'],
        shipcostinr: doc.data()['shipcostinr'],
        shipcostinternusd: doc.data()['shipcostinternusd'],
        shipcostinterneur: doc.data()['shipcostinterneur'],
        shipcostinterngbp: doc.data()['shipcostinterngbp'],
        shipcostinterninr: doc.data()['shipcostinterninr'],
        round: doc.data()['round'],
        shipto: doc.data()['shipto'],
        shipfrom: doc.data()['shipfrom'],
        shipinterfrom: doc.data()['shipinterfrom'],
        shipinterto: doc.data()['shipinterto'],
        images: doc.data()['images'],


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
  _ResaleState createState() => _ResaleState(
      condition: this.condition,
    ownerId: this.ownerId,
    username: this.username,
      resaleId: this.resaleId,
    description: this.description,
      shipment: this.shipment,
    likes: this.likes,
    photoUrl: this.photoUrl,
    currency: this.currency,
      country: this.country,
      color: this.color,
      title: this.title,
      size: this.size,
      worldship: this.worldship,
      freeworldship: this.freeworldship,
      freeship: this.freeship,
      usd: this.usd,
      eur: this.eur,
      gbp: this.gbp,
      inr: this.inr,
      shipcostusd: this.shipcostusd,
      shipcosteur: this.shipcosteur,
      shipcostgbp: this.shipcostgbp,
      shipcostinr: this.shipcostinr,
      shipcostinternusd: this.shipcostinternusd,
      shipcostinterneur: this.shipcostinterneur,
      shipcostinterngbp: this.shipcostinterngbp,
      shipcostinterninr: this.shipcostinterninr,
      round: this.round,
      shipfrom: this.shipfrom,
      shipto: this.shipto,
      shipinterfrom: this.shipinterfrom,
      shipinterto: this.shipinterto,
      images: this.images,

    likeCount: getLikeCount(this.likes),

  );
}

class _ResaleState extends State<Resale> {
  final String condition;
  final String ownerId;
  final String username;
  final String photoUrl;
  final String currency;

  final String resaleId;
  final String description;
  final String shipment;
  final String country;
  final String color;
  final String title;
  final String size;

  final bool worldship;
  final bool freeworldship;
  final bool freeship;
  var usd;
  var eur;
  var gbp;
  var inr;
  var shipcostusd;
  var shipcosteur;
  var shipcostgbp;
  var shipcostinr;
  var shipcostinternusd;
  var shipcostinterneur;
  var shipcostinterngbp;
  var shipcostinterninr;
  var round;
  var shipfrom;
  var shipto;
  var shipinterfrom;
  var shipinterto;
  final String currentUserId = currentUser?.id;

  final List images;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  List <Widget>listOfImages = <Widget>[];
  String media;
  int _current = 0;
  final CarouselController _ccontroller = CarouselController();
  _ResaleState({
      this.condition, this.ownerId, this.username, this.photoUrl,
      this.currency, this.resaleId, this.description, this.shipment,
      this.country, this.color, this.title, this.size, this.worldship,
      this.freeworldship, this.freeship, this.images, this.likes,
      this.usd,
      this.eur,
      this.gbp,
      this.inr,
      this.shipcostusd,
      this.shipcosteur,
      this.shipcostgbp,
      this.shipcostinr,
      this.shipcostinternusd,
      this.shipcostinterneur,
      this.shipcostinterngbp,
      this.shipcostinterninr,
      this.round,
      this.shipfrom,
      this.shipto,
      this.shipinterfrom,
      this.shipinterto, this.likeCount,});
  pics(){
    return
      FutureBuilder<QuerySnapshot> (
          future:    FirebaseFirestore.instance.collection('Resale')

              .doc(ownerId)

              .collection('userResale')
              .where('resaleId' ,isEqualTo: '$resaleId')
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

                    // List<String> images = List.from(snapshot.data.docs[index].data()['collimages']);
                    listOfImages = [];
                    for (int i = 0;
                    i <
                        snapshot.data.docs[index].data()['images']
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
                                        .data.docs[index].data()['images'][i])),),
                                );
                            },
                          );

                        },
                        child: CachedNetworkImage(imageUrl:snapshot
                            .data.docs[index].data()['images'][i]),
                      ));
                    }
                    return Column(
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
                                  height: 400,

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
    FirebaseFirestore.instance.collection('Resale')
        .doc(ownerId)
        .collection('userResale')
        .doc(resaleId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // delete uploaded image for the post
//    storageRef.child("postnow${postId}").delete();

    for ( var imageFile in images) {
      var photo =  FirebaseStorage.instance.refFromURL(imageFile) ;
      await photo.delete();}
    // then delete all activity feed notifications
    QuerySnapshot activityFeedSnapshot = await activityFeedRef
        .doc(ownerId)
        .collection("feedItems")
        .where('postId', isEqualTo: resaleId)
        .get();
    activityFeedSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // then delete all comments
    QuerySnapshot commentsSnapshot = await resalecommentsRef
        .doc(resaleId)
        .collection('comments')
        .get();
    commentsSnapshot.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleLikePost() {
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      FirebaseFirestore.instance.collection('Resale')
          .doc(ownerId)
          .collection('userResale')
          .doc(resaleId)
          .update({'likes.$currentUserId': false});
      removeLikeFromActivityFeed();
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      FirebaseFirestore.instance.collection('Resale')
          .doc(ownerId)
          .collection('userResale')
          .doc(resaleId)
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

  addLikeToActivityFeed() {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(resaleId)
          .set({
        "type": "resaleLike",
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": resaleId,
        "mediaUrl": images.first,
        "timestamp": timestamp,
        "read": 'false',
      });
    }
  }

  removeLikeFromActivityFeed() {
    bool isNotPostOwner = currentUserId != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(resaleId)
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
        .doc(resaleId)
        .set({
      "type": "post",
      "userId": ownerId,
      "postId": resaleId,
      "timestamp": timestamp,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   FutureBuilder(

        future:    FirebaseFirestore.instance.collection('Resale')

            .doc(currentUser.id)

            .collection('userResale').get(),

        builder: (context,snapshot)

        {



          return

            ListView.builder(physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,

                scrollDirection:Axis.vertical,

                itemCount: snapshot.data.docs.length,

                itemBuilder: (BuildContext context, int index) {

                  return Container(

                      child: CachedImage( snapshot.data.docs[index].data()['shopimages']

                          .first,

                      ));



                });

        },



      ),
    );

  }
}
