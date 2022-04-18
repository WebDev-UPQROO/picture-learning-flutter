import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
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
    return BlocListener<GameCubit, GameState>(
      // listenWhen: (p, c) => p.progressStatus != c.progressStatus,
      listener: (context, state) {
        switch (state.progressStatus) {
          case ProgressStatus.start:
            controller.reverse();
            break;

          case ProgressStatus.correct:
            controller.value = controller.value + 0.03;
            controller.reverse();
            break;

          case ProgressStatus.wrong:
            controller.value = controller.value - 0.03;
            controller.reverse();
            break;

          case ProgressStatus.finished:
            print('finished');
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
