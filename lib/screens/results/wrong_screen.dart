import 'package:flutter/material.dart';

import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/results_ui.dart';
import 'package:picture_learning/routes/index.dart';
import 'package:picture_learning/screens/results/widgets/results.dart';
import 'package:picture_learning/utils/nullable.dart';

class WrongScreen extends StatelessWidget {
  const WrongScreen({
    Key? key,
    required this.results,
  }) : super(key: key);

  final ResultsUI results;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Results(
      color: Style.danger,
      images: [
        Text(
          'Game Over',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            color: Style.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Image.asset(
          'assets/img/facepalm_results.png',
          height: size.height * 0.25,
        )
      ],
      score: getString(results.score),
      total: getString(results.total),
      title: "No te desanimes",
      description: "Vuelve a intentarlos",
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutesHome.home,
          (route) => false,
        );
      },
    );
  }
}
