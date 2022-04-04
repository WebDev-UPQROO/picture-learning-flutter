import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/models/user/user.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  LocalService localService;
  SettingsCubit(this.localService) : super(SettingsState.initial());

  void getConfigs() {
    catchErrors(() async {
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
    });
  }

  void putMusic(bool isActive) {
    catchErrorsStatic(() async {
      await localService.putBackgroundMusic(isActive);

      emit(state.copyWith(
        music: isActive,
        status: Status.initial,
      ));
    });
  }

  void putEffects(bool isActive) {
    catchErrorsStatic(() async {
      await localService.putSoundEffects(isActive);

      emit(state.copyWith(
        effects: isActive,
        status: Status.initial,
      ));
    });
  }

  void logout() {
    catchErrorsStatic(() async {
      await localService.deleteUser();
      emit(state.copyWith(status: Status.finished));
    });
  }

  void catchErrors(Function() function) {
    try {
      function();
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }

  void catchErrorsStatic(Function() function) {
    try {
      function();
    } catch (e) {
      emit(state.copyWith(
        status: Status.errorStatic,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
