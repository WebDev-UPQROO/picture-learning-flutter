import 'example_provider.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'package:provider/provider.dart';

class ExampleConsumer extends StatefulWidget {
  const ExampleConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<ExampleConsumer> createState() => _ExampleConsumerState();
}

class _ExampleConsumerState extends State<ExampleConsumer> {
  late ExampleProvider notifier;

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

    notifier = context.read<ExampleProvider>();
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
