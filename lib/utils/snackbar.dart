import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

snackbarError(BuildContext context, String error) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final snackBar = SnackBar(
    backgroundColor: Style.danger,
    content: Text((error)),
    action: SnackBarAction(
      textColor: Style.white,
      label: 'Cerrar',
      onPressed: () {
        scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

snackbarSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final snackBar = SnackBar(
    backgroundColor: Style.success,
    content: Text((message)),
    action: SnackBarAction(
      textColor: Style.white,
      label: 'Cerrar',
      onPressed: () {
        scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
