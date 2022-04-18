import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';

part 'oauth_state.dart';

class OAuthCubit extends Cubit<OAuthState> {
  LocalService localService;
  AuthService authService;

  OAuthCubit(
    this.localService,
    this.authService,
  ) : super(OAuthState.initial());

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

  void postLogin() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final user = await authService.loginGoogle();
      await localService.putUser(user);

      emit(state.copyWith(
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
