import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/models/response_api.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServ implements AuthService {
  final http.Client httpClient = http.Client();

  @override
  Future<User> loginEmail(String email, String password) async {
    final response = await httpClient.post(
      Uri.parse('${API.auth}/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email.trim(),
        "password": password.trim(),
      }),
    );

    return User.fromMap(ResponseAPI.getData(response));
  }
}
