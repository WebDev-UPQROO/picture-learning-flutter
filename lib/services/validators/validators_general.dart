// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:picture_learning/models/error.dart';

class ValidatorsGeneral {
  static dynamic getData(response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ErrorAPI();
    }
    return json.decode(utf8.decode(response.bodyBytes))['data'];
  }
}
