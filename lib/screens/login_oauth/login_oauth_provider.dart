import 'package:flutter/material.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/models/user/user.dart';

class LoginOAuthProvider with ChangeNotifier {
  LoginOAuthProvider(
    this.localService,
  );

  // Services
  LocalService localService;

  MessageUI? message;
  Status status = Status.initial;

  bool firstTime = true;
  bool? isUser;

  void getFirstTime() async {
    try {
      status = Status.loading;
      notifyListeners();

      final firstTime = await localService.getFirstTime();

      this.firstTime = firstTime;
      status = Status.loaded;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }

  void putFirstTime() async {
    try {
      status = Status.loading;
      notifyListeners();

      await localService.putFirstTime();

      status = Status.finished;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }

  void getIsUser() async {
    try {
      status = Status.loading;
      notifyListeners();

      isUser = await localService.isUser();

      status = Status.validated;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }
}
