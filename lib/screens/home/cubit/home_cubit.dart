import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/game/field.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/game_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/models/user/user.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  LocalService localService;
  GameService gameService;

  HomeCubit(
    this.localService,
    this.gameService,
  ) : super(HomeState.initial());

  void getHome() async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));

      final user = await localService.getUser();
      List<Field> fields = await gameService.getFields(user.facultyId!);
      // fields = fields.where((field) {
      //   return field.topics?.isNotEmpty ?? false;
      // }).toList();

      emit(state.copyWith(
        user: user,
        fields: fields,
        status: Status.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  Future getIsUser() async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));

      final isUser = await localService.isUser();

      emit(state.copyWith(
        isUser: isUser,
        status: Status.validated,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
