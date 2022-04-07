import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    Key? key,
    required this.title,
    required this.options,
  }) : super(key: key);

  final String title;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Section Title
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Style.grey400,
              fontWeight: FontWeight.bold,
              fontSize: Style.textsm,
            ),
          ),
        ),

        // Options
        for (Widget item in options) item,
        const Divider(height: 30),
      ],
    );
  }
}
