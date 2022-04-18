import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/screens/example/cubit/example_cubit.dart';
import 'package:picture_learning/utils/dialog.dart';
import 'package:picture_learning/utils/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class ExampleConsumer extends StatefulWidget {
  const ExampleConsumer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  State<ExampleConsumer> createState() => _ExampleConsumerState();
}

class _ExampleConsumerState extends State<ExampleConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExampleCubit, ExampleState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            Navigator.pop(context);
            break;

          case Status.error:
            Navigator.pop(context);
            snackbarError(context, state.message!.description);
            break;

          default:
            break;
        }
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Do something
    });
  }
}
