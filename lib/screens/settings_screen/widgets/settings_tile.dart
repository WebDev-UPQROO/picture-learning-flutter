import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.action,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget? action;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      trailing: action,
      onTap: onPressed,
    );
  }
}
