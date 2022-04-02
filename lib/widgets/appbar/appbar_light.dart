import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class AppBarLight extends StatelessWidget implements PreferredSizeWidget {
  @override
  get preferredSize => Size.fromHeight(70);

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
      centerTitle: true,
      toolbarHeight: 70,
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
