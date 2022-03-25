import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
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
        break;

      case Status.loaded:
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
  }

  @override
  void dispose() {
    notifier.removeListener(listener);
    super.dispose();
  }
}
