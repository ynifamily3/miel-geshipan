import 'dart:convert';

import 'package:board/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userKey = 'user';

Future<UserModel?> getLogginedUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _user = prefs.getString(userKey);
  if (_user == null) return null;
  UserModel user = UserModel.fromJson(json.decode(_user));

  return user;
}

Future<void> setLogginedUser(UserModel user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(userKey, json.encode(user.toJson()));
}

Future<void> logoutUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(userKey);
}
