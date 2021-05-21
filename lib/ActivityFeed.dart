import 'package:badges/badges.dart';
import 'package:fashow/OrderView.dart';
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

class  ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class  _ActivityFeedState extends State<ActivityFeed>  with  TickerProviderStateMixin{
  int data;
  int serdata;
  final CollectionReference _messageCollection =
  Firestore.instance.collection(MESSAGES_COLLECTION);

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
      .document(currentUser.id)
      .collection('feedItems')
      .getDocuments();
  snapshot.documents.forEach((doc) {
    doc.reference.updateData({'read':'true'});
  });}

  getActivityFeed() async {
    QuerySnapshot snapshot = await activityFeedRef
        .document(currentUser.id)
        .collection('feedItems')
        .orderBy('timestamp', descending: true)
        .limit(50)
        .getDocuments();
    List<ActivityFeedItem> feedItems = [];
    snapshot.documents.forEach((doc) {
      feedItems.add(ActivityFeedItem.fromDocument(doc));
      //   print('Activity Feed Item: ${doc.data}');
    });
    return feedItems;
  }
  badgescount()  {
    return
    StreamBuilder(
      stream:  activityFeedRef
          .document(currentUser.id)
          .collection('feedItems')
          .where('read',isEqualTo: 'false').snapshots(),
      builder: (context,snapshot){
        int data =  snapshot.data.documents.length;
        return
          Badge(
            shape: BadgeShape.circle,
            padding: EdgeInsets.all(7),
            badgeContent: Text('$data',style: TextStyle(color: kText),),
          );

      },
    );

  }

  badgescountmessage()  {
    return
    StreamBuilder(
      stream: _messageCollection
          .document(currentUser.id)
        .snapshots(),

      builder: (context,snapshot){
        if(!snapshot.hasData){return Container();}
        else{ int data;
        String messages = snapshot.data['read'];
        print("mess:$messages");
        if(messages == 'false');
        {
          setState(() {
            data  = messages.length;
          });
          return

            Badge(
              shape: BadgeShape.circle,
              padding: EdgeInsets.all(7),
              badgeContent: Text('$data',style: TextStyle(color: kText),),
            );
        }

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
          badgeContent: Text('$sum', style: TextStyle(color: kText),),
        );
    }
  }
  orderbadge(){
    return
    StreamBuilder(
      stream:  Firestore.instance.collection('ordersSeller')
          .document(currentUser.id)
          .collection('sellerOrder')
          .where('read',isEqualTo: 'false').snapshots(),
      builder: (context,snapshot){

          data =  snapshot.data.documents.length ?? 0;


        return
          StreamBuilder(
            stream:   Firestore.instance.collection('Payments')
                .document(currentUser.id,)
                .collection('SellerPayments')
                .where('fulfilled',isEqualTo: 'true')
                .where('read',isEqualTo: 'false').snapshots(),
            builder: (context,snapshot){

              setState(() {
                data =  data + snapshot.data.documents.length ?? 0;
              });
              return
                Badge(
                  shape: BadgeShape.circle,
                  padding: EdgeInsets.all(7),
                  badgeContent: Text('$data ',style: TextStyle(color: kText),),
                );

            },
          );


      },
    );
  }
  servicebadge(){
    return
    StreamBuilder(
      stream:     Firestore.instance.collection('serviceSeller')
          .document(currentUser.id)
          .collection('sellerService')
          .where('read',isEqualTo: 'false').snapshots(),
      builder: (context,snapshot){
        setState(() {
          serdata =  snapshot.data.documents.length ?? 0;
        });

        return
          StreamBuilder(
            stream:   Firestore.instance.collection('Payments')
                .document(currentUser.id)
                .collection('ServicePayments')
                .where('fulfilled',isEqualTo: 'true')
                .where('read',isEqualTo: 'false').snapshots(),
            builder: (context,snapshot){
              setState(() {
                serdata =   serdata + snapshot.data.documents.length;
              });
              return
                Badge(
                  shape: BadgeShape.circle,
                  padding: EdgeInsets.all(7),
                  badgeContent: Text('$serdata ',style: TextStyle(color: kText),),
                );

            },
          );


      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(title:  FittedBox(
              fit: BoxFit.contain,child: Text(_myHandler.title,style: TextStyle(fontFamily: 'MajorMonoDisplay'),)),
              backgroundColor: _myHandler.color,

              bottom: new TabBar(

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
                        // badgescountmessage(),
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
              iconTheme: new IconThemeData(color: kSecondaryColor),
//            leading:IconButton(  icon: Icon(
//              Icons.menu,
//              color: Colors.blue,),
              actions: <Widget>[

                Stack(
                  children: [
                    OutlineButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     child: Text('DashBoard',style: TextStyle(color: kText),),
                      onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) =>AllDash()));
                        // do something
                      },
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        child:dashbadge(),
                      ),
                    ),

                  ],
                ),
              ]
          ),
        ),






        body: TabBarView(
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
                  Settings()
                ],
              ),

            ])




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
      username: doc['username'],
      userId: doc['userId'],
      type: doc['type'],
      mediaUrl: doc['mediaUrl'],
      postId: doc['postId'],
      userProfileImg: doc['userProfileImg'],
      commentData: doc['commentData'],
      timestamp: doc['timestamp'],
      message: doc['message'],

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
showOrderView(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderView(
          orderId:postId,
        ),
      ),
    );
  }
showInvoiceView(context) {
  print(postId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvoiceView(
            orderId:postId,
        ),
      ),
    );
  }
showSellerDash(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SellerDash(
        ),
      ),
    );
  }
showServiceDash(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDash(
        ),
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
    else if (type == 'PaymentO') {
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
      activityItemText = 'Wishlisted an item in your shop';
    }

    else {
      activityItemText = "Error: Unknown type '$type'";
    }
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
              onTap: () => showOrderView(ParentContext),
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
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                    text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kText,
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                  maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kText,
                      ),
                      children: [
                        TextSpan(
                          text: username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kUser),
                        ),
                        TextSpan(
                          text: ' $activityItemText',
                        )
                      ]),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
              onTap: () => showServiceDash(ParentContext),
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
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                  maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                      text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kText,
                      ),
                      children: [
                        TextSpan(
                          text: username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kUser),
                        ),
                        TextSpan(
                          text: ' $activityItemText',
                        )
                      ]),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                onTap: () => showServiceDash(ParentContext),
                child: RichText(
                  maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                      text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kText,
                      ),
                      children: [
                        TextSpan(
                          text: username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kUser),
                        ),
                        TextSpan(
                          text: ' $activityItemText',
                        )
                      ]),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                            fontWeight: FontWeight.bold, color: kUser),
                      ),
                      TextSpan(
                        text: ' $activityItemText',
                      )
                    ]),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userProfileImg),
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
                 onTap: () => showProfile(ParentContext, profileId: userId),
                 child: RichText(
                   maxLines: 1,softWrap:false,overflow:TextOverflow.fade,                       text: TextSpan(
                       style: TextStyle(
                         fontSize: 14.0,
                         color: kText,
                       ),
                       children: [
                         TextSpan(
                           text: username,
                           style: TextStyle(
                               fontWeight: FontWeight.bold, color: kUser),
                         ),
                         TextSpan(
                           text: ' $activityItemText',
                         )
                       ]),
                 ),
               ),
               leading: CircleAvatar(
                 backgroundImage: CachedNetworkImageProvider(userProfileImg),
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

    return type == 'like'|| type == 'follow'|| type == 'comment' || type == 'Videocomment'|| type == 'Videolike'? main(context):
    type == 'bloglike'||type == 'blogcomment' ? blog(context) :
    type == 'CollectionLikes'|| type == 'collectioncomment'?collection(context) :
        type == 'fav' ? prod(context):
    type == 'Payment'?payent(context):
    type == 'PaymentO' ? payo(context):
    type == 'ReqPayment' ? ReqPayment(context):
     type == 'ReqPaymentI' ? ReqPaymentI(context):
     type == 'ReviewC' ? ReviewC(context):
     type == 'ReviewO' ? ReviewO(context):
     type == 'ServicePaymentI'?   ServicePaymentI(context):
      type == 'ServicePayment'?   ServicePayment(context):
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