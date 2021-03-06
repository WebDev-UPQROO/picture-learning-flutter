import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/utils/game.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'widgets/index.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  final GameUI game;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<GameCubit>().state;
    final read = context.read<GameCubit>();
    final gameIndex = watch.gameIndex;
    Exercise? question;

    if ((watch.exercises?.length ?? 0) > 0) {
      question = watch.exercises?[gameIndex];
    }

    return Scaffold(
      appBar: GameAppbar(
        name: game.name,
        musicActive: watch.backgroundMusic,
        musicControl:
            isPlaying(watch.progressStatus) ? read.musicControl : null,
      ),

      // Game Screen
      body: GameBackground(
        // Initial Screen
        initalScreen: GameInitial(
          mesageInitial: watch.mesageInitial,
          progressStatus: watch.progressStatus,
        ),

        // ProgressBar
        progressBar: const GameProgressbar(),

        // Game
        game: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Gap04(
                child: Column(
                  children: [
                    // Image
                    const Spacer(),
                    GameImage(
                      question: question,
                      isActive: isPlaying(watch.progressStatus),
                      errorEnable: watch.erroreffect,
                    ),

                    // Options
                    const Spacer(),
                    GameButtons(
                      question: question,
                      isActive: isPlaying(watch.progressStatus) &&
                          watch.optionIsActive,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
