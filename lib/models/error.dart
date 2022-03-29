import 'dart:io';
import 'package:flutter/material.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/message.dart';

abstract class ErrorC extends MessageUI {
  ErrorC(
    String title,
    String message,
    IconData icon,
  ) : super(title, message, icon);

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
  ErrorConnection()
      : super(
          Lang.errorTitleConnection,
          Lang.errorTextConnction,
          Icons.wifi_off_outlined,
        );
}

class ErrorUI extends ErrorC {
  ErrorUI(String description)
      : super(
          Lang.errorTitleDefault,
          description,
          Icons.error_outline,
        );
}

class ErrorUnknown extends ErrorC {
  ErrorUnknown()
      : super(
          Lang.errorTitleDefault,
          Lang.errorTextDefault,
          Icons.error_outline,
        );
}

class ErrorAPI extends ErrorC {
  ErrorAPI(String message)
      : super(
          Lang.errorTitleDefault,
          message,
          Icons.error_outline,
        );

  factory ErrorAPI.fromCode(int code) {
    return ErrorAPI(getAPIError(code));
  }
}

String getAPIError(int code) {
  switch (code) {
    default:
      return Lang.errorTextAPI;
  }
}
