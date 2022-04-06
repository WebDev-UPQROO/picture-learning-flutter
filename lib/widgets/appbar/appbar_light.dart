import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class AppBarLight extends StatelessWidget implements PreferredSizeWidget {
  @override
  get preferredSize => const Size.fromHeight(56);

  const AppBarLight({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.white,
      foregroundColor: Style.grey800,
      elevation: 1,
      toolbarHeight: 56,
      title: Text(
        title,
        style: TextStyle(
          color: Style.grey800,
          fontSize: Style.h4,
        ),
      ),
    );
  }
}
