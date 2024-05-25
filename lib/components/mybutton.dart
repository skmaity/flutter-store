import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
 final void Function()? onTap;
 final String myText;
 const MyButton({super.key,required this.onTap,required this.myText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF0D47A1),
        ),
        child:  Center(child: Text(myText,style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}