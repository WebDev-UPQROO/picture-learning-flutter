import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class RegisterPasswordConsumer extends StatefulWidget {
  const RegisterPasswordConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<RegisterPasswordConsumer> createState() =>
      _RegisterPasswordConsumerState();
}

class _RegisterPasswordConsumerState extends State<RegisterPasswordConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordCubit, PasswordState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.finished:
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.loginEmail);
            snackbarSuccess(context, state.message!.description);
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
  }
}
