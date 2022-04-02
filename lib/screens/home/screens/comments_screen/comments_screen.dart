import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/appbar/appbar_light.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/img/like.png', width: size.width * 0.9),
        Column(
          children: [
            const AppBarLight(title: 'Comentarios'),
            const Spacer(),
            Text(
              '¡Gracias por tus comentarios!',
              style: TextStyle(
                color: Style.grey600,
                fontSize: Style.h4,
              ),
            ),
            const SizedBox(height: 40),
          ],
        )
      ],
    );
  }
}
