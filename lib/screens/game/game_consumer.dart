import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

class GameConsumer extends StatefulWidget {
  const GameConsumer({
    Key? key,
    required this.child,
    required this.uid,
  }) : super(key: key);

  final Widget child;
  final String uid;

  @override
  State<GameConsumer> createState() => _GameConsumerState();
}

class _GameConsumerState extends State<GameConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
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
  }
}
