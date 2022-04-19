import 'dart:convert';

import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/services/validators/validators_general.dart';
import 'package:picture_learning/models/services/game_service.dart';

import 'package:http/http.dart' as http;
import 'package:picture_learning/models/user/user.dart';

class GameServ implements GameService {
  final http.Client httpClient = http.Client();

  @override
  Future<List<Field>> getFields(String faculty) async {
    final response = await httpClient.get(
      Uri.parse('${API.home}/faculty/$faculty'),
      headers: {'Content-Type': 'application/json'},
    ).timeout(API.timeout);

    return (ValidatorsGeneral.getData(response) as List)
        .map((item) => Field.fromMap(item))
        .toList();
  }

  @override
  Future<List<Exercise>> getExercise(String topicId) async {
    final response = await httpClient.get(
      Uri.parse('${API.home}/exercises/$topicId'),
      headers: {'Content-Type': 'application/json'},
    ).timeout(API.timeout);

    return (ValidatorsGeneral.getData(response) as List)
        .map((item) => Exercise.fromMap(item))
        .toList();
  }

  @override
  Future<User> putGame(String uid, List<String> uidTopics) async {
    final response = await httpClient
        .put(
          Uri.parse('${API.user}/topics/$uid'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(uidTopics),
        )
        .timeout(API.timeout);

    return User.fromMap(ValidatorsGeneral.getData(response));
  }
}
