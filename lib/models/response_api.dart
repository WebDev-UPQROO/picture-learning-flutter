import 'dart:convert';
import 'package:picture_learning/models/error.dart';

class ResponseAPI {
  static dynamic getData(response) {
    print('Response: ${response.statusCode}');

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ErrorAPI.fromCode(response.statusCode);
    }

    return json.decode(utf8.decode(response.bodyBytes))['data'];
  }
}