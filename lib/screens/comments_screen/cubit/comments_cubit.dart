import 'package:bloc/bloc.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/utils/nullable.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  UserService userService;
  LocalService localService;
  CommentsCubit(
    this.userService,
    this.localService,
  ) : super(CommentsState.initial());

  void changeStars(int stars) {
    emit(state.copyWith(stars: stars + 1));
  }

  void submitReview(String text) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final today = DateTime.now();

      if (!isNotEmpty(text)) {
        throw Lang.reviewError;
      }

      final lastReview = await localService.getLastReview();
      final todayReview = '${today.year}${today.month}${today.day}';

      if (isNotEmpty(lastReview) && lastReview == todayReview) {
        throw Lang.reviewSpam;
      }

      await userService.postFeed(text, state.stars);
      await localService.putLastReview(todayReview);

      emit(state.copyWith(
        comment: text,
        status: Status.loaded,
        message: MessageSuccess(Lang.reviewSuccess),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
