import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/routes/routes_home.dart';
import 'package:picture_learning/screens/login_email/cubit/email_cubit.dart';
import 'package:picture_learning/utils/dialog.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class LoginEmailConsumer extends StatefulWidget {
  const LoginEmailConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<LoginEmailConsumer> createState() => _LoginEmailConsumerState();
}

class _LoginEmailConsumerState extends State<LoginEmailConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailCubit, EmailState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.finished:
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesHome.home,
              (Route<dynamic> route) => false,
            );
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
