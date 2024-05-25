import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  final List imagePath;
  const SlideTile({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagePath.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            imagePath[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}