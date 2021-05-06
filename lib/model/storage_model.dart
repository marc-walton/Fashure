import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/methods/chat_method.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/provider/image_upload_provider.dart';
import 'package:fashow/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;

class StorageMethods {
  static final Firestore firestore = Firestore.instance;

  StorageReference _storageReference;

  //user class
  UserModel user = UserModel();

  Future<String> uploadImageToStorage(File imageFile) async {


    try {
      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;
      Im.Image imageF = Im.decodeImage(imageFile.readAsBytesSync());
      final compressedImageFile = File('$path/img.jpg')
        ..writeAsBytesSync(Im.encodeJpg(imageF, quality: 65));

      imageFile = compressedImageFile;

      _storageReference = FirebaseStorage.instance
          .ref()
          .child('${DateTime.now().millisecondsSinceEpoch}');
      StorageUploadTask storageUploadTask =
      _storageReference.putFile(imageFile);
      var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
      // print(url);
      return url;
    } catch (e) {
      return null;
    }
  }

  void uploadImage({
    @required File image,
    @required String receiverId,
    @required String senderId,
    @required ImageUploadProvider imageUploadProvider,
  }) async {
    final ChatMethods chatMethods = ChatMethods();

    // Set some loading value to db and show it to user
    imageUploadProvider.setToLoading();

    // Get url from the image bucket
    String url = await uploadImageToStorage(image);

    // Hide loading
    imageUploadProvider.setToIdle();

    chatMethods.setImageMsg(url, receiverId, senderId);
  }
}