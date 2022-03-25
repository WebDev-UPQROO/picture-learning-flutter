import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class LoginOAuthProvider with ChangeNotifier {
  int _count = 0;
  Status status = Status.initial;

  int get count => _count;

  void increment() {
    _count++;
    status = (count % 2 != 0) ? Status.loading : Status.loaded;

    notifyListeners();
  }
}
