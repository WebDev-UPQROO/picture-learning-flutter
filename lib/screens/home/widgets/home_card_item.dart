import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/null_helper.dart';

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({
    Key? key,
    required this.image,
    required this.isPerfect,
    required this.name,
  }) : super(key: key);

  final bool isPerfect;
  final String? image;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        border: Border.all(
          width: 2,
          color: isPerfect ? Style.primary : Style.grey200,
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(100),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isNotEmpty(image)
                    ? Image.network(
                        image!,
                        width: 40,
                        height: 40,
                      )
                    : Image.asset(
                        'assets/img/card_icon.png',
                        width: 40,
                        height: 40,
                      ),
                const SizedBox(height: 8),
                Text(getString(name)),
              ],
            ),
            if (isPerfect)
              Positioned(
                top: 72,
                child: Image.asset(
                  'assets/icons/crown.png',
                  width: 32,
                  height: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
