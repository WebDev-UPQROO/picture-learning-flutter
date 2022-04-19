import 'package:flutter/material.dart';

import 'package:picture_learning/utils/nullable.dart';

class GameAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);

  const GameAppbar({
    Key? key,
    required this.name,
    required this.musicActive,
    required this.musicControl,
  }) : super(key: key);

  final String? name;
  final bool musicActive;
  final Function()? musicControl;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,

      // Return button
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.highlight_off_rounded,
          size: 32,
        ),
      ),

      // Game Title
      centerTitle: true,
      title: Text(getString(name)),
      actions: [
        // Music/Mute button
        IconButton(
          onPressed: musicControl,
          icon: Icon(
            musicActive ? Icons.volume_up_rounded : Icons.volume_off_rounded,
          ),
        )
      ],
    );
  }
}
