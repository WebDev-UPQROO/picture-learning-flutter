import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:provider/provider.dart';
import 'login_oauth_provider.dart';

class LoginOAuthConsumer extends StatefulWidget {
  const LoginOAuthConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<LoginOAuthConsumer> createState() => _LoginOAuthConsumerState();
}

class _LoginOAuthConsumerState extends State<LoginOAuthConsumer> {
  late LoginOAuthProvider notifier;

  void listener() {
    switch (notifier.status) {
      case Status.loading:
        dialogLoading(context);
        break;

      case Status.loaded:
        Navigator.pop(context);
        if (notifier.firstTime) {
          notifier.putFirstTime();
        } else {
          notifier.getIsUser();
        }
        break;

      case Status.validated:
        Navigator.pop(context);
        if (notifier.isUser == true) {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
        break;

      case Status.finished:
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.welcomeApp);
        break;

      case Status.error:
        Navigator.pop(context);
        snackbarError(context, notifier.message!.description);
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();

    notifier = context.read<LoginOAuthProvider>();
    notifier.addListener(listener);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifier.getFirstTime();
    });
  }

  @override
  void dispose() {
    notifier.removeListener(listener);
    super.dispose();
  }
}
