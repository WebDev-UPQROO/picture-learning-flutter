import 'dart:convert';

import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalServ implements LocalService {
  // User
  @override
  Future<bool> isUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('user');

    return user?.isNotEmpty ?? false;
  }

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

  // Review
  @override
  Future<void> putLastReview(String review) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('review', review);
  }

  @override
  Future<String?> getLastReview() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('review');
  }

  // FirstTime
  @override
  Future<void> putFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
  }

  @override
  Future<bool> getFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTime') ?? true;
  }

  // Music
  @override
  Future<bool> getBackgroundMusic() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('music') ?? true;
  }

  @override
  Future<void> putBackgroundMusic(bool isActive) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('music', isActive);
  }

  // Sound Effects
  @override
  Future<bool> getSoundEffects() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('effects') ?? true;
  }

  @override
  Future<void> putSoundEffects(bool isActive) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('effects', isActive);
  }
}
