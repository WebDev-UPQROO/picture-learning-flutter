import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/screens/game/widgets/game_background.dart';
import 'package:picture_learning/widgets/anim/animated_bar.dart';

class GameProgressbar extends StatefulWidget {
  const GameProgressbar({Key? key}) : super(key: key);

  @override
  State<GameProgressbar> createState() => _GameProgressbarState();
}

class _GameProgressbarState extends State<GameProgressbar>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    value: 1,
    duration: const Duration(seconds: 20),
    vsync: this,
  );

  @override
  void initState() {
    controller.addStatusListener((status) {
      if (status.index == 0) {
        context.read<GameCubit>().finishGame();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void awaitAnimation() {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        if (mounted) {
          controller.reverse();
        }
      });
    }

    return BlocListener<GameCubit, GameState>(
      listener: (context, state) {
        switch (state.progressStatus) {
          case ProgressStatus.start:
            controller.reverse();
            break;

          case ProgressStatus.correct:
            controller.value = controller.value + 0.03;
            controller.stop();
            confettiController.play();
            awaitAnimation();
            break;

          case ProgressStatus.wrong:
            controller.value = controller.value - 0.03;
            controller.stop();
            awaitAnimation();
            break;

          case ProgressStatus.finished:
            Navigator.of(context).pushReplacementNamed(Routes.home);
            break;

          default:
            break;
        }
      },
      child: AnimatedBar(controller: controller),
    );
  }
}
