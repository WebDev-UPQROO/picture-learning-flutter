import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class LoginEmailProvider with ChangeNotifier {
  Status status = Status.initial;

  void doSomething() {
    notifyListeners();
  }
}
