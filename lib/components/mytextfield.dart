import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
final bool obsecuretext;
final String hinttext;
  const MyTextField({
    super.key,
    required this.controller,
    required this.obsecuretext,
    required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: TextField(
                  controller: controller, 
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor:Colors.grey.shade200,
                    filled: true,
                    hintText: hinttext,
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  obscureText: obsecuretext,
                
                 ),
               );
  }
}