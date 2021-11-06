import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Categories/Men/Men.dart';
import 'package:fashow/Categories/Women/Women.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Resale/addressResale.dart';
import 'package:fashow/Resale/resaleCommenrs.dart';
import 'package:fashow/Resale/upload_resale.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/fav.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:flutter_currencies_tracker/currency.dart';
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
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:photo_view/photo_view.dart';

final List<String> cartNumbers = [
  "nROwtseY3nSUhoXoT2zf",
  "Tqd8WNBNZ7ADIWU3P2ci"];
final List<String> ids = [
  "nROXoT2zf",
  "Tqd8W2ci"];

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
  TextEditingController offerController = TextEditingController();

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
   var shipcostuser;
  final _formKey = GlobalKey<FormState>();
  var price;
  var USD;
  var GBP;
  var EUR;
  var INR;
  final String currentUserId = currentUser?.id;
  List<String> OwnerId  = [];
  List<String> Amount  = [];
  List<String> ResaleId  = [];
  List<String> profileimg  = [];
  List<String> Username  = [];
  List<String> Images  = [];
  List<String> Title  = [];
  List<String>  Country = [];
  List<String>  Size = [];
  List  shipcost = [];
  List  Usd = [];
  List  Eur = [];
  List  Gbp = [];
  List  Inr = [];
  List  Color = [];
  List<bool> ship = [];
  bool shipBool;
  final List images;
  int likeCount;
  Map likes;
  bool isLiked;
  bool loading;
  
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
                                  enlargeCenterPage: false,
                                  pauseAutoPlayOnManualNavigate: true,
                                  pauseAutoPlayOnTouch: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                )
                            )
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child:            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: images.asMap().entries.map((entry) {
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
  void initState() {

    super.initState();
    currentUser.currency =="INR" ?
    shipcostuser = currentUser.country == country?shipcostinr:shipcostinterninr:
    currentUser.currency =="EUR" ?
    shipcostuser = currentUser.country == country?shipcosteur:shipcostinterneur:
    currentUser.currency =="GBP" ?
    shipcostuser = currentUser.country == country?shipcostgbp:shipcostinterngbp:
    shipcostuser = currentUser.country == country?shipcostusd:shipcostinternusd;
shipBool = currentUser.country == country?freeship:freeworldship;



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
  void INRUSD() async {
    var I;
    var E;
    var G;
    var U;


    setState(() {
      loading = true;
      price = double.tryParse(offerController.text ?? "0.0");


    });
    if(currentUser.currency == "INR") {
      var resultUSD = await Currency.getConversion(
          from: 'INR', to: 'USD', amount: offerController.text ?? 0);
      var resultEUR = await Currency.getConversion(
          from: 'INR', to: 'EUR', amount: offerController.text ?? 0);
      var resultGBP = await Currency.getConversion(
          from: 'INR', to: 'GBP', amount: offerController.text ?? 0);
    

      setState(() {
        INR = price ?? 0.001;
        USD = resultUSD.rate ?? 0.001;
        EUR = resultEUR.rate ?? 0.001;
        GBP = resultGBP.rate ?? 0.001;
      

        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
      
        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
     
        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
      
      }); }
    else if(currentUser.currency == "EUR") {
      var resultUSD = await Currency.getConversion(
          from: 'EUR', to: 'USD', amount: offerController.text ?? 0);
      var resultINR = await Currency.getConversion(
          from: 'EUR', to: 'INR', amount: offerController.text ?? 0);
      var resultGBP = await Currency.getConversion(
          from: 'EUR', to: 'GBP', amount: offerController.text ?? 0);
     
      setState(() {
        INR =  resultINR.rate?? 0.001;
        USD = resultUSD.rate ?? 0.001;
        EUR = price ?? 0.001;
        GBP = resultGBP.rate ?? 0.001;
 
        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
       

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
       

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        

      }); }
    else if(currentUser.currency == "GBP") {
      var resultUSD = await Currency.getConversion(
          from: 'GBP', to: 'USD', amount: offerController.text ?? 0);
      var resultINR = await Currency.getConversion(
          from: 'GBP', to: 'INR', amount: offerController.text ?? 0);
      var resultEUR = await Currency.getConversion(
          from: 'GBP', to: 'EUR', amount: offerController.text ?? 0);

      setState(() {
        INR =  resultINR.rate?? 0.001;
        USD = resultUSD.rate ?? 0.001;
        EUR = resultEUR.rate  ?? 0.001;
        GBP =  price ?? 0.001;


        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
       

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
       

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        

      }); }
    else {
      var resultGBP = await Currency.getConversion(
          from: 'USD', to: 'GBP', amount: offerController.text ?? 0);
      var resultINR = await Currency.getConversion(
          from: 'USD', to: 'INR', amount: offerController.text ?? 0);
      var resultEUR = await Currency.getConversion(
          from: 'USD', to: 'EUR', amount: offerController.text ?? 0);

      setState(() {
        INR =  resultINR.rate?? 0.001;
        USD = price ?? 0.001;
        EUR = resultEUR.rate  ?? 0.001;
        GBP =   resultGBP.rate ?? 0.001;


        I = INR.toStringAsFixed(2);
        INR = double.tryParse(I);
       

        U = USD.toStringAsFixed(2);
        USD = double.tryParse(U);
       

        E = EUR.toStringAsFixed(2);
        EUR = double.tryParse(E);
        

        G = GBP.toStringAsFixed(2);
        GBP = double.tryParse(G);
        

      }); }



  }

  makeOffer(){
    FirebaseFirestore.instance.collection('Resale')
        .doc(ownerId)
        .collection('userResale').doc(resaleId) .collection('offers').doc(currentUser.id).set({
    'userId':currentUser.id,
   'name':currentUser.username,
   'img':currentUser.photoUrl,

    'usd':USD,
  'inr':INR,
    'eur':EUR,
    'gbp':GBP,
    'accepted' :false,
      
    });
    loading = false;
  }
  posteurope(){
    bool isPostOwner = currentUserId == ownerId;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),

          child: Expanded(
            child: Column(
              children:  [
                GestureDetector(
                  onTap:(){},
                  onDoubleTap: () {
                    handleLikePost();
                    Fluttertoast.showToast(
                        msg: "Added to Favorites! " , timeInSecForIos: 4);

                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.only
                            (bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                          child: Container(
                            //  height: MediaQuery.of(context).size.height * 0.65,

                              width:     MediaQuery.of(context).size.width,
                              child: pics())),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child:   ListTile(
                            leading:FloatingActionButton(
                              mini: true,
                              backgroundColor:Colors.white.withOpacity(0.5),
                              child:Icon(Icons.arrow_back_ios,color: Colors.white,),
                              onPressed:() { Navigator.pop(context);},
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () => showProfile(context, profileId: ownerId),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(photoUrl),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      username,
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
                    IconButton(
                      onPressed: (){
                        handleLikePost();
                        Fluttertoast.showToast(
                            msg: "Added to Favorites! " , timeInSecForIos: 4);
                      },
                      icon: Icon(
                        isLiked?   Icons.favorite:Icons.favorite_border ,
                        color:  Colors.black,
                      ),
                    ),
                    Container(
                      child: Text(
                        "$likeCount ",
                        style: TextStyle(
                          color:kText,
                          fontSize: 15.0,
                          //                      fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // FutureBuilder<Uri>(
                    //     future: _dynamicLinkService.createDynamicLink( postId:prodId,ownerId: ownerId,),
                    //     builder: (context, snapshot) {
                    //       if(snapshot.hasData) {
                    //         Uri uri = snapshot.data;
                    //         return IconButton(
                    //           color: Colors.black,
                    //           onPressed: () => Share.share(uri.toString()),
                    //           icon: Icon(Icons.send),
                    //         );
                    //       } else {
                    //         return Container();
                    //       }
                    //
                    //     }
                    // ),
                    Spacer(),
                    // InkWell(
                    //   onTap:() => reviews(),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.star_border_rounded,
                    //         color:  Colors.black,
                    //       ),
                    //       Icon(
                    //         Icons.star_border_rounded,
                    //         color:  Colors.black,
                    //       ),
                    //       Icon(
                    //         Icons.star_border_rounded,
                    //         color:  Colors.black,
                    //       ),
                    //       Icon(
                    //         Icons.star_border_rounded,
                    //         color:  Colors.black,
                    //       ),
                    //       Icon(
                    //         Icons.star_border_rounded,
                    //         color:  Colors.black,
                    //       ),
                    //
                    //
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "$title ",
                          style: TextStyle(
                            color: kText,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                        subtitle:    currentUser.country == "$country" ?  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            freeship?Container(
                                color:Colors.grey.withOpacity(0.2),
                                child:   Text(
                                  "FREE SHIPPING",
                                  style: TextStyle(
                                    color: Colors.black,

                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                )
                            ) :
                            currentUser.currency == "INR"? Row(
                              children: [
                                Text(" ${cf.format(shipcostinr, CurrencyFormatter.inr)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            currentUser.currency == "EUR"?Row(
                              children: [
                                Text("${cf.format(shipcostusd, CurrencyFormatter.usd)}  €",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            currentUser.currency == "GBP"?Row(
                              children: [
                                Text(" ${cf.format(shipcostgbp, CurrencyFormatter.gbp)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):Row(
                              children: [
                                Text("${cf.format(shipcostusd, CurrencyFormatter.usd)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),

                          ],
                        ):   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

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
                            freeworldship?Container(
                                color:Colors.grey.withOpacity(0.2),
                                child:   Text(
                                  "FREE SHIPPING",
                                  style: TextStyle(
                                    color: Colors.black,

                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                )
                            ) :
                            currentUser.currency == "INR"? Row(
                              children: [
                                Text("${cf.format(shipcostinterninr, CurrencyFormatter.inr)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            currentUser.currency == "EUR"?Row(
                              children: [
                                Text("${cf.format(shipcostinterneur, CurrencyFormatter.eur)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):
                            currentUser.currency == "GBP"?Row(
                              children: [
                                Text("${cf.format(shipcostinterngbp, CurrencyFormatter.gbp)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ):Row(
                              children: [
                                Text("${cf.format(shipcostinternusd, CurrencyFormatter.usd)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),

                          ],
                        ) ,
                        trailing: FloatingActionButton(
                          heroTag:null,
                          backgroundColor: Colors.black,
                          onPressed: (){
                            },
                          child:   Icon(Icons.add_shopping_cart,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                        ),
                      ),
                    ),

                  ],
                ),
                worldship == false?Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading:  Icon(Icons.cancel, color: Colors.red),
                        title: Text(
                          "This product doesn't ship worldwide,check shipping & returns info below ",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),

                  ],
                ):Text(''),
                ListTileTheme(
                  tileColor:trans,
                  child: ExpansionTile(
                    backgroundColor:trans,
                    title:  Text(
                      "Make offer",
                      style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                    trailing:Icon(Icons.expand_more,color: kText,),

                    maintainState: true,
                    children: [

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                         isPostOwner?Container():   Form(
                              key: _formKey,
                              child: Row(
                                children: [
                                  TextFormField(
                                    style:TextStyle(color: kText),
                                    controller: offerController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                                      labelText: 'Make offer',labelStyle: TextStyle(color: kText),
                                      hintText:
                                      currentUser.currency == "INR"?'₹':
                                      currentUser.currency == "EUR"?'€':
                                      currentUser.currency == "GBP"?'£':'\u0024',                                          ),
                                    textAlign: TextAlign.center,
                                    validator: (text) {
                                      if ( text.isEmpty) {
                                        return 'should not be  empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  FloatingActionButton(
                                    heroTag:null,
                                    backgroundColor: Colors.black,
                                    onPressed: ()async{
                                      Fluttertoast.showToast(
                                          msg: "Please wait:Uploading", timeInSecForIos: 4);


                                      if(_formKey.currentState.validate()) {
                                        // ignore: unnecessary_statements
                                        await INRUSD();

                                        loading?makeOffer():null;
                                       loading = false;
                                      }
                                    },
                                    child: loading? CircularProgressIndicator():  Icon(Icons.done_outline_rounded,),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                                  ),
                                ],
                              ),
                            ),

                            PaginateFirestore(
                                isLive: true,
                                emptyDisplay: Center(child: Text("No reviews",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),)),
                                itemBuilderType:
                                PaginateBuilderType.listView,
                                itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.docs[index];
                                  String ownerId = documentSnapshot.data()['userId'];
                                    String name = documentSnapshot.data()['name'];
                                    String img = documentSnapshot.data()['img'];

 var usd =   documentSnapshot.data()['usd'];
 var inr =   documentSnapshot.data()['inr'];
 var gbp =   documentSnapshot.data()['gbp'];
 var eur =   documentSnapshot.data()['eur'];
bool accepted = documentSnapshot.data()['accepted'];

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading:        GestureDetector(
                                            onTap: () => showProfile(context, profileId: ownerId),
                                            child: CircleAvatar(
                                              backgroundImage: CachedNetworkImageProvider(img),
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                          title:        GestureDetector(
                                            onTap: () => showProfile(context, profileId: ownerId),
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                color: kText,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          subtitle:        currentUser.currency == "INR"? Text("${cf.format(inr, CurrencyFormatter.inr)}",
                                              ):
                                          currentUser.currency == "EUR"?Text("${cf.format(eur, CurrencyFormatter.eur)}",
                                              ):
                                          currentUser.currency == "GBP"?Text("${cf.format(gbp, CurrencyFormatter.gbp)}",
                                              ):Text("${cf.format(usd, CurrencyFormatter.usd)}",
                                                  ) ,
                                          trailing:isPostOwner?             TextButton(
onPressed:(){FirebaseFirestore.instance.collection('Resale')
    .doc(ownerId)
    .collection('userResale').doc(resaleId) .collection('offers').doc(ownerId).update(
    {"accepted":true});},
                                              child:Text("Accept")
                                          ):
                                         accepted? TextButton(
                                              onPressed:() async{await addingToList();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => AddressResale(
                                                    OwnerId:OwnerId,
                                                    resaleId:ResaleId ,
                                                    profileimg: profileimg,
                                                    username: Username,
                                                    images:Images,
                                                    title:Title,
                                                    country:Country,
                                                    size:Size,
                                                    shipcost:shipcost,
                                                    usd:Usd,
                                                    eur:Eur,
                                                    gbp:Gbp,
                                                    inr:Inr,
                                                    ship: ship,
                                                  ),
                                                ),
                                              );},
                                              child:Text("Buy Now")
                                          ):Container(),

                                        ),

                                      ],

                                    ),
                                  );
                                },
                                query: FirebaseFirestore.instance.collection('Resale')
                                    .doc(ownerId)
                                    .collection('userResale').doc(resaleId) .collection('offers').orderBy('usd',descending: true)


                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 ListTileTheme(
                  tileColor:trans,
                  child: ExpansionTile(
                    backgroundColor:trans,
                    title:  Text(
                      " Description",
                      style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                    trailing:Icon(Icons.expand_more,color: kText,),

                    maintainState: true,
                    children: [

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ExpandableText("$description",),
                            SizedBox(height: 8,),
                            Text("Color:",style: TextStyle(
                              color: kText.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            Text('$color',style: TextStyle(
                              color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 8,),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ListTileTheme(
                  tileColor:trans,
                  child: ExpansionTile(
                    backgroundColor:trans,
                    // leading: Icon(Icons.local_shipping,color: kText,),
                    title:  Text(
                      " Shipping  and Returns:",
                      style: TextStyle(
                        color: kText.withOpacity(0.5),
                        fontWeight: FontWeight.bold,fontSize: 20,
                      ),),
                    trailing:Icon(Icons.expand_more,color: kText,),
                    maintainState: true,
                    children: [

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[

                            Text('Shipping  and Returns:',style: TextStyle(
                              color: kText.withOpacity(0.5),
                              fontWeight: FontWeight.bold,fontSize: 20,
                            ),),
                           ListTile(title: Text('Shipping duration to ${country}'),
                                subtitle:Text("$shipfrom - $shipto")
                            ),ListTile(title: Text('International shipping duration'),
                                subtitle:Text("$shipinterfrom - $shipinterto")
                            ),
                            Text('$shipment', maxLines: 1,softWrap:false,overflow:TextOverflow.fade,style: TextStyle(
                              color: kText.withOpacity(0.5),
//                          fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),                ],
                  ),
                ),
              ],
            ),
          ),

        ),
      ],
    );
  }
addingToList(){
   OwnerId.add(ownerId);
   Amount ;
   ResaleId.add(resaleId) ;
   profileimg.add(photoUrl) ;
   Username.add(username) ;
   Images.add(images.first) ;
   Title.add(title) ;
    Country.add(country);
    Size.add(size);
    shipcost.add(shipcostuser);
    Usd.add(usd);
    Eur.add(eur);
    Gbp.add(gbp);
    Inr.add(inr);
    ship.add(shipBool);
     Color.add(color);

}
  @override
  Widget build(BuildContext context) {
    isLiked = (likes[currentUserId] == true);

    return Column(children:[posteurope(),
      Container(height: MediaQuery.of(context).size.height/10,child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation : 0.001,
                primary: Colors.grey.withOpacity(0.3), ),
              onPressed: () => Tagger(),
              child: Text('Post', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                //   fontSize:  ,
                  color: Colors.white),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation : 0.001,
                primary:  Colors.black, ),
              onPressed:() async{await addingToList();
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddressResale(
                      OwnerId:OwnerId,
                       resaleId:ResaleId ,
                   profileimg: profileimg,
                  username: Username,
                   images:Images,
                   title:Title,
                    country:Country,
                   size:Size,
                shipcost:shipcost,
                   usd:Usd,
                  eur:Eur,
                        gbp:Gbp,
                     inr:Inr,
                    ship: ship,
                  ),
                ),
              );},
              child: Text('Buy Now', style: TextStyle(
                // fontFamily :"MajorMonoDisplay",
                //   fontSize:  ,
                  color: Colors.white),),
            )

          ]
      ),),

    ]);

  }
  Tagger(){
TaggerId ==""? print(true):print(false);
    // FirebaseFirestore.instance.collection('Influence')
    //     .doc("TaggerId")
    //     .collection('InfluenceCommission')
    //     .doc("orderId").set({
    //   "totalEarnings":TaggerCurrency == "INR"?0.03*inr:TaggerCurrency == "EUR"?0.03*eur:TaggerCurrency == "GBP"?0.03*gbp:0.03*usd,
    // });

    // FirebaseFirestore.instance.collection('Earnings')
    //     .doc(ownerId)
    //     .update({
    //   "Balance": 0,
    //
    // });
    setState(() {
      TaggerImg = "";
      TaggerId = "";
      TaggerName = "";
      TaggerCurrency = "";
    });
  }

}
showComments(BuildContext context,
    {String postId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ResaleComments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
    );
  }));
}
Future update(List<String> cartNumbers) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();

  // 1. Get all items
  // 2. Iterate through each item
  // 3. Parse each document ID
  // 4. Check if cart_numers contains item
  // 5. Change quantity

  FirebaseFirestore.instance.collection("test").get().then((querySnapshot) {
    querySnapshot.docs.forEach((document) {
      try {

        // Only if DocumentID has only numbers
        if (cartNumbers.contains(document.id)) {
          batch.update(document.reference,
              {"sold": false});
          for(var i=0;i < ids.length;i++) {
            FirebaseFirestore.instance.collection("test")
                .doc(ids[i].toString())
                .set({
              "ids":ids[i].toString(),
              "c":cartNumbers[i].toString(),
              "id": "4",
              "sold": false,
            });
          }
        }
      } on FormatException catch (error) {

        // If a document ID is unparsable. Example "lRt931gu83iukSSLwyei" is unparsable.
        print("The document ${error.source} could not be parsed.");
        return null;
      }
    });
    return batch.commit();
  });
}
