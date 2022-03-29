import 'package:flutter/material.dart';
import 'package:picture_learning/models/error.dart';
import 'package:picture_learning/models/message.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/models/user/user.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider(this.localService);

  // Services
  LocalService localService;

  // Data
  User? user;
  MessageUI? message;
  Status status = Status.initial;

  void getUser() async {
    try {
      status = Status.loading;
      notifyListeners();

      user = await localService.getUser();

      status = Status.finished;
    } catch (e) {
      message = ErrorC.errorHandler(e);
      status = Status.error;
    }
    notifyListeners();
  }
}
