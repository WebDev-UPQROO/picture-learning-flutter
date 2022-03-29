import 'dart:convert';

import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalServ implements LocalService {
  @override
  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('user');

    if (user?.isEmpty ?? true) {
      throw '';
    }

    return User.fromMap(jsonDecode(user!));
  }

  @override
  Future<void> putUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toMap()));
  }

  @override
  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
