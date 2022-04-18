import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/models/response_api.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  Future<User> loginGoogle() async {
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw '';
    }

    final GoogleSignInAuthentication autenticated =
        await googleUser.authentication;

    final response = await httpClient.post(
      Uri.parse('${API.auth}/google'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id_token": autenticated.idToken}),
    );

    await GoogleSignIn().signOut();
    return User.fromMap(ResponseAPI.getData(response));
  }
}
