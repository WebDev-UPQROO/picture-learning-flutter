import 'package:bloc/bloc.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/user_service.dart';
import 'package:picture_learning/models/status.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  UserService userService;

  PasswordCubit(this.userService) : super(PasswordState.initial());

  void postUser(String username, String email, String password) async {
    try {
      emit(state.copyWith(status: Status.loading));

      await userService.register(username, email, password);

      emit(state.copyWith(
        message: MessageSuccess(message: Lang.successTextRegister),
        status: Status.finished,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
