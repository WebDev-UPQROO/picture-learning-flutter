// Used to build endpoints
class API {
  // API Base
  static const String base =
      'https://843a-2806-2f0-8080-6ea-18cf-f470-b7de-f41a.ngrok.io';
  static const String api = 'api';

  // API Services
  static const String auth = '$base/$api/auth';
  static const String user = '$base/$api/user';
  static const String home = '$base/$api/home';
  static const String feed = '$base/$api/feed';

  // Global connections timeout
  static const Duration timeout = Duration(seconds: 5);
}
