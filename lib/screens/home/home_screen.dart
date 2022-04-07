import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/screens/home/widgets/home_resumen.dart';
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
          // Resumen
          children: [
            HomeResumen(
              perfectFields: user?.perfectFields?.length,
              perfectLevels: user?.perfectLevels?.length,
            ),
            const Divider(height: 0),

            // Cards
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
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(hasIcon: false),
                        header: Row(
                          children: [
                            // Image
                            Container(
                              decoration: BoxDecoration(
                                color: Style.primary,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.all(24),
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                'assets/img/card_icon.png',
                                fit: BoxFit.contain,
                              ),
                            ),

                            // Info
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Level 1'),
                                const SizedBox(
                                  width: 40,
                                  child: Divider(
                                    height: 12,
                                    color: Colors.black45,
                                  ),
                                ),
                                Text(
                                  'Begginer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Style.h4,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),

                            if (true)
                              Image.asset(
                                'assets/icons/diamond.png',
                                width: 48,
                                height: 48,
                              ),
                            const SizedBox(width: 24),
                          ],
                        ),
                        collapsed: const SizedBox(),
                        expanded: Container(
                          padding: const EdgeInsets.all(16),
                          width: size.width,
                          child: Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 96,
                                height: 96,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  border: Border.all(
                                    width: 2,
                                    color: Style.primary,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/img/like.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(height: 8),
                                          const Text('Nivel 1'),
                                        ],
                                      ),
                                      if (true)
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
                              ),
                            ],
                          ),
                        ),
                        builder: (_, collapsed, expanded) {
                          return Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                          );
                        },
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
