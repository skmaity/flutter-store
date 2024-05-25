import 'package:flutter/material.dart';

class Applistpage extends StatelessWidget {
  const Applistpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                return const ListTile(
                  title: Text('data'),
                );
              }
            
            ),
          )
        ],
      ),
    );
  }
}