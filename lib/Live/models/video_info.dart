import 'package:cloud_firestore/cloud_firestore.dart';

class VideoInfo {
  String mediaUrl;
  String thumbUrl;
  // String coverUrl;
  // double aspectRatio;
  // Duration timestamp;
  String postId;
  List hashTags;
  bool hasHashTags;
  String ownerId;
   String username;
  String photoUrl;
  String currency;
   String description;
   String location;
Map likes;
  VideoInfo(
      {this.mediaUrl,
        this.thumbUrl,
        // this.coverUrl,
        // this.aspectRatio,
        this.likes,
        this.postId,
        this.hashTags,
        this.hasHashTags,
        this.ownerId,
        this.username,
         this.photoUrl,
         this.currency,
        this.description,
        this.location,
        });
  factory VideoInfo.fromDocument(DocumentSnapshot doc){
    return VideoInfo(
      mediaUrl: doc.data()['mediaUrl'],
      thumbUrl: doc.data()['thumbUrl'],
      likes: doc.data()['likes'],
      // timestamp: doc.data()['timestamp'],
      postId: doc.data()['postId'],
      hashTags: doc.data()['hashTags'],
      hasHashTags: doc.data()['hasHashTags'],
      ownerId: doc.data()['ownerId'],
      username: doc.data()['username'],
      photoUrl: doc.data()['photoUrl'],
      currency: doc.data()['currency'],
      description: doc.data()['description'],
      location: doc.data()['location'],

    );
  }

}