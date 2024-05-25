import 'package:flutter/material.dart';

class SecendTab extends StatelessWidget {
  final int pageIndex ;

  const SecendTab({super.key,required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('2 st tab'),
    );
  }
}