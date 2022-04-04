import 'package:picture_learning/models/user/user.dart';

abstract class LocalService {
  // User
  Future<bool> isUser();
  Future<User> getUser();
  Future<void> putUser(User user);
  Future<void> deleteUser();

  // First Time
  Future<void> putFirstTime();
  Future<bool> getFirstTime();

  // Music
  Future<bool> getBackgroundMusic();
  Future<void> putBackgroundMusic(bool isActive);

  // Sound Effects
  Future<bool> getSoundEffects();
  Future<void> putSoundEffects(bool isActive);
}
