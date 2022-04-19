// ignore_for_file: avoid_print

import 'dart:io';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/message.dart';

abstract class ErrorC extends MessageUI {
  ErrorC(
    String message,
  ) : super(message);

  static ErrorC errorHandler(error) {
    try {
      print(error);
      throw error;
    } on ErrorAPI catch (e) {
      return e;
    } on String catch (e) {
      return ErrorUI(e);
    } on SocketException catch (_) {
      return ErrorConnection();
    } catch (_) {
      return ErrorUnknown();
    }
  }
}

class ErrorConnection extends ErrorC {
  ErrorConnection() : super(Lang.errorConnction);
}

class ErrorUI extends ErrorC {
  ErrorUI(String description) : super(description);
}

class ErrorAPI extends ErrorC {
  ErrorAPI([String? error]) : super(error ?? Lang.errorAPI500);
}

class ErrorUnknown extends ErrorC {
  ErrorUnknown() : super(Lang.errorDefault);
}
