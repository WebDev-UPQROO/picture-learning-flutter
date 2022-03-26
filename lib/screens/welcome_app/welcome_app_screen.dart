import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/validators.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'package:picture_learning/widgets/text/text_md_w500_grey600.dart';

//for storing form state.
class WelcomeAppScreen extends StatelessWidget {
  const WelcomeAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: size.height * 0.61,
              width: size.width,
              child: CustomPaint(
                painter: PainterCurve(color: Style.white),
              ),
            ),
          ),
          const Spacer(),
          SafeArea(
            child: Gap04(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    right: size.width * 0.05,
                    top: size.height * 0.07,
                    child: Image.asset(
                      'assets/img/welcome_man.png',
                      height: size.height * 0.43,
                    ),
                  ),
                  Text(
                    'Bienvenido',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h2,
                      color: Style.grey800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus tempus diam non varius. Aenean imperdiet consectetur lorem.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h4,
                      color: Style.grey600,
                      fontWeight: FontWeight.w500,
                      height: 1.7,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Directionality(
                    
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                    onPressed: () {
                            
                    },
                    
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Siguiente'),
                    
                    ),
                    
                  ),
                  
                

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}