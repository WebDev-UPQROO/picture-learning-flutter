import 'dart:convert';

import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/error.dart';

class ValidatorsAuth {
  static dynamic getLogin(response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      switch (response.statusCode) {
        case 400:
          throw ErrorAPI(Lang.errorLogin400);
        case 401:
          throw ErrorAPI(Lang.errorLogin401);
        default:
          throw ErrorAPI(Lang.errorAPI500);
      }
    }

    return json.decode(utf8.decode(response.bodyBytes))['data'];
  }

  static dynamic getGoogleOAuth(response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      switch (response.statusCode) {
        case 400:
          throw ErrorAPI(Lang.errorGoogleOAuth400);
        case 401:
          throw ErrorAPI(Lang.errorGoogleOAuth401);
        default:
          throw ErrorAPI(Lang.errorAPI500);
      }
    }

    return json.decode(utf8.decode(response.bodyBytes))['data'];
  }
}
