import 'package:flutter/material.dart';
import 'package:picture_learning/widgets/dialogs/widgets/widgets.dart';
import 'package:picture_learning/widgets/loading/loading.dart';

// Show the loading dialog
dialogLoading(BuildContext context) {
  // Draw the entire widget
  Widget alert = const DialogBackground(
    child: Loading(),
  );

  // show the loading widget
  showDialog(
    barrierColor: Colors.white12,
    // prevents the dialog from being able to close
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      // prevents going backwards
      return WillPopScope(
        onWillPop: () async => false,
        child: alert,
      );
    },
  );
}
