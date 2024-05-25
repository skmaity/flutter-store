import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String page;
  const CategoryPage({super.key,required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
    Center(child: Text(page),)
      
      ,
    );
    
  }
}