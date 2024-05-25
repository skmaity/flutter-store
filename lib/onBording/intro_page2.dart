import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.blue.withOpacity(0.5),
                Colors.blue.withOpacity(0.15)
              ],
              radius: 1,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "feedback mechanisms for app developers",
                style: TextStyle(fontSize: 25, fontFamily: 'pacifico'),
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset('lib/assets/feedback4.json'),
          ],
        ),
      ],
    );
  }
}
