import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/exercise.dart';
import 'package:picture_learning/models/game/game_ui.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'package:picture_learning/widgets/text/text_h3_bold_primary.dart';
import 'package:picture_learning/widgets/text/text_h4_bold_grey800.dart';

const List<String> initial = [
  "3",
  "2",
  "1",
  "¡VAMOS!",
];

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  final GameUI game;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late Timer initialTimer;
  String? mesageInitial;
  late GameStatus gameStatus;
  late final AnimationController _controller = AnimationController(
    value: 1,
    duration: const Duration(seconds: 15),
    vsync: this,
  );

  @override
  void initState() {
    gameStatus = GameStatus.initial;
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<GameCubit>().getGame(widget.game.uid).then((value) {
        int index = 0;
        mesageInitial = initial[index];

        initialTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          index = index + 1;
          mesageInitial = initial[index];

          if (index == initial.length - 1) {
            timer.cancel();
            gameStatus = GameStatus.active;
            _controller.reverse();
          }

          setState(() {});
        });
      });
    });

    _controller.addStatusListener((status) {
      if (status.index == 0) {
        gameStatus = GameStatus.finished;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    initialTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final watch = context.watch<GameCubit>().state;
    final gameIndex = watch.gameIndex;
    Exercise? question;

    if ((watch.exercises?.length ?? 0) > 0) {
      question = watch.exercises?[gameIndex];
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.highlight_off_rounded,
            size: 32,
          ),
        ),
        centerTitle: true,
        title: Text(getString(widget.game.name)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              true ? Icons.volume_off_rounded : Icons.volume_up_rounded,
            ),
          )
        ],
      ),
      body: question != null
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: size.height * 0.4,
                    width: size.width,
                    child: CustomPaint(
                      painter: HeaderCurve(color: Style.primary),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BarAnimation(controller: _controller),
                    Expanded(
                      child: Gap04(
                        child: Column(
                          children: [
                            const Spacer(),
                            Material(
                              elevation: 10,
                              clipBehavior: Clip.hardEdge,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              child: gameStatus == GameStatus.active
                                  ? Image.network(
                                      question.image!,
                                      height: size.height * 0.3,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/img/question.jpg',
                                      height: size.height * 0.3,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const Spacer(),
                            GridView.builder(
                              clipBehavior: Clip.none,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: size.height * 0.02,
                                crossAxisSpacing: size.height * 0.02,
                                mainAxisExtent: 100,
                              ),
                              itemCount: question.options?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                final option = question?.options?[index];
                                return ElevatedButton(
                                  onPressed: gameStatus == GameStatus.active
                                      ? () {
                                          if (option == question?.answer) {
                                            _controller.value =
                                                _controller.value + 0.1;
                                            _controller.reverse();
                                            print('correct');
                                          } else {
                                            _controller.value =
                                                _controller.value - 0.03;
                                            _controller.reverse();
                                            print('wrong');
                                          }
                                        }
                                      : null,
                                  child: TextH4BoldGrey800(
                                    gameStatus == GameStatus.active
                                        ? getString(option)
                                        : '??',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    primary: Style.white,
                                    onPrimary: Style.primary,
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                if (gameStatus == GameStatus.initial)
                  Container(
                    color: Style.primary.withOpacity(0.7),
                    child: Gap04(
                      child: Center(
                        child: TextH1BoldWhite(
                          mesageInitial ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : const SizedBox(),
    );
  }
}

class BarAnimation extends AnimatedWidget {
  const BarAnimation({
    required AnimationController controller,
    Key? key,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: LinearProgressIndicator(
        backgroundColor: Colors.white38,
        color: Style.secondary,
        value: _progress.value,
        minHeight: 10,
      ),
    );
  }
}

enum GameStatus {
  initial,
  active,
  finished,
}
