import 'package:flutter/material.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';

class LoginEmailProvider with ChangeNotifier {
  LoginEmailProvider(
    this.authService,
    this.localService,
  );

  // Services
  AuthService authService;
  LocalService localService;

  // Data
  MessageUI? message;
  Status status = Status.initial;

  void postLogin(String email, String password) async {
    try {
      status = Status.loading;
      notifyListeners();

      final user = await authService.loginEmail(email, password);

      await localService.putUser(user);

      status = Status.finished;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }
}
