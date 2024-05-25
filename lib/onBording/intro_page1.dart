// ignore_for_file: prefer_const_constructors
// import 'package:animated_login/components/glass_box.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Colors.deepPurple.withOpacity(0.5),
            Colors.deepPurple.withOpacity(0.15)
          ],
          radius: 1,
          ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "browse, discover, and download various applications",
                style: TextStyle(fontSize: 25, fontFamily: 'pacifico'),
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset('lib/assets/search.json'),
          ],
        ),
      ],
    );
  }
}
