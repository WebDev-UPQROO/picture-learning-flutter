import 'register_email_provider.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';

class RegisterEmailConsumer extends StatefulWidget {
  const RegisterEmailConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<RegisterEmailConsumer> createState() => _RegisterEmailConsumerState();
}

class _RegisterEmailConsumerState extends State<RegisterEmailConsumer> {
  late RegisterEmailProvider notifier;

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
  Widget build(BuildContext context) => widget.child;

  @override
  void initState() {
    super.initState();

    notifier = context.read<RegisterEmailProvider>();
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
