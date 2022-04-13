abstract class UserService {
  Future<void> register(String username, String email, String password);
  Future<void> putUsername(String uid, String username);
  Future<void> putPassword(
    String uid,
    String password,
    String newPassword,
  );

  Future<void> postFeed(String comments, int stars);
}
