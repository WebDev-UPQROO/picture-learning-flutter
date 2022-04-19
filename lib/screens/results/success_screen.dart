import 'package:flutter/material.dart';

import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/results_ui.dart';
import 'package:picture_learning/routes/index.dart';
import 'package:picture_learning/screens/results/widgets/results.dart';
import 'package:picture_learning/utils/nullable.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.results,
  }) : super(key: key);

  final ResultsUI results;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Results(
      color: Style.success,
      images: [
        Text(
          '¡Nivel completado!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            color: Style.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          'assets/img/crown_results.png',
          height: size.height * 0.22,
        ),
      ],
      total: getString(results.total),
      score: getString(results.score),
      title: "Felicidades",
      description: "Has completado el nivel",
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
