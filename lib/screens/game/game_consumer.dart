import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/lang.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/main.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/screens/game/game_data.dart';
import 'package:picture_learning/utils/dialog_loading.dart';
import 'package:picture_learning/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/status.dart';

const String song =
    'https://t4.bcbits.com/stream/a70976542a534e8266e7010c324049ec/mp3-128/3206091462?p=0&ts=1650239624&t=62ebe9e48862da5c017b3068f513aa807c6fbbf4&token=1650239624_b265ee019ad6835c4c2592eeb70b942a4d3ee777';

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

class _GameConsumerState extends State<GameConsumer> with RouteAware {
  late final Timer timer;
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
              snackbarError(context, Lang.gameNull);
            }
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
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context.read<GameCubit>().getGame(widget.uid);
      await Future.delayed(const Duration(milliseconds: 600));

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
                  gameStatus: GameStatus.active,
                  progressStatus: ProgressStatus.start,
                );
            timer.cancel();
          }
        },
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    timer.cancel();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    context.read<MusicCubit>().stopMusic();
  }

  @override
  void didPopNext() {
    const url = song;
    context.read<MusicCubit>().playMusic(url);
  }

  @override
  void didPush() {
    const url = song;
    context.read<MusicCubit>().playMusic(url);
  }
}
