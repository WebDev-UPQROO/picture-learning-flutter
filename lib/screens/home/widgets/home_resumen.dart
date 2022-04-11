import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/text/text_md_bold_grey800.dart';

class HomeResumen extends StatelessWidget {
  const HomeResumen({
    Key? key,
    required this.perfectFields,
    required this.perfectLevels,
  }) : super(key: key);

  final int? perfectFields;
  final int? perfectLevels;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Color foregroundColor = Style.white;
    final Color backgroundColor = Style.primary;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/diamond.png', height: 14),
          const SizedBox(width: 8),
          Text(
            'Diamantes: ',
            style: TextStyle(color: foregroundColor),
          ),
          Text(
            getString(perfectFields),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: foregroundColor,
            ),
          ),
          SizedBox(width: size.width * 0.2),
          //
          Image.asset('assets/icons/crown.png', height: 14),
          const SizedBox(width: 8),
          Text(
            'Coronas: ',
            style: TextStyle(color: foregroundColor),
          ),
          Text(
            getString(perfectLevels),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
