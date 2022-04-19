import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/services/validators/validators_general.dart';
import 'package:picture_learning/models/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:picture_learning/services/validators/validators_user.dart';

class UserServ implements UserService {
  final http.Client httpClient = http.Client();

  @override
  Future<void> register(
    String username,
    String email,
    String password,
  ) async {
    final response = await httpClient
        .post(
          Uri.parse('${API.user}/register/62488ef3a780e9be1149cdd7'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": email.trim(),
            "username": username.trim(),
            "password": password.trim(),
          }),
        )
        .timeout(API.timeout);

    ValidatorsUser.getRegister(response);
  }

  @override
  Future<void> putUsername(
    String uid,
    String username,
  ) async {
    final response = await httpClient
        .put(
          Uri.parse('${API.user}/username/$uid'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "username": username.trim(),
          }),
        )
        .timeout(API.timeout);

    ValidatorsGeneral.getData(response);
  }

  @override
  Future<void> putPassword(
    String uid,
    String password,
    String newPassword,
  ) async {
    final response = await httpClient
        .put(
          Uri.parse('${API.user}/password/$uid'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "password": password.trim(),
            "newPassword": newPassword.trim(),
          }),
        )
        .timeout(API.timeout);

    ValidatorsUser.getPassowrd(response);
  }

  @override
  Future<void> postFeed(String comments, int stars) async {
    await httpClient
        .post(
          Uri.parse('${API.user}/feedback'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "title": "Review",
            "feed": comments,
            "score": stars,
          }),
        )
        .timeout(API.timeout);
  }
}
