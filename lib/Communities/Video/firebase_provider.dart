import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Communities/Video/video_info.dart';

class FirebaseProvider {
  static saveVideo(String videoName) async {
    await FirebaseFirestore.instance.collection('videos').doc(videoName).set({
      'finishedProcessing': false,
      'videoName': videoName,
    });
  }

  static deleteVideo(String videoName) async {
    await FirebaseFirestore.instance.collection('videos').doc(videoName).delete();
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
        finishedProcessing: ds.data()['finishedProcessing'] == true,
      );
    }).toList();
  }
}