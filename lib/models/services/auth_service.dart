import 'package:picture_learning/models/user/user.dart';

abstract class AuthService {
  Future<User> loginEmail(String email, String password);
  Future<User> loginGoogle();
}
