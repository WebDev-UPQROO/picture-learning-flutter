import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/text/text_md_white.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        color: Style.primary,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Style.white,
              ),
              const SizedBox(height: 20),
              const TextMdWhite('Cargando...')
            ],
          ),
        ),
      ),
    );
  }
}
