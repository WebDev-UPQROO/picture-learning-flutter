import 'package:flutter/material.dart';
import 'package:picture_learning/utils/null_helper.dart';

class GameAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);

  const GameAppbar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String? name;

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
          onPressed: () {},
          icon: const Icon(
            true ? Icons.volume_off_rounded : Icons.volume_up_rounded,
          ),
        )
      ],
    );
  }
}
