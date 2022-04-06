import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class SettingsTileEdit extends StatelessWidget {
  const SettingsTileEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Editar',
      style: TextStyle(
        color: Style.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
