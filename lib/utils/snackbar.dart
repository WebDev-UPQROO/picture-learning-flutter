import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

// snackbar to show errors
snackbarError(BuildContext context, String error) {
  // Snackbar colors
  Color background = Style.danger;
  Color foreground = Style.white;

  // remove any previous snack bar
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final snackBar = SnackBar(
    backgroundColor: background,
    content: Text((error)),
    action: SnackBarAction(
      textColor: foreground,
      label: 'Cerrar',
      onPressed: () {
        // Removes the current snackbar thanks to its globalkey
        scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// snackbar to show updates
snackbarSuccess(BuildContext context, String message) {
  // Snackbar colors
  Color background = Style.success;
  Color foreground = Style.white;

  // remove any previous snack bar
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final snackBar = SnackBar(
    backgroundColor: background,
    content: Text((message)),
    action: SnackBarAction(
      textColor: foreground,
      label: 'Cerrar',
      onPressed: () {
        // Removes the current snackbar thanks to its globalkey
        scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
