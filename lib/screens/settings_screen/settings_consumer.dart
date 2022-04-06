import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';
import 'cubit/settings_cubit.dart';

class SettingsConsumer extends StatefulWidget {
  const SettingsConsumer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  State<SettingsConsumer> createState() => _SettingsConsumerState();
}

class _SettingsConsumerState extends State<SettingsConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            Navigator.pop(context);
            break;

          case Status.validated:
            Navigator.pop(context);
            Navigator.pop(context);
            snackbarSuccess(context, state.message!.description);
            break;

          case Status.finished:
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginOAuth,
              (Route<dynamic> route) => false,
            );
            break;

          case Status.error:
            Navigator.pop(context);
            snackbarError(context, state.message!.description);
            break;

          case Status.errorStatic:
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
      context.read<SettingsCubit>().getConfigs();
    });
  }
}
