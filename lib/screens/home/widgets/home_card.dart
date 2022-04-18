import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/null_helper.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    Key? key,
    required this.isPerfect,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.exercises,
    required this.pressEffect,
  }) : super(key: key);

  final bool isPerfect;
  final String? image;
  final String? subtitle;
  final String? title;
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
                      child: isNotEmpty(widget.image)
                          ? Image.network(widget.image!)
                          : Image.asset('assets/img/card_icon.png'),
                    ),

                    // Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getString(widget.subtitle)),
                        const SizedBox(
                          width: 40,
                          child: Divider(
                            height: 12,
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          getString(widget.title),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Style.h4,
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
                      child: Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        alignment: WrapAlignment.spaceEvenly,
                        children: widget.exercises ?? [],
                      ),
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
}
