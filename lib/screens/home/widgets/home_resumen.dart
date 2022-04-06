import 'package:flutter/material.dart';
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

    return Container(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/diamond.png', height: 14),
          const SizedBox(width: 8),
          const Text('Diamantes: '),
          TextMdBoldGrey800(getString(perfectFields)),
          SizedBox(width: size.width * 0.2),
          //
          Image.asset('assets/icons/crown.png', height: 14),
          const SizedBox(width: 8),
          const Text('Coronas: '),
          TextMdBoldGrey800(getString(perfectLevels)),
        ],
      ),
    );
  }
}
