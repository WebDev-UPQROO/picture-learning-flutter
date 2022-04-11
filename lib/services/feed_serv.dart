import 'dart:convert';

import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/models/services/feed_service.dart';
import 'package:http/http.dart' as http;

class FeedServ implements FeedService {
  final http.Client httpClient = http.Client();

  @override
  Future<void> postFeed(String comments, int stars) async {
    await httpClient.post(
      Uri.parse('${API.feed}/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "title": "Review",
        "feed": comments,
        "score": stars,
      }),
    );
  }
}
