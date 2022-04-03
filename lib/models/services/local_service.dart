import 'package:picture_learning/models/user/user.dart';

abstract class LocalService {
  Future<bool> isUser();
  Future<User> getUser();
  Future<void> putUser(User user);
  Future<void> deleteUser();
  Future<void> putFirstTime();
  Future<bool> getFirstTime();
}
