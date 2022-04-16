import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/screens/game/widgets/game_buttons_item.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({
    Key? key,
    required this.question,
    required this.gameStatus,
  }) : super(key: key);

  final Exercise? question;
  final GameStatus gameStatus;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GridView.builder(
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: size.height * 0.02,
        crossAxisSpacing: size.height * 0.02,
        mainAxisExtent: 100,
      ),
      itemCount: question?.options?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final option = question?.options?[index];
        return GameButtonsItem(
          gameStatus: gameStatus,
          option: option,
          onPressed: () => context.read<GameCubit>().pressOption(option!),
        );
      },
    );
  }
}
