import 'package:badges/badges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fashow/Live/models/auction_model.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/SellerDash/alldash.dart';
import 'package:fashow/SellerDash/sellerdashboard.dart';
import 'package:fashow/Settings.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/clientreview.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/invoiceview.dart';
import 'package:fashow/page_view/chatlist.dart';
import 'package:fashow/servicedash/ServiceDash.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/post_screen.dart';

import 'package:fashow/Profile.dart';
import 'package:flutter/cupertino.dart';

import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/orders.dart';

class  ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class  _ActivityFeedState extends State<ActivityFeed>  with  TickerProviderStateMixin{
  int data;
  int serdata;
  final CollectionReference _messageCollection =
  FirebaseFirestore.instance.collection(MESSAGES_COLLECTION);

  final List<Tab> _tabs = [new Tab(title: "Notifications",color: kPrimaryColor),
    new Tab(title: "Chat",color: kPrimaryColor),
    new Tab(title: "Settings",color:kPrimaryColor),

  ];
  Tab _myHandler ;
  TabController _controller ;
  void initState() {
    super.initState();
    badgescountmessage();
    _controller = new TabController(length: 3, vsync: this);
    _myHandler = _tabs[1];
    _controller.addListener(_handleSelected);
    orderbadge();
    servicebadge();
    Updateread();
  }
  void _handleSelected() {
    setState(() {
      _myHandler= _tabs[_controller.index];
    });
  }

  Updateread() async { QuerySnapshot snapshot = await activityFeedRef
      .doc(currentUser.id)
      .collection('feedItems')
      .get();
  snapshot.docs.forEach((doc) {
    doc.reference.update({'read':'true'});
  });}

  getActivityFeed() async {
    QuerySnapshot snapshot = await activityFeedRef
        .doc(currentUser.id)
        .collection('feedItems')
        .orderBy('timestamp', descending: true)
        .limit(50)
        .get();
    List<ActivityFeedItem> feedItems = [];
    snapshot.docs.forEach((doc) {
      feedItems.add(ActivityFeedItem.fromDocument(doc));
      //   print('Activity Feed Item: ${doc.data}');
    });
    return feedItems;
  }
  badgescount()  {
    return
      StreamBuilder(
        stream:  activityFeedRef
            .doc(currentUser.id)
            .collection('feedItems')
            .where('read',isEqualTo: 'false').snapshots(),
        builder: (context,snapshot){

          if(snapshot.data==null){
return Container();
            }
            else {
            data += snapshot.data.docs.length;

              return
                Badge(

                  shape: BadgeShape.circle,
                  padding: EdgeInsets.all(2),
                  badgeContent: Text(
                    '$data', style: TextStyle(color: Colors.white),),
                );
            }
        },
      );

  }
  badgescountmessage()  {
    return
      StreamBuilder(
        stream:FirebaseFirestore.instance.collection('feed')
            .doc(currentUser.id)
            .collection('feedItems')
            .where('type',isEqualTo: 'Chat')
            .where('read',isEqualTo: 'false')

            .snapshots(),
        builder: (context,snapshot){

          if(snapshot.data==null){
            return Container();

          }
          else
          {
            data +=  snapshot.data.docs.length;


            return

              Badge(
                shape: BadgeShape.circle,
                padding: EdgeInsets.all(7),
                badgeContent: Text('$data',style: TextStyle(color: Colors.white),),
              );
          }


        },
      );

  }
  dashbadge(){

    if(serdata == null||data == null) {
      return Container();

    }else{
      var sum = serdata + data;
      return
        Badge(
          shape: BadgeShape.circle,
          padding: EdgeInsets.all(7),
          badgeContent: Text('$sum', style: TextStyle(color: Colors.white),),
        );
    }
  }
  orderbadge(){
    return
      StreamBuilder(
        stream:  FirebaseFirestore.instance.collection('ordersSeller')
            .doc(currentUser.id)
            .collection('sellerOrder')
            .where('read',isEqualTo: 'false').snapshots(),
        builder: (context,snapshot){
          if(snapshot.data.exists) {
            data +=  snapshot.data.docs.length;

            return
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Payments')
                    .doc(currentUser.id,)
                    .collection('SellerPayments')
                    .where('fulfilled', isEqualTo: 'true')
                    .where('read', isEqualTo: 'false').snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.data.exists) {
                    data += snapshot.data.docs.length;

                    return
                      Badge(
                        shape: BadgeShape.circle,
                        padding: EdgeInsets.all(7),
                        badgeContent: Text(
                          '$data ', style: TextStyle(color: Colors.white),),
                      );
                  }
                  else {
                    return Container();

                  }
                },
              );
          }
          else {
            return Container();

          }

        },
      );
  }
  servicebadge(){
    return
      StreamBuilder(
        stream:     FirebaseFirestore.instance.collection('serviceSeller')
            .doc(currentUser.id)
            .collection('sellerService')
            .where('read',isEqualTo: 'false').snapshots(),
        builder: (context,snapshot){
          if(snapshot.data.exists) {
            serdata += snapshot.data.docs.length;


            return
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Payments')
                    .doc(currentUser.id)
                    .collection('ServicePayments')
                    .where('fulfilled', isEqualTo: 'true')
                    .where('read', isEqualTo: 'false').snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.data.exists) {
                    setState(() {
                      serdata += snapshot.data.docs.length;
                    });
                    return
                      Badge(
                        shape: BadgeShape.circle,
                        padding: EdgeInsets.all(7),
                        badgeContent: Text(
                          '$serdata ', style: TextStyle(color: Colors.white),),
                      );
                  }
                  else{
                    return Container();

                  }
                },
              );
          }
          else{
            return Container();
          }
        },
      );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.0),
            child: AppBar(title:  FittedBox(
                fit: BoxFit.contain,child: Text(_myHandler.title,style: TextStyle(fontFamily: 'MajorMonoDisplay'),)),
                backgroundColor: _myHandler.color,

                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child:Container(
                    height: 80.0,
                    child: TabBar(
                      indicatorSize:TabBarIndicatorSize.tab,
                      indicator:BubbleTabIndicator(indicatorHeight:40.0,
                        indicatorColor: kblue,
                      ),
                      controller: _controller,
                      tabs: <Widget>[
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            children: [
                              Text('Notifications'),
                              badgescount(),
                            ],
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            children: [
                              Text('Chats'),
                             badgescountmessage(),
                            ],
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            children: [
                              Text('Settings'),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                iconTheme: new IconThemeData(color: kSecondaryColor),
                actions: <Widget>[

                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: Colors.blue),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                    ),
            ),
                   child: Row(
                     children: [
                       Container(
                         child:dashbadge(),
                       ),
                       SizedBox(width:2),
                       Text('Dashboard',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                     ],
                   ),
                    onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>AllDash()));
                      // do something
                    },
                  ),
                ]
            ),
          ),


          body: Container(
            child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      child: FutureBuilder(
                        future: getActivityFeed(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return circularProgress();
                          }
                          return new Expanded(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: snapshot.data,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                      children: [
                        Expanded(child: Container(child: ChatListScreen()))
                      ]),
                  Column(
                    children: [
                      Setting()
                    ],
                  ),

                ]),
          )




      ),
    );
  }
}
class Tab {
  final String title;
  final Color color;
  Tab({this.title,this.color});
}

Widget mediaPreview;
String activityItemText;

class ActivityFeedItem extends StatelessWidget {
  final String username;
  final String userId;
  final String type; // 'like', 'follow', 'comment'
  final String mediaUrl;
  final String postId;
  final String userProfileImg;
  final String commentData;
  final Timestamp timestamp;
final String message;


  ActivityFeedItem({
    this.username,
    this.userId,
    this.type, // 'like', 'follow', 'comment'
    this.mediaUrl,
    this.postId,
    this.userProfileImg,
    this.commentData,
    this.timestamp,
    this.message,

  });

  factory ActivityFeedItem.fromDocument(DocumentSnapshot doc) {
    return ActivityFeedItem(
      username: doc.data()['username'],
      userId: doc.data()['userId'],
      type: doc.data()['type'],
      mediaUrl: doc.data()['mediaUrl'],
      postId: doc.data()['postId'],
      userProfileImg: doc.data()['userProfileImg'],
      commentData: doc.data()['commentData'],
      timestamp: doc.data()['timestamp'],
      message: doc.data()['message'],

    );
  }

  showPost(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostScreen(
          postId: postId,
          userId: userId,
        ),
      ),
    );
  }
    showAuction(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AuctionModel(
          postId: postId,
          ownerId: userId,
        ),
      ),
    );
  }

  showProduct(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          prodId: postId,
          userId: userId,
        ),
      ),
    );
  }
 showBlog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogScreen(
          blogId: postId,
          userId: userId,
        ),
      ),
    );
  }
showColl(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollScreen(
          collId: postId,
          userId: userId,
        ),
      ),
    );
  }
showClient(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClientReview(
            profileId:userId,
        ),
      ),
    );
  }
showInvoiceView(context) {


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvoiceView(
          ownerId: userId,
            orderId:postId,
        ),
      ),
    );
  }
showSellerDash(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllDash(
          selectedPage: 0,
        ),
      ),
    );
  }
showServiceDash(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllDash(          selectedPage: 0,

        ),
      ),
    );
  }
 showAuctionDash(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllDash(          selectedPage: 2,

        ),
      ),
    );
  }

  showOrderpay(context) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SellerDash(          selectedPage: 1,

        ),
      ),
    );
  }
  showServicepay(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDash(          selectedPage: 1,

        ),
      ),
    );
  }
showOrders(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  Orders(),
      ),
    );
  }

  configureMediaPreview(context) {
    if (type == "like" || type == 'comment') {
      return
      mediaPreview = GestureDetector(
        onTap: () => showPost(context),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(mediaUrl),
                    )),
              ),
            ),
          ),
        ),
      );
    }
    else if (type == 'bloglike'||type == 'blogcomment'){
      return

        mediaPreview = GestureDetector(
        onTap: () => showBlog(context),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(mediaUrl),
                    )),
              ),
            ),
          ),
        ),
      );
    }
    else if (type == 'CollectionLikes'|| type == 'collectioncomment'){
      mediaPreview = GestureDetector(
        onTap: () => showColl(context),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(mediaUrl),
                    )),
              ),
            ),
          ),
        ),
      );
    }
    else if (type == 'Payment'||type == 'PaymentO'||type=='fav') {
      return

        mediaPreview = GestureDetector(
        onTap: () => showProduct(context),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(mediaUrl),
                    )),
              ),
            ),
          ),
        ),
      );
    }
    else if (type == 'ReviewO'){
      return

        mediaPreview = GestureDetector(
        onTap: () => showProduct(context),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(mediaUrl),
                    )),
              ),
            ),
          ),
        ),
      );
    }

    else {
      mediaPreview = Text('');
    }

  }
  configureactivityItemText(context) {

    if (type == 'like') {
      return

        activityItemText = "liked your post";
    }
   else if (type == 'bloglike') {
      activityItemText =  "liked your blog";
    }
   else if (type == 'CollectionLikes') {
      activityItemText = "liked your Collection";
    }
   else if (type == 'Videolike') {
      activityItemText = "liked your Video";
    }
    else if (type == 'follow') {
      return
      activityItemText = "is following you";
    }
    else if (type == 'comment') {
      activityItemText = 'Commented on your post: $commentData';
    }
    else if (type == 'Payment') {

      activityItemText = "$message";
    }
    else if (type == 'ReqPayment') {
      activityItemText = '$message';
    }
    else if (type == 'ReqPaymentI') {
      activityItemText = '$message';
    }
    else if (type == 'ReviewC') {
      activityItemText = '$message';
    }
    else if (type == 'ReviewO') {
      activityItemText = '$message';
    }
    else if (type == 'ServicePaymentI') {
      activityItemText = '$message';
    }
    else if (type == 'ServicePayment') {
      activityItemText = '$message';
    }
     else if (type == 'SupportPaymentSender') {
      activityItemText = '$message';
    }
    else if (type == 'SupportPaymentReceiver') {
      activityItemText = '$message';
    }
    
    else if (type == 'PaymentO') {
      return
      activityItemText = "$message";
    }
    else if (type == 'PaymentA') {
      activityItemText = '$message';
    }
    else if (type == 'PaymentOA') {
      activityItemText = '$message';
    }
    else if (type == 'topBid') {
      return
      activityItemText = "$message";
    }
    else if (type == 'Videocomment') {
      activityItemText = 'Commented on your video: $commentData';
    }
    else if (type == 'blogcomment') {
      activityItemText = 'Commented on your Blog: $commentData';
    }
    else if (type == 'collectioncomment') {
      activityItemText = 'Commented on your Collection: $commentData';
    }
else if (type == 'fav') {
      activityItemText = 'Someone wish listed an item from your shop';
    }else if (type == 'O') {
      activityItemText = 'Payments sent to your bank account';
    }else if (type == 'S') {
      activityItemText = 'Payments sent to your bank account';
    }

    else {
      activityItemText = "Error: Unknown type '$type'";
    }
  }

  supportPaymentSender(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );
}
 supportPaymentReceiver(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );
}

payent(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showOrders(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );
}

paymentA(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showOrders(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );
}
paymentOA(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showAuctionDash(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );
}
Auction(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showAuction(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'You have won an auction!',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );
}

blog(ParentContext){
  return
    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showBlog(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}
collection(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showColl(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}
payo(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showSellerDash(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}
prod(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showProduct(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}

  ReqPayment(ParentContext){
    return


      Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            color: Color(0XFFb3b3ff).withOpacity(0.3),
            child: ListTile(
              title: GestureDetector(
                onTap: () => showInvoiceView(ParentContext),
                child: RichText(
                  maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
                ),
              ),
              leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
              subtitle: Text(
                timeago.format(timestamp.toDate()),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: kSubtitle),
              ),
              trailing: mediaPreview,
            ),
          ),
        ),
      );

  }
ReqPaymentI(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showInvoiceView(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.visible,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}
  ReviewC(ParentContext){
    return

      Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            color: Color(0XFFb3b3ff).withOpacity(0.3),
            child: ListTile(
              title: GestureDetector(
                onTap: () => showClient(ParentContext),
                child: RichText(
                  maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
                ),
              ),
              leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
              subtitle: Text(
                timeago.format(timestamp.toDate()),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: kSubtitle),
              ),
              trailing: mediaPreview,
            ),
          ),
        ),
      );

  }
ReviewO(ParentContext){
  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showProduct(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}
  ServicePaymentI(ParentContext){
    return

      Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Container(
            color: Color(0XFFb3b3ff).withOpacity(0.3),
            child: ListTile(
              title: GestureDetector(
                onTap: () => showInvoiceView(ParentContext),
                child: RichText(
                  maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
                ),
              ),
              leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
              subtitle: Text(
                timeago.format(timestamp.toDate()),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: kSubtitle),
              ),
              trailing: mediaPreview,
            ),
          ),
        ),
      );

  }
ServicePayment(ParentContext){

  return

    Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0XFFb3b3ff).withOpacity(0.3),
          child: ListTile(
            title: GestureDetector(
              onTap: () => showInvoiceView(ParentContext),
              child: RichText(
                maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kText,
                  ),
                  children: [
                    TextSpan(
                      text: username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' $activityItemText',
                    )
                  ]),
              ),
            ),
            leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
            subtitle: Text(
              timeago.format(timestamp.toDate()),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kSubtitle),
            ),
            trailing: mediaPreview,
          ),
        ),
      ),
    );

}

   main(ParentContext){

     return
       Padding(
         padding: EdgeInsets.only(bottom: 2.0),
         child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
           child: Container(
             color: Color(0XFFb3b3ff).withOpacity(0.3),
             child: ListTile(
               title: GestureDetector(
                 onTap: () => showPost(ParentContext),
                 child: RichText(
                   maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                     style: TextStyle(
                       fontSize: 14.0,
                       color: kText,
                     ),
                     children: [
                       TextSpan(
                         text: username,
                         style: TextStyle(
                             fontWeight: FontWeight.bold, color: Colors.black),
                       ),
                       TextSpan(
                         text: ' $activityItemText',
                       )
                     ]),
                 ),
               ),
               leading: GestureDetector(
              onTap: () => showProfile(ParentContext,profileId: userId),
child:CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
            ),
),
               subtitle: Text(
                 timeago.format(timestamp.toDate()),
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(color: kSubtitle),
               ),
               trailing: mediaPreview,
             ),
           ),
         ),
       );
  }

  @override
  Widget build(BuildContext context) {
    configureMediaPreview(context);
    configureactivityItemText(context);
    // || type == 'Videocomment'|| type == 'Videolike'
    return type == 'like'|| type == 'follow'|| type == 'comment' ? main(context):
    type == 'bloglike'||type == 'blogcomment' ? blog(context) :
    type == 'CollectionLikes'|| type == 'collectioncomment'?collection(context) :
        type == 'fav' ? prod(context):
    type == 'Payment'?payent(context):
    type == 'PaymentO' ? payo(context):
    type == 'ReqPayment' ? ReqPayment(context):
      type == 'SupportPaymentSender' ? supportPaymentSender(context):
      type == 'SupportPaymentReceiver' ? supportPaymentReceiver(context):

     type == 'ReqPaymentI' ? ReqPaymentI(context):
     type == 'ReviewC' ? ReviewC(context):
     type == 'ReviewO' ? ReviewO(context):
     type == 'ServicePaymentI'?   ServicePaymentI(context):
      type == 'ServicePayment'?   ServicePayment(context):
      type == 'PaymentA'?   paymentA(context):
      type == 'PaymentOA'?   paymentOA(context):
       type == 'topBid'?   Auction(context):

    Container();

  }

}

showProfile(BuildContext context, {String profileId}) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Profile(
            profileId: profileId,
          )));
}