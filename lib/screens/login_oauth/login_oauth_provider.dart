import 'package:flutter/material.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';

class LoginOAuthProvider with ChangeNotifier {
  LoginOAuthProvider(
    this.localService,
  );

  // Services
  LocalService localService;

  MessageUI? message;
  Status status = Status.initial;

  void cleanLocalStorage() async {
    try {
      status = Status.loading;
      notifyListeners();

      await localService.deleteUser();

      status = Status.loaded;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }
}
