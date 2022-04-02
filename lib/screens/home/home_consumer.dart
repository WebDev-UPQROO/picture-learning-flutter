import 'package:picture_learning/utils/dialog_loading.dart';

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
        dialogLoading(context);
        break;

      case Status.loaded:
        Navigator.pop(context);
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
      notifier.getUser();
    });
  }

  @override
  void dispose() {
    notifier.removeListener(listener);
    super.dispose();
  }
}
