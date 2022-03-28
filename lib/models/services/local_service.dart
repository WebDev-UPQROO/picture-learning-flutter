import 'package:picture_learning/models/user/user.dart';

abstract class LocalService {
  Future<User> getUser();
  Future<void> putUser(User user);
  Future<void> deleteUser();
}
