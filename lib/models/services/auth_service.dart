import 'package:picture_learning/models/user/user.dart';

abstract class AuthService {
  Future<User> loginEmail(String email, String password);
  Future<void> register(String username, String email, String password);
}
