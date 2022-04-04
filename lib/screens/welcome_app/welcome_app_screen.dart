import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
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
          IconButton(onPressed: (){}, icon: Icon(Icons.highlight_off)),
          Positioned(
            right: size.width * 0.15,
            top: size.height * 0.08,
            child: Image.asset(
              'assets/img/welcome_man.png',
              height: size.height * 0.43,
            ),
          ),
          const Spacer(),
          SafeArea(
            child: Gap04(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.45),
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