import 'package:picture_learning/constants/api.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/models/response_api.dart';
import 'package:picture_learning/models/services/game_service.dart';

import 'package:http/http.dart' as http;

class GameServ implements GameService {
  final http.Client httpClient = http.Client();

  @override
  Future<List<Field>> getFields(String faculty) async {
    return ([
      {
        "name": "Software",
        "description":
            "Software engineering is the practical application of scientific knowledge to the design and construction of computer programs and the associated documentation required to develop, operate, and maintain them.",
        "image":
            "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-21.png",
        "facultyId": "62488ef3a780e9be1149cdd7",
        "uid": "624893bd6cdb752860a39208",
        "topics": [
          {
            "name": "Software",
            "description":
                "Software engineering is the practical application of scientific knowledge to the design and construction of computer programs and the associated documentation required to develop, operate, and maintain them.",
            "image":
                "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-21.png",
            "fieldId": "624893bd6cdb752860a39208",
            "uid": "6248d579513084019176e84e"
          }
        ]
      },
      {
        "name": "Software",
        "description":
            "Software engineering is the practical application of scientific knowledge to the design and construction of computer programs and the associated documentation required to develop, operate, and maintain them.",
        "image":
            "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-21.png",
        "facultyId": "62488ef3a780e9be1149cdd7",
        "uid": "624893bd6cdb752860a39208",
        "topics": [
          {
            "name": "Software",
            "description":
                "Software engineering is the practical application of scientific knowledge to the design and construction of computer programs and the associated documentation required to develop, operate, and maintain them.",
            "image":
                "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-21.png",
            "fieldId": "624893bd6cdb752860a39208",
            "uid": "6248d579513084019176e84e"
          }
        ]
      },
      {
        "name": "Software",
        "description":
            "Software engineering is the practical application of scientific knowledge to the design and construction of computer programs and the associated documentation required to develop, operate, and maintain them.",
        "image":
            "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-21.png",
        "facultyId": "62488ef3a780e9be1149cdd7",
        "uid": "624893bd6cdb752860a39208",
        "topics": [
          {
            "name": "Software",
            "description":
                "Software engineering is the practical application of scientific knowledge to the design and construction of computer programs and the associated documentation required to develop, operate, and maintain them.",
            "image":
                "https://wonder-day.com/wp-content/uploads/2020/10/wonder-day-among-us-21.png",
            "fieldId": "624893bd6cdb752860a39208",
            "uid": "6248d579513084019176e84e"
          }
        ]
      }
    ]).map((item) => Field.fromMap(item)).toList();

    // final response = await httpClient.get(
    //   Uri.parse('${API.home}/$faculty'),
    //   headers: {'Content-Type': 'application/json'},
    // );

    // return (ResponseAPI.getData(response) as List)
    //     .map((item) => Field.fromMap(item))
    //     .toList();
  }

  @override
  Future<List<Exercise>> getExercise(String topicId) async {
    final response = await httpClient.get(
      Uri.parse('${API.home}/$topicId'),
      headers: {'Content-Type': 'application/json'},
    );

    return (ResponseAPI.getData(response) as List)
        .map((item) => Exercise.fromMap(item))
        .toList();
  }
}
