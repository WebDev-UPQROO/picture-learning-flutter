import 'package:picture_learning/models/game/index.dart';

bool isPlaying(ProgressStatus status) {
  return status != ProgressStatus.initial && status != ProgressStatus.finished;
}
