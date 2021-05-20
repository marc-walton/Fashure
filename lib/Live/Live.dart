import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fashow/Live/video_comments.dart';
import 'package:fashow/post.dart';
import 'package:fashow/utils/universal_variables.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:fashow/Live/models/livemodel.dart';



import 'package:fashow/Live/host.dart';
import 'package:fashow/Live/join.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class LiveTv extends StatefulWidget {

  @override
  _LiveTvState createState() => _LiveTvState();

}

class _LiveTvState extends State<LiveTv> with  TickerProviderStateMixin {
  final String currentUserId = currentUser?.id;

  final FlareControls flareControls = FlareControls();
  final databaseReference = Firestore.instance;
  String videoId;
  String mediaUrl;
  String OwnerId;

  List<Live> list =[];
  bool ready =false;
  Live liveUser;
  var name;
  var image;
  var username;
   var ownerId;
  int likeCount;
  Map likes;
  bool isLiked;
  bool showHeart = false;
  var postUsername;
 String followingList  ;
  List<Post> posts;
 List<NetworkImage> _listOfImages = <NetworkImage>[];

 String version = 'Unknown';
 final int appID = 1234567890;
 final String appSign = 'abcdefghijklmnopqrstuvwzyv123456789abcdefghijklmnopqrstuvwzyz123';

 // Specify test environment and app scenario
 final bool isTestEnv = true;
 final ZegoScenario scenario = ZegoScenario.General;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          appBar:  AppBar(title:  FittedBox(fit:BoxFit.contain,child: Text('FashureTV',style: TextStyle(fontSize: 20,color: kText,fontFamily: 'MajorMonoDisplay'),),),
            backgroundColor:kPrimaryColor,

          ),
        body:
        Container(
          decoration: BoxDecoration(
              gradient: fabGradient
          ) ,
          alignment: Alignment.center,
          child: Column(children:[
            SizedBox(height: 8),

            FittedBox(fit:BoxFit.contain,child: Text('Go Live',style: TextStyle(fontSize: 20,color: kText,),)),
          Container(
          height: 250,
          child: getStories(),
    ),
           Center(child: getvid(),)

    ]),
        ),

      ),
    );

  }

 @override
 void initState() {

   loadSharedPref();
   list = [];
   liveUser = new Live(username: name,me: true,image:image );
   setState(() {
     list.add(liveUser);
   });
   dbChangeListen();
   /*var date = DateTime.now();
    var newDate = '${DateFormat("dd-MM-yyyy hh:mm:ss").format(date)}';
    */
 }

 Future<void> loadSharedPref() async{
   // final prefs = await SharedPreferences.getInstance();
   setState(() {
     name = currentUser.displayName;
     username = currentUser.id;
     image = currentUser.photoUrl;
 ownerId = currentUser.id;
   });
 }

 void dbChangeListen(){
   databaseReference.collection('liveuser').orderBy("time",descending: true)
       .snapshots()
       .listen((result) {   // Listens to update in appointment collection

     setState(() {
       list = [];
       liveUser = new Live(username: name,me: true,image:image,ownerId: ownerId );
       list.add(liveUser);
     });
     result.documents.forEach((result) {
       setState(() {
         list.add(new Live(username: result.data['name'],image: result.data['image'],channelId:result.data['channel'],me: false));

       });
     });
   });

 }

 Widget getStories() {
   return ListView(

       scrollDirection: Axis.horizontal,
       children: getUserStories()
   );
 }

 List<Widget> getUserStories() {
   List<Widget> stories = [];
   for (Live users in list) {
     stories.add(getStory(users));
   }
   return stories;
 }

 Widget getStory(Live users) {
   return Container(
     margin: EdgeInsets.only(left:1.0,right:4.0,bottom :1.0,top:1.0),
     child: Column(
       children: <Widget>[
         Container(
             height: 150,
             width: 150,
             child: GestureDetector(
               onTap: (){
                 if(users.me==true){
                   // Host function
                   onCreate(username: users.username, image: users.image);
                 }
                 else{
                   // Join function
                   onJoin(channelName: users.username,channelId: users.channelId,username: username, hostImage: users.image,userImage: image);
                 }
               },
               child: Stack(
                 alignment: Alignment(0, 0),
                 children: <Widget>[
                   !users.me ?

                   Container(
                     height: 150,
                     width: 150,
                     child: Container(
                       decoration: BoxDecoration(
                           shape: BoxShape.rectangle,
                           gradient: LinearGradient(
                               colors: [
                                 Colors.indigo,
                                 Colors.blue,
                                 Colors.cyan
                               ],
                               begin: Alignment.topLeft,
                               end: Alignment.bottomRight
                           ),
                       ),
                     ),
                   ) : SizedBox(height: 0,),
         // FutureBuilder(
         //     future: usersRef.document(users.ownerId).get(),
         //     builder: (context, snapshot) {
         //       if (!snapshot.hasData) {
         //         return circularProgress();
         //       }
         //       // User user = User.fromDocument(snapshot.data);
         //       // bool isPostOwner = currentUserId == ownerId;
         //       return
         //         Column(
         //           children: <Widget>[
         //             GestureDetector(
         //               onTap: () =>
         //                   showProfile(context, profileId: users.ownerId),
         //               child: ListTile(
         //                 leading: CircleAvatar(
         //                   backgroundImage: CachedNetworkImageProvider(
         //                       users.image),
         //                   backgroundColor: Colors.grey,
         //                 ),
         //                 title: Text(
         //                   users.username,
         //                   style: TextStyle(
         //                     color: kText,
         //                     fontWeight: FontWeight.bold,
         //                   ),
         //                 ),
         //                 subtitle: Text(users.username,
         //                   style: TextStyle(color: kIcon),),),
         //             ),
         //             ClipRRect(
         //                 borderRadius: BorderRadius.circular(20.0),
         //                 child: cachedNetworkImage(users.image)),
         //             // GestureDetector(
         //             //   onTap: () => Navigator.push(
         //             //     context,
         //             //     MaterialPageRoute(
         //             //       builder: (context) => ProductScreen(
         //             //         prodId: prodId,
         //             //         userId: ownerId,
         //             //       ),
         //             //     ),
         //             //   ),
         //             //   child: Stack(
         //             //     alignment: Alignment.center,
         //             //     children: <Widget>[
         //             //
         //             //     ],),),
         //             // df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),
         //
         //             Divider(color: kGrey,),
         //           ],
         //
         //         );
         //     }
         // ),
               Container(
                     height: 95.5,
                     width: 95.5,
                     child: CircleAvatar(
                       backgroundColor: Colors.black,
                     ),
                   ),
                   CachedNetworkImage(
                     imageUrl: users.image,
                     imageBuilder: (context, imageProvider) => Container(
                       width: 92.0,
                       height: 92.0,
                       decoration: BoxDecoration(
                         shape: BoxShape.rectangle,
                         image: DecorationImage(
                             image: imageProvider, fit: BoxFit.cover),
                       ),
                     ),
                   ),
                   users.me ? Container(
                       height: 95,
                       width: 95,
                       alignment: Alignment.bottomRight,
                       child: Container(
                         decoration: new BoxDecoration(
                           color: Colors.blue,
                           shape: BoxShape.circle,
                           border: Border.all(
                             color: Colors.black,
                             width: 1,
                           ),
                         ),

                         child: Icon(
                           Icons.add,
                           size: 13.5,
                           color: Colors.white,
                         ),
                       )
                   ) :
                   Container(
                       height: 100,
                       width: 100,
                       alignment: Alignment.bottomCenter,

                       child: Stack(
                         alignment: Alignment.center,
                         children: <Widget>[
                           Container(
                             height: 17,
                             width: 25,
                             decoration: new BoxDecoration(
                               shape: BoxShape.rectangle,
                               borderRadius: BorderRadius.all(
                                   Radius.circular(
                                       4.0) //         <--- border radius here
                               ),
                               gradient: LinearGradient(
                                   colors: [Colors.black, Colors.black],
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight
                               ),
                             ),


                           ),
                           Container(
                               decoration: new BoxDecoration(
                                 shape: BoxShape.rectangle,
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(
                                         2.0) //         <--- border radius here
                                 ),
                                 gradient: LinearGradient(
                                     colors: [Colors.indigo, Colors.blueAccent],
                                     begin: Alignment.centerLeft,
                                     end: Alignment.centerRight
                                 ),
                               ),

                               child: Padding(
                                 padding: const EdgeInsets.all(3.0),
                                 child: Text(
                                   'LIVE',
                                   style: TextStyle(
                                       fontSize: 7,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                               )
                           ),
                         ],
                       )
                   )
                 ],
               ),
             )
         ),
         SizedBox(height: 3,),
         Text(users.username ?? '',style: TextStyle(color:kText), )
       ],
     ),
   );
 }
 Widget getvid(){
   return Center(
     child: Padding(
       padding: EdgeInsets.symmetric(horizontal: 25),
       child: Container(
         color: kText,
         padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Text(
               "Video feed coming soon!",
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 30,
               ),
             ),
             SizedBox(height: 25),
           ],
         ),
       ),
     ),
   );

 }

 Future<void> onJoin({channelName,channelId, username, hostImage, userImage}) async {
   // update input validation
   if (channelName.isNotEmpty) {
     // push video page with given channel name
     await Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => JoinPage(
           channelName: channelName,
           channelId: channelId,
           username: username,
           hostImage: hostImage,
           userImage: userImage,
         ),
       ),
     );
   }
 }


 Future<void> onCreate({username, image}) async {
   // await for camera and mic permissions before pushing video page
   await _handleCameraAndMic();
   var date = DateTime.now();
   var currentTime = '${DateFormat("dd-MM-yyyy hh:mm:ss").format(date)}';
   // push video page with given channel name
   await Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => CallPage(
         channelName: username,
         time: currentTime ,
         image: image,
       ),
     ),
   );

 }


 Future<void> _handleCameraAndMic() async {
   await PermissionHandler().requestPermissions(
     [PermissionGroup.camera, PermissionGroup.microphone],
   );
 }

}


