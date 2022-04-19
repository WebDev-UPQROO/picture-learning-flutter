import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/models/user/user.dart';

abstract class GameService {
  Future<List<Field>> getFields(String faculty);
  Future<List<Exercise>> getExercise(String topicId);

  // Finished
  Future<User> putGame(String uid, List<String> uidTopics);
}
