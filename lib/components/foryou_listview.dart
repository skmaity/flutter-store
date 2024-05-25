import 'package:flutter/material.dart';

class ForYouListView extends StatelessWidget {
  ForYouListView({super.key});
final List<String> images = [
    'https://drive.google.com/uc?id=1Tm3Z9LFC6ZmgX0UyAMPaP4asnxywGFki',
    'https://drive.google.com/uc?id=1Tm3Z9LFC6ZmgX0UyAMPaP4asnxywGFki',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
          Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        const Text('Suggested for You'),
        IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded))
      ]
    ),
      
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
    children: [
      SizedBox(
        height: 80,
        width: 80,
        child: 
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(image: NetworkImage(images[0]),fit: BoxFit.cover,)),
      )
    ],
        ),
        const SizedBox(width: 20,),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
              children: [
        Text('CCLMS app - collage updates'),
        Text('Education . collage managment'),
        Text('3 *   34 MB'),
              ],
            )
      ],
    ),
    
      ]
    );
      },
    
    );
  }
}