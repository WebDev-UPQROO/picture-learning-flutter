import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/field.dart';
import 'package:picture_learning/screens/home/cubit/home_cubit.dart';
import 'package:picture_learning/utils/nullable.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    Key? key,
    required this.isPerfect,
    required this.field,
    required this.exercises,
    required this.pressEffect,
  }) : super(key: key);

  final Field? field;
  final bool isPerfect;
  final List<Widget>? exercises;
  final Function() pressEffect;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  final ExpandableController controller = ExpandableController();

  @override
  void initState() {
    controller.addListener(() {
      widget.pressEffect();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = context.watch<HomeCubit>().state.user;

    final topics = widget.field?.topics?.length ?? 0;
    final completed = widget.field?.topics?.where(
          (element) {
            final equal = user?.perfectTopics?.contains(element.uid);
            return equal ?? false;
          },
        ).length ??
        0;

    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        child: Column(
          children: [
            // Card
            Card(
              clipBehavior: Clip.hardEdge,
              child: ExpandablePanel(
                controller: controller,
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
                      child: isNotEmpty(widget.field?.image)
                          ? Image.network(widget.field!.image!)
                          : Image.asset('assets/img/card_icon.png'),
                    ),

                    // Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxString(widget.field?.description, 20),
                        ),
                        const SizedBox(
                          width: 40,
                          child: Divider(
                            height: 12,
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          getString(widget.field?.name),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Style.h4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Completados: ${getString(completed)} / ${getString(topics)}',
                          style: TextStyle(
                            fontSize: Style.textsm,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Perfect icon
                    if (widget.isPerfect)
                      Image.asset(
                        'assets/icons/diamond.png',
                        width: 48,
                        height: 48,
                      ),
                    const SizedBox(width: 24),
                  ],
                ),
                collapsed: const SizedBox(),
                expanded: Column(
                  children: [
                    Divider(
                      height: 0,
                      color: Style.grey400,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: size.width,
                      child: (widget.exercises?.length ?? 0) > 0
                          ? Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              alignment: WrapAlignment.spaceEvenly,
                              children: widget.exercises ?? [],
                            )
                          : const Text('Mas niveles proximamente...'),
                    ),
                  ],
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
    );
  }

  String maxString(String? text, int maxLength) {
    return (text?.length ?? 1) > maxLength
        ? '${text?.substring(0, maxLength)}...'
        : getString(text);
  }
}
