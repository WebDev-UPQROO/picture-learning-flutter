import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/models/response_api.dart';
import 'package:picture_learning/models/services/game_service.dart';

import 'package:http/http.dart' as http;

class GameServ implements GameService {
  final http.Client httpClient = http.Client();

  @override
  Future<List<Field>> getFields(String faculty) async {
    final response = await httpClient.get(
      Uri.parse('${API.home}/faculty/$faculty'),
      headers: {'Content-Type': 'application/json'},
    );

    return (ResponseAPI.getData(response) as List)
        .map((item) => Field.fromMap(item))
        .toList();
  }

  @override
  Future<List<Exercise>> getExercise(String topicId) async {
    final response = await httpClient.get(
      Uri.parse('${API.home}/exercises/$topicId'),
      headers: {'Content-Type': 'application/json'},
    );

    return (ResponseAPI.getData(response) as List)
        .map((item) => Exercise.fromMap(item))
        .toList();
  }
}
