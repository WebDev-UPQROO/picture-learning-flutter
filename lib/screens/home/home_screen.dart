import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/screens/home/widgets/home_card_item.dart';
import 'package:picture_learning/screens/home/widgets/home_resumen.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'widgets/home_card.dart';
import 'widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final watch = context.watch<HomeCubit>().state;
    final user = watch.user;
    final fields = watch.fields;

    pressEffect() {
      context.read<MusicCubit>().playeffect(
            watch.press,
          );
    }

    ;

    return SafeArea(
      child: Scaffold(
        appBar: HomeAppar(
          pressEffect: pressEffect,
        ),
        body: Column(
          // Resumen
          children: [
            HomeResumen(
              perfectFields: user?.perfectFields?.length,
              perfectLevels: user?.perfectLevels?.length,
            ),

            // Cards list
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 60),
                    itemCount: fields?.length ?? 0,
                    itemBuilder: (context, index) {
                      final field = fields?[index];

                      // Card Item
                      return HomeCard(
                        image: field?.image,
                        isPerfect: isPerfect(
                          user?.perfectFields,
                          field?.uid,
                        ),
                        subtitle: maxString(field?.description, 20),
                        title: field?.name,

                        // Level Item
                        exercises: field?.topics?.map((topic) {
                              return HomeCardItem(
                                topic: topic,
                                isPerfect: isPerfect(
                                  user?.perfectLevels,
                                  topic.uid,
                                ),
                                pressEffect: pressEffect,
                              );
                            }).toList() ??
                            [],

                        pressEffect: pressEffect,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 60,
                      width: size.width,
                      child: CustomPaint(
                        painter: HeaderCurve(color: Style.primary),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isPerfect(List<String>? perfect, String? uid) =>
      perfect?.contains(uid) ?? false;

  String maxString(String? text, int maxLength) {
    return (text?.length ?? 1) > maxLength
        ? '${text?.substring(0, maxLength)}...'
        : getString(text);
  }
}
