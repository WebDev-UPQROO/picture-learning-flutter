import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/status.dart';
import 'package:picture_learning/routes/index.dart';
import 'package:picture_learning/screens/login_oauth/cubit/oauth_cubit.dart';
import 'package:picture_learning/utils/dialog.dart';
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
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            Navigator.pop(context);
            if (state.firstTime) {
              Navigator.pushNamed(
                context,
                RoutesInitial.welcomeApp,
              );
            }
            break;

          case Status.validated:
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
      context.read<OAuthCubit>().getFirstTime();
    });
  }
}
