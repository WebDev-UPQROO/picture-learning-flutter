import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'package:picture_learning/widgets/text/text_h3_bold_white.dart';
import 'package:picture_learning/widgets/text/text_h4_bold_grey800.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String uid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.highlight_off_rounded,
            size: 32,
          ),
        ),
        centerTitle: true,
        title: const Text('Example - Example'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              true ? Icons.volume_off_rounded : Icons.volume_up_rounded,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: CustomPaint(
                painter: HeaderCurve(color: Style.primary),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white38,
                  color: Style.secondary,
                  value: 0.8,
                  minHeight: 10,
                ),
              ),
              Expanded(
                child: Gap04(
                  child: Column(
                    children: [
                      const Spacer(),
                      const TextH3BoldWhite(
                        '¿Cuál es la respuesta correcta?',
                      ),
                      SizedBox(height: size.height * 0.04),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image.network(
                          'https://post.healthline.com/wp-content/uploads/2020/01/Runner-training-on-running-track-732x549-thumbnail.jpg',
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                      GridView.builder(
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: size.height * 0.02,
                          crossAxisSpacing: size.height * 0.02,
                          mainAxisExtent: 100,
                        ),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            onPressed: () {},
                            child: const TextH4BoldGrey800('data'),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              primary: Style.white,
                              onPrimary: Style.primary,
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
