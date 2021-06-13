import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/enum/user_state.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/search_service.dart';
import 'package:fashow/utils/utilities.dart';
import 'package:flutter/material.dart';


class OnlineDotIndicator extends StatelessWidget {
  final String uid;
  final SearchMethod _authMethods = SearchMethod();

  OnlineDotIndicator({
    @required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    getColor(int state) {
      switch (Utils.numToState(state)) {
        case UserState.Offline:
          return Colors.red;
        case UserState.Online:
          return Colors.green;
        default:
          return Colors.blue;
      }
    }

    return Align(
      alignment: Alignment.topRight,
      child: StreamBuilder<DocumentSnapshot>(
        stream: _authMethods.getUserStream(
          id: uid,
        ),
        builder: (context, snapshot) {
          UserModel user;

          if (snapshot.hasData && snapshot.data.data != null) {
            user = UserModel.fromMap(snapshot.data.data());
          }

          return Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(right: 5, top: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(user?.state),
            ),
          );
        },
      ),
    );
  }
}