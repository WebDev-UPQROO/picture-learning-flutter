import 'package:bloc/bloc.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/models/user/user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  LocalService localService;

  HomeCubit(this.localService) : super(HomeState.initial());

  void getUser() async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));

      final user = await localService.getUser();

      emit(state.copyWith(
        user: user,
        status: Status.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        message: ErrorC.errorHandler(e),
      ));
    }
  }
}
