import 'package:flutter/material.dart';
import 'package:picture_learning/widgets/dialogs/widgets/widgets.dart';
import 'package:picture_learning/widgets/loading/loading.dart';

// Show the loading dialog
dialogLoading(BuildContext context) {
  Widget alert = const DialogBackground(
    child: Loading(),
  );
  showDialog(
    barrierColor: Colors.white12,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: alert,
      );
    },
  );
}
