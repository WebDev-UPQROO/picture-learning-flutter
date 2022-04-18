import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes/routes_home.dart';

class HomeAppar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);

  const HomeAppar({
    Key? key,
    required this.pressEffect,
  }) : super(key: key);

  final Function() pressEffect;

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
            onPressed: () {
              pressEffect();
              Navigator.pushNamed(context, RoutesHome.reviews);
            },
            icon: const Icon(Icons.comment_rounded),
          ),
          IconButton(
            onPressed: () {
              pressEffect();
              Navigator.pushNamed(context, RoutesHome.appSettings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
