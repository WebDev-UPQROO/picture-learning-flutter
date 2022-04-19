// Used to build endpoints
class API {
  // API Base
  static const String base =
      'https://4192-2806-2f0-8080-6ea-5aa-e73a-ff57-f505.ngrok.io/api';

  // API Services
  static const String auth = '$base/auth';
  static const String user = '$base/user';
  static const String home = '$base/home';
  static const String feed = '$base/feed';

  static const Duration timeout = Duration(seconds: 5);
}
