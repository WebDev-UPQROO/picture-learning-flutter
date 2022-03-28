import 'home_provider.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';

class HomeConsumer extends StatefulWidget {
  const HomeConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<HomeConsumer> createState() => _HomeConsumerState();
}

class _HomeConsumerState extends State<HomeConsumer> {
  late HomeProvider notifier;

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

    notifier = context.read<HomeProvider>();
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
