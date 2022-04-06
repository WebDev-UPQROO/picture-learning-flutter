import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/text/text_md_bold_grey800.dart';
import 'package:picture_learning/widgets/text/text_md_white.dart';
import 'widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = context.watch<HomeCubit>().state.user;

    return SafeArea(
      child: Scaffold(
        appBar: const HomeAppar(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/diamond.png', height: 14),
                  const SizedBox(width: 8),
                  const Text('Diamantes: '),
                  TextMdBoldGrey800(getString(user?.perfectFields?.length)),
                  SizedBox(width: size.width * 0.2),
                  //
                  Image.asset('assets/icons/crown.png', height: 14),
                  const SizedBox(width: 8),
                  const Text('Coronas: '),
                  TextMdBoldGrey800(getString(user?.perfectLevels?.length)),
                ],
              ),
            ),
            const Divider(height: 0),
            SizedBox(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.02,
                ),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.hardEdge,
                      color: Style.primary,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Expanded(
                                  child:
                                      Image.asset('assets/img/card_icon.png'),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 50,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Level 1',
                                          style: TextStyle(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                          child: Divider(
                                            height: 12,
                                            color: Colors.white60,
                                          ),
                                        ),
                                        Text(
                                          'Begginer',
                                          style: TextStyle(
                                            color: Style.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Style.h4,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Image.asset(
                                          'assets/icons/diamond.png',
                                          // color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (false)
                            Positioned.fill(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white70,
                                child: const Icon(
                                  Icons.lock,
                                  color: Colors.black26,
                                  size: 50,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
