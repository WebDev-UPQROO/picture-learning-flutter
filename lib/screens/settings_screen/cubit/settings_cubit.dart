import 'package:bloc/bloc.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/services/user_service.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/models/user/user.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  LocalService localService;
  UserService userService;
  SettingsCubit(
    this.localService,
    this.userService,
  ) : super(SettingsState.initial());

  void getConfigs() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final music = await localService.getBackgroundMusic();
      final effects = await localService.getSoundEffects();
      final user = await localService.getUser();

      emit(state.copyWith(
        music: music,
        effects: effects,
        user: user,
        status: Status.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.errorStatic,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void putUsername(String username) async {
    try {
      emit(state.copyWith(status: Status.loading));

      if (state.user == null) {
        throw '';
      }
      await userService.putUsername(state.user!.uid!, username);

      final newUser = state.user!.copyWith(
        username: username,
      );

      await localService.putUser(newUser);

      emit(state.copyWith(
        user: newUser,
        message: MessageSuccess(Lang.successSettings),
        status: Status.validated,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void putPassword(String password, String newPassword) async {
    try {
      emit(state.copyWith(status: Status.loading));

      if (state.user == null) {
        throw '';
      }

      await userService.putPassword(state.user!.uid!, password, newPassword);

      emit(state.copyWith(
        status: Status.validated,
        message: MessageSuccess(Lang.successSettings),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void putMusic(bool isActive) async {
    try {
      await localService.putBackgroundMusic(isActive);

      emit(state.copyWith(
        music: isActive,
        status: Status.initial,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.errorStatic,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void putEffects(bool isActive) async {
    try {
      await localService.putSoundEffects(isActive);

      emit(state.copyWith(
        effects: isActive,
        status: Status.initial,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.errorStatic,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void logout() async {
    try {
      await localService.deleteUser();
      emit(state.copyWith(status: Status.finished));
    } catch (e) {
      emit(state.copyWith(
        status: Status.errorStatic,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
