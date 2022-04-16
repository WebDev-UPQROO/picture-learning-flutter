import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/text/index.dart';

class GameButtonsItem extends StatelessWidget {
  const GameButtonsItem({
    Key? key,
    required this.option,
    required this.gameStatus,
    required this.onPressed,
  }) : super(key: key);

  final String? option;
  final GameStatus gameStatus;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<GameCubit>().pressOption(option!),
      child: TextH4BoldGrey800(
        gameStatus == GameStatus.active ? getString(option) : '??',
      ),
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: Style.white,
        onPrimary: Style.primary,
      ),
    );
  }
}
