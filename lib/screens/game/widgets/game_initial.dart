import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/text/index.dart';

class GameInitial extends StatelessWidget {
  const GameInitial({
    Key? key,
    required this.mesageInitial,
    required this.progressStatus,
  }) : super(key: key);

  final String? mesageInitial;
  final ProgressStatus progressStatus;

  @override
  Widget build(BuildContext context) {
    return (progressStatus == ProgressStatus.initial)
        ? Container(
            color: Style.primary.withOpacity(0.7),
            child: Gap04(
              child: Center(
                child: TextH1BoldWhite(
                  mesageInitial ?? '',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
