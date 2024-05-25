import 'package:flutter/material.dart';

class AppList extends StatelessWidget {
  final String header;
  final Function()? backOnTap;
  const AppList({super.key,required this.header,required this.backOnTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(header),
            IconButton(onPressed: backOnTap, icon: const Icon(Icons.arrow_right_rounded))
          ],
        )
      ],
    );
  }
}