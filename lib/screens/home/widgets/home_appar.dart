import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/widgets/text/text_h4_bold_grey800.dart';

class HomeAppar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  const HomeAppar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.white,
      foregroundColor: Style.grey600,
      toolbarHeight: 56,
      elevation: 0,
      title: Row(
        children: [
          // App Name
          Image.asset('assets/img/logo.png', height: 30),
          const SizedBox(width: 8),
          const TextH4BoldGrey800('Picture Learning'),
          const Spacer(),

          // Options
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.reviews),
            icon: const Icon(Icons.comment_rounded),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.appSettings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
