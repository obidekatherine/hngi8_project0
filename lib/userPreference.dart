import 'dart:convert';

import 'package:hngi8_project0/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNU4SWCNyrQtHiaxxwYCAmAJ_9Ys-wbq7_Lg&usqp=CAU',
    name: '',
    email: '',
    address: '',
    about: '',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
