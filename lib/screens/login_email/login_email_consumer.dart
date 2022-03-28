import 'package:picture_learning/routes.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';

import 'login_email_provider.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';

class LoginEmailConsumer extends StatefulWidget {
  const LoginEmailConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<LoginEmailConsumer> createState() => _LoginEmailConsumerState();
}

class _LoginEmailConsumerState extends State<LoginEmailConsumer> {
  late LoginEmailProvider notifier;

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
        Navigator.pushNamed(context, Routes.home);
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

    notifier = context.read<LoginEmailProvider>();
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
