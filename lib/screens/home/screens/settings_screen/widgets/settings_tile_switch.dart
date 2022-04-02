import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class SettingsTileSwitch extends StatelessWidget {
  const SettingsTileSwitch({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Style.primary,
      title: Text(
        title,
        style: TextStyle(
          color: Style.grey800,
          fontSize: Style.h4,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Style.grey600,
        ),
      ),
      value: value,
      onChanged: onChange,
    );
  }
}
