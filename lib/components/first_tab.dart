import 'package:animated_login/components/foryou_listview.dart';
import 'package:animated_login/components/slide_tile.dart';
import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  final int pageIndex ;
 FirstTab ({super.key,required this.pageIndex});
 final List<String> images = [
    'https://drive.google.com/uc?id=1Tm3Z9LFC6ZmgX0UyAMPaP4asnxywGFki',
    'https://drive.google.com/uc?id=1Tm3Z9LFC6ZmgX0UyAMPaP4asnxywGFki',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 250,
          child: Expanded(child: SlideTile(imagePath: images))),
            // const SizedBox(height: 200,),
           Expanded(child: ForYouListView()),
      ],
    );
  }
}