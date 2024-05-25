import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Colors.pink.withOpacity(0.5),
            Colors.pink.withOpacity(0.15)
          ],
          radius: 1,
          ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "recognition to developers by showcasing their apps",
              style: TextStyle(fontSize: 25, fontFamily: 'pacifico'),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Lottie.asset('lib/assets/recognation.json'),
            ),
          ],
        ),
      ],
    );
  }
}