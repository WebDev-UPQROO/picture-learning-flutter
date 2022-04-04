import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  AuthService authService;
  LocalService localService;

  EmailCubit(
    this.authService,
    this.localService,
  ) : super(EmailState.initial());

  void postLogin(
    String email,
    String password,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final user = await authService.loginEmail(email, password);
      await localService.putUser(user);

      emit(state.copyWith(status: Status.finished));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
