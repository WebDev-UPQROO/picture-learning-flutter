import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/message.dart';

snackbarError(BuildContext context, MessageUI error) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  final snackBar = SnackBar(
    backgroundColor: Style.danger,
    content: Text((error.description)),
    action: SnackBarAction(
      textColor: Style.white,
      label: 'Cerrar',
      onPressed: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

snackbarSuccess(BuildContext context, MessageUI error) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  final snackBar = SnackBar(
    backgroundColor: Style.success,
    content: Text((error.description)),
    action: SnackBarAction(
      textColor: Style.white,
      label: 'Cerrar',
      onPressed: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
