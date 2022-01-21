import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Live/models/video_info.dart';
class FirebaseProvider {
  static saveVideo(VideoInfo video) async {
    await FirebaseFirestore.instance.collection('videos').doc().set({
      'videoUrl': video.videoUrl,
      'thumbUrl': video.thumbUrl,
      'coverUrl': video.coverUrl,
      'aspectRatio': video.aspectRatio,
      'uploadedAt': video.uploadedAt,
      'videoName': video.videoName,
    });
  }

  static listenToVideos(callback) async {
    FirebaseFirestore.instance.collection('videos').snapshots().listen((qs) {
      final videos = mapQueryToVideoInfo(qs);
      callback(videos);
    });
  }

  static mapQueryToVideoInfo(QuerySnapshot qs) {
    return qs.docs.map((DocumentSnapshot ds) {
      return VideoInfo(
        videoUrl: ds.data()['videoUrl'],
        thumbUrl: ds.data()['thumbUrl'],
        coverUrl: ds.data()['coverUrl'],
        aspectRatio: ds.data()['aspectRatio'],
        videoName: ds.data()['videoName'],
        uploadedAt: ds.data()['uploadedAt'],
      );
    }).toList();
  }
}