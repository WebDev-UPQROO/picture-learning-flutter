// Used to build endpoints
class API {
  // API Base
  static const String base = 'https://picture-learning.herokuapp.com';
  static const String api = 'api';

  // API Services
  static const String auth = '$base/$api/auth';
  static const String user = '$base/$api/user';
  static const String home = '$base/$api/home';
  static const String feed = '$base/$api/feed';

  // Global connections timeout
  static const Duration timeout = Duration(seconds: 15);
}
