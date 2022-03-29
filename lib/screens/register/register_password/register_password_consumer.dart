import 'package:picture_learning/routes.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';

import 'register_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';

class RegisterPasswordConsumer extends StatefulWidget {
  const RegisterPasswordConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<RegisterPasswordConsumer> createState() =>
      _RegisterPasswordConsumerState();
}

class _RegisterPasswordConsumerState extends State<RegisterPasswordConsumer> {
  late RegisterPasswordProvider notifier;

  void listener() {
    switch (notifier.status) {
      case Status.loading:
        dialogLoading(context);
        break;

      case Status.error:
        Navigator.pop(context);
        snackbarError(context, notifier.message!.description);
        break;

      case Status.finished:
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.loginEmail);
        snackbarSuccess(context, notifier.message!.description);
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void initState() {
    super.initState();

    notifier = context.read<RegisterPasswordProvider>();
    notifier.addListener(listener);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Do something
    });
  }

  @override
  void dispose() {
    notifier.removeListener(listener);
    super.dispose();
  }
}
