import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const SearchBox({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
                child: Container(
                
                height: 60,
                // width: 230,
                decoration: BoxDecoration(
               boxShadow: [
      // BoxShadow(
      //   color: Colors.black.withOpacity(0.1),
      //   spreadRadius: 2,
      //   blurRadius: 3,
      //   offset: Offset(1,1), // changes position of shadow
      // ),
               ],
                  
                  borderRadius: BorderRadius.circular(30),
                color: Colors.white38
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_rounded),
                    Text(text),
                  ],
                ),
                
                ),
              );
  }
}