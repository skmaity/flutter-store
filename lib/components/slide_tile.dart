import 'package:flutter/material.dart';

class SlideTile extends StatefulWidget {
  final List imagePath;
  const SlideTile({super.key,required this.imagePath});

  @override
  State<SlideTile> createState() => _SlideTileState();
}

class _SlideTileState extends State<SlideTile> {
  
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: widget.imagePath.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              
              image: NetworkImage(widget.imagePath[index]),fit: BoxFit.cover,),
          )
        );
      },
    );
  }
}