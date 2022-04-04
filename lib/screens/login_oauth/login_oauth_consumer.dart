import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/login_oauth/cubit/oauth_cubit.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';

class LoginOAuthConsumer extends StatefulWidget {
  const LoginOAuthConsumer(this.child, {Key? key}) : super(key: key);
  final Widget child;
  @override
  State<LoginOAuthConsumer> createState() => _LoginOAuthConsumerState();
}

class _LoginOAuthConsumerState extends State<LoginOAuthConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OAuthCubit, OAuthState>(
      listener: (context, state) {
        final read = context.read<OAuthCubit>();

        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            Navigator.pop(context);
            if (state.firstTime) {
              read.putFirstTime();
            } else {
              read.getIsUser();
            }
            break;

          case Status.validated:
            Navigator.pop(context);
            if (state.isUser == true) {
              Navigator.pushReplacementNamed(context, Routes.home);
            }
            break;

          case Status.finished:
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.welcomeApp);
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
      context.read<OAuthCubit>().getFirstTime();
    });
  }
}
