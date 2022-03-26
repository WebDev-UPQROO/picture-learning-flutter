import 'welcome_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';

class WelcomeAppConsumer extends StatefulWidget {
  const WelcomeAppConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<WelcomeAppConsumer> createState() => _WelcomeAppConsumerState();
}

class _WelcomeAppConsumerState extends State<WelcomeAppConsumer> {
  late WelcomeAppProvider notifier;

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

    notifier = context.read<WelcomeAppProvider>();
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