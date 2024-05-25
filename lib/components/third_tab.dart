import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  final int pageIndex ;

  const ThirdTab({super.key,required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Text('3 st tab'),
    );
  }
}