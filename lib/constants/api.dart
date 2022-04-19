// Used to build endpoints
class API {
  // API Base
  static const String base = 'https://picture-learning.herokuapp.com/api';

  // API Services
  static const String auth = '$base/auth';
  static const String user = '$base/user';
  static const String home = '$base/home';
  static const String feed = '$base/feed';

  // Global connections timeout
  static const Duration timeout = Duration(seconds: 5);
}
