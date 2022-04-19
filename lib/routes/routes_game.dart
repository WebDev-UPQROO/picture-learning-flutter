import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/models/game/game_ui.dart';
import 'package:picture_learning/models/game/results_ui.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/screens/screens.dart';

class RoutesGame {
  static const String game = 'game';
  static MaterialPageRoute gameScreen(settings) {
    GameUI game = settings.arguments as GameUI;
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => GameCubit(
          context.read<GameService>(),
          context.read<LocalService>(),
          context.read<MusicCubit>(),
        ),
        child: GameConsumer(
          uid: game.uid,
          child: GameScreen(game: game),
        ),
      ),
    );
  }

  static const String success = 'success';
  static MaterialPageRoute successScreen(settings) {
    final args = settings.arguments as ResultsUI;

    return MaterialPageRoute(
      builder: (_) => SuccessScreen(results: args),
    );
  }

  static const String wrong = 'wrong';
  static MaterialPageRoute wrongScreen(settings) {
    final args = settings.arguments as ResultsUI;

    return MaterialPageRoute(
      builder: (_) => WrongScreen(results: args),
    );
  }
}
