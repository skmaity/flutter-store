import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  final theWidth;
  final theHeight;
  final theChild;

 FrostedGlass({super.key,
 required this.theWidth,
 required this.theHeight,
 required this.theChild
 });
  final _borderRadious = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadious,
      child: Container(
        width: theWidth,
        height: theHeight,
        // color: Colors.white,
        child: Stack(children: [
          // blur
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Container(),
          ),
// gradient
Container(
decoration: BoxDecoration(
  border: Border.all(color: Colors.white.withOpacity(0.2)),
  borderRadius: _borderRadious,
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.4),
      Colors.white.withOpacity(0.1),
    ],
  
  begin: Alignment.topLeft,end: Alignment.bottomRight)
),
),
// Child
theChild,


        ]),
      ),
    );
  }
}
