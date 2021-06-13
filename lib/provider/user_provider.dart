import 'package:fashow/model/user_model.dart';
import 'package:flutter/widgets.dart';
//import 'package:skype_clone/models/user.dart';
import 'package:fashow/search_service.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;
  SearchMethod _authMethods = SearchMethod();

  UserModel get getUser => _user;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}