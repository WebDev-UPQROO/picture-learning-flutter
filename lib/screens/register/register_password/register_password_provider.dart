import 'package:flutter/material.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/status.dart';

class RegisterPasswordProvider with ChangeNotifier {
  RegisterPasswordProvider(this.authService);

  // Services
  AuthService authService;

  // Data
  MessageUI? message;
  Status status = Status.initial;

  void postUser(String username, String email, String password) async {
    try {
      status = Status.loading;
      notifyListeners();

      await authService.register(username, email, password);

      message = MessageSuccess(message: Lang.successTextRegister);
      status = Status.finished;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }
}
