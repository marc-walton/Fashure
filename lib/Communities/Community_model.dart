import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
class CommunityModel{
  List leader;
  List leaderImg;
  List leaderId;
  List members;
  List bannedMembersId;
  List awaitingAcceptance;
   String title;
  String description;
  String communityId;
  String communityImg;



  CommunityModel({

    this.communityId,
    this.leader,
    this.leaderImg,
    this.leaderId,
    this.members,
    this.bannedMembersId,
    this.awaitingAcceptance,
     this.description,
      this.communityImg,
    this.title,



  });
  factory CommunityModel.fromDocument(DocumentSnapshot doc){
    return CommunityModel(
      communityId: doc.data()['communityId'],
      leader: doc.data()['leader'],
      leaderImg: doc.data()['leaderImg'],
      leaderId: doc.data()['leaderId'],
      members: doc.data()['members'],
      bannedMembersId: doc.data()['bannedMembersId'],
      awaitingAcceptance: doc.data()['awaitingAcceptance'],
      communityImg: doc.data()['communityImg'],
      description: doc.data()['description'],
      title: doc.data()['title'],


    );
  }
}
