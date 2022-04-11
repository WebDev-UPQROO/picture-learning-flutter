import 'package:picture_learning/models/game/index.dart';

abstract class GameService {
  Future<List<Field>> getFields(String faculty);

  Future<List<Exercise>> getExercise(String topicId);
}
