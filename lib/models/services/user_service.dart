abstract class UserService {
  // register
  Future<void> register(String username, String email, String password);

  // Updates
  Future<void> putUsername(String uid, String username);
  Future<void> putPassword(
    String uid,
    String password,
    String newPassword,
  );

  // Feedack
  Future<void> postFeed(String comments, int stars);
}
