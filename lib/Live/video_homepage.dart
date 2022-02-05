import 'dart:io';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Communities/Share_button.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Live/video_comments.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Live/upload_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'models/video_info.dart';
import 'package:fashow/Live/models/video_player.dart';

class UserVideos extends StatefulWidget {

  @override
  _UserVideosState createState() => _UserVideosState();
}

class _UserVideosState extends State<UserVideos> {
  DynamicLinkService _dynamicLinkService = DynamicLinkService();

  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }
  addLikeToActivityFeed(ownerId,postId,mediaUrl) {
    // add a notification to the postOwner's activity feed only if comment made by OTHER user (to avoid getting notification for our own like)
    bool isNotPostOwner = currentUser.id != ownerId;
    if (isNotPostOwner) {
      activityFeedRef
          .doc(ownerId)
          .collection("feedItems")
          .doc(postId)
          .set({
        "type": "like",
        "username": currentUser.displayName,
        "userId": currentUser.id,
        "userProfileImg": currentUser.photoUrl,
        "postId": postId,
        "mediaUrl": mediaUrl.first,
        "timestamp": timestamp,
        "read": 'false',
      });
    }
  }
  removeLikeFromActivityFeed(ownerId,postId,mediaUrl) {
    bool isNotPostOwner = currentUser.id != ownerId;
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
  likeColumn(postId,ownerId,mediaUrl){
    bool isLiked = false;
    int likeCount = 0;
    videoRef
        .doc(ownerId)
        .collection('userVideos')
        .doc(postId)
        .collection("likes")
        .doc(currentUser.id).get().then((doc) => doc.exists?isLiked=true:false);
    videoRef
        .doc(ownerId)
        .collection('userVideos')
        .doc(postId)
        .collection("likes")
        .get().then((doc) => setState((){likeCount = doc.docs.length;}));
    return
      Column(
        children: [
          InkWell(
            onTap: ()
            {
              print("||||||||||||||||||||||||");
              if (isLiked == true) {
                print("|||||||||||||||||||||||true|");

                videoRef
                    .doc(ownerId)
                    .collection('userVideos')
                    .doc(postId)
                    .collection("likes")
                    .doc(currentUser.id).delete();
                removeLikeFromActivityFeed(ownerId,postId,mediaUrl);

                setState(() {
                  likeCount -= 1;
                  isLiked = false;
                });
              }
              else if (isLiked== false) {
                print("|||||||||||||||||||||||false|");

                videoRef
                    .doc(ownerId)
                    .collection('userVideos')
                    .doc(postId)
                    .collection("likes")
                    .doc(currentUser.id).set({});
                addLikeToActivityFeed(ownerId,postId,mediaUrl);

                setState(() {
                  likeCount += 1;
                  isLiked = true;
                });
              }},
            child: Icon(
              Icons.favorite,
              size: 40,
              color: isLiked
                  ? Colors.red
                  : Colors.white,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            likeCount.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      );

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return PreloadPageView.builder(
          preloadPagesCount: 25,
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            print(data.mediaUrl);
            return Stack(
              children: [
                // BetterPlayer.network(
                // data.mediaUrl,
                //   betterPlayerConfiguration: BetterPlayerConfiguration(
                //     fit: BoxFit.cover,
                //     // autoDetectFullscreenDeviceOrientation: true,
                //     deviceOrientationsAfterFullScreen: [
                //       DeviceOrientation.portraitUp
                //     ],
                //     // deviceOrientationsOnFullScreen: [
                //     //   DeviceOrientation.portraitUp
                //     // ],
                //     autoPlay: true,
                //     // aspectRatio: _aspectRatio,
                //     // eventListener: (BetterPlayerEvent event) {},
                //     controlsConfiguration:
                //     const BetterPlayerControlsConfiguration(
                //       // backgroundColor: Colors.transparent,
                //       enableFullscreen: false,
                //       showControlsOnInitialize: false,
                //       enableProgressBar: false,
                //       enableProgressText: false,
                //     ),
                //   ),
                // ),
                VideoPlayerItem(
                  videoUrl: data.mediaUrl,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => showProfile(context, profileId: data.ownerId),

                                        child: CircleAvatar(
                                          backgroundImage: CachedNetworkImageProvider(data.photoUrl),
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        data.username,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    data.description,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                likeColumn(data.postId, data.ownerId, data.mediaUrl),

                                GestureDetector(
                                  onTap: handleLikePost,

                                  child: ImageIcon(
                                    isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
                                    color: kText,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => showComments(
                                    context,
                                    postId: data.postId,
                                    ownerId: data.ownerId,
                                    mediaUrl: data.thumbUrl,
                                  ),
                                  child: Icon(
                                    Icons.mode_comment_outlined,
                                    size: 28.0,
                                    color: Colors.white,
                                  ),

                                ),
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
                                                      postId:data.postId,
                                                      ownerId:data.ownerId,
                                                      type:"SharedVideo",
                                                      imageURL:data.thumbUrl,
                                                      productname:data.description,

                                                    ),
                                                ));
                                              },
                                              child: Text("Share to a community",style: TextStyle(color: kText),),
                                            ),
                                            FutureBuilder<Uri>(
                                                future: _dynamicLinkService.createDynamicLink( postId:data.postId,ownerId: data.ownerId,Description: data.description,type: "Video",imageURL:data.thumbUrl),
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
                                // Column(
                                //   children: [
                                //     InkWell(
                                //       onTap: () =>
                                //           videoController.likeVideo(data.postId,data.ownerId),
                                //       child: Icon(
                                //         Icons.favorite,
                                //         size: 40,
                                //         color: videoController.ldata.likes.contains(
                                //             authController.user.uid)
                                //             ? Colors.red
                                //             : Colors.white,
                                //       ),
                                //     ),
                                //     const SizedBox(height: 7),
                                //     Text(
                                //       data.likes.length.toString(),
                                //       style: const TextStyle(
                                //         fontSize: 20,
                                //         color: Colors.white,
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     InkWell(
                                //       onTap: () => Navigator.of(context).push(
                                //         MaterialPageRoute(
                                //           builder: (context) => CommentScreen(
                                //             id: data.id,
                                //           ),
                                //         ),
                                //       ),
                                //       child: const Icon(
                                //         Icons.comment,
                                //         size: 40,
                                //         color: Colors.white,
                                //       ),
                                //     ),
                                //     const SizedBox(height: 7),
                                //     Text(
                                //       data.commentCount.toString(),
                                //       style: const TextStyle(
                                //         fontSize: 20,
                                //         color: Colors.white,
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     InkWell(
                                //       onTap: () {},
                                //       child: const Icon(
                                //         Icons.reply,
                                //         size: 40,
                                //         color: Colors.white,
                                //       ),
                                //     ),
                                //     const SizedBox(height: 7),
                                //     Text(
                                //       data.shareCount.toString(),
                                //       style: const TextStyle(
                                //         fontSize: 20,
                                //         color: Colors.white,
                                //       ),
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        heroTag:'uploadVideo',
        backgroundColor: Colors.black38,
        onPressed: () async{
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>ShipEngine()));
          Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadVideo()));
        },
        child: Icon(Icons.group_add_outlined),
      )
    );
  }
}

showComments(BuildContext context,
    {String postId, String ownerId, String mediaUrl}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return VideoComments(
      postId: postId,
      postOwnerId: ownerId,
      postMediaUrl: mediaUrl,
    );
  }));
}
class VideoController extends GetxController {
  final Rx<List<VideoInfo>> _videoList = Rx<List<VideoInfo>>([]);

  List<VideoInfo> get videoList => _videoList.value;
bool isLiked;
  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        videosRef.orderBy('timestamp',descending: true).snapshots().map((QuerySnapshot query) {
          List<VideoInfo> retVal = [];
          for (var element in query.docs) {
            retVal.add(
              VideoInfo.fromDocument(element),
            );
          }
          return retVal;
        }));
  }

}
