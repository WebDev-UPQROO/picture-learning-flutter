import 'package:flutter/material.dart';

import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/results/widgets/results_image.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';

class Results extends StatelessWidget {
  const Results({
    Key? key,
    required this.color,
    required this.images,
    required this.score,
    required this.total,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final List<Widget> images;
  final String score;
  final String total;
  final String title;
  final String description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.primary,
      body: Stack(
        children: [
          ResultsImages(
            children: images,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: size.height * 0.51,
              width: size.width,
              child: CustomPaint(
                painter: PainterCurve(color: Style.white),
              ),
            ),
          ),
          Gap04(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.3),
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.white,
                      border: Border.all(
                        color: Style.primary,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$score / $total',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Style.h3,
                          color: Style.grey800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Style.h2,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Style.h4,
                    color: Style.grey600,
                    fontWeight: FontWeight.w500,
                    height: 1.7,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: onPressed,
                    icon: const Icon(Icons.chevron_left),
                    label: Text(
                      'Continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Style.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: color,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
