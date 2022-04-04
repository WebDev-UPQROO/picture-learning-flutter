import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';

part 'oauth_state.dart';

class OAuthCubit extends Cubit<OAuthState> {
  LocalService localService;
  OAuthCubit(this.localService) : super(OAuthState.initial());

  void getFirstTime() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final firstTime = await localService.getFirstTime();

      emit(state.copyWith(
        status: Status.loaded,
        firstTime: firstTime,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void putFirstTime() async {
    try {
      emit(state.copyWith(status: Status.loading));

      await localService.putFirstTime();

      emit(state.copyWith(
        status: Status.finished,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void getIsUser() async {
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
