import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'apis/encoding_provider.dart';
import 'apis/firebase_provider.dart';
import 'package:path/path.dart' as p;
import 'models/video_info.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:fashow/Live/models/video_player.dart';

class UserVideos extends StatefulWidget {
  UserVideos({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserVideosState createState() => _UserVideosState();
}

class _UserVideosState extends State<UserVideos> {

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
    bool isLiked;
    int likeCount;
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
        .get().then((doc) => doc.docs.length=likeCount);
    return
      Column(
        children: [
          InkWell(
            onTap: ()
            {
              if (isLiked) {
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
              else if (isLiked) {
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
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                Player(
                  video: data,
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
                                  Text(
                                    data.username,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                buildProfile(
                                  data.photoUrl,
                                ),
                                likeColumn(data.postId, data.ownerId, data.mediaUrl),
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
    );
  }
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
