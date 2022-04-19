import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_learning/services/validators/validators_auth.dart';

class AuthServ implements AuthService {
  final http.Client httpClient = http.Client();

  @override
  Future<User> loginEmail(String email, String password) async {
    final response = await httpClient
        .post(
          Uri.parse('${API.auth}/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": email.trim(),
            "password": password.trim(),
          }),
        )
        .timeout(API.timeout);

    return User.fromMap(ValidatorsAuth.getLogin(response));
  }

  @override
  Future<User> loginGoogle() async {
    // Check if there is an active google session, if so, close the current session
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().signOut();
    }

    // The user is asked to sign in with a google account
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If the account information is not received, the error is reported to the user
    if (googleUser == null) {
      throw Lang.errorGoogleOAuth400;
    }

    // The user is authenticated to obtain his idToken
    final GoogleSignInAuthentication autenticated =
        await googleUser.authentication;

    // The token is sent to the back
    final response = await httpClient
        .post(
          Uri.parse('${API.auth}/google'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"id_token": autenticated.idToken}),
        )
        .timeout(API.timeout);

    // Google log out
    await GoogleSignIn().signOut();
    return User.fromMap(ValidatorsAuth.getGoogleOAuth(response));
  }
}
