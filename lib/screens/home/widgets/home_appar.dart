import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';

class HomeAppar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);

  const HomeAppar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.primary,
      foregroundColor: Style.white,
      toolbarHeight: 80,
      elevation: 0,
      title: Row(
        children: [
          // App Name
          Image.asset('assets/img/logo.png', height: 40),
          const SizedBox(width: 8),
          const Text(
            'Picture Learning',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
