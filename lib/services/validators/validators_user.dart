import 'dart:convert';

import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/error.dart';

class ValidatorsUser {
  static dynamic getRegister(response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      switch (response.statusCode) {
        case 400:
          throw ErrorAPI(Lang.errorRegister400);
        default:
          throw ErrorAPI(Lang.errorAPI500);
      }
    }

    return json.decode(utf8.decode(response.bodyBytes))['data'];
  }

  static dynamic getPassowrd(response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      switch (response.statusCode) {
        default:
          throw ErrorAPI(Lang.errorPassword500);
      }
    }

    return json.decode(utf8.decode(response.bodyBytes))['data'];
  }
}
