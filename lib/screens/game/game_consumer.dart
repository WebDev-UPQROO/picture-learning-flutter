import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/models/game/results_ui.dart';
import 'package:picture_learning/routes/index.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/screens/game/game_data.dart';
import 'package:picture_learning/utils/dialog.dart';
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
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        switch (state.status) {
          case Status.loading:
            dialogLoading(context);
            break;

          case Status.loaded:
            Navigator.pop(context);
            if (state.exercises?.isEmpty ?? true) {
              Navigator.pop(context);
              snackbarError(context, Lang.errorGameNull);
            }
            break;

          case Status.finished:
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(
              RoutesGame.wrong,
              arguments: ResultsUI(
                score: state.correctAnswers,
                total: state.exercises?.length ?? 0,
              ),
            );
            break;

          case Status.validated:
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(
              RoutesGame.success,
              arguments: ResultsUI(
                score: state.correctAnswers,
                total: state.exercises?.length ?? 0,
              ),
            );
            break;

          case Status.saving:
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(
              RoutesGame.success,
              arguments: ResultsUI(
                score: state.correctAnswers,
                total: state.exercises?.length ?? 0,
              ),
            );
            break;

          case Status.error:
            Navigator.pop(context);
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
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context.read<GameCubit>().getGame(widget.uid);
      context.read<GameCubit>().updateMusic();

      await Future.delayed(const Duration(milliseconds: 600));

      if (mounted) {
        // Star and show first text
        int index = 0;
        var messageInitial = gameInitial[index];
        context.read<GameCubit>().startGame(
              messageInitial: messageInitial,
            );

        // every secnd show next text
        timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            index = index + 1;
            messageInitial = gameInitial[index];

            context.read<GameCubit>().startGame(
                  messageInitial: messageInitial,
                );

            // If all the text was displayed, the game starts
            if (index == gameInitial.length - 1) {
              context.read<GameCubit>().startGame(
                    progressStatus: ProgressStatus.playing,
                  );
              timer.cancel();
            }
          },
        );
      }
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }
}
