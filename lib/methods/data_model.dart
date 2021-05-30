import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String name;
  final String id;

  DataModel({this.name, this.id});

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold
  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map((snapshot) {
      final Map<String, dynamic> dataMap = snapshot.data;
      return DataModel(
          name: dataMap['displayName'], id: dataMap['userId']);
    }).toList();
  }
}