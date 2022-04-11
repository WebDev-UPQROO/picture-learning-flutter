import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';

class HomeAppar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  const HomeAppar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.primary,
      foregroundColor: Style.white,
      toolbarHeight: 56,
      elevation: 0,
      title: Row(
        children: [
          // App Name
          Image.asset('assets/img/logo.png', height: 30),
          const SizedBox(width: 8),
          Text('Picture Learning', style: TextStyle(fontSize: Style.h4)),
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
