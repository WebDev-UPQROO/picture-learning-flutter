import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class HomeConsumer extends StatefulWidget {
  const HomeConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<HomeConsumer> createState() => _HomeConsumerState();
}

class _HomeConsumerState extends State<HomeConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
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
      context.read<HomeCubit>().getHome();
    });
  }
}
